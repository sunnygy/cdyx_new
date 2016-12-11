package com.cdyx.model;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import com.cdyx.entity.Order;

public class TodayOrderModel {
	
	
	private List<Order> processOrders=new ArrayList<Order>();
	
	private List<Order> finishedOrders=new ArrayList<Order>();	
	
	private BigDecimal processBill;

	private BigDecimal totalBill;
	


	public List<Order> getProcessOrders() {
		return processOrders;
	}

	public void setProcessOrders(List<Order> processOrders) {
		this.processOrders = processOrders;
	}

	public List<Order> getFinishedOrders() {
		return finishedOrders;
	}

	public void setFinishedOrders(List<Order> finishedOrders) {
		this.finishedOrders = finishedOrders;
	}

	public BigDecimal getProcessBill() {
		return processBill;
	}

	public void setProcessBill(BigDecimal processBill) {
		this.processBill = processBill;
	}

	public BigDecimal getTotalBill() {
		return totalBill;
	}

	public void setTotalBill(BigDecimal totalBill) {
		this.totalBill = totalBill;
	}
}
