package cn.weric.charge.student.service;

import java.util.List;
import cn.weric.charge.domain.Student;


/**
 * @author DQ
 * 
 * 
 */
public interface StudentService {

	// 测试方法
	List<Student> query();

	// 增
	Student insert(Student stud);

	// 删
	boolean delete(String uuid);

	// 改
	boolean update(Student stud);

	// 查
	List<Student> select(Student stud);
}
