package com.cdyx.entity;

import javax.persistence.*;

/**
 * Created by guyu on 2016/10/3.
 */
@Entity
@Table(name="position")
public class Position {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="position_id")
    private Integer id;

    @Column(name="en_name_pos")
    private String enName;

    @Column(name="cn_name_pos")
    private String cnName;

    @Column(name="desc_position")
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
