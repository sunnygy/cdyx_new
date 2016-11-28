package com.cdyx.service;


import java.util.List;

import com.cdyx.entity.Order;
import com.cdyx.entity.OrderDetail;


/**
 * Created by guyu on 2016/10/4.
 */
public interface OrderService {

    Integer saveNewOrder(Order order, List<OrderDetail> orderDetails, Integer tableId);

	void updateOrder(Order order, List<OrderDetail> details, Integer tableId);

	void deleteOrder(Integer orderId);

	Order getOrderByTableId(Integer tableId);

	List<Order> getAllOrder();
   

}
