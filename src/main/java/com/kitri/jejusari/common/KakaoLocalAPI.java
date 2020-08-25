package com.kitri.jejusari.common;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;

public class KakaoLocalAPI {
	//카카오 API 앱 키값
	private static final String APPKEY = "47d269828391ebdbbd9ef43e5d60962c";
	
	@SuppressWarnings("unchecked")
	public static List<String> kakaoAPI(String place){
		
//		String place = "제주특별자치도 제주시 화북이동 177";
		List<String> factor = null;
		
		try {
			// 검색할 장소에 대한 좌표 x,y값을 찾을 URL을 요청
			String queryString = "?query="+URLEncoder.encode(place, "UTF-8");
			String apiURL = "https://dapi.kakao.com/v2/local/search/address.json" + queryString;
			URL url = new URL(apiURL);
			
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			
			String userCredentials = "KakaoAK " + APPKEY;
			
			// 카카오 앱키를 요청헤더 Authorization에 담아 전송
			con.setRequestProperty("Authorization", userCredentials); 
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			
			// 응답코드
			int responseCode = con.getResponseCode();
			System.out.println(responseCode);
			System.out.println("응답메시지 : " + con.getResponseMessage());
			BufferedReader br;
			
			
			if(responseCode==200) { // 응답코드 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream())); 
			} 
			else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
				
			String inputLine;
			StringBuffer res = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			
//			System.out.println("sd >>  "+res.toString());
			
			// 응답 받은 Json 데이터를 Map 객체로 변환
			Map<String, Object> map = new ObjectMapper().readValue(res.toString(), Map.class);
			List<Map<String,Object>> addressList = (List<Map<String, Object>>) map.get("documents");
			
			// 변환 받은 데이터를 카테고리 별 검색 수를 가져오기 위한 메서드에 전달
			factor = kakaoGetFactor(addressList);
			System.out.println("factor : " + factor.toString());
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return factor;
	}

	@SuppressWarnings("unchecked")
	public static List<String> kakaoGetFactor(List<Map<String, Object>> addressList) {
		
		List<Map<String,Object>> apiList = null;
		
		// 검색할 카테고리 5개, 순서대로 OL7(주유소), MT1(대형마트), PO3(공공기관), HP8(병원), AT4(관광지)
		String[] category = {"OL7","MT1","PO3","HP8","AT4"};
		List<String> factor = new ArrayList<String>();
		try {
			// 카테고리 별로 반경 3km 이내에 검색 지수를 반환
			for (int i=0; i<category.length; i++) {
				
				String x = (String) addressList.get(0).get("x");
				String y = (String) addressList.get(0).get("y");
				
				String postParams = "x=" + x + "&y=" + y + "&category_group_code=" + category[i] + "&radius=3000"; 
				String apiURL = "https://dapi.kakao.com/v2/local/search/category.json?" + postParams;
				URL url = new URL(apiURL);
				
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setRequestMethod("GET");
				
				String userCredentials = "KakaoAK " + APPKEY;
				
				con.setRequestProperty("Authorization", userCredentials); 
				con.setUseCaches(false);
				con.setDoInput(true);
				con.setDoOutput(true);
				
				System.out.println("응답메시지 : " + con.getResponseMessage());		//Bad Request
				
				int responseCode = con.getResponseCode();
				
				BufferedReader br;
				if(responseCode==200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream())); 
				} 
				else {  // 에러 발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				
				String inputLine;
				StringBuffer res = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					res.append(inputLine);
				}
				br.close();
				
				// json 데이터 잘 날라왔는지 체크
//				System.out.println("sd >>  " + res.toString());
				
				Map<String, Object> map = null;
				
				map = new ObjectMapper().readValue(res.toString(), Map.class);
				
				apiList = (List<Map<String, Object>>) map.get("documents");
//				System.out.println(apiList.size());
				
				factor.add(Integer.toString(apiList.size()));
				
			}

		} 
		catch (Exception e) {
			e.printStackTrace();
		}
			
		return factor;
	}
	
}
