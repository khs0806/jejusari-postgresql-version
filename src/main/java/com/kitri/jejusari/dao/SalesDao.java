package com.kitri.jejusari.dao;


import java.util.List;
import java.util.Map;

import com.kitri.jejusari.dto.MemberDto;
import com.kitri.jejusari.dto.SalesDto;
import com.kitri.jejusari.dto.SalesImgDto;

public interface SalesDao {

	//상세페이지
	public SalesDto salesDetail(int sales_number);
	public MemberDto salesBroker(String member_id);
	public int salesScrapCheck(Map<String, Object> map);
	public int salesScrapDo(Map<String, Object> map);
	public int salesScrapDelete(Map<String, Object> map);
	public int salesScrapCount(int sales_number);
	public float totalAvg();
	public List<SalesImgDto> selectSalesImg(int sales_number);

	//
	public int salesCount(Map<String, Object> hmap);
	public List<SalesDto> salesList(Map<String, Object> hmap);
	
	public int salesWriteOk(SalesDto salesDto);

	public int salesDelete(SalesDto salesDto);
	public String salesIdCheck(int sales_number);
	public String getAddress(int sales_number);
	public int salesUpdate(Map<String, Object> map);
	
	// 상세매물의 지수5개 가져오기
	public Map<String, Object> getFactor(int sales_number);
	// 상세매물의 지수5개 인서트하기
	public void insertFactor(Map<String,Object> factorMap);
	// 매물디비 업데이트
	public int updateSalesDB(Map<String,Object> factorMap_update);
	// 등록한 매물의 번호 가져오기
	public int getSalesNumber(String member_id);
	
	public int insertSalesImg(SalesImgDto salesImgDto);
	public int updateSalesImg(SalesImgDto salesImgDto);
	
	
}
