package kr.co.gdu.cash.controller;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;

@Controller
public class NoticeController {
	@Autowired NoticeService noticeService;
	
	//공지 사항 더 보기
	@GetMapping("/admin/noticeList/{currentPage}")
	public String noticeList(Model model,
					@PathVariable(name="currentPage" ,required = true) int currentPage) {
		int rowPerPage = 5;
		//total lastPage = (total / rowPerPage)+1
		int total = noticeService.totalList();
		System.out.println(total+"<-total");
		int lastPage = (total/rowPerPage);
		System.out.println(lastPage+"<-lastPage");
		
		if(total%rowPerPage != 0) {
			lastPage = (total/rowPerPage)+1;
		}else {
			lastPage = total/rowPerPage;
		}
		//noticeService 호출
		List<Notice> noticeListByPage = noticeService.getNoticeListByPage(currentPage, rowPerPage);
		model.addAttribute("noticeListByPage",noticeListByPage);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		return "noticeList";
	}
	
	//공지 상세보기
	@GetMapping("/admin/noticeOne/{noticeId}/{currentPage}")
	public String noticeOne(Model model,
						@PathVariable(name="noticeId") int noticeId,
						@PathVariable(name="currentPage") int currentPage) {
		int rowPerPage=5; // 페이지 당 보여질 댓글 수
		int totalComment = noticeService.getTotalComment(noticeId); //총 댓글 수
		int lastPage=0;
		if(totalComment % rowPerPage != 0) { // 나머지 데이터가 5개 미만 일때
			lastPage = (totalComment / rowPerPage)+1;
		}else {
			lastPage = totalComment / rowPerPage;
		}
		Notice noticeOne = noticeService.getNoticeOne(noticeId,currentPage,rowPerPage);
		model.addAttribute("noticeOne",noticeOne);
		model.addAttribute("lastPage",lastPage);
		return "noticeOne";
	}
	
	//공지 입력 폼
	@GetMapping("/admin/addNotice")
	public String addNotice() {
		return "addNotice";
	}
	
	//공지 입력 액션
	@PostMapping("/admin/addNotice")
	public String addNotice(NoticeForm noticeForm) {
		noticeService.addNotice(noticeForm);
		
		return "redirect:/admin/noticeList/1";
	}
	
	// 공지 업로드된 파일 하나 삭제(수정폼에서)
	@GetMapping("/admin/deleteFileOne")
	public String deleteFileOne(@RequestParam(value="noticefileId") int noticefileId,
								@RequestParam(value="noticefileName") String noticefileName,
								@RequestParam(value="noticeId") int noticeId) {
		noticeService.removeUploadFileOne(noticefileId, noticefileName);
		return "redirect:/admin/updateNotice/"+noticeId;
	}
	
	//공지 삭제
	@GetMapping("/admin/removeNotice")
	public String removeNotice(@RequestParam(value="noticeId") int noticeId) {
		noticeService.deleteNotice(noticeId);
		return "redirect:/admin/noticeList/1";
	}
	//공지 수정 폼
	@GetMapping("/admin/updateNotice/{noticeId}")
	public String updateNotice(Model model, @PathVariable(name="noticeId") int noticeId) {
		Notice updateNoticeForm = noticeService.getUpdateNoticeForm(noticeId);
		model.addAttribute("updateNoticeForm",updateNoticeForm);
		return "updateNotice";
	}
	//공지 수정
	@PostMapping("/admin/updateNotice")
	public String updateNotice(NoticeForm noticeForm,
							@RequestParam(value="noticeId") int noticeId) {
		noticeService.updateNotice(noticeForm,noticeId);
		
		return "redirect:/admin/noticeOne/"+noticeId+"/1";
	}
}