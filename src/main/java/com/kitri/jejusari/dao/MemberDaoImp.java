package com.kitri.jejusari.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.jejusari.dto.MemberDto;
import com.kitri.jejusari.dto.SalesImgDto;


@Repository
public class MemberDaoImp implements MemberDao{
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int memberJoin(MemberDto memberDto) {
		return session.insert("member_join", memberDto);
	}
	
	@Override
	public int member_id_check(String member_id) {
		return session.selectOne("member_id_check",member_id);
	}
	
	@Override
	public int member_delete(String member_id) {
		// TODO Auto-generated method stub
		return session.delete("member_delete", member_id);
	}
	

	@Override
	public int dropMember(List<String> list) {
		return session.delete("dropMember", list);
	}

	@Override
	public int memberCount() {
		return session.selectOne("memberadmin_count");
	}

	@Override
	public List<String> memberList(int startRow, int endRow) {
		Map<String, Integer> hmap=new HashMap<String, Integer>();
		hmap.put("startRow", startRow);
		hmap.put("endRow", endRow);
		
		return session.selectList("memberadmin_list", hmap);
	}
	
	@Override
	public MemberDto tempLogin(MemberDto memberDto) {
		MemberDto member = session.selectOne("member_login", memberDto);
		return member;
	}
	
	@Override
	public int memberUpdate(MemberDto memberDto) {
		return session.update("member_update", memberDto);
	}
	
	// 마이페이지
	@Override
	public List<SalesImgDto> getScrap(String member_id) {
		System.out.println("다오-겟스크랩 : " + session.selectList("getScrap", member_id));
		return session.selectList("getScrap", member_id);
	}
	
	@Override
	public List<SalesImgDto> getSales(String member_id) {
//		System.out.println("다오-겟세일즈 -" + session.selectList("getSales", member_id));
		return session.selectList("getSales", member_id);
	}
	
	@Override
	public List<String> getSalesNumber(String member_id) {
		return session.selectList("getScrapSalesNumber", member_id);
	}
	
}
