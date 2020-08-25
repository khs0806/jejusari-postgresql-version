package com.kitri.jejusari.dto;

public class ReportDto {
	private int report_number;
	private String member_id;
	private String report_date;
	private String report_title;
	private String report_content;
	private int check_complete;
	private int sales_number;
	
	public ReportDto() {
	}

	public ReportDto(int report_number, String member_id, String report_date, String report_title,
			String report_content, int check_complete, int sales_number) {
		super();
		this.report_number = report_number;
		this.member_id = member_id;
		this.report_date = report_date;
		this.report_title = report_title;
		this.report_content = report_content;
		this.check_complete = check_complete;
		this.sales_number = sales_number;
	}

	public int getReport_number() {
		return report_number;
	}

	public void setReport_number(int report_number) {
		this.report_number = report_number;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getReport_date() {
		return report_date;
	}

	public void setReport_date(String report_date) {
		this.report_date = report_date;
	}

	public String getReport_title() {
		return report_title;
	}

	public void setReport_title(String report_title) {
		this.report_title = report_title;
	}

	public String getReport_content() {
		return report_content;
	}

	public void setReport_content(String report_content) {
		this.report_content = report_content;
	}

	public int getCheck_complete() {
		return check_complete;
	}

	public void setCheck_complete(int check_complete) {
		this.check_complete = check_complete;
	}

	public int getSales_number() {
		return sales_number;
	}

	public void setSales_number(int sales_number) {
		this.sales_number = sales_number;
	}

	@Override
	public String toString() {
		return "ReportDto [report_number=" + report_number + ", member_id=" + member_id + ", report_date=" + report_date
				+ ", report_title=" + report_title + ", report_content=" + report_content + ", check_complete="
				+ check_complete + ", sales_number=" + sales_number + "]";
	}
	
}
