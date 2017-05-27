package cn.weric.charge.charge;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.weric.charge.charge.service.ChargeServiceImpl;
import cn.weric.charge.domain.Charge;

@Controller
@RequestMapping("/charge/")
public class ChargeController {
	@Resource
	private ChargeServiceImpl service;

	@RequestMapping("query") // 查询学生的交费信息
	public ModelAndView query(String name) {
		List<Charge> list = service.query();
		ModelAndView cha = new ModelAndView("charge", "charges", list);
		return cha;
	}
	@RequestMapping("del")
	@ResponseBody
	public String delete(String charge_id) {
		service.delete(charge_id);
		return null;
	}
	@RequestMapping("add")
	public String  add(Charge charge) {
		service.add(charge);
		return "charge";
	}
}
