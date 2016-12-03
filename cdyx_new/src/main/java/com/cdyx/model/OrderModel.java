package com.cdyx.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.cdyx.entity.OrderDetail;
import com.cdyx.entity.OrderType;
import com.cdyx.entity.TableList;

public class OrderModel {
	
	
    private Integer id;

   
    private String code;
    
  
    private Integer peopleNum;

 
    private Date createTimer;
    
   
    private String peopleType;    
    
 
    private OrderType orderType;

 
    private Date endTimer;

 
    private Short discount;

  
    private BigDecimal totalPrice;

   
    private String description;

  
    private boolean status; 
    
   
    private TableList table;
    
    private Integer pageSize;
    
    private Integer PageNum;
    
    private Integer totalPage;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Integer getPeopleNum() {
		return peopleNum;
	}

	public void setPeopleNum(Integer peopleNum) {
		this.peopleNum = peopleNum;
	}

	public Date getCreateTimer() {
		return createTimer;
	}

	public void setCreateTimer(Date createTimer) {
		this.createTimer = createTimer;
	}

	public String getPeopleType() {
		return peopleType;
	}

	public void setPeopleType(String peopleType) {
		this.peopleType = peopleType;
	}

	public OrderType getOrderType() {
		return orderType;
	}

	public void setOrderType(OrderType orderType) {
		this.orderType = orderType;
	}

	public Date getEndTimer() {
		return endTimer;
	}

	public void setEndTimer(Date endTimer) {
		this.endTimer = endTimer;
	}

	public Short getDiscount() {
		return discount;
	}

	public void setDiscount(Short discount) {
		this.discount = discount;
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public TableList getTable() {
		return table;
	}

	public void setTable(TableList table) {
		this.table = table;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageNum() {
		return PageNum;
	}

	public void setPageNum(Integer pageNum) {
		PageNum = pageNum;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}
    
    
    

}
