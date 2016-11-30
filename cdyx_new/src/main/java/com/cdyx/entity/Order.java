package com.cdyx.entity;

import javax.persistence.*;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.*;

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
	
	@Column(name="table_id")
    private Integer tabId;

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

    @OneToMany(targetEntity =OrderDetail.class,cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinColumn(name="order_id")
    private List<OrderDetail> details=new ArrayList<OrderDetail>();

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    

    public Integer getTabId() {
		return tabId;
	}

	public void setTabId(Integer tabId) {
		this.tabId = tabId;
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
}
