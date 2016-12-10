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
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Created by guyu on 2016/10/3.
 */
@Entity
@Table(name="menu_parent")
public class MenuParent {
   

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="menu_parent_id")
    private Integer id;

    @Column(name="en_name_menu_parent")
    private String enName;

    @Column(name="cn_name_menu_parent")
    private String cnName;

    @Column(name="desc_menu_parent")
    private String description;


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

    
}
