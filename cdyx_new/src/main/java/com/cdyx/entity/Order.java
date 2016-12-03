package com.cdyx.entity;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 * Created by guyu on 2016/10/3.
 */
@Entity
@Table(name="order_info")
public class Order implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;	

	@Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="order_id")
    private Integer id;

    @Column(name="order_code")
    private String code;
    
    @Column(name="people_num")
    private Integer peopleNum;

    @Column(name="create_time")
    private Date createTimer;
    
    @Column(name="people_type")
    private String peopleType="C";    
    
    @ManyToOne( cascade = CascadeType.ALL, targetEntity=OrderType.class)
    @JoinColumn(name = "order_type_id",unique = true)
    private OrderType orderType;

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

    @OneToMany(targetEntity =OrderDetail.class,cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name="order_id")
    private List<OrderDetail> details=new ArrayList<OrderDetail>();
    
    @ManyToOne(cascade = CascadeType.PERSIST,fetch = FetchType.EAGER)
    @JoinColumn(name="table_id",unique=true)
    private TableList table;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    

    public List<OrderDetail> getDetails() {
		return details;
	}

	public void setDetails(List<OrderDetail> details) {
		this.details = details;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

	public Integer getPeopleNum() {
		return peopleNum;
	}

	public void setPeopleNum(Integer peopleNum) {
		this.peopleNum = peopleNum;
	}

	public String getPeopleType() {
		return peopleType;
	}

	public void setPeopleType(String peopleType) {
		this.peopleType = peopleType;
	}

	public OrderType getOrderType() {
		return orderType;
	}

	public void setOrderType(OrderType orderType) {
		this.orderType = orderType;
	}

	public TableList getTable() {
		return table;
	}

	public void setTable(TableList table) {
		this.table = table;
	}
	
	

	
	
	
    
    
}
