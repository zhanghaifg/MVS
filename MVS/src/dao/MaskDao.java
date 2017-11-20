package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class MaskDao {
	private JdbcTemplate jdbcTemplate;

	/**
	 * @param jdbcTemplate the jdbcTemplate to set
	 */
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	public void insert(String maskName,String tab,String layer,String maskNo) {
		String sql = "insert into  masks (mask_name,bar,layer,mask_no) values (?,?,?,?) ";
		jdbcTemplate.update(sql, maskName,tab,layer,maskNo);
		
	}
	
	public List<Mask> search (String maskName) {
		
		String sql = "select * from masks where mask_name like ? ";
		String name = "%"+maskName+"%";
		List <Mask> maskList = jdbcTemplate.query(sql, new Object[]{name}, new MaskMapper());
		return maskList;
	}
	
}

class MaskMapper implements RowMapper <Mask> {
	

@Override
public Mask mapRow(ResultSet rs, int rowNumber) throws SQLException {
	Mask mask = new Mask();
	mask.setId(rs.getInt("id"));
	mask.setMaskName(rs.getString("mask_name"));
	mask.setTab(rs.getString("tab"));
	mask.setLayer(rs.getString("layer"));
	mask.setMaskNo(rs.getString("mask_no"));
	return mask;
}

}