package com.cdyx.common.util;

import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by guyu on 2016/10/4.
 */
public interface RowMapper {

        public Object mapRow(ResultSet rs, int index)
                throws SQLException;
}
