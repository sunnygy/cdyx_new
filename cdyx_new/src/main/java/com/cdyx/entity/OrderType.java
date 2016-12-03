package com.cdyx.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="order_type")
public class OrderType {
	
	
	@Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="order_type_id")
	private Integer id;	
	
	@Column(name="order_type_name")
	private String typeName;
	
	@Column(name="order_type_desc")
	private String desc;
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	
	
	


}
