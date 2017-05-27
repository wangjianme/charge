package cn.weric.charge.menu.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import cn.weric.charge.domain.Menu;

@Repository("menuDao")
public class MenuDaoJdbc extends JdbcDaoSupport{
	public List<Menu> query(){
		String sql = "select * from menus";
		List<Menu> list = getJdbcTemplate().query(sql, new RowMapper<Menu>(){
			@Override
			public Menu mapRow(ResultSet rs, int rowNum) throws SQLException {
				Menu menu = new Menu();
				menu.setId(rs.getString("menu_id"));
				menu.setLeaf(rs.getString("menu_leaf"));
				menu.setParent(rs.getString("menu_parent"));
				menu.setText(rs.getString("menu_text"));
				menu.setUrl(rs.getString("menu_url"));
				return menu;
			}
		});
		return list;
	}
}
