package cn.weric.charge.example;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.weric.charge.example.service.ExampleServiceImpl;

@Controller
//
@RequestMapping("/example/")
public class ExampleController {
	// 自动识别ExampleServiceImpl
	@Resource
	private ExampleServiceImpl service;

	@RequestMapping("save")
	public ModelAndView save() {
		List<Map<String, Object>> list = service.save();
		ModelAndView mv = new ModelAndView("example", "studs", list);
		return mv;
	}
}
