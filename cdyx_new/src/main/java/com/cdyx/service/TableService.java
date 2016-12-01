package com.cdyx.service;

import com.cdyx.entity.Order;
import com.cdyx.entity.TableList;

import java.util.List;

/**
 * Created by guyu on 2016/10/4.
 */
public interface TableService {

    List<TableList> getAllTables();

    TableList getTableById(Integer id);

    Integer saveOrUpdateTable(TableList table);

    void deleteTable(Integer id);

    Order getOrderByTableId(Integer tableId);

	Integer addTable(TableList table);

}
