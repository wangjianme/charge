package cn.weric.charge.dept;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.weric.charge.dept.service.DeptServiceImp;
import cn.weric.charge.domain.Dept;
import cn.weric.charge.domain.Source;
;

@Controller
@RequestMapping("/dept/")
public class DeptController {
	@Resource
	private DeptServiceImp service;

	@RequestMapping("query")
	public ModelAndView save(String name) {
	
		List<Dept> list = service.query(name);
		ModelAndView mv = new ModelAndView("dept", "dept", list);
		return mv;

	}
	@RequestMapping("delete")
	@ResponseBody
	public String del(String id){
		service.del(id);
		 return "delete1";
	}
	@RequestMapping("add")
	public void add(Source source){
		service.add(source);
	}

}
