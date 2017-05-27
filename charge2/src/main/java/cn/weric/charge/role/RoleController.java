package cn.weric.charge.role;

import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;

import cn.weric.charge.domain.Role;
import cn.weric.charge.domain.User;
import cn.weric.charge.role.service.RoleServiceImpl;
/**
 * @author DQ
 *
 */
@Controller
@RequestMapping("/role/")
public class RoleController {
	@Resource
	private RoleServiceImpl service;

	@RequestMapping("query")
	public ModelAndView query(){
		List<User> list = service.query();
		ModelAndView mv = new ModelAndView("role","roles",list);
		System.out.println(mv);
		return mv;
	}
	
	@RequestMapping(value = "del")
	@ResponseBody
	public String del(String id){
		service.delete(id);
		 return "delete1";
	}

	@RequestMapping(value = "add")
	@ResponseBody
	public String add(Role role,HttpServletResponse response) throws UnsupportedEncodingException{
		Role newRole = service.add(role);
		String json = JSONArray.toJSONString(newRole);
		return json;
	}
}
