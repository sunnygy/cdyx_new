package com.cdyx.dao.impl;

import com.cdyx.dao.OrderDao;
import com.cdyx.entity.Order;
import org.springframework.stereotype.Repository;

/**
 * Created by guyu on 2016/10/4.
 */
@SuppressWarnings("rawtypes")
@Repository
public class OrderDaoImpl extends BaseDaoImpl<Order,Integer> implements OrderDao {
}
