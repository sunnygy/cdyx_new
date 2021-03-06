package com.cdyx.controller;




import com.cdyx.entity.*;
import com.cdyx.model.NewOrderModel;
import com.cdyx.service.MenuParentService;
import com.cdyx.service.MenuService;
import com.cdyx.service.OrderTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.cdyx.common.util.PageResults;
import com.cdyx.model.PageRequestModel;
import com.cdyx.model.TodayOrderModel;
import com.cdyx.service.OrderService;

import java.util.List;


/**
 * Created by guyu on 2016/11/19.
 */
@Controller
@RequestMapping("/order")
public class OrderMangerController {
	
	
	@Autowired
	private OrderService orderService;

	@Autowired
	private MenuParentService menuParentService;

	@Autowired
	private MenuService menuService;

	@Autowired
	private OrderTypeService orderTypeService;



	@RequestMapping(value = "/addNewOrder.json",method = RequestMethod.POST)
	@ResponseBody
	public Object addNewOrder(@RequestBody Order order){


		Integer id=orderService.saveNewOrder(order);

		
	    return id;
		
	}

	@RequestMapping(value = "/finishOrder.json",method = RequestMethod.POST)
	@ResponseBody
	public Object finnishOrder(@RequestBody Order order){

		orderService.closeOrder(order);


		return null;

	}


	@RequestMapping(value = "/getOrderPage.json",method = RequestMethod.POST)
	@ResponseBody
	public Object getOrderPage (@RequestBody PageRequestModel page){


		PageResults<Order>result=orderService.getOrderByDate(page.getBeginDate(), page.getEndDate(),null,page.getCuurentPage());



		return result;

	}


	
	
	@RequestMapping(value = "/updateOrder.htm",method = RequestMethod.POST)
	public Object updateOrder(@RequestBody TableList  table,@RequestBody Order  order){	
		
		  		
		
	   return null;
		
	}
	
	@RequestMapping(value = "/deleteOrder.htm",method = RequestMethod.POST)
	public Object deleteOrder(@RequestBody Integer orderId){

		orderService.deleteOrder(orderId);
	    return null;
		
	}
	
	@RequestMapping(value = "/getOrderByTable.htm",method = RequestMethod.GET)
	public Object getOrderByTableId(@RequestBody Integer tableId){	
		
		  orderService.getOrderByTableId(tableId);			
		
	   return null;
		
	}
	
	@RequestMapping(value = "/goAllOrder.htm")
	public ModelAndView goAllOrder(){	
		
		ModelAndView view=new ModelAndView("/allOrder");
		
		PageResults<Order>result=orderService.getOrderByDate(null, null, null, null);	
	
		
		view.addObject("result", result);
		
	   return view;
		
	}
	
	@RequestMapping(value = "/goTodayOrder.htm")
	public ModelAndView goTodayOrder(){	
		
		ModelAndView view=new ModelAndView("/todayOrder");
		
		TodayOrderModel orders=orderService.getTodayOrder();
	
		
		view.addObject("orders", orders);
		
	   return view;
		
	}


	@RequestMapping(value = "/goTableOrder.html")
	public ModelAndView goTableOrder(@RequestParam Integer tableId){

		ModelAndView view=new ModelAndView("/tableOrder");

		List<MenuParent> menuParents=menuParentService.getAllMenuParent();
		List<Menu>menus=menuService.getAllMenu();
		Order order=orderService.getOrderByTableId(tableId);
		List<OrderType>orderTypes=orderTypeService.getAllOrderTypes();




		view.addObject("tableId",tableId);
		view.addObject("order", order);
		view.addObject("menuParents", menuParents);
		view.addObject("menus",menus);
		view.addObject("orderTypes",orderTypes);

		return view;

	}


	

	
	
	
	





}
