package kr.co.gdu.cash.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.service.CategoryService;
import kr.co.gdu.cash.vo.Cashbook;
import kr.co.gdu.cash.vo.Category;

@Controller
public class CashbookController {
	
	@Autowired private CashbookService cashbookService;
	@Autowired private CategoryService categoryService;
	
	//페이징 처리한 캐쉬북 전체 리스트
	@GetMapping("/admin/cashbookList/{currentPage}")
	public String cashbookList(Model model,
							@PathVariable(name="currentPage", required = true) int currentPage) {
		int rowPerPage = 20;
		int total = cashbookService.getTotalCashbookList();
		int lastPage = 0;
		if(total%rowPerPage != 0) {
			lastPage = (total/rowPerPage)+1;
		}else {
			lastPage = total/rowPerPage;
		}
		List<Cashbook> cashbookList = cashbookService.getCashbookListByPage(currentPage, rowPerPage);
		model.addAttribute("cashbookList", cashbookList);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("total",total);
		return "cashbookList";
	}
	
	
	//가계부 상세보기
	@GetMapping("/admin/cashbookOne/{cashbookId}")
	public String cashbookOne(Model model,
			@PathVariable(name="cashbookId",required = true) int cashbookId) {
		Cashbook cashOne = cashbookService.getCashbookOne(cashbookId);
		model.addAttribute("cashOne",cashOne);
		return "cashbookOne";
	}
	
	//가계부 목록 수정 액션
	@PostMapping("/admin/updateCashbook")
	public String updateCashbook(Cashbook cashbook,
			@RequestParam(name = "currentYear", required = true) int currentYear,
			@RequestParam(name = "currentMonth", required = true) int currentMonth,
			@RequestParam(name = "currentDay", required = true) int currentDay) {
		cashbookService.updateCashbook(cashbook);
		return "redirect:/admin/cashbookByDay/"+cashbook.getCashbookId()+"/"+currentYear+"/"+currentMonth+"/"+currentDay;
	}
	
	//가계부 목록 수정 폼
	@GetMapping("/admin/updateCashbook/{cashbookId}/{currentYear}/{currentMonth}/{currentDay}")
	public String updateCashbook(Model model,
			@PathVariable(name="cashbookId",required = true) int cashbookId,
			@PathVariable(name="currentYear",required = true) int currentYear,
			@PathVariable(name="currentMonth",required = true) int currentMonth,
			@PathVariable(name="currentDay",required = true) int currentDay) {
		Cashbook cashOne = cashbookService.getCashbookOne(cashbookId);
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("cashOne",cashOne);
		return "updateCashbook";
	}
	
	//가계부 목록 삭제
	@GetMapping("/admin/deleteCashbook")
	public String deleteCashbook(
			@RequestParam(name="cashbookId", required = true) int cashbookId,
			@RequestParam(name = "currentYear", required = true) int currentYear,
			@RequestParam(name = "currentMonth", required = true) int currentMonth,
			@RequestParam(name = "currentDay", required = true) int currentDay){
		cashbookService.deleteCashook(cashbookId);
		return "redirect:/admin/cashbookByDay/now/"+currentYear+"/"+currentMonth+"/"+currentDay;
	}
	
	//cashbook 추가
	@PostMapping("/admin/addCashbook")
	public String addCashbook(Cashbook cashbook,// 커맨드객체
							@RequestParam(value="currentYear") int currentYear, 
							@RequestParam(value="currentMonth") int currentMonth,
							@RequestParam(value="currentDay") int currentDay) { //redirect path경로 이름 맞추기 위해 추가
		// System.out.println(cashbook);
		cashbookService.addCashbook(cashbook);
		return "redirect:/admin/cashbookByDay/now/"+currentYear+"/"+currentMonth+"/"+currentDay; 
	}
	
	//cashbook 추가 폼
	@GetMapping("/admin/addCashbook/{target}/{currentYear}/{currentMonth}/{currentDay}")
	public String addCashbook(Model model,
			@PathVariable(name = "target", required=true) String target,
			@PathVariable(name = "currentYear", required = true) int currentYear,
			@PathVariable(name = "currentMonth", required = true) int currentMonth,
			@PathVariable(name = "currentDay", required = true) int currentDay) {
		
		List<Category> categoryList = categoryService.getCategoryList();
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("currentYear",currentYear);
		model.addAttribute("currentMonth",currentMonth);
		model.addAttribute("currentDay",currentDay);
		model.addAttribute("target",target);
		return "addCashbook"; // forward
	}
	
	// 선택한 날짜 가계부 목록
	@GetMapping("/admin/cashbookByDay/{target}/{currentYear}/{currentMonth}/{currentDay}")
	public String cashbookByDay(Model model,
			@PathVariable(name = "target") String target,
			@PathVariable(name = "currentYear", required = true) int currentYear,
			@PathVariable(name = "currentMonth", required = true) int currentMonth,
			@PathVariable(name = "currentDay", required = true) int currentDay) {
		Calendar targetDay = Calendar.getInstance();
		targetDay.set(Calendar.YEAR, currentYear);
		targetDay.set(Calendar.MONTH, currentMonth-1);
		targetDay.set(Calendar.DATE, currentDay);
		if(target.equals("pre")) {
			targetDay.add(Calendar.DATE, -1);
		} else if(target.equals("next")) {
			targetDay.add(Calendar.DATE, 1);
		}
		
		List<Cashbook> cashbookList = cashbookService.getCashbookListByDay(
								targetDay.get(Calendar.YEAR), 
								targetDay.get(Calendar.MONTH)+1, 
								targetDay.get(Calendar.DATE));	
		model.addAttribute("cashbookList", cashbookList);
		model.addAttribute("currentYear", targetDay.get(Calendar.YEAR));
		model.addAttribute("currentMonth", targetDay.get(Calendar.MONTH)+1);
		model.addAttribute("currentDay", targetDay.get(Calendar.DATE));
		return "cashbookByDay";
	}
	
	// 매 일 마다 보여지는 수입 , 지출
	@GetMapping(value="/admin/cashbookByMonth/{target}/{currentYear}/{currentMonth}")
	public String cashbookByMonth(Model model,
			@PathVariable(name ="target") String target,
			@PathVariable(name = "currentYear") int currentYear,
			@PathVariable(name = "currentMonth") int currentMonth) { 
		// 1-1. 요청분석
		Calendar currentDay = Calendar.getInstance(); // 2020년 11월 2일
		// currentYear 넘어오고, currentMonth도 넘어면
		if(currentYear != -1 && currentMonth != -1) { // 년도가 넘어갈때
			if(currentMonth == 0) {
				currentYear -= 1;
				currentMonth = 12;
			}
			if(currentMonth == 13) {
				currentYear += 1;
				currentMonth = 1;
			}
			currentDay.set(Calendar.YEAR, currentYear);
			currentDay.set(Calendar.MONTH, currentMonth-1);
		}
		if(target.equals("pre")) {
			currentDay.add((Calendar.MONTH), -1);
		}else if(target.equals("next")) {
			currentDay.add((Calendar.MONTH), +1);
		}
		currentDay.set(Calendar.DATE, 1); // 2020년 11월 1일
		
		currentYear = currentDay.get(Calendar.YEAR);
		currentMonth = currentDay.get(Calendar.MONTH)+1;
		int lastDay = currentDay.getActualMaximum(Calendar.DATE);
		int firstDayOfWeek = currentDay.get(Calendar.DAY_OF_WEEK);
		// -----------------------------------------------------------------------------
		int sumIn = cashbookService.getSumCashbookPriceByInOut("수입", currentYear, currentMonth);
		int sumOut = cashbookService.getSumCashbookPriceByInOut("지출", currentYear, currentMonth);
		
		// -----------------------------------------------------------------------------
		List<Map<String, Object>> cashList = cashbookService.getCashListByMonth(currentYear, currentMonth);
		// -------------------------------------------------------------------------------
		
		// 3. 뷰 모델 추가
		model.addAttribute("currentYear", currentYear); // 년
		model.addAttribute("currentMonth", currentMonth); // 월
		model.addAttribute("lastDay", lastDay); // 마지막 일
		model.addAttribute("firstDayOfWeek", firstDayOfWeek); // 1일의 요일
		
		model.addAttribute("sumIn", sumIn);
		model.addAttribute("sumOut", sumOut);
		
		model.addAttribute("cashList", cashList);
		
		return "cashbookByMonth";
	}
}