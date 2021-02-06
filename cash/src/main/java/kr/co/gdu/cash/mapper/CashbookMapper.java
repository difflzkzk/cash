package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

// @Conpoment
// @Controller, @Service, @Mapper, @Repository : 스테레오타입
@Mapper
public interface CashbookMapper {
	//가계부 수정 액션
	int insertCashbook(Cashbook cashbook);
	// 가계부 삭제 액션
	int deleteCashbook(int cashbookId);
	// 가계부 수정 액션
	int updateCashbook(Cashbook cashbook);
	//전체 가계부 리스트 출력 + 페이징 (map<beginRow, rowPerPage>)
	List<Cashbook> selectCashbookListByPage(Map<String,Object> map);
	// 전체 가계부 데이터 총 양
	int totalCashbookList();
	// 전체 가계부 리스트 가져오기
	List<Cashbook> selectCashbookListAll();
	List<Map<String, Object>> selectCashInOutList(); // 
	// 달력안에 수입 지출 출력
	Integer selectSumCashbookPriceByInOut(Map<String, Object> map); 
	// 달력 날짜 출력
	List<Map<String, Object>> selectCashListByMonth(Map<String, Object> map);
	 // 특정 날짜 정보 출력
	List<Cashbook> selectCashBookListByDay(Map<String, Object> map);
	// 가계부 상세보기
	Cashbook selectCashbookOne(int cashbookId);
	
}