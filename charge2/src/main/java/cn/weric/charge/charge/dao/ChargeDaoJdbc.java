package cn.weric.charge.charge.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import cn.weric.charge.domain.Charge;

@Repository("chargeDao")
public class ChargeDaoJdbc extends JdbcDaoSupport {
	/**
	 * 查询学生的交费信息
	 * 
	 * @param name
	 * @return
	 */
	public List<Charge> query() {
		String sql = "select c.charge_id,c.charge_sid,c.charge_money,c.charge_type,c.charge_date,s.stud_id,s.stud_name from charge c inner join students s on c.charge_sid=s.stud_uuid ";
		// 查询所有学生的交费信息
		List<Charge> list = getJdbcTemplate().query(sql, new RowMapper<Charge>() {
			@Override
			public Charge mapRow(ResultSet rs, int rowNum) throws SQLException {
				Charge charge = new Charge();
				charge.setCharge_id(rs.getString("charge_id"));
				charge.setCharge_sid(rs.getString("charge_sid"));
				charge.setCharge_money(rs.getDouble("charge_money"));
				charge.setCharge_type(rs.getString("charge_type"));
				charge.setCharge_date(rs.getString("charge_date"));
				charge.setCharge_ssid(rs.getString("s.stud_id"));
				charge.setCharge_name(rs.getString("s.stud_name"));
				return charge;
			}
		});
		return list;
	}
	/**
	 * 删除一行数据
	 */
	public void delete(String charge_id) {
		getJdbcTemplate().update("delete from charge where charge_id = ?", charge_id);
	}

	/**
	 * 增加学生交费信息
	 */
	public Charge add(Charge charge) {
		 String charge_ssid = charge.getCharge_ssid();
		 JdbcTemplate jt = getJdbcTemplate();
		 List<Map<String, Object>> list = jt.queryForList("select stud_uuid from students where stud_id = ?",charge_ssid);
		 int row = list.size();
		 if(row>0){
			 Map map = list.get(0);
			 String charge_sid = (String) map.get("stud_uuid");
			 charge.setCharge_id(UUID.randomUUID().toString().replace("-", ""));
			 String sql = "insert into charge values(?,?,?,?,?)";
				jt.update(sql, charge.getCharge_id(), charge_sid, charge.getCharge_money(),
						charge.getCharge_type(), charge.getCharge_date());
		 }
		return charge;
	}
}
