package com.cdyx.entity;

import javax.persistence.*;

@Entity
@Table(name="table_list")
public class TableList {
	
	private static final Integer hall_TYPE=1;
	
	private static final Integer Box_TYPE=2;	
	
	private static final Integer OUT_TYPE=3;

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="table_id")
    private Integer id;

    @Column(name="table_code")
    private String code;

    @Column(name="table_desc")
    private String description;

    @Column(name="table_status")
    private Boolean status=false;//false:empty true:full
    
    @Column(name="table_type")
    private Integer type=0; 
    
  

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

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	
    
    


    
    
}
