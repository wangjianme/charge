package cn.weric.charge.student.service;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import cn.weric.charge.domain.Student;
import cn.weric.charge.student.dao.StudentDaoJdbc;

/**
 * @author DQ
 *
 */
@Service("studentService")
public class StudentServiceImp implements StudentService {
	@Resource
	private StudentDaoJdbc dao;
	
	//测试
	@Override
	public List<Student> query() {
		return dao.query();
	}

	@Override
	public Student insert(Student stud) {
		// TODO Auto-generated method stub
		return dao.insert(stud);
	}

	@Override
	public boolean delete(String uuid) {
		
		return dao.delect(uuid);
	}

	@Override
	public boolean update(Student stud) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Student> select(Student stud) {
		// TODO Auto-generated method stub
		return null;
	}
}
