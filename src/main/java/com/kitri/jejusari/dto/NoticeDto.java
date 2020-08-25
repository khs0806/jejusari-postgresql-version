package com.kitri.jejusari.dto;

import java.util.Date;

public class NoticeDto {
	private int notice_number;
	private String notice_title;
	private Date notice_date;
	private String notice_content;
	private int notice_count;
	private String member_id;
	
	public NoticeDto() {
	}

	public NoticeDto(int notice_number, String notice_title, Date notice_date, String notice_content,
			int notice_count, String member_id) {
		super();
		this.notice_number = notice_number;
		this.notice_title = notice_title;
		this.notice_date = notice_date;
		this.notice_content = notice_content;
		this.notice_count = notice_count;
		this.member_id = member_id;
	}

	public int getNotice_number() {
		return notice_number;
	}

	public void setNotice_number(int notice_number) {
		this.notice_number = notice_number;
	}

	public String getNotice_title() {
		return notice_title;
	}

	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}

	public Date getNotice_date() {
		return notice_date;
	}

	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}

	public String getNotice_content() {
		return notice_content;
	}

	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}

	public int getNotice_count() {
		return notice_count;
	}

	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	@Override
	public String toString() {
		return "NoticeDto [notice_number=" + notice_number + ", notice_title=" + notice_title + ", notice_date="
				+ notice_date + ", notice_content=" + notice_content + ", notice_count=" + notice_count + ", member_id="
				+ member_id + "]";
	}
	
}
