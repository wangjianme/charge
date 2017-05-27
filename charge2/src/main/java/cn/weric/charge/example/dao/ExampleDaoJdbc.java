package cn.weric.charge.example.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

@Repository("exampleDao")
public class ExampleDaoJdbc extends JdbcDaoSupport {
	public List<Map<String, Object>> save() {
		List<Map<String,Object>> list = 
				getJdbcTemplate().queryForList("select id,name from studs");
		return list;
	}
}
