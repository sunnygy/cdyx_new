package com.cdyx.controller;

import com.cdyx.common.util.UserPool;
import com.cdyx.entity.Employee;
import com.cdyx.service.EmployService;
import com.cdyx.websocket.MyWebSocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.List;

/**
 * Created by guyu on 2016/10/4.
 */
@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	private EmployService employService;

    @RequestMapping(value = "/callback")
    public Object receiveMessage() {

        List<MyWebSocket> list= UserPool.getUserPool();

        for (int i = 0; i < list.size(); i++) {

            MyWebSocket socket=list.get(i);

            String message="It's ok for all";

            try {
                socket.sendMessage(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        System.out.println("访问成功............................");

        return null;

    }
    
    @RequestMapping(value = "/delete")
    public Object delete() {
    	
        Employee employee=new Employee();
    	
    	employee.setId(3); 
    	
    	employee.setFirstName("dsauhdgashdghasd");
    	
    	employService.updateEmployee(employee);

      
        System.out.println("访问成功............................");

        return null;

    }



}
