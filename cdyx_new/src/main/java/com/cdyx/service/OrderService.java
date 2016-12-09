package com.cdyx.service;


import java.util.Date;
import java.util.List;

import com.cdyx.common.util.PageResults;
import com.cdyx.entity.Order;
import com.cdyx.entity.OrderDetail;
import com.cdyx.entity.TableList;
import com.cdyx.model.OrderModel;
import com.cdyx.model.TodayOrderModel;


/**
 * Created by guyu on 2016/10/4.
 */
public interface OrderService {

    Integer saveNewOrder(Order order);

	void updateOrder(Order order,TableList table);

	void deleteOrder(Integer orderId);

	Order getOrderByTableId(Integer tableId);
	
	PageResults<Order> getOrderByDate(Date beginDay,Date endDay,Integer pageSize,Integer currentPage);

	List<Order> getAllOrder();
	
	TodayOrderModel getTodayOrder();
	
	

	

}
