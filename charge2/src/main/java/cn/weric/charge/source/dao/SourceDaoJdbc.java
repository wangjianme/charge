package cn.weric.charge.source.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import cn.weric.charge.domain.Source;

@Repository("sourceDao")
public class SourceDaoJdbc extends JdbcDaoSupport {

	public List<Source> query(String name) {

		// List<Map<String, Object>> list =
		// getJdbcTemplate().queryForList("select source_id as id ,source_name
		// as name from source");
		List<Source> list = getJdbcTemplate().query("select source_id as id ,source_name as name from source",
				new RowMapper<Source>() {

					@Override
					public Source mapRow(ResultSet rs, int rowNum) throws SQLException {
						Source source = new Source();
						source.setId(rs.getString("id"));
						source.setName(rs.getString("name"));
						return source;
					}
				});

return list;
	}
public void del(String id){
	String sql="delete from source where source_id=?";
	getJdbcTemplate().update(sql,id);
}	

public Source add(Source source){
	
	String uuid=UUID.randomUUID().toString().replace("-", "");
	source.setId(uuid);
	String sql="insert into source(source_id,source_name) values(?,?)";
	getJdbcTemplate().update(sql,uuid,source.getName());
	return source;
}
public Source update(Source source){
	String sql="update  source set source_name=? where source_id=?";
	getJdbcTemplate().update(sql,source.getName(),source.getId());
	return source;
	
}

}
