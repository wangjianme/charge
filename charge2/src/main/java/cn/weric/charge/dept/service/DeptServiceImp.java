package cn.weric.charge.dept.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.weric.charge.dept.dao.DeptDaoJdbc;
import cn.weric.charge.domain.Dept;
import cn.weric.charge.domain.Source;

@Service("deptService")
public class DeptServiceImp {
	@Resource
	private DeptDaoJdbc dao;

	public List<Dept> query(String name) {
		return dao.query(name);
	}
	public void del(String id){
		dao.del(id);
	}
	public void add(Source source){
		dao.add(source);
	}
}
