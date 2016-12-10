package com.cdyx.model;

import com.cdyx.entity.Order;
import com.cdyx.entity.OrderDetail;

import javax.xml.soap.Detail;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by guyu on 2016/12/10.
 */
public class NewOrderModel implements Serializable{


    private Order order;

    private List<OrderDetail> details=new ArrayList<OrderDetail>();


    private Integer tableId;


    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public List<OrderDetail> getDetails() {
        return details;
    }

    public void setDetails(List<OrderDetail> details) {
        this.details = details;
    }

    public Integer getTableId() {
        return tableId;
    }

    public void setTableId(Integer tableId) {
        this.tableId = tableId;
    }
}
