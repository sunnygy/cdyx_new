package com.cdyx.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.RowMapper;

public class TableListModelRowMap  implements RowMapper<TableListModel>{
	

	public TableListModel mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		TableListModel model=new TableListModel();
		
		model.setId(rs.getInt("id"));
		model.setCode(rs.getString("code"));
		model.setDescription(rs.getString("description"));
		model.setOrderId(rs.getInt("orderId"));
		model.setOrderStatus(rs.getBoolean("orderStatus"));
		model.setStatus(rs.getBoolean("status"));
		model.setType(rs.getInt("type"));
		
		return model;
	}   
	    

}
