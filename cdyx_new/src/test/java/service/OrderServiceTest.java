package service;



import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

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
		
		Integer orderId=orderService.saveNewOrder(order,list , 11);
		
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



	}
	
	@Test
	public void getAllOrder(){

		List<Order>order=orderService.getAllOrder();
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
