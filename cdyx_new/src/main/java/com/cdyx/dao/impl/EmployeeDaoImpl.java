package com.cdyx.dao.impl;


import com.cdyx.dao.EmployDao;
import com.cdyx.entity.Employee;
import org.springframework.stereotype.Repository;

/**
 * Created by guyu on 2016/10/4.
 */
@SuppressWarnings("rawtypes")
@Repository
public class EmployeeDaoImpl extends BaseDaoImpl<Employee,Integer> implements EmployDao{

}
