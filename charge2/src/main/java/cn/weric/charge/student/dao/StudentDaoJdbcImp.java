package cn.weric.charge.student.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import cn.weric.charge.domain.Student;

/**
 * @author DQ
 *
 */

@Repository("studentDao")
public class StudentDaoJdbcImp extends JdbcDaoSupport implements StudentDaoJdbc {

	@Override
	public List<Student> query() {
		String sql = "select * from students";
		List<Student> list = getJdbcTemplate().query(sql, new RowMapper<Student>() {
			@Override
			public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
				Student stud = new Student();
				stud.setStud_uuid(rs.getString("stud_uuid"));
				stud.setStud_id(rs.getString("stud_id"));
				stud.setStud_name(rs.getString("stud_name"));
				stud.setStud_gender(rs.getString("stud_gender"));
				stud.setStud_birth(rs.getString("stud_birth"));
				stud.setStud_education(rs.getString("stud_education"));
				stud.setStud_major(rs.getString("stud_major"));
				stud.setStud_graduationdate(rs.getString("stud_graduationdate"));
				stud.setStud_resume(rs.getString("stud_resume"));
				stud.setStud_class(rs.getString("stud_class"));
				stud.setStud_from(rs.getString("stud_from"));
				stud.setStud_tuition(rs.getString("stud_tuition"));
				stud.setStud_picture(rs.getString("stud_picture"));
				return stud;
			}
		});
		return list;
	}

	@Override
	public boolean delect(String uuid) {
		String sql = "delete from students where stud_uuid=?";
		int i = getJdbcTemplate().update(sql, uuid);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println("StudentDaoJdbcImp_delect_uuid: "+uuid);
		System.out.println("StudentDaoJdbcImp_delect_this: "+this);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		if(i==0){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public Student insert(Student stud) {
		String uuid=UUID.randomUUID().toString().replace("-", "");
		
		stud.setStud_uuid(uuid);
		
		String sql="insert into students values("
				+ "?,?,?,?,"
				+ "?,?,?,?,"
				+ "?,?,?,?,?)";
		getJdbcTemplate().update(sql,
				stud.getStud_uuid(),
				stud.getStud_id(),
				stud.getStud_name(),
				stud.getStud_gender(),
				stud.getStud_birth(),
				stud.getStud_education(),
				stud.getStud_major(),
				stud.getStud_graduationdate(),
				stud.getStud_resume(),
				stud.getStud_class(),
				stud.getStud_from(),
				stud.getStud_tuition(),
				stud.getStud_picture()
				);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println("StudentDaoJdbcImp_insert_this: "+this);
		System.out.println("StudentDaoJdbcImp_insert_uuid: "+stud.getStud_uuid());
		System.out.println("StudentDaoJdbcImp_insert_id: "+stud.getStud_id());
		System.out.println("StudentDaoJdbcImp_insert_name: "+stud.getStud_name());
		System.out.println("StudentDaoJdbcImp_insert_gender: "+stud.getStud_gender());
		System.out.println("StudentDaoJdbcImp_insert_birth: "+stud.getStud_birth());
		System.out.println("StudentDaoJdbcImp_insert_education: "+stud.getStud_education());
		System.out.println("StudentDaoJdbcImp_insert_major: "+stud.getStud_major());
		System.out.println("StudentDaoJdbcImp_insert_graduationdate: "+stud.getStud_graduationdate());
		System.out.println("StudentDaoJdbcImp_insert_resume: "+stud.getStud_resume());
		System.out.println("StudentDaoJdbcImp_insert_class: "+stud.getStud_class());
		System.out.println("StudentDaoJdbcImp_insert_from: "+stud.getStud_from());
		System.out.println("StudentDaoJdbcImp_insert_tuition: "+stud.getStud_tuition());
		System.out.println("StudentDaoJdbcImp_insert_picture: "+stud.getStud_picture());
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		return stud;
	}
}















