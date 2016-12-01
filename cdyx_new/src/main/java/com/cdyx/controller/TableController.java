package com.cdyx.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cdyx.entity.Order;
import com.cdyx.entity.TableList;
import com.cdyx.service.TableService;

@Controller
@RequestMapping("/table")
public class TableController {
	
	
	@Autowired
	private TableService tableService;
	
	

	@RequestMapping(value="/goTableList.htm")
	public ModelAndView goTableListPage(HttpServletRequest request, HttpServletResponse response){
		
		ModelAndView model=new ModelAndView("/table");		
		
		List<TableList> tables=tableService.getAllTables();
		
		for (TableList tableList : tables) {
			Order order=tableList.getOrder();
			
			if(order!=null)			
			System.out.println("tableId:"+tableList.getId()+" orderId:"+order.getId());
		}
		
		model.addObject("tables",tables);		
				
		return model;		
	}
	
	

	
	
	@RequestMapping(value="/addTable.html",method=RequestMethod.POST)
	public Object addTables(@RequestBody TableList table){
		
		tableService.addTable(table);	
		
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	

}
