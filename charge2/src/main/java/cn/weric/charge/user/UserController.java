package cn.weric.charge.user;

import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;

import cn.weric.charge.domain.Claz;
import cn.weric.charge.domain.User;
import cn.weric.charge.user.service.UserServiceImpl;

/**
 * @author DQ
 *
 */
@Controller
@RequestMapping("/user/")
public class UserController {
	@Resource
	private UserServiceImpl service;

	@RequestMapping("query")
	public ModelAndView query(){
		List<User> list = service.query();
		ModelAndView mv = new ModelAndView("user","users",list);
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
	public String add(User user,HttpServletResponse response) throws UnsupportedEncodingException{
		User newUser = service.add(user);
		String json = JSONArray.toJSONString(newUser);
		return json;
	}
	
	@RequestMapping(value = "update")
	@ResponseBody
	public String update(User user){
		service.update(user);
		String json = JSONArray.toJSONString(user);
		return json;
	}

	
}
