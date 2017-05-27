package cn.weric.charge.charge.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.weric.charge.charge.dao.ChargeDaoJdbc;
import cn.weric.charge.domain.Charge;

@Service("chargeService")
public class ChargeServiceImpl {
	@Resource
	private ChargeDaoJdbc dao;
	/**
	 * 查询学生交费信息
	 * @param name
	 * @return
	 */
	public List<Charge> query(){
		return dao.query();
	}
	/**
	 * 删除一行数据
	 */
	public void delete(String charge_id){
		dao.delete(charge_id);
	}
	/**
	 * 增加学生交费信息
	 */
	public Charge add(Charge charge){
		return dao.add(charge);
	}
}
