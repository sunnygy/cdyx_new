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


    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="order_detail_id")
    private Integer id;   

    @OneToOne(cascade = CascadeType.REFRESH,fetch = FetchType.EAGER )
    @JoinColumn(name = "menu_id",unique = true)
    private Menu menu;

    @Column(name="end_time_detail")
    private Date endTimer;

    @Column(name="copies_number")
    private Short numbers;

    @Column(name="order_detail_price")
    private BigDecimal detailPrice;
    
  
    @Column(name="order_id")
    private  Integer orderId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    

    public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
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
