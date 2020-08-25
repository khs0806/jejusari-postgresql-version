package com.kitri.jejusari.service;

import org.springframework.web.servlet.ModelAndView;


public interface SalesService {
	
	//상세페이지
	public void salesDetail(ModelAndView mav); 
	public void salesBroker(ModelAndView mav);
	public int salesScrap(ModelAndView mav);

	//
	public void salesList(ModelAndView mav);

	public void salesWriteOk(ModelAndView mav);
	
	public void salesUpdate(ModelAndView mav);
	public void salesUpdateOk(ModelAndView mav);
	
	public void salesDeleteOk(ModelAndView mav);
	
	public String salesIdCheck(int sales_number);
	public String getAddress(int sales_number);
}
