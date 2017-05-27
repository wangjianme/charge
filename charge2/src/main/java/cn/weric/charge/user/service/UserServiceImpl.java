package cn.weric.charge.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.weric.charge.domain.Claz;
import cn.weric.charge.domain.User;
import cn.weric.charge.user.dao.UserDaoJdbc;

@Service("userService")
public class UserServiceImpl {
	@Resource
	private UserDaoJdbc dao;

	public List<User> query() {
		return dao.query();
	}
	public void delete(String id){
		dao.delete(id);
	}
	public User add(User user) {
		return dao.add(user);
	}
	public void update(User user){
		dao.update(user);
	}
}
