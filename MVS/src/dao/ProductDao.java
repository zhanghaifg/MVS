package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class ProductDao {
	private JdbcTemplate jdbcTemplate;

	/**
	 * @param jdbcTemplate the jdbcTemplate to set
	 */
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public List<Product> getList (){
		String sql = "select * from products";
		List<Product> productList = jdbcTemplate.query(sql, new ProductMapper());
		return productList;
	}
	
	public Product getProduct(String name){
		String sql = "select * from products where name="+name;
		return jdbcTemplate.queryForObject(sql, Product.class);
	}
	
}

class ProductMapper implements RowMapper<Product>{

	@Override
	public Product mapRow(ResultSet rs, int rowNumber) throws SQLException {
		Product product = new Product();
		product.setId(rs.getInt("id"));
		product.setName(rs.getString("name"));
		return product;
	}
	
	
}
