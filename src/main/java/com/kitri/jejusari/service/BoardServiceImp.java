package com.kitri.jejusari.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.parser.ContainerFactory;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.jejusari.dao.BoardDao;
import com.kitri.jejusari.dto.NoticeDto;
import com.kitri.jejusari.dto.ReportDto;

@Service
public class BoardServiceImp implements BoardService{

	@Autowired
	BoardDao boardDao;

	@Override
	public List<String> testDB() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void newsList(ModelAndView mav) {
		String clientId = "nRMcm30QpjGM_zMZaO_f"; //애플리케이션 클라이언트 아이디값"
		String clientSecret = "4rZaN1wN27"; //애플리케이션 클라이언트 시크릿값"

		String text = null;
		try {
			text = URLEncoder.encode("제주도 힐링", "UTF-8");
		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("검색어 인코딩 실패",e);
		}

		String apiURL = "https://openapi.naver.com/v1/search/news?query=" + text + "&display=" + 20 + "&sort=sim" ;    // json 결과

		Map<String, String> requestHeaders = new HashMap<>();
		requestHeaders.put("X-Naver-Client-Id", clientId);
		requestHeaders.put("X-Naver-Client-Secret", clientSecret);
		String responseBody = get(apiURL,requestHeaders);

		//        System.out.println(responseBody);

		JSONParser jsonParser=new JSONParser();

		ContainerFactory orderedKeyFactory = new ContainerFactory() {

			@Override
			public Map createObjectContainer() {
				return new HashMap();
			}

			@Override
			public List creatArrayContainer() {
				return new ArrayList();
			}
		};

		Object obj=null;

		try {
			obj=jsonParser.parse(responseBody, orderedKeyFactory);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		HashMap map=(HashMap) obj;
		List<Map<String, Object>> newsList=(List<Map<String, Object>>) map.get("items");

		for(int i=0; i<newsList.size(); i++) {
			String pubDate=(String) newsList.get(i).get("pubDate");			// 기사 1개의 pubDate

			if(pubDate!=null) {
				String[] dateArr=pubDate.split(" ");
				String year=dateArr[3];
				String monthEng=dateArr[2];
				String month=null;
				switch (monthEng) {
				case "Jan":
					month="01";
					break;
				case "Feb":
					month="02";
					break;
				case "Mar":
					month="03";
					break;
				case "Apr":
					month="04";
					break;
				case "May":
					month="05";
					break;
				case "Jun":
					month="06";
					break;
				case "Jul":
					month="07";
					break;
				case "Aug":
					month="08";
					break;
				case "Sep":
					month="09";
					break;
				case "Oct":
					month="10";
					break;
				case "Nov":
					month="11";
					break;
				case "Dec":
					month="12";
					break;
				default:
					month=monthEng;
					break;
				}

				String day=dateArr[1];

				String date=year + "-" + month + "-" + day;

				//        		newsList.get(i).remove("pubDate");
				newsList.get(i).put("date", date);
			}
		}

		System.out.println("newsList : " + newsList);

		mav.addObject("newsList", newsList);
		mav.setViewName("news/news_list.tiles");

		//        System.out.println(mav);
	}

	private static String get(String apiUrl, Map<String, String> requestHeaders){
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl){
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection)url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body){
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}

	public void reportWriteOk(ModelAndView mav) {
		// TODO Auto-generated method stub

		Map<String, Object> map=mav.getModelMap();

		HttpServletRequest request=(HttpServletRequest)map.get("request");
	 	HttpSession session=request.getSession();
	  
	 	String member_id=(String) session.getAttribute("member_id");

		ReportDto reportDto=(ReportDto) map.get("reportDto");

		//session받아서 id넣어주기 : "kke"대신에 (String)session.getAttr~( );
		reportDto.setMember_id(member_id);

		int check=boardDao.reportInsert(reportDto);
		System.out.println("check : " + check);

		mav.addObject("check", check);
		mav.setViewName("report/report_writeOk.tiles");
	}




	//공지사항
	//공지사항 게시판 읽기
	@Override
	public void noticeDetail(ModelAndView mav) {
		Map<String,Object> map = mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		HttpSession session = request.getSession();
		String member_level = (String) session.getAttribute("member_level");
		String member_id = (String) session.getAttribute("member_id");
		System.out.println(member_level);
		System.out.println(member_id);
		
		int notice_number=Integer.parseInt(request.getParameter("notice_number"));	

		boardDao.noticeCountPlus(notice_number);
		NoticeDto noticeDto = boardDao.noticeDetail(notice_number);
		System.out.println(noticeDto);
		mav.addObject("noticeDto",noticeDto);
		mav.addObject("member_level", member_level);
		mav.addObject("member_id", member_id);
		mav.setViewName("notice/notice_read.tiles");

	}

	//공지사항 게시판
	@Override
	public void noticeList(ModelAndView mav) {
		Map<String, Object> map= mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession();
		String member_level = (String) session.getAttribute("member_level");
		String member_id = (String) session.getAttribute("member_id");
		System.out.println(member_level);
		System.out.println(member_id);
		

		//페이징
		String pageNumber=request.getParameter("pageNumber");
		if(pageNumber == null) pageNumber = "1";
		int currentPage = Integer.parseInt(pageNumber);	//요청한 페이지
		int boardSize = 10;		// [1] start:1, end:10  [2] start:11, end:20

		int startRow = (currentPage - 1) * boardSize + 1;	//1  11 21 31
		int endRow = currentPage * boardSize;			//10 20 30 40

		//count 사용해서 글이 아예 없는경우 페이징 사라지게
//		int count = boardDao.noticeCount();
		int count = 0;
		List<NoticeDto> noticeList = null;
		System.out.println("count" + count);
		if(count > 0) {
			//startRow, endRow
			System.out.println("currnetPage : " + currentPage);
			System.out.println("pageNumber : " + pageNumber);
			noticeList = boardDao.noticeList(startRow, endRow);
		}

		mav.addObject("noticeList", noticeList);
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		mav.addObject("member_level", member_level);
		mav.addObject("member_id", member_id);
		mav.setViewName("/notice/notice_list.tiles");

	}

	//공지사항 게시판 쓰기
	@Override
	public void noticeWrite(ModelAndView mav) {	//글작성 누르면 띄워지는 공지사항 글작성 페이지

		mav.setViewName("/notice/notice_write.tiles");

	}

	//공지사항 게시판 쓰기 완료
	@Override
	public void noticeWriteOk(ModelAndView mav) {

		Map<String, Object> map = mav.getModelMap();	//불러오기
		NoticeDto noticeDto = (NoticeDto) map.get("noticeDto");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		System.out.println(noticeDto.toString());

		noticeDto.setNotice_date(new Date());
		noticeDto.setNotice_count(0);

		int check = boardDao.noticeWrite(noticeDto);
		System.out.println(check);

		mav.addObject("check", check);
		mav.setViewName("/notice/notice_writeOk.tiles");

	}
	
	
	//공지사항 삭제
	@Override
	public void noticeDelete(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int notice_number = Integer.parseInt(request.getParameter("notice_number"));
		System.out.println(notice_number);

		mav.addObject("notice_number", notice_number);

		mav.setViewName("notice/notice_delete.tiles");

	}

	//공지사항 삭제 완료
	@Override
	public void noticeDeleteOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int notice_number = Integer.parseInt(request.getParameter("notice_number"));
		System.out.println(notice_number);

		int check = boardDao.noticeDelete(notice_number);
		System.out.println(check);

		mav.addObject("notice_number", notice_number);
		mav.addObject("check", check);

		mav.setViewName("notice/notice_deleteOk.tiles");

	}

	//공지사항 수정 기존의 정보 뿌리기
	@Override
	public void noticeUpdate(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		int notice_number = Integer.parseInt(request.getParameter("notice_number"));
		System.out.println("update_notice_number : " + notice_number);

		NoticeDto noticeDto = boardDao.noticeSelect(notice_number);

		mav.addObject("notice_number", notice_number);
		mav.addObject("noticeDto", noticeDto);

		mav.setViewName("notice/notice_update.tiles");
	}

	//공지사항 수정 완료
	@Override
	public void noticeUpdateOk(ModelAndView mav) {
		Map<String, Object> map = mav.getModelMap();
		NoticeDto noticeDto = (NoticeDto) map.get("noticeDto");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		System.out.println(noticeDto.toString());

		int notice_number = Integer.parseInt(request.getParameter("notice_number"));
		System.out.println("updateOk_notice_number : " + notice_number);

		int check = boardDao.noticeUpdate(noticeDto);
		System.out.println("check : " + check);

		mav.addObject("notice_number", notice_number);
		mav.addObject("noticeDto", noticeDto);
		mav.addObject("check", check);

		mav.setViewName("notice/notice_updateOk.tiles");


	}
	
	@Override
	public void getReportList(ModelAndView mav) {
		Map<String, Object> map= mav.getModelMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		//페이징
		String pageNumber=request.getParameter("pageNumber");
		System.out.println("pageNumber"+pageNumber);
		if(pageNumber == null) pageNumber = "1";
		int currentPage = Integer.parseInt(pageNumber);	//요청한 페이지
		int boardSize = 10;		// [1] start:1, end:10  [2] start:11, end:20

		int startRow = (currentPage - 1) * boardSize + 1;	//1  11 21 31
		int endRow = currentPage * boardSize;			//10 20 30 40

		//count 사용해서 글이 아예 없는경우 페이징 사라지게
		int count = boardDao.reportCount();
		List<String> reportList = null;

		if(count > 0) {
			//startRow, endRow
			 reportList = boardDao.reportList(startRow, endRow);
		}
		
		mav.addObject("ReportList", reportList);
		System.out.println(reportList);
		
		mav.addObject("boardSize", boardSize);
		mav.addObject("currentPage", currentPage);
		mav.addObject("count", count);
		
		mav.setViewName("/admin/report_admin.tiles");
	}

	
	  @Override 
	  public void AdDelete(ModelAndView mav) {
	  int check=0;
	  Map<String, Object> map=mav.getModelMap();
	  HttpServletRequest request=(HttpServletRequest)map.get("request");
	  HttpSession session =request.getSession();
	  
	  String member_level = (String)session.getAttribute("member_level");
	  int sales_number = Integer.parseInt(request.getParameter("sales_number"));
	 
	  check = boardDao.AdDelete(sales_number); 
	  
	  //System.out.println(check);
	 
	  //System.out.println("BoardService:"+sales_number+"\t"+check);
	  
	  mav.addObject("check", check); 
	  mav.addObject("member_level",member_level);
	  mav.addObject("sales_number",sales_number);
	  
	  }

	@Override
	public void ReportDetail(ModelAndView mav) {
		
		Map<String, Object> map=mav.getModelMap();
		HttpServletRequest request=(HttpServletRequest)map.get("request");
		
		int report_number = Integer.parseInt(request.getParameter("report_number"));
		
		List<ReportDto> list = boardDao.ReportDetail(report_number);
		
		mav.addObject("list", list);
		mav.addObject("report_number", report_number);
		//System.out.println("BoardServiceDetail:"+report_number);
		//System.out.println("BoardServiceDetail:"+list);
	
	
		mav.setViewName("/report/report_detail");
		
	}

	@Override
	public int reportUpdate(ModelAndView mav) {
		 Map<String, Object> map=mav.getModelMap();
	     HttpServletRequest request=(HttpServletRequest)map.get("request");
	     int sales_number = Integer.parseInt(request.getParameter("sales_number"));
	     
	     System.out.println("sales_number"+sales_number);
	     
	     int check = boardDao.reportUpdate(sales_number);
	
	     System.out.println(check);
	     
	     mav.addObject("check", check);	
	     mav.addObject("sales_number", sales_number);	
	     
	     return check;
	}
}