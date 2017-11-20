package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class WaferDao {
	private JdbcTemplate jdbcTemplate;

	/**
	 * @param jdbcTemplate the jdbcTemplate to set
	 */
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public List<Wafer> search (String name){
		String s ="%"+name+"%";
		String sql = "select * from wafers where mesh_name like "+s;
		return jdbcTemplate.query(sql, new WaferMapper());
	}
	
	public List<Wafer> getList() {
		String sql = "select * from wafers";
		return jdbcTemplate.query(sql, new WaferMapper());
	}
		
}

class WaferMapper implements RowMapper<Wafer>{

	@Override
	public Wafer mapRow(ResultSet rs, int rowNumber) throws SQLException {
		Wafer wafer = new Wafer();
		wafer.setId(rs.getInt("id"));
		wafer.setMeshName(rs.getString("mesh_name"));
		wafer.setPoleHeight(rs.getDouble("pole_height"));
		wafer.setBasecoat(rs.getInt("basecoat"));
		
		return wafer;
	}
	
	
}