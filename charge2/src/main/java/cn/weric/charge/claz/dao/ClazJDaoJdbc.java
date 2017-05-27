package cn.weric.charge.claz.dao;
/*
 * 班级表
 */

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import cn.weric.charge.domain.Claz;
import cn.weric.charge.domain.Student;

@Repository("clazDao")
public class ClazJDaoJdbc extends JdbcDaoSupport {
	/* 通过班级id查询本班级内的所有学生 */
	public List<Student> query_student(String id) {
		String sql="select stud_name from students where stud_class=?";
		List<Student> list = getJdbcTemplate().query(sql, new RowMapper<Student>() {
			@Override
			public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
				Student stud = new Student();
			    stud.setStud_name(rs.getString("stud_name"));
				return stud;
			}
		},id);
		return list;
	}
	/*查询有哪些班级*/
	public List<Claz> query_class(){
		//查询所有的班级
	   String sql="select claz_name as name,claz_id as id from claz";
	   JdbcTemplate jt=getJdbcTemplate();
	   //通过Id查询本班级里面的人数
	  
	   List<Claz> list=jt.query(sql, new RowMapper<Claz>(){

		@Override
		public Claz mapRow(ResultSet rs, int rowNum) throws SQLException {
			String sql_s="select 1 from students where stud_class=?";
			List<Map<String, Object>> ll = jt.queryForList(sql_s,rs.getString("id"));
			   Integer rows=jt.queryForList(sql_s,rs.getString("id")).size();
			  Claz claz=new Claz();
              claz.setName(rs.getString("name"));
              claz.setId(rs.getString("id"));
              claz.setRow(rows);
              return claz;
		}
		   
	   });
	   return list;
	}

	/* 添加 班级*/
	public Claz add(Claz claz) {
		String uuid=UUID.randomUUID().toString().replace("-", "");
		claz.setId(uuid);
		String sql = "insert into claz(claz_id,claz_name,claz_desc) values(?,?,?)";
		getJdbcTemplate().update(sql, uuid, claz.getName(), claz.getDesc());
		return claz;
	}

	/* 删除班级 */
	public void delete(String id) {
		String sql = "delete from claz where claz_id=?";
		getJdbcTemplate().update(sql, id);
	}
	/*修改*/
	public Claz update(Claz claz){
		String sql="update claz set claz_name=?";
		getJdbcTemplate().update(sql, claz.getName());
		return claz;
	}
}