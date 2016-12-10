package service;



import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.cdyx.entity.*;
import com.cdyx.service.TableService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.cdyx.common.util.JsonUtil;
import com.cdyx.common.util.PageResults;
import com.cdyx.model.TodayOrderModel;
import com.cdyx.service.OrderService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.BaseTest;
import net.sf.json.util.JSONUtils;
public class OrderServiceTest extends BaseTest{
	
	@Autowired
	private OrderService orderService;

	@Autowired
	private TableService tableService;
	
	@Test
	public void  testsaveNewOrder(){	
		
		for(int j=0;j<10;++j){
		
			Order order=new Order();
			order.setDescription("fhsdjhfjsdf");
			order.setDiscount((short)110);
			order.setPeopleNum(5);

			List<OrderDetail>list=new ArrayList<OrderDetail>();
			Menu menu=new Menu();
			menu.setId(1);
			for(int i=0;i<2;++i){
				OrderDetail detail=new OrderDetail();
				detail.setNumbers((short)5);
				detail.setMenu(menu);
				list.add(detail);
			}

			order.setDetails(list);

			TableList table=new TableList();
			table.setId(11);
			table.setStatus(true);

			order.setTable(table);

			OrderType type=new OrderType();

			type.setId(4);

			order.setOrderType(type);


			Integer orderId=orderService.saveNewOrder(order);



		
		}
		
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
	public void getAllOrder() throws JsonProcessingException{
		
		 ObjectMapper mapper = new ObjectMapper(); 

		List<Order>orders=orderService.getAllOrder();
		
		for (Order order : orders) {			
				
				System.out.println(JsonUtil.toJson(order));
				
			}
			
			
		
	
		
		
	}
	
	
	@Test
	public void getOrderByDate() throws ParseException{
		/*SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" );
		
		String beginStr="2016-11-10 00:00:00";
		
		String endStr="2016-11-28 00:00:00";
		
		Date begin=sdf.parse(beginStr);
		
		Date end=sdf.parse(endStr);*/
	
		
		PageResults<Order>result=orderService.getOrderByDate(null, null, null, null);
		
		List<Order>order=result.getResults();
		
		System.out.println("order size:="+order.size());	
		
		
		System.out.println(result.getTotalCount());
		
		
		
		
	}
	
	@Test
	public void getTodayOrder(){
		
		
		TodayOrderModel orders=orderService.getTodayOrder();
		
		//System.out.println(orders.size());
	}
	
	
	@Test
	public void updateOrderStatus(){	
		
		Order order=new Order();
		
		order.setId(34);
		
		
		orderService.updateOrder(order,null);
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
