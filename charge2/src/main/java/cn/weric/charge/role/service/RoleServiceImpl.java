package cn.weric.charge.role.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.weric.charge.domain.Role;
import cn.weric.charge.domain.User;
import cn.weric.charge.role.dao.RoleDaoJdbc;

@Service("roleService")
public class RoleServiceImpl {
	@Resource
	private RoleDaoJdbc dao;

	public List<User> query() {
		return dao.query();
	}
	public void delete(String id){
		dao.delete(id);
	}
	public Role add(Role role) {
		return dao.add(role);
	}
}
