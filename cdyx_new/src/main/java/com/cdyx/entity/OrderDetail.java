package com.cdyx.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by guyu on 2016/10/3.
 */
@Entity
@Table(name="order_detail")
public class OrderDetail {


    /*
    *order_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `end_time_detail` datetime DEFAULT NULL,
  `copies_number` smallint(6) NOT NULL,
  `order_detail_price` float(6,2) DEFAULT NULL,
    *
    *
    * */
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="order_detail_id")
    private Integer id;

    @ManyToOne( cascade = {CascadeType.PERSIST, CascadeType.MERGE}, targetEntity=Order.class )
    private  Order order;

    @OneToOne(cascade = CascadeType.REFRESH,fetch = FetchType.EAGER )
    @JoinColumn(name = "sub_menu_id",unique = true)
    private Menu menu;

    @Column(name="end_time_detail")
    private Date endTimer;

    @Column(name="copies_number")
    private Short numbers;

    @Column(name="order_detail_price")
    private BigDecimal detailPrice;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }

    public Date getEndTimer() {
        return endTimer;
    }

    public void setEndTimer(Date endTimer) {
        this.endTimer = endTimer;
    }

    public Short getNumbers() {
        return numbers;
    }

    public void setNumbers(Short numbers) {
        this.numbers = numbers;
    }

    public BigDecimal getDetailPrice() {
        return detailPrice;
    }

    public void setDetailPrice(BigDecimal detailPrice) {
        this.detailPrice = detailPrice;
    }
}
