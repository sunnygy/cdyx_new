package com.cdyx.service.impl;

import com.cdyx.dao.MenuDao;
import com.cdyx.dao.MenuParentDao;
import com.cdyx.entity.Menu;
import com.cdyx.entity.MenuParent;
import com.cdyx.service.MenuService;
import com.cdyx.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by guyu on 2016/11/19.
 */
@Service
public class MenuServiceImpl implements MenuService {

    @Autowired
	private MenuDao menuDao;

	public List<Menu> getAllMenu() {

		String hql="FROM Menu";

		List<Menu>menus=menuDao.getListByHQL(hql);

		if(menus.size()>0)
			return menus;

		return null;
	}

  



}
