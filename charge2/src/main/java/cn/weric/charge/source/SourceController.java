package cn.weric.charge.source;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;

import cn.weric.charge.domain.Source;
import cn.weric.charge.source.service.SourceServiceImp;

@Controller
@RequestMapping("/source/")
public class SourceController {
	@Resource
	private SourceServiceImp service;

	@RequestMapping("query")
	public ModelAndView save(String name) {
	
		List<Source> list = service.query(name);
		ModelAndView mv = new ModelAndView("test", "source", list);
		return mv;

	}
	@RequestMapping("delete")
	@ResponseBody
	public String del(String id){
		service.del(id);
		 return "delete1";
	}
	@RequestMapping("add")
	@ResponseBody
	public String  add(Source source){
		Source newSource = service.add(source);
		String json = JSONArray.toJSONString(newSource);
		return json;
	}
	@RequestMapping("update")
	@ResponseBody()
	public String update(Source source){
		
		service.update(source);
		String json = JSONArray.toJSONString(source);
		return json;
	}
} 