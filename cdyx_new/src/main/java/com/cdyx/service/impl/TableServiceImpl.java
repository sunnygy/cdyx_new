package com.cdyx.service.impl;

import com.cdyx.dao.OrderDao;
import com.cdyx.dao.TableListDao;
import com.cdyx.entity.Order;
import com.cdyx.entity.TableList;
import com.cdyx.service.TableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by guyu on 2016/11/19.
 */
@Service
public class TableServiceImpl implements TableService {

    @Autowired
    private TableListDao tableListDao;

    @Autowired
    private OrderDao orderDao;


	public List<TableList> getAllTables(){

        String hql="FROM TableList";

        List<TableList> tables=tableListDao.getListByHQL(hql);

        return tables;

    }


	public TableList getTableById(Integer id) {

        TableList table= tableListDao.get(id);

        return table;
    }



	public Integer saveOrUpdateTable(TableList table) {

        //TODO update get Table Id
        Integer tableId=null;

        tableListDao.saveOrUpdate(table);

        return tableId;
    }


	public void deleteTable(Integer id) {

        tableListDao.deleteById(id);

    }

    public Order getOrderByTableId(Integer tableId) {

        String hql="SELECT * FROM TableList as a LEFT JOIN Order as b  ON a.id=b.table_list_id WHERE a.id=? AND b.status=? ";

        Order order= orderDao.getByHQL(hql,tableId,false);

        return order;
    }

	public Integer addTable(TableList table) {
		
		return (Integer)tableListDao.save(table);
	}
}
