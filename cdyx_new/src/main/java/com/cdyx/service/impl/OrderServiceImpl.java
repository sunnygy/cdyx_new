package com.cdyx.service.impl;

import com.cdyx.dao.OrderDao;
import com.cdyx.dao.OrderDetailDao;
import com.cdyx.dao.TableListDao;
import com.cdyx.entity.Order;
import com.cdyx.entity.OrderDetail;
import com.cdyx.entity.TableList;
import com.cdyx.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by guyu on 2016/11/19.
 */
@Service
public class OrderServiceImpl implements OrderService {


    @Autowired
    private OrderDao orderDao;

    @Autowired
    private OrderDetailDao detailDao;

    @Autowired
    private TableListDao tableListDao;


    @SuppressWarnings("unchecked")
	public Integer saveNewOrder(Order order, OrderDetail detail, Integer tableId) {
        TableList tableList=new TableList();
        tableList.setId(tableId);
        tableList.setStatus(true);
        tableListDao.update(tableId);

        order.setTab(tableList);
        order.setStatus(true);
        order.setCode("");//TODO
        order.setCreateTimer(new Date());
        Integer orderId=(Integer) orderDao.save(order);

        detail.setOrder(order);
        detailDao.save(order);

        //TODO send message to table and ckechin Today order and  ALL order

        return  orderId;
    }



}
