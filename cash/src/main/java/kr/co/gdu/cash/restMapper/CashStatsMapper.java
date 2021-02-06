package kr.co.gdu.cash.restMapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CashStatsMapper {
	public Map<String,Object> selectTotalOfMonthByInYear();//2020년도의 매 월 수입
	public Map<String,Object> selectTotalOfMonthByYear(); //2020년도의 매 월 지출
	public Map<String, Object> selectTotalOfMonthByLastYear(); //2019년도의 매 월 지출
	public Map<String, Object> selectTotalOfMonthByBeforeLastYear();//2018년도의 매 월 지출
	public Map<String, Object> selectTotalOutAndInByYear(int year); // 해당 년도의 지출,수입
	public Map<String, Object> selectCategoryForThreeMonth();//최근 3개월간 카테고리별 지출
	public Map<String, Object> selectTotalofYearForThreeYear();//18년~올해 총 지출
	public Map<String,Object> selectCategoryForYear();//올해 카테고리별 지출 빈도
	public Map<String,Object> selectTotalofInOut();//올해 매월 수입, 지출액수 차이
}
