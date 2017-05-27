package cn.weric.charge.claz.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.weric.charge.claz.dao.ClazJDaoJdbc;
import cn.weric.charge.domain.Claz;
import cn.weric.charge.domain.Student;

@Service("clazService")
public class ClazServiceImp {
	@Resource
	private ClazJDaoJdbc dao;

	/* 查询本班级内的所有学生 */
	public List<Student> query_student(String id) {
		return dao.query_student(id);
	}

	/* 查询班级 */
	public List<Claz> query_class() {
		return dao.query_class();
	}

	/* 添加 */
	public Claz add(Claz claz) {
		return dao.add(claz);
	}

	/* 根据id删除班级 */
	public void delete(String id) {
		dao.delete(id);
	}

}
