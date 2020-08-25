package com.kitri.jejusari.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.jejusari.dto.MemberDto;
import com.kitri.jejusari.dto.SalesDto;
import com.kitri.jejusari.dto.SalesImgDto;

@Repository
public class SalesDaoImp implements SalesDao {
	
	@Autowired
	SqlSessionTemplate session;
	
	//상세페이지
	@Override
	public SalesDto salesDetail(int sales_number) {
		return session.selectOne("sales_detail_select",sales_number);
	}
	@Override
	public MemberDto salesBroker(String member_id) {
		return session.selectOne("sales_broker_select",member_id);
	}

	@Override
	public int salesScrapCheck(Map<String, Object> map) {
		return session.selectOne("sales_scrap_check",map);
	}
	
	@Override
	public int salesScrapDo(Map<String, Object> map) {
		return session.insert("sales_scrap_do", map);
	}
	
	@Override
	public int salesScrapDelete(Map<String, Object> map) {
		return session.delete("sales_scrap_delete",map);
	}

	@Override
	public int salesScrapCount(int sales_number) {
		return session.selectOne("sales_scrap_count",sales_number);
	}

	@Override
	public int salesCount(Map<String, Object> hmap) {
		return session.selectOne("sales_getCount", hmap);
	}
	
	@Override
	public List<SalesImgDto> selectSalesImg(int sales_number) {
		return session.selectList("sales_select_img",sales_number);
	}

	@Override
	public List<SalesDto> salesList(Map<String, Object> hmap) {
		return session.selectList("sales_list", hmap);
	}
	
	@Override
	public int salesWriteOk(SalesDto salesDto) {
		System.out.println(salesDto.toString());
		return session.insert("sales_write", salesDto);
	}
	
	
	@Override
	public int salesDelete(SalesDto salesDto) {
		session.delete("sales_delete1", salesDto);
		session.delete("sales_delete2", salesDto);
		session.delete("sales_delete3", salesDto);
		session.delete("sales_delete4", salesDto);
		return session.delete("sales_delete5", salesDto);
	}
	
	
	@Override
	public String salesIdCheck(int sales_number) {
		return session.selectOne("get_member_id", sales_number);
	}
	
	@Override
	public String getAddress(int sales_number) {
		return session.selectOne("get_address", sales_number);
	}
	
	@Override
	public int salesUpdate(Map<String, Object> map) {
		return session.update("sales_update", map);
	}
	
	//
	@Override
	public void insertFactor(Map<String, Object> factorMap) {
		session.insert("insert_factor", factorMap);
	}
	
	@Override
	public Map<String, Object> getFactor(int sales_number) {
		return session.selectOne("get_factor", sales_number);
	}
	
	@Override
	public int updateSalesDB(Map<String, Object> factorMap_update) {
		return session.update("db_sales_update",factorMap_update);
	}
	
	@Override
	public float totalAvg() {
		return session.selectOne("factor_all_avg");
	}
	
	@Override
	public int getSalesNumber(String member_id) {
		return session.selectOne("get_sales_number", member_id);
	}
	@Override
	public int insertSalesImg(SalesImgDto salesImgDto) {
		return session.insert("salesImg_insert", salesImgDto);
		
	}
	@Override
	public int updateSalesImg(SalesImgDto salesImgDto) {
		session.delete("sales_delete1", salesImgDto.getSales_number());
		
		return session.insert("salesImg_insert", salesImgDto);
	}
	
	
}
