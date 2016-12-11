package com.cdyx.service.impl;


import java.io.IOException;
import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.cdyx.common.util.*;
import com.cdyx.dao.MenuDao;
import com.cdyx.entity.Menu;
import com.cdyx.websocket.OrderWebSocket;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdyx.dao.OrderDao;
import com.cdyx.dao.OrderDetailDao;
import com.cdyx.dao.TableListDao;
import com.cdyx.entity.Order;
import com.cdyx.entity.OrderDetail;
import com.cdyx.entity.TableList;
import com.cdyx.model.TodayOrderModel;
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


	@Autowired
	private MenuDao menuDao;




    
	public Integer saveNewOrder(Order order) {

		String sql="UPDATE Table_list SET table_status=true WHERE table_id= ?";
		tableListDao.querySql(sql,order.getTable().getId());

		order.setStatus(1);
		order.setCode(GenerateOrderCode.getOrderNo());
		order.setCreateTimer(new Date());
		order.setDiscount((short)100);

		List<OrderDetail>details=order.getDetails();

		if(details.size()>0){

			BigDecimal totalPrice=new BigDecimal(0);

			for (OrderDetail detail :details) {

				BigDecimal detailPrice=new BigDecimal(0);

				Integer menuId=detail.getMenu().getId();

				Menu menu=menuDao.get(menuId);

				detailPrice=menu.getPrice().multiply(new BigDecimal(detail.getNumbers()));

				totalPrice=totalPrice.add(detailPrice);
				detail.setDetailPrice(detailPrice);
				detail.setStatus(false);
				detail.setStartTime(new Date());


			}
			order.setTotalPrice(totalPrice);


		}

        Integer id= (Integer) orderDao.save(order);

		orderDao.getSession().evict(order);

		if(details.size()>0){
			for (OrderDetail detail :details) {

				detail.setOrderId(id);
				detailDao.save(detail);

			}
		}

        List<OrderWebSocket> list= UserPool.getUserPool();
        for (OrderWebSocket orderWebSocket : list) {
        	try {

				orderWebSocket.sendMessage(JsonUtil.toJson(orderDao.get(id)));
			} catch (IOException e) {				
				e.printStackTrace();
			}
			
		}
        
        return  id;
    }


	
	public void updateOrder(Order order, TableList table) {
		
		if(table!=null)			
			order.setTable(table);
		
	    orderDao.update(order);
			
		
	}


	public void deleteOrder(Integer orderId) {
		
		//set table status
		
		String  hql="FROM Order";

	    List<Order>orders=orderDao.getListByHQL(hql);
	    
	    System.out.println(orders.size());

	
		
	}


	public Order getOrderByTableId(Integer tableId) {		
		
		String sql="SELECT a.* FROM order_info as a  LEFT JOIN table_list as b ON a.table_id=b.table_id " +
				"WHERE a.order_status=true AND b.table_id=? ";
		
		Order order=orderDao.getBySQL(sql, tableId);
		
		return order;
	}

	public PageResults<Order> getOrderByDate(Date beginDay, Date endDay, Integer pageSize,Integer currentPage) {
		
			if(beginDay==null){
				Calendar calendar = Calendar.getInstance();	
				calendar.set(Calendar.HOUR_OF_DAY, 0);
				calendar.set(Calendar.MINUTE, 0);
				calendar.set(Calendar.SECOND, 0);				
				endDay=calendar.getTime();
				beginDay=DateUtil.addDay(endDay, -1);
			}
		if(pageSize==null)
			pageSize=10;
		
		if(currentPage==null)
			currentPage=1;		
		
		String hql="FROM Order o WHERE o.createTimer >=?  AND o.createTimer <? ";
		
		String countHql="SELECT COUNT(*) FROM Order o WHERE o.createTimer >=?  AND o.createTimer < ? ";	
		
		endDay=DateUtil.addDay(endDay, 1);
		
		PageResults<Order>result=orderDao.findPageByFetchedHql(hql, countHql, currentPage, pageSize,beginDay,endDay);                                         				
		
		return result;
	}
	
	



	public TodayOrderModel getTodayOrder() {
		
		Calendar calendar = Calendar.getInstance();	
		calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		
		Date today=calendar.getTime();
		
		Date endDay=DateUtil.addDay(today,1);
		
		String hql="FROM Order o WHERE o.createTimer >=?  AND o.createTimer < ? ";
		
		List<Order>orders=orderDao.getListByHQL(hql, today,endDay);
		
		if(orders.size()>0){
			
			TodayOrderModel model=new TodayOrderModel();
			
			BigDecimal processBill=new BigDecimal(0);
			
			BigDecimal totalBill=new BigDecimal(0);
			
			for (Order order : orders) {
				
				if(order.getStatus().equals(1)){					
					model.getProcessOrders().add(order);
					processBill=processBill.add(order.getTotalPrice());
				}else if(order.getStatus().equals(2)){

                    model.getFinishedOrders().add(order);
                }

                totalBill=totalBill.add(order.getTotalPrice());
				
			}			
			
			model.setProcessBill(processBill);

			model.setTotalBill(totalBill);
			
			
			return model;
			
			
		}		
		
		return null;
	}



	public List<Order> getAllOrder() {	
	
		
		String sql="SELECT * FROM order_info WHERE order_status=true";
		
		List<Order>orders=orderDao.getListBySQL(sql);
		
		if(orders.size()>0)
			return orders;	
		
		return null;
	}


	public void closeOrder(Order order) {


		List<OrderDetail>details=order.getDetails();

		BigDecimal totalPrice=new BigDecimal(0);

		for (OrderDetail detail :details) {

			totalPrice=totalPrice.add(detail.getDetailPrice());

		}

		totalPrice=totalPrice.multiply(new BigDecimal((float)order.getDiscount()/100));


		String sql="UPDATE table_list SET table_status=false WHERE table_id= ?";

		tableListDao.querySql(sql,order.getTable().getId());


		String sql2="UPDATE order_info SET end_time= ?,total_price= ?, order_status= ?  WHERE order_id= ?  ";

		orderDao.querySql(sql2,new Date(),totalPrice,order.getStatus(),order.getId());


		Order orderJson=orderDao.getByHQL("FROM Order WHERE id= ? ",order.getId());
		orderJson.setDetails(null);


		List<OrderWebSocket> list= UserPool.getUserPool();
		for (OrderWebSocket orderWebSocket : list) {
			try {
				orderWebSocket.sendMessage(JsonUtil.toJson(orderJson));
			} catch (IOException e) {
				e.printStackTrace();
			}

		}



	}
}
