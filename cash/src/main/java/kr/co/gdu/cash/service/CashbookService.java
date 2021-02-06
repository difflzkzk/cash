package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.vo.Cashbook;

@Service
@Transactional
public class CashbookService {
	@Autowired private CashbookMapper cashBookMapper;
	
	//캐쉬북 전체 리스트 총 양
	public int getTotalCashbookList() {
		return cashBookMapper.totalCashbookList();
	}
	
	//캐쉬북 전체 리스트
	public List<Cashbook> getCashbookListAll(){
		return cashBookMapper.selectCashbookListAll();
	}
	
	//페이징 처리한 캐쉬북 전체 리스트
	public List<Cashbook> getCashbookListByPage(int currentPage, int rowPerPage){
		Map<String,Object> map = new HashMap<>();
		map.put("beginRow", (currentPage-1)*rowPerPage);
		map.put("rowPerPage", rowPerPage);
		return cashBookMapper.selectCashbookListByPage(map);
	}
	//가계부 수정
	public int updateCashbook(Cashbook cashbook) {
		cashbook.getCashbookContent().replaceAll("(?i)<script", "&lt;script");//스크립트가 db 접근 방지
		return cashBookMapper.updateCashbook(cashbook);
	}
	//가계부 상세보기
	public Cashbook getCashbookOne(int cashbookId) {
		return cashBookMapper.selectCashbookOne(cashbookId);
	}
	// 가계부 삭제
	public int deleteCashook(int cashbookId) {
		return cashBookMapper.deleteCashbook(cashbookId);
	}
	//가계부 추가
	public int addCashbook(Cashbook cashbook) {
		cashbook.getCashbookContent().replaceAll("(?i)<script", "&lt;script");
		return cashBookMapper.insertCashbook(cashbook);
	}
	// 해당 일의 가계부 리스트 출력
	public List<Cashbook> getCashbookListByDay(int currentYear, int currentMonth, int currentDay) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		map.put("currentDay", currentDay);
		return cashBookMapper.selectCashBookListByDay(map);
	}
	// 달력에 출력될 가계부 금액 리스트
	public List<Map<String, Object>> getCashListByMonth(int currentYear, int currentMonth) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		return cashBookMapper.selectCashListByMonth(map);
	}
	// 가계부 수입/지출 합계
	public int getSumCashbookPriceByInOut(String cashbookKind, int currentYear, int currentMonth) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cashbookKind", cashbookKind);
		map.put("currentYear", currentYear);
		map.put("currentMonth", currentMonth);
		Integer sum = cashBookMapper.selectSumCashbookPriceByInOut(map);
		return sum;
	}
}