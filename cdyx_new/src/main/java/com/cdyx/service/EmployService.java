package com.cdyx.service;

import com.cdyx.entity.Employee;

/**
 * Created by guyu on 2016/10/4.
 */
public interface EmployService {

    void saveEmployee(Employee employee);

    Employee loginCheck(String name,String password);

    void deleteEmployee(Integer id);

    void updateEmployee(Employee employee);
}
