package com.cdyx.service;

import java.util.List;

import com.cdyx.entity.OrderDetail;

public interface OrderDetailService {
	
	List<OrderDetail> getAllDetailsByOrderId(Integer orderId);
	
			

}
