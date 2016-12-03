package com.cdyx.model;



public class TableListModel {
	
	
	    private Integer id;
	 
	    private String code;
	   
	    private String description;
	   
	    private boolean status;	    
	  
	    private Integer type;	
	    
	    private Integer orderId;
	    
	    private Boolean orderStatus;

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

		public Integer getType() {
			return type;
		}

		public void setType(Integer type) {
			this.type = type;
		}

	

		public Integer getOrderId() {
			return orderId;
		}

		public void setOrderId(Integer orderId) {
			this.orderId = orderId;
		}

		public Boolean getOrderStatus() {
			return orderStatus;
		}

		public void setOrderStatus(Boolean orderStatus) {
			this.orderStatus = orderStatus;
		}

		@Override
		public String toString() {
			return "TableListModel [id=" + id + ", code=" + code + ", description=" + description + ", status=" + status
					+ ", type=" + type + ", orderId=" + orderId + ", orderStatus=" + orderStatus + "]";
		}
		
		
		
		
		
		
	    
	    
	    

}
