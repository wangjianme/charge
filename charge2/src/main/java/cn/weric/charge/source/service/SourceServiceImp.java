package cn.weric.charge.source.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.weric.charge.domain.Source;
import cn.weric.charge.source.dao.SourceDaoJdbc;

@Service("sourceService")
public class SourceServiceImp {
	@Resource
	private SourceDaoJdbc dao;

	public List<Source> query(String name) {
		return dao.query(name);
	}
	public void del(String id){
		dao.del(id);
	}
	public Source add(Source source){
		return dao.add(source);
	}
	public Source update(Source source){
		return dao.update(source);
	}
	
}
