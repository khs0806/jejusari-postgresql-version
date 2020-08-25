package com.kitri.jejusari.dto;

public class SalesDto extends Criteria{
	private int sales_number;				//게시글 번호
	private String member_id;				// 작성자
	private String sales_date;				// 작성일자
	private String sales_title;				// 글 제목
	private String sales_content;			// 글 내용
	private String sales_category_type;		// 아파트/원룸/오피스텔 구분
	private String sales_category_rent;		// 전월세 구분
	private Integer sales_deposit;				// 보증금
	private Integer sales_cost;					// 매매가 or 전월세
	private int sales_factor_total;			// 귤지수
	private float sales_area;				// 면적(m^2)
	private String sales_address;			// 주소
	private int sales_check_blind;			// 신고처리시 블라인드 처리 유무
	private int sales_count;				//조회수
	private String sales_option;			// 옵션
	private int sales_build_year;			//준공년도
	private String sales_floor;				//층수
	
	private int sales_full;				//풀옵션 유무
	private int sales_parking;				//주차장 유무
	private int sales_cctv;				//CCTV 유무
	private int sales_ele;				//엘베 유무
	
	public SalesDto() {
	}

	public SalesDto(int sales_number, String member_id, String sales_date, String sales_title, String sales_content,
			String sales_category_type, String sales_category_rent, int sales_deposit, int sales_cost,
			int sales_factor_total, int sales_area, String sales_address, int sales_check_blind, int sales_count,
			String sales_option, int sales_build_year, String sales_floor, int sales_full, int sales_parking,
			int sales_cctv, int sales_ele) {
		super();
		this.sales_number = sales_number;
		this.member_id = member_id;
		this.sales_date = sales_date;
		this.sales_title = sales_title;
		this.sales_content = sales_content;
		this.sales_category_type = sales_category_type;
		this.sales_category_rent = sales_category_rent;
		this.sales_deposit = sales_deposit;
		this.sales_cost = sales_cost;
		this.sales_factor_total = sales_factor_total;
		this.sales_area = sales_area;
		this.sales_address = sales_address;
		this.sales_check_blind = sales_check_blind;
		this.sales_count = sales_count;
		this.sales_option = sales_option;
		this.sales_build_year = sales_build_year;
		this.sales_floor = sales_floor;
		this.sales_option = sales_option;
		this.sales_parking = sales_parking;
		this.sales_cctv = sales_cctv;
		this.sales_ele = sales_ele;
	}

	public int getSales_number() {
		return sales_number;
	}

	public void setSales_number(int sales_number) {
		this.sales_number = sales_number;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getSales_date() {
		return sales_date;
	}

	public void setSales_date(String sales_date) {
		this.sales_date = sales_date;
	}

	public String getSales_title() {
		return sales_title;
	}

	public void setSales_title(String sales_title) {
		this.sales_title = sales_title;
	}

	public String getSales_content() {
		return sales_content;
	}

	public void setSales_content(String sales_content) {
		this.sales_content = sales_content;
	}

	public String getSales_category_type() {
		return sales_category_type;
	}

	public void setSales_category_type(String sales_category_type) {
		this.sales_category_type = sales_category_type;
	}

	public String getSales_category_rent() {
		return sales_category_rent;
	}

	public void setSales_category_rent(String sales_category_rent) {
		this.sales_category_rent = sales_category_rent;
	}

	public int getSales_deposit() {
		return sales_deposit;
	}

	public void setSales_deposit(int sales_deposit) {
		this.sales_deposit = sales_deposit;
	}

	public int getSales_cost() {
		return sales_cost;
	}
	
	public void setSales_cost(int sales_cost) {
		this.sales_cost = sales_cost;
	}
	
	public int getSales_factor_total() {
		return sales_factor_total;
	}

	public void setSales_factor_total(int sales_factor_total) {
		this.sales_factor_total = sales_factor_total;
	}

	public float getSales_area() {
		return sales_area;
	}

	public void setSales_area(float sales_area) {
		this.sales_area = sales_area;
	}

	public String getSales_address() {
		return sales_address;
	}

	public void setSales_address(String sales_address) {
		this.sales_address = sales_address;
	}

	public int getSales_check_blind() {
		return sales_check_blind;
	}

	public void setSales_check_blind(int sales_check_blind) {
		this.sales_check_blind = sales_check_blind;
	}

	public int getSales_count() {
		return sales_count;
	}

	public void setSales_count(int sales_count) {
		this.sales_count = sales_count;
	}

	public String getSales_option() {
		return sales_option;
	}

	public void setSales_option(String sales_option) {
		this.sales_option = sales_option;
	}


	public int getSales_build_year() {
		return sales_build_year;
	}

	public void setSales_build_year(int sales_build_year) {
		this.sales_build_year = sales_build_year;
	}

	public String getSales_floor() {
		return sales_floor;
	}

	public void setSales_floor(String sales_floor) {
		this.sales_floor = sales_floor;
	}
	

	public int getSales_full() {
		return sales_full;
	}

	public void setSales_full(int sales_full) {
		this.sales_full = sales_full;
	}

	public int getSales_parking() {
		return sales_parking;
	}

	public void setSales_parking(int sales_parking) {
		this.sales_parking = sales_parking;
	}

	public int getSales_cctv() {
		return sales_cctv;
	}

	public void setSales_cctv(int sales_cctv) {
		this.sales_cctv = sales_cctv;
	}

	public int getSales_ele() {
		return sales_ele;
	}

	public void setSales_ele(int sales_ele) {
		this.sales_ele = sales_ele;
	}

	@Override
	public String toString() {
		return "SalesDto [sales_number=" + sales_number + ", member_id=" + member_id + ", sales_date=" + sales_date
				+ ", sales_title=" + sales_title + ", sales_content=" + sales_content + ", sales_category_type="
				+ sales_category_type + ", sales_category_rent=" + sales_category_rent + ", sales_deposit="
				+ sales_deposit + ", sales_cost=" + sales_cost + ", sales_factor_total=" + sales_factor_total
				+ ", sales_area=" + sales_area + ", sales_address=" + sales_address + ", sales_check_blind="
				+ sales_check_blind + ", sales_count=" + sales_count + ", sales_option=" + sales_option + ", sales_build_year="
				+ sales_build_year + ", sales_floor=" + sales_floor + ", sales_full=" + sales_full
				+ ", sales_parking=" + sales_parking + ", sales_cctv=" + sales_cctv + ", sales_ele=" + sales_ele + "]";
	}


	
}
