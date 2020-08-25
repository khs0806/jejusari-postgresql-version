package com.kitri.jejusari.dto;

public class NoticeImgDto {
	private int image_index;
	private String image_url;
	private int notice_number;
	
	public NoticeImgDto() {}

	public NoticeImgDto(int image_index, String image_url, int notice_number) {
		super();
		this.image_index = image_index;
		this.image_url = image_url;
		this.notice_number = notice_number;
	}

	public int getImage_index() {
		return image_index;
	}

	public void setImage_index(int image_index) {
		this.image_index = image_index;
	}

	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}

	public int getNotice_number() {
		return notice_number;
	}

	public void setNotice_number(int notice_number) {
		this.notice_number = notice_number;
	}

	@Override
	public String toString() {
		return "NoticeImgDto [image_index=" + image_index + ", image_url=" + image_url + ", notice_number="
				+ notice_number + "]";
	}
	
	
}
