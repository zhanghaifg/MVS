package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;



public class UserDao {
	private JdbcTemplate jdbcTemplate;

	/**
	 * @return the jdbcTemplate
	 */
	
	public boolean checkPassword(String gid, String password) {

		String sql = "select * from users where G_id="+"'"+gid+"'";
		System.out.println(sql);
		List<User> userList = jdbcTemplate.query(sql, new UserMapper());
		if(userList==null||userList.isEmpty()){
			return false;
		}
		else{
			String s = userList.get(0).getPassword();
			if(s!=null&&s.equals(password))
				return true;
			else
				return false;
		}
		
	}
	
	/**
	 * @return the jdbcTemplate
	 */
	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	/**
	 * @param jdbcTemplate the jdbcTemplate to set
	 */
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public User getUser (String gid){
		User user = new User();
		String sql = "select * from users where G_id="+"'"+gid+"'";
		user = jdbcTemplate.queryForObject(sql, new UserMapper());
		return user;
	}
	
}
class UserMapper implements RowMapper<User>{

	@Override
	public User mapRow(ResultSet rs, int rowNumber) throws SQLException {
/*		if (rs==null)
			return new User();*/
				
		User user = new User();
		user.setId(rs.getInt("id"));
		user.setGlobalId(rs.getString("G_id"));
		user.setEmail(rs.getString("e_mail"));
		user.setPassword(rs.getString("pass_word"));
		
		return user;
	}
	
}


