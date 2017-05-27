package cn.weric.charge.student.dao;

import java.util.List;
import cn.weric.charge.domain.Student;

/**
 * @author DQ
 *
 */
public interface StudentDaoJdbc {
	
	// 查:测试查询
	List<Student> query();

	//删除
	boolean delect(String uuid);
	
	//增
	public Student insert(Student Stud);

}
