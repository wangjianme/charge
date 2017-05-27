package cn.weric.charge.dept.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import cn.weric.charge.domain.Dept;
import cn.weric.charge.domain.Source;
@Repository("deptDao")
public class DeptDaoJdbc extends JdbcDaoSupport{
	public List<Dept> query(String name) {

		// List<Map<String, Object>> list =
		// getJdbcTemplate().queryForList("select source_id as id ,source_name
		// as name from source");
		List<Dept> list = getJdbcTemplate().query("select source_id as id ,source_name as name from source",
				new RowMapper<Dept>() {

					@Override
					public Dept mapRow(ResultSet rs, int rowNum) throws SQLException {
						Dept dept=new Dept();
						dept.setId(rs.getString("id"));
						dept.setName(rs.getString("name"));
						
						return dept;
					}
				});

return list;
	}
public void del(String id){
	String sql="delete from source where source_id=?";
	getJdbcTemplate().update(sql,id);
}	

public void add(Source source){
	
	source.setId(UUID.randomUUID().toString().replace("-", ""));
	String sql="insert into source(id,name) values(?,?)";
	getJdbcTemplate().update(sql, source.getId(), source.getName());
}
	
}
