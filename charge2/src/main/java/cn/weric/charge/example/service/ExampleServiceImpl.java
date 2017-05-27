package cn.weric.charge.example.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.weric.charge.example.dao.ExampleDaoJdbc;

@Service("exampleService")
public class ExampleServiceImpl {
	@Resource
	private ExampleDaoJdbc dao;
	public List<Map<String, Object>> save(){
		return dao.save();
	}
}
