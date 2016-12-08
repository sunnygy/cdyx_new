package com.cdyx.model;

import com.cdyx.entity.Order;
import com.cdyx.entity.OrderDetail;

import java.util.List;

/**
 * Created by guyu on 2016/12/8.
 */
public class OrderRquestModel {

    private Order order;

    private List<OrderDetail> details;




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


}
