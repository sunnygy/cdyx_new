package com.cdyx.service;

import com.cdyx.entity.Employee;
import com.cdyx.entity.Order;
import com.cdyx.entity.OrderDetail;
import com.cdyx.entity.TableList;

/**
 * Created by guyu on 2016/10/4.
 */
public interface OrderService {

    Integer saveNewOrder(Order order, OrderDetail detail, Integer tableId);



}
