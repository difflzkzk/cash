package kr.co.gdu.cash.restService;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restMapper.CashStatsMapper;

@Service
@Transactional
public class CashStatsService {
	@Autowired CashStatsMapper cashStatsMapper;
	//chart1,6. 2020년 월별 지출
	public Map<String, Object> getTotalOfMonthByYear () {
		return cashStatsMapper.selectTotalOfMonthByYear();
	}
	//chart2. 2019년 월별 지출
	public Map<String, Object> getTotalOfMonthByLastYear () {
		return cashStatsMapper.selectTotalOfMonthByLastYear();
	}
	//chart2. 2018년 월별 지출
	public Map<String, Object> getTotalOfMonthByBeforeLastYear () {
		return cashStatsMapper.selectTotalOfMonthByBeforeLastYear();
	}
	//chart3. 최근 3개월 간 카테고리별 지출
	public Map<String,Object> getCategoryForThreeMonth(){
		return cashStatsMapper.selectCategoryForThreeMonth();
	}
	//chart4. 18년~올해 총 지출
	public Map<String,Object> getTotalofYearForThreeYear(){
		return cashStatsMapper.selectTotalofYearForThreeYear();
	}
	//chart5. 올해 카테고리별 지출 빈도
	public Map<String,Object> getCategoryForYear(){
		return cashStatsMapper.selectCategoryForYear();
	}
	//chart6. 올해 매월 수입, 지출액수 차이
	public Map<String,Object> getTotalofInOut(){
		return cashStatsMapper.selectTotalofInOut();
	}
	//chart6. 2020년 월별 수입
	public Map<String, Object> getTotalOfMonthByInYear () {
		return cashStatsMapper.selectTotalOfMonthByInYear();
	}
	public Map<String, Object> getTotalOutAndInByYear(int year) {
		return cashStatsMapper.selectTotalOutAndInByYear(year);
	}
}