package com.cdyx.service.impl;

import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Method;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.beanutils.ConvertUtils;
import org.hibernate.Query;
import org.hibernate.criterion.CriteriaSpecification;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import com.cdyx.dao.OrderDao;
import com.cdyx.dao.TableListDao;
import com.cdyx.entity.Order;
import com.cdyx.entity.TableList;
import com.cdyx.model.TableListModel;
import com.cdyx.model.TableListModelRowMap;
import com.cdyx.service.TableService;

/**
 * Created by guyu on 2016/11/19.
 */
@Service
public class TableServiceImpl implements TableService {

    @Autowired
    private TableListDao tableListDao;

    @Autowired
    private OrderDao orderDao;


	public List<TableListModel> getAllTables(){
		
		String hql="FROM TableList";
		
		List<TableList> tables=tableListDao.getListByHQL(hql);		

        String sql="SELECT t.table_id as id ,t.table_code as code,t.table_desc as description,t.table_status as status,t.table_type as type,o.order_id as orderId,o.order_status as orderStatus "
        		+ "FROM table_list t LEFT JOIN order_info o ON t.table_id=o.table_id WHERE o.order_status=FALSE";  
        
		@SuppressWarnings("unchecked")
		List<TableListModel> tablesHasOrder=tableListDao.findListBySql(sql, new TableListModelRowMap());
		
		List<TableListModel> result=new ArrayList<TableListModel>();
		
		for (TableList table : tables) {
			TableListModel model=new TableListModel();
			BeanUtils.copyProperties(table, model);			
			for (TableListModel tableListModel : tablesHasOrder) {
				if(table.getId().equals(tableListModel.getId())){
					model.setOrderId(tableListModel.getId());
				}
				
			}
			result.add(model);
		}
		
		
		
		
        
        return result;    

    }


	public TableList getTableById(Integer id) {

        TableList table= tableListDao.get(id);

        return table;
    }



	public void  updateTable(TableList table) {



        tableListDao.update(table);


    }

	public Integer saveTable(TableList table) {

		Integer id =(Integer)tableListDao.save(table);

		return id;
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
