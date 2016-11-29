package com.cdyx.service.impl;

import com.cdyx.dao.EmployDao;
import com.cdyx.entity.Employee;
import com.cdyx.service.EmployService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by guyu on 2016/10/4.
 */
@Service
public class EmpoyServiceImpl implements EmployService {

    @Autowired
    private EmployDao employDao;

 
	public void saveEmployee(Employee employee) {

        employDao.saveOrUpdate(employee);

    }

   
	public void deleteEmployee(Integer id) {
        employDao.deleteById(id);
    }

    
	public void updateEmployee(Employee employee){

        employDao.saveOrUpdate(employee);

    }

    public Employee loginCheck(String name, String password){

        String sql="SELECT * FROM employee WHERE name=?";

        Employee employee=(Employee)employDao.getBySQL(sql,name);

        if(employee!=null){
            if(employee.getPassword().equals(password)){
                return employee;
            }
        }
        return null;
    }
}
