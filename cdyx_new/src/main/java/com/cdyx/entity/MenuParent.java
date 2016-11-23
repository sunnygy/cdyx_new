package com.cdyx.entity;

import javax.persistence.*;

/**
 * Created by guyu on 2016/10/3.
 */
@Entity
@Table(name="menu_parent")
public class MenuParent {
    /*
    *
    * `menu_parent_id` int(11) NOT NULL AUTO_INCREMENT,
  `en_name_menu_parent` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cn_name_menu_parent` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `desc_menu_parent` varchar(64)
    *
    *
    *
    * */

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
