package com.kitri.jejusari.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kitri.jejusari.dto.NoticeDto;
import com.kitri.jejusari.dto.ReportDto;

@Repository
public class BoardDaoImp implements BoardDao{
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public int reportInsert(ReportDto reportDto) {
		// TODO Auto-generated method stub
		return session.insert("report_insert", reportDto);
	}
	
	//공지사항
	//공지사항 읽기
		@Override
		public NoticeDto noticeDetail(int notice_number) {
			return session.selectOne("notice_read", notice_number);
		}
		
		//공지사항 작성
		@Override
		public int noticeWrite(NoticeDto noticeDto) {
			return session.insert("notice_write", noticeDto);
		}
		
		
		//
		@Override
		public int noticeCount() {
			return session.selectOne("notice_count");
		}
		
		//공지사항 리스트
		@Override
		public List<NoticeDto> noticeList(int startRow, int endRow) {
			Map<String, Integer> hmap=new HashMap<String, Integer>();
			hmap.put("startRow", startRow);
			hmap.put("endRow", endRow);
			
			return session.selectList("notice_list", hmap);
		}
		
		//조회수 증가
		@Override
		public NoticeDto noticeReadCount(int notice_number) {
			
			return session.selectOne("notice_read", notice_number);
		}
		
		@Override
		public int noticeCountPlus(int notice_number) {
			return session.update("notice_readCount", notice_number);
		}
		
		@Override
		public int noticeDelete(int notice_number) {
			return session.delete("notice_delete", notice_number);
		}
		
		@Override
		public NoticeDto noticeSelect(int notice_number) {
			return session.selectOne("notice_read", notice_number);
		}
		
		@Override
		public int noticeUpdate(NoticeDto noticeDto) {
			return session.update("notice_update", noticeDto);
		}
		
		@Override
		public List<String> reportList(int startRow, int endRow) {
			Map<String, Integer> hmap=new HashMap<String, Integer>();
			hmap.put("startRow", startRow);
			hmap.put("endRow", endRow);
			
			return session.selectList("reportadmin_list",hmap);
		}

		@Override
		public int AdDelete(int sales_number) {
			return session.delete("reportDel", sales_number);
		}

		@Override
		public int reportCount() {
			return session.selectOne("reportadmin_count");
		}
		
		@Override
		public List<ReportDto> ReportDetail(int report_number) {
			
			return session.selectList("detailSelect",report_number);
		}

		@Override
		public int reportUpdate(int sales_number) {
			session.update("updateReportAdmin", sales_number);
			return session.update("checkUpdate", sales_number);
		}
		
}
