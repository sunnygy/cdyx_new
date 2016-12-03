package service;



import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.cdyx.common.util.PageResults;
import com.cdyx.entity.Order;
import com.cdyx.entity.OrderDetail;
import com.cdyx.service.OrderService;

import dao.BaseTest;
public class OrderServiceTest extends BaseTest{
	
	@Autowired
	private OrderService orderService;
	
	@Test
	public void  testsaveNewOrder(){		
		
		Order order=new Order();		
		order.setCode("01");
		order.setCreateTimer(new Date());
		order.setDescription("fhsdjhfjsdf");
		order.setDiscount((short)110);
		order.setStatus(true);
		List<OrderDetail>list=new ArrayList<OrderDetail>();
		for(int i=0;i<10;++i){			
			OrderDetail detail=new OrderDetail();			
			detail.setNumbers((short)5);			
			list.add(detail);
		}
		
		Integer orderId=orderService.saveNewOrder(order,list , 10);
		
	}
	
	@Test
	public void testupdateOrder(){

		Order order=new Order();
		order.setId(5);
		order.setStatus(false);

		OrderDetail detail=new OrderDetail();




	}
	
	@Test
	public void deleteOrder(){

		orderService.deleteOrder(5);

		
	}
	
	@Test
	public void getOrderByTableId(){

		Order order=orderService.getOrderByTableId(11);
		
		List<OrderDetail>details=order.getDetails();
		
		System.out.println(details.size());



	}
	
	@Test
	public void getAllOrder(){

		List<Order>orders=orderService.getAllOrder();
		
		for (Order order : orders) {			
			
			System.out.println(order.getTable().getCode());
		}
	
		
		
	}
	
	
	@Test
	public void getOrderByDate() throws ParseException{
		SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
		
		String beginStr="2016-11-10 00:00:00";
		
		String endStr="2016-11-28 00:00:00";
		
		Date begin=sdf.parse(beginStr);
		
		Date end=sdf.parse(endStr);
	
		
		PageResults<Order>result=orderService.getOrderByDate(begin, end, 1, 1);
		
		List<Order>order=result.getResults();
		
		System.out.println("order size:="+order.size());
		
		System.out.println(order.get(0));
		
		System.out.println(result.getTotalCount());
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
