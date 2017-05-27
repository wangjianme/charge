package cn.weric.charge.menu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.weric.charge.domain.Menu;
import cn.weric.charge.domain.Student;
import cn.weric.charge.example.service.ExampleServiceImpl;
import cn.weric.charge.menu.service.MenuServiceImpl;

@Controller
@RequestMapping("/menu/")
public class MenuController {
	// 自动识别ExampleServiceImpl
	@Resource
	private MenuServiceImpl service;

	@RequestMapping("menuList")
	public ModelAndView menuList(HttpServletRequest req) {
		    	List<Menu> list=service.query();
		    	Iterator<Menu> it = list.iterator();
		    	Map<String, List<Menu>> map=new HashMap<>();
		    	while(it.hasNext()){
		    		Menu menu = it.next();
		    		//子菜单保存
		    		if(menu.getLeaf().equals("0")){
		    			List<Menu> childs = map.get(menu.getParent());
		    			if(childs==null){
		    				childs = new ArrayList<>();
		    			}
		    			childs.add(menu);
		    			map.put(menu.getParent(), childs);
		    			it.remove();
		    		}
		    	}
		    	//父菜单保存
		    	map.put("father", list);
		    	
		    	Menu url = new Menu();
		    	url.setUrl(req.getParameter("url"));
		    	List<Menu> _url = new ArrayList<>();
		    	_url.add(url);
		    	map.put("url", _url);
		    	
		    	ModelAndView mv=new ModelAndView("jeesite", "menus", map);
		    	return mv;
	}
	
}