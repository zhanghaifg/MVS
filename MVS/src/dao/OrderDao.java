package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class OrderDao {
	private JdbcTemplate jdbcTemplate;

	/**
	 * @param jdbcTemplate the jdbcTemplate to set
	 */
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	public void save (String name, int productId, int maskId,int userId, int waferId){
		String date = (new java.sql.Date(Calendar.getInstance().getTimeInMillis())).toString();
		String sql = "insert into orders (name,product_id,mask_id,user_id,wafer_id,wafer_id) values (?,?,?,?,?,?)";
		jdbcTemplate.update(sql, name, productId, maskId, userId, waferId, date);
	}
	
}

class OrderMapper implements RowMapper <Order> {

	@Override
	public Order mapRow(ResultSet rs, int rowNumber) throws SQLException {
		Order order = new Order();
		order.setId(rs.getInt("id"));
		order.setName(rs.getString("name"));
		order.setMaskId(rs.getInt("mask_id"));
		order.setUserId(rs.getInt("user_id"));
		order.setWaferId(rs.getInt("wafer_id"));
		order.setOrderTime(rs.getDate("order_time").toString());
		return order;
	}
	
	
}
