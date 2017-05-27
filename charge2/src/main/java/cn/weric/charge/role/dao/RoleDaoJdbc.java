package cn.weric.charge.role.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import cn.weric.charge.domain.Role;
import cn.weric.charge.domain.User;

/**
 * @author DQ
 *
 */
@Repository("roleDao")
public class RoleDaoJdbc extends JdbcDaoSupport {

	public List<User> query() {
		String sql = "select * from roles";
		List<User> list = getJdbcTemplate().query(sql, new RowMapper<User>() {
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User user = new User();
				user.setId(rs.getString("role_id"));
				user.setName(rs.getString("role_name"));
				return user;
			}
		});
		return list;
	}

	public void delete(String id) {
		System.out.println(id);
		//先使外键失效,再删除某条数据
		String sql2 = "delete from roles where role_id=?";
		//需要开事务,尚未实现
		getJdbcTemplate().update(sql2, id);
	}
	
	public Role add(Role role) {
		String uuid=UUID.randomUUID().toString().replace("-", "");
		String sql = "insert into roles values(?,?,'1','b')";
		getJdbcTemplate().update(sql, uuid, role.getName());
		return role;
	}
}
