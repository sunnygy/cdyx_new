package com.cdyx.entity;

import javax.persistence.*;
import java.math.BigDecimal;

/**
 * Created by guyu on 2016/10/4.
 */
@Entity
@Table(name="menu")
public class Menu {
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="menu_id")
    private Integer id;

    @ManyToOne( cascade = {CascadeType.PERSIST},fetch = FetchType.LAZY,targetEntity= MenuType.class )
    //@JoinColumn(name="menu_type_id")
    private MenuType type;

    @ManyToOne( cascade = {CascadeType.PERSIST},fetch = FetchType.LAZY,targetEntity=MenuParent.class )
    //@JoinColumn(name="menu_parent_id")
    private MenuParent parent;

    @Column(name="en_name_menu")
    private String enName;

    @Column(name="cn_name_menu")
    private String cnName;

    @Column(name="desc_menu")
    private String description;

    @Column(name="menu_price")
    private BigDecimal price;

    @Column(name="path")
    private String picPath;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public MenuType getType() {
        return type;
    }

    public void setType(MenuType type) {
        this.type = type;
    }

    public MenuParent getParent() {
        return parent;
    }

    public void setParent(MenuParent parent) {
        this.parent = parent;
    }

    public String getEnName() {
        return enName;
    }

    public void setEnName(String enName) {
        this.enName = enName;
    }

    public String getCnName() {
        return cnName;
    }

    public void setCnName(String cnName) {
        this.cnName = cnName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getPicPath() {
        return picPath;
    }

    public void setPicPath(String picPath) {
        this.picPath = picPath;
    }
}
