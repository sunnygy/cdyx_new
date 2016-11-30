package com.cdyx.service.impl;

import com.cdyx.dao.MenuParentDao;
import com.cdyx.dao.OrderDao;
import com.cdyx.dao.TableListDao;
import com.cdyx.entity.MenuParent;
import com.cdyx.entity.Order;
import com.cdyx.entity.TableList;
import com.cdyx.service.MenuParentService;
import com.cdyx.service.TableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by guyu on 2016/11/19.
 */
@Service
public class MenuParentServiceImpl implements MenuParentService {

    @Autowired
    private MenuParentDao parentDao;

	public List<MenuParent> getAllMenuParent() {
		
		String hql="FROM MenuParent";
		
		List<MenuParent>parents=parentDao.getListByHQL(hql);
		
		if(parents.size()>0)
			return parents;
		
		return null;
	}

  



}
