package com.kitri.jejusari.dto;

public class MemberDto {
	private String member_id;
	private int member_number;
	private String member_name;
	private String member_email;
	private String member_phone;
	private String member_level;
	private String member_register_date;
	
	public MemberDto() {
	}

	public MemberDto(String member_id, int member_number, String member_name, String member_email, String member_phone,
			String member_level, String member_register_date) {
		super();
		this.member_id = member_id;
		this.member_number = member_number;
		this.member_name = member_name;
		this.member_email = member_email;
		this.member_phone = member_phone;
		this.member_level = member_level;
		this.member_register_date = member_register_date;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public int getMember_number() {
		return member_number;
	}

	public void setMember_number(int member_number) {
		this.member_number = member_number;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_level() {
		return member_level;
	}

	public void setMember_level(String member_level) {
		this.member_level = member_level;
	}

	public String getMember_register_date() {
		return member_register_date;
	}

	public void setMember_register_date(String member_register_date) {
		this.member_register_date = member_register_date;
	}

	@Override
	public String toString() {
		return "MemberDto [member_id=" + member_id + ", member_number=" + member_number + ", member_name=" + member_name
				+ ", member_email=" + member_email + ", member_phone=" + member_phone + ", member_level=" + member_level
				+ ", member_register_date=" + member_register_date + "]";
	}
	
}
