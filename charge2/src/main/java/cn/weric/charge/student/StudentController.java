package cn.weric.charge.student;

import java.io.UnsupportedEncodingException;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.alibaba.fastjson.JSONArray;
import cn.weric.charge.domain.Student;
import cn.weric.charge.student.service.StudentService;

/**
 * @author DQ
 *
 */

@Controller
public class StudentController {
	@Resource
	private StudentService service;

	// 测试的
	@ResponseBody
	@RequestMapping(value="/student/query.html")
	public ModelAndView query(){
		List<Student> list = service.query();
		//charge\src\main\webapp\WEB-INF\views\student.jsp
		ModelAndView mv = new ModelAndView("student","stud",list);
		System.out.println("StudentController_query_this: "+this);
		return mv;
	}
	
	// 增
	@RequestMapping(value="/student/insert.html")
	@ResponseBody
	public String insert(Student stud,HttpServletResponse response) throws UnsupportedEncodingException{
		Student newStudent = service.insert(stud);
		String json = JSONArray.toJSONString(newStudent);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println("StudentController_insert_this: "+this);
		
		System.out.println("StudentController_insert_uuid: "+stud.getStud_uuid());
		System.out.println("StudentController_insert_id: "+stud.getStud_id());
		System.out.println("StudentController_insert_name: "+stud.getStud_name());
		System.out.println("StudentController_insert_gender: "+stud.getStud_gender());
		System.out.println("StudentController_insert_birth: "+stud.getStud_birth());
		System.out.println("StudentController_insert_education: "+stud.getStud_education());
		System.out.println("StudentController_insert_major: "+stud.getStud_major());
		System.out.println("StudentController_insert_graduationdate: "+stud.getStud_graduationdate());
		System.out.println("StudentController_insert_resume: "+stud.getStud_resume());
		System.out.println("StudentController_insert_class: "+stud.getStud_class());
		System.out.println("StudentController_insert_from: "+stud.getStud_from());
		System.out.println("StudentController_insert_tuition: "+stud.getStud_tuition());
		System.out.println("StudentController_insert_picture: "+stud.getStud_picture());
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		return json;
	}
	// 刪
	@RequestMapping(value="/student/delete.html")
	@ResponseBody
	public void delete(String uuid) {
		Boolean boo = service.delete(uuid);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		System.out.println("StudentController_delete_this: "+this);
		System.out.println("要删除的UUID(StudentController_delete): "+uuid);
		System.out.println("是否成功删除: "+boo);
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
	}
	
	
	// 改
	@ResponseBody
	@RequestMapping(value="/student/update.html")
	public ModelAndView update(Student stud) {
		Boolean boo = service.update(stud);
		// student_query.jsp
		ModelAndView mv = new ModelAndView("student_update", "stud", boo);
		return mv;
	}
	// 查
	@ResponseBody
	@RequestMapping(value="/student/select")
	public ModelAndView select(Student stud) {
		List<Student> list = service.select(stud);
		// student_query.jsp
		ModelAndView mv = new ModelAndView("student_select", "stud", list);
		return mv;
	}

}
