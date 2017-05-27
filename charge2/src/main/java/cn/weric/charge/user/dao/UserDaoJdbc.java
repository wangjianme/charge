package cn.weric.charge.user.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import cn.weric.charge.domain.Claz;
import cn.weric.charge.domain.User;

/**
 * @author DQ
 *
 */
@Repository("userDao")
public class UserDaoJdbc extends JdbcDaoSupport {

	public List<User> query() {
		String sql = "select * from users";
		List<User> list = getJdbcTemplate().query(sql, new RowMapper<User>() {
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setId(rs.getString("user_id"));
				user.setName(rs.getString("user_name"));
				return user;
			}
		});
		return list;
	}

	public void delete(String id) {
		System.out.println(id);
		//先使外键失效,再删除某条数据
		String sql2 = "delete from users where user_id=?";
		//需要开事务,尚未实现
		getJdbcTemplate().update(sql2, id);
	}
	
	public User add(User user) {
		String uuid=UUID.randomUUID().toString().replace("-", "");
		System.out.println(uuid);
		String sql = "insert into users values(?,?,'a','b','c','d','e','f','g')";
		getJdbcTemplate().update(sql, uuid, user.getName());
		return user;
	}
	
	public void update(User user) {
		String sql = "update users set user_name = ? where user_id=?";
		getJdbcTemplate().update(sql,user.getName(),user.getId());
	}
}
