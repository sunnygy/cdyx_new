package com.cdyx.entity;

import javax.persistence.*;

/**
 * Created by guyu on 2016/10/3.
 */
@Entity
@Table(name="table_list")
public class TableList {

    /*
    * `table_list_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_code` char(4) COLLATE utf8_unicode_ci NOT NULL,
  `table_desc` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
    *
    *
    * */

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="table_list_id")
    private Integer id;

    @Column(name="table_code")
    private String code;

    @Column(name="table_desc")
    private String description;

    @Column(name="table_status")
    private boolean status=false;//false:empty true:full

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
