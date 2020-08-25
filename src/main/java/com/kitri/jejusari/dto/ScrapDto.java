package com.kitri.jejusari.dto;

public class ScrapDto {
	private String member_id;
	private int scrap_number;
	private int sales_number;
	
	public ScrapDto() {
	}

	public ScrapDto(String member_id, int scrap_number, int sales_number) {
		super();
		this.member_id = member_id;
		this.scrap_number = scrap_number;
		this.sales_number = sales_number;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getScrap_number() {
		return scrap_number;
	}

	public void setScrap_number(int scrap_number) {
		this.scrap_number = scrap_number;
	}

	public int getSales_number() {
		return sales_number;
	}

	public void setSales_number(int sales_number) {
		this.sales_number = sales_number;
	}

	@Override
	public String toString() {
		return "ScrapDto [member_id=" + member_id + ", scrap_number=" + scrap_number + ", sales_number=" + sales_number
				+ "]";
	}
	
}
