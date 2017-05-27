package cn.weric.charge.menu.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.weric.charge.claz.dao.ClazJDaoJdbc;
import cn.weric.charge.domain.Claz;
import cn.weric.charge.domain.Menu;
import cn.weric.charge.domain.Student;
import cn.weric.charge.menu.dao.MenuDaoJdbc;

@Service("menuService")
public class MenuServiceImpl {
	@Resource
	private MenuDaoJdbc dao;
	/*查询本班级内的所有学生*/
	public List<Menu> query(){
		return dao.query();
	}
	
}