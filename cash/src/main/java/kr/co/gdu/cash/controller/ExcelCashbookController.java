package kr.co.gdu.cash.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.vo.Cashbook;

@Controller
@Scope("singleton") // 스프링이 실행할 때 객체 하나만 추가된다.
public class ExcelCashbookController {
	
	@GetMapping(path="/admin/cashbookListExcel", produces="application/vnd.ms-excel")
	public String cashbookListExcel() {
		
		return "cashbookListExcel";
	}
}

@Component("cashbookListExcel") // 객체를 만들어 주는 어노테이션
@Scope("prototype") // 스프링이 실행 중에 필요할 때 마다 new연산자로 객체를 추가해준다. //컴포넌트타입의 스코프의 디폴트값은 "singleton"
class CashbookExcelView extends AbstractXlsView{
	@Autowired CashbookService cashbookService;
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setHeader("Content-Disposition", "attachment;filename=\"cashbook.xls\"");
		List<Cashbook> cashbookList = cashbookService.getCashbookListAll();
		Sheet sheet = workbook.createSheet(); // 하나의 시트를 생성
		Row titleRow = sheet.createRow(0); // 첫번째 행에 셀에 추가
		titleRow.createCell(0).setCellValue("cashbook_id");
		titleRow.createCell(1).setCellValue("cashbook_kind");
		titleRow.createCell(2).setCellValue("category_name");
		titleRow.createCell(3).setCellValue("cashbook_price");
		titleRow.createCell(4).setCellValue("cashbook_content");
		titleRow.createCell(5).setCellValue("cashbook_date");
		titleRow.createCell(6).setCellValue("create_date");
		titleRow.createCell(7).setCellValue("update_date");
		
		//각 열의 크기 지정
		sheet.setColumnWidth(0, 5000);
		sheet.setColumnWidth(1, 5000);
		sheet.setColumnWidth(2, 5000);
		sheet.setColumnWidth(3, 5000);
		sheet.setColumnWidth(4, 20000);
		sheet.setColumnWidth(5, 5000);
		sheet.setColumnWidth(6, 5000);
		sheet.setColumnWidth(7, 5000);
		
		//1행 A열의 정렬을 가운데로 맞춤
		CellStyle style = titleRow.getCell(0).getCellStyle();
		style.setAlignment(HorizontalAlignment.CENTER);
		
		//A열부터 8개의 열에 대해 정렬을 복사함
		sheet.setDefaultColumnStyle(0, style);
		sheet.setDefaultColumnStyle(1, style);
		sheet.setDefaultColumnStyle(2, style);
		sheet.setDefaultColumnStyle(3, style);
		sheet.setDefaultColumnStyle(4, style);
		sheet.setDefaultColumnStyle(5, style);
		sheet.setDefaultColumnStyle(6, style);
		sheet.setDefaultColumnStyle(7, style);
		
		for(int i=1;i<cashbookList.size();i++) {
			Row row = sheet.createRow(i);
			row.createCell(0).setCellValue(cashbookList.get(i).getCashbookId());
			row.createCell(1).setCellValue(cashbookList.get(i).getCashbookKind());
			row.createCell(2).setCellValue(cashbookList.get(i).getCategoryName());
			row.createCell(3).setCellValue(cashbookList.get(i).getCashbookPrice());
			row.createCell(4).setCellValue(cashbookList.get(i).getCashbookContent());
			row.createCell(5).setCellValue(cashbookList.get(i).getCashbookDate());
			row.createCell(6).setCellValue(cashbookList.get(i).getCreateDate());
			row.createCell(7).setCellValue(cashbookList.get(i).getUpdateDate());
		}
	}
}






