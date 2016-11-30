package com.cdyx.entity;

import java.util.ArrayList;
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
import javax.persistence.Table;

/**
 * Created by guyu on 2016/10/3.
 */
@Entity
@Table(name="menu_type")
public class MenuType {
   
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="menu_type_id")
    private Integer id;
    
    @ManyToOne(cascade =CascadeType.REFRESH,targetEntity =MenuParent.class)
    @JoinColumn(name="menu_parent_id")
    private MenuParent  menuParent;

    @Column(name="en_name_menu_type")
    private String enName;

    @Column(name="cn_name_nemu_type")
    private String cnName;

    @Column(name="desc_menu_type")
    private String description;
    
    @OneToMany(targetEntity=Menu.class,cascade =CascadeType.REFRESH,fetch = FetchType.LAZY)  
    private List<Menu>menus=new ArrayList<Menu>();


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}
    
}
