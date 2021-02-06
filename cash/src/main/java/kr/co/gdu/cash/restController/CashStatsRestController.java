package kr.co.gdu.cash.restController;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restService.CashStatsService;

@RestController
public class CashStatsRestController {

	@Autowired CashStatsService cashStatsService;
	
	@GetMapping("/totalOutAndInByYear/{year}")
	public Map<String, Object> totalOutAndInByYear(@PathVariable(name = "year") int year) {
		return cashStatsService.getTotalOutAndInByYear(year);
	}
	//chart1.올해 지출 내역
	@GetMapping("/admin/chart1")
	public Map<String, Object> totalOfMonthByYear() {
		Map<String, Object> map = cashStatsService.getTotalOfMonthByYear();
		return map; 
	}
	//chart2.최근 3년간 매월 지출 내역
	@GetMapping("/admin/chart2")
	public Map<String, Object> totalOfMonthByThirdYear() {
		Map<String, Object> map = new HashMap<>();
		map.put("currentYear",cashStatsService.getTotalOfMonthByYear());
		map.put("lastYear", cashStatsService.getTotalOfMonthByLastYear());
		map.put("beforeLastYear",cashStatsService.getTotalOfMonthByBeforeLastYear());
		return map; 
	}
	//chart3. 최근 3개월간 카테고리별 지출 내역
	@GetMapping("/admin/chart3")
	public Map<String,Object> selectCategoryForThreeMonth(){
		Map<String,Object> map = cashStatsService.getCategoryForThreeMonth();
		return map;
	}
	//chart4. 18년~올해 총 지출
	@GetMapping("/admin/chart4")
	public Map<String,Object> selectTotalofYearForThreeYear(){
		Map<String,Object> map = cashStatsService.getTotalofYearForThreeYear();
		return map;
	}
	//chart5. 올해 카테고리별 지출 빈도
	@GetMapping("/admin/chart5")
	public Map<String,Object> selectCategoryForYear(){
		Map<String,Object> map = cashStatsService.getCategoryForYear();
		return map;
	}
	//chart6. 올해 매월 수입, 지출액수 차이
	@GetMapping("/admin/chart6")
	public Map<String,Object> selectTotalofInOut(){
		Map<String,Object> map = new HashMap<>();
		map.put("income",cashStatsService.getTotalOfMonthByInYear());
		map.put("expense", cashStatsService.getTotalOfMonthByYear());
		map.put("difference", cashStatsService.getTotalofInOut());
		return map;
	}
}
























