package com.cdyx.service;

import java.util.List;

import com.cdyx.entity.Order;
import com.cdyx.entity.TableList;
import com.cdyx.model.TableListModel;

/**
 * Created by guyu on 2016/10/4.
 */
public interface TableService {

    List<TableList> getAllTables();

    TableList getTableById(Integer id);

    void updateTable(TableList table);

    Integer saveTable(TableList table);

    void deleteTable(Integer id);

    Order getOrderByTableId(Integer tableId);

	Integer addTable(TableList table);

}
