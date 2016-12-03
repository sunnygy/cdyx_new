package com.cdyx.service;


import java.util.Date;
import java.util.List;

import com.cdyx.common.util.PageResults;
import com.cdyx.entity.Order;
import com.cdyx.entity.OrderDetail;
import com.cdyx.model.OrderModel;


/**
 * Created by guyu on 2016/10/4.
 */
public interface OrderService {

    Integer saveNewOrder(Order order, List<OrderDetail> orderDetails, Integer tableId);

	void updateOrder(Order order, List<OrderDetail> details, Integer tableId);

	void deleteOrder(Integer orderId);

	Order getOrderByTableId(Integer tableId);
	
	PageResults<Order> getOrderByDate(Date beginDay,Date endDay,int pageSize,int currentPage);

	List<Order> getAllOrder();

	

}
