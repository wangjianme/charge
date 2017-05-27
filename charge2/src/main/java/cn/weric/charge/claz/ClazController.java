package cn.weric.charge.claz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;

import cn.weric.charge.claz.service.ClazServiceImp;
import cn.weric.charge.domain.Claz;
import cn.weric.charge.domain.Student;

@Controller
@RequestMapping("/claz/")
public class ClazController {
	@Resource
	private ClazServiceImp service;

	/* 查询本班级内所有学生 */
	@RequestMapping("query_s")
	public ModelAndView query(String id,String name) {
		List<Student> list = service.query_student(id);
		Map<String, Object> map = new HashMap<>();
		map.put("clazName", name);
		map.put("studs", list);
		ModelAndView mv = new ModelAndView("claz_s", "students", map);
		return mv;
	}

	/* 查询班级 */
	@RequestMapping("query_c")
	public ModelAndView query() {
		List<Claz> list = service.query_class();
		ModelAndView mv = new ModelAndView("claz", "clazs", list);
		return mv;
	}
	/*删除班级*/
	@RequestMapping("del")
	@ResponseBody
	public String delete(String id){
		service.delete(id);
		return "hello";
	}
	/*添加班级*/
	@RequestMapping("add")
	@ResponseBody
	public String add(Claz claz){
		Claz newClaz = service.add(claz);
		String json = JSONArray.toJSONString(newClaz);
		return json;
	}
}