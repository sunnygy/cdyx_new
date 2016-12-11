package com.cdyx.service.impl;

import com.cdyx.dao.OrderTypeDao;
import com.cdyx.entity.OrderType;
import com.cdyx.service.OrderTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by guyu on 2016/12/11.
 */
@Service
public class OrderTypeServiceImpl implements OrderTypeService{


    @Autowired
    private OrderTypeDao orderTypeDao;


    public List<OrderType> getAllOrderTypes() {

        String hql="FROM OrderType";

        List<OrderType>types=orderTypeDao.getListByHQL(hql);

        if(types.size()>0)
            return types;

        return null;
    }
}
