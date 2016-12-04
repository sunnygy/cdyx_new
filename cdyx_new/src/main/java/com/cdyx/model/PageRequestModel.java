package com.cdyx.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class PageRequestModel implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -6429040974006562372L;

	private Integer cuurentPage;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date beginDate;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date endDate;

	public Integer getCuurentPage() {
		return cuurentPage;
	}

	public void setCuurentPage(Integer cuurentPage) {
		this.cuurentPage = cuurentPage;
	}


	public Date getBeginDate() {
		return beginDate;
	}

	public void setBeginDate(Date beginDate) {
		this.beginDate = beginDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	
	
	

}
