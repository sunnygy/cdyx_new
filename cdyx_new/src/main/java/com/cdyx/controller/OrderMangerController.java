package com.cdyx.controller;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cdyx.entity.Order;
import com.cdyx.entity.OrderDetail;
import com.cdyx.service.OrderService;


/**
 * Created by guyu on 2016/11/19.
 */
@Controller
@RequestMapping("/order")
public class OrderMangerController {
	
	
	@Autowired
	private OrderService orderService;		
	
	
	@RequestMapping(value = "/addNewOrder.htm",method = RequestMethod.POST)
	public Object addNewOrder(@RequestBody Integer  tableId,@RequestBody Order  order,@RequestBody List<OrderDetail>  orderDetails){	
		
		Integer orderId=orderService.saveNewOrder(order, orderDetails, tableId);			
		
	   return orderId;
		
	}
	
	
	@RequestMapping(value = "/updateOrder.htm",method = RequestMethod.POST)
	public Object updateOrder(@RequestBody Integer  tableId,@RequestBody Order  order,@RequestBody List<OrderDetail>  orderDetails){	
		
		     orderService.updateOrder(order, orderDetails, tableId);			
		
	   return null;
		
	}
	
	@RequestMapping(value = "/deleteOrder.htm",method = RequestMethod.POST)
	public Object updateOrder(@RequestBody Integer orderId){	
		
		     orderService.deleteOrder(orderId);			
		
	   return null;
		
	}
	
	@RequestMapping(value = "/getOrderByTable.htm",method = RequestMethod.GET)
	public Object getOrderByTableId(@RequestBody Integer tableId){	
		
		  orderService.getOrderByTableId(tableId);			
		
	   return null;
		
	}
	
	@RequestMapping(value = "/getAllOrder.htm",method = RequestMethod.GET)
	public Object getOrderByTableId(){	
		
		  orderService.getAllOrder();			
		
	   return null;
		
	}
	
	
	
	





}
