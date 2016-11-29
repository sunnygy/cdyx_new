package com.cdyx.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdyx.dao.OrderDao;
import com.cdyx.dao.OrderDetailDao;
import com.cdyx.dao.TableListDao;
import com.cdyx.entity.Order;
import com.cdyx.entity.OrderDetail;
import com.cdyx.entity.TableList;
import com.cdyx.service.OrderService;

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
	public Integer saveNewOrder(Order order, List<OrderDetail> details, Integer tableId) {
        TableList tableList=new TableList();
        tableList.setId(tableId);
        tableList.setStatus(true);
        tableList.setCode("01");
        tableListDao.update(tableList);

        order.setTab(tableList);
        order.setStatus(true);
        order.setCode("aaaaa");//TODO
        order.setCreateTimer(new Date());
        Integer orderId=(Integer) orderDao.save(order);
        
        for (OrderDetail orderDetail : details) {
        	 orderDetail.setOrder(order);
        	 detailDao.save(orderDetail);
		}       

        //TODO send message to table and ckechin Today order and  ALL order

        return  orderId;
    }


	@SuppressWarnings("unchecked")
	public void updateOrder(Order order, List<OrderDetail> details, Integer tableId) {
		
		if(tableId!=null){
			TableList tableList=new TableList();
	        tableList.setId(tableId);
	        tableList.setStatus(true);
	        tableListDao.update(tableList);
	        order.setTab(tableList);
		}
		if(order!=null){
			orderDao.update(order);
		}

	    for (OrderDetail orderDetail : details) {
        	orderDetail.setOrder(order);
        	detailDao.update(orderDetail);
		}    
		
		
	}


	public void deleteOrder(Integer orderId) {
		
		//set table status

		Order order=orderDao.get(9);


		System.out.println(order.getTab().getId());
		
	}


	public Order getOrderByTableId(Integer tableId) {		
		
		String hql="SELECT a.* FROM Order as a  LEFT JOIN TableList as b ON a.table_id=b.table_id " +
				"WHERE b.table_status=true AND a.order_status=true AND b.table_id=? ";
		
		Order order=orderDao.getByHQL(hql, tableId);
		
		return order;
	}



	public List<Order> getAllOrder() {
		
		String sql="SELECT * FROM `order` WHERE order_status=true";
		
		List<Order>orders=orderDao.getListBySQL(sql);

		System.out.println(orders.get(0).getTab().getId());
		
		return orders;
	}






}
