package com.cdyx.controller;


import com.cdyx.entity.Employee;
import com.cdyx.service.EmployService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by guyu on 2016/11/19.
 */
@Controller
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private EmployService employService;

    @RequestMapping(value = "/userlogin.htm")
    public ModelAndView userLogin(HttpServletRequest request, HttpServletResponse response) {

        ModelAndView view=new ModelAndView();
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        Employee employee=employService.loginCheck(name,password);
       if(employee!=null){
           HttpSession session=request.getSession();
           session.setAttribute(employee.getId().toString(),employee);
           view.setViewName("/order/table.html");

       }else {
           view.setViewName("/index");
       }
        return  view;
    }

    @RequestMapping(value = "/userlogout.htm")
    public ModelAndView userLogout(HttpServletRequest request, HttpServletResponse response) {

        ModelAndView view=new ModelAndView("/index");

        String userId=request.getParameter("id");

        HttpSession session=request.getSession();

        session.removeAttribute(userId);

        return view;

    }




}
