package com.cdyx.entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.*;

/**
 * Created by guyu on 2016/10/3.
 */
@Entity
@Table(name="`order`")
public class Order {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="order_id")
    private Integer id;

    @OneToOne(cascade = CascadeType.REFRESH,fetch = FetchType.EAGER )
    @JoinColumn(name = "table_id",unique = true)
    private TableList tab;

    @Column(name="order_code")
    private String code;

    @Column(name="create_time")
    private Date createTimer;

    @Column(name="end_time")
    private Date endTimer;

    @Column(name="discount")
    private Short discount;

    @Column(name="total_price")
    private BigDecimal totalPrice;

    @Column(name="desc_order")
    private String description;

    @Column(name="order_status")
    private boolean status=false;

   /* @OneToMany(cascade = {CascadeType.REFRESH,CascadeType.REMOVE},fetch = FetchType.LAZY)
    private Set<OrderDetail> details=new HashSet<OrderDetail>();
*/
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public TableList getTab() {
        return tab;
    }

    public void setTab(TableList tab) {
        this.tab = tab;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Date getCreateTimer() {
        return createTimer;
    }

    public void setCreateTimer(Date createTimer) {
        this.createTimer = createTimer;
    }

    public Date getEndTimer() {
        return endTimer;
    }

    public void setEndTimer(Date endTimer) {
        this.endTimer = endTimer;
    }

    public Short getDiscount() {
        return discount;
    }

    public void setDiscount(Short discount) {
        this.discount = discount;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

  /*  public Set<OrderDetail> getDetails() {
        return details;
    }

    public void setDetails(Set<OrderDetail> details) {
        this.details = details;
    }*/

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
