package com.cdyx.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cdyx.entity.TableList;
import com.cdyx.service.TableService;

@Controller
@RequestMapping("/table")
public class TableController {
	
	
	@Autowired
	private TableService tableService;
	
	
	
	
	@RequestMapping(value="/allTables.html",method = RequestMethod.POST)
	public Object getAllTables(){
		
		
		List<TableList> tables=tableService.getAllTablesStatus();
		
		if(tables.size()>=1)
			return tables;
		
				
		return null;		
	}
	
	
	@RequestMapping(value="/addTable.html",method=RequestMethod.POST)
	public Object addTables(@RequestBody TableList table){
		
		tableService.addTable(table);
		
		
		
		
		return null;
	}
	
	
	
	
	
	
	
	
	
	

}
