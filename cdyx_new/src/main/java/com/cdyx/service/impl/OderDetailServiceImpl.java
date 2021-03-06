package com.cdyx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdyx.dao.OrderDetailDao;
import com.cdyx.entity.OrderDetail;
import com.cdyx.service.OrderDetailService;


@Service
public class OderDetailServiceImpl implements OrderDetailService{	
	
	@Autowired
	private OrderDetailDao detailDao;


	
	public List<OrderDetail> getAllDetailsByOrderId(Integer orderId) {
		
		
		String sql="SELECT * FROM order_detail WHERE　order_id＝?　";
		
		
		List<OrderDetail>details=detailDao.getListBySQL(sql, orderId);
		
		
		if(details.size()>=1)
			return details;
		
		return null;
	}




	public void addOrderDetail(List<OrderDetail> detail) {
		
		Integer id;
		
		for (OrderDetail orderDetail : detail) {			
			id=(Integer) detailDao.save(orderDetail);
			
			//通知前台
			
			
		}
		
		
	}
	
	
	
	

}
