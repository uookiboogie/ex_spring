package co.hans.app.employees.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.hans.app.employees.domain.Criteria;
import co.hans.app.employees.domain.DepartmentsVO;
import co.hans.app.employees.domain.EmployeesVO;
import co.hans.app.employees.domain.JobsVO;
import co.hans.app.employees.domain.PageVO;
import co.hans.app.employees.service.DepartmentsService;
import co.hans.app.employees.service.EmployeesService;
import co.hans.app.employees.service.JobsService;

@Controller
@RequestMapping("/employees/*")
//@SessionAttributes("cri")
public class EmployeesController {
	
	@Autowired EmployeesService employeesService;
	@Autowired JobsService jobsService;
	@Autowired DepartmentsService departmentsService;
	
	//전체조회
	@GetMapping("/list")
	public void list(Model model, @ModelAttribute("cri") Criteria cri) {
		
		int total = employeesService.getTotalCount(cri);
		
		model.addAttribute("list",employeesService.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}
	
	//검색조회
	@RequestMapping("/empSearch")
	public String empSearch(Model model, EmployeesVO vo, Criteria cri) {
	  cri.setAmount(1000);
	  model.addAttribute("list",employeesService.getList(cri));
	  return "employees/empSearch";
	}
	
	//사원검색
	@RequestMapping("/ajaxEmp")
	@ResponseBody
	public EmployeesVO ajaxEmp(EmployeesVO vo) {
		return employeesService.read(vo);
	}		
	
	//단건조회
	@GetMapping("/get")
	public void get(Model model, EmployeesVO employeesVO, @ModelAttribute("cri") Criteria cri) {  //bno 파라미터 -> 커맨드 객체
		model.addAttribute("employees",employeesService.read(employeesVO));
	}
	
	@ModelAttribute("jobs")
	public List<JobsVO> jobs(){
		return jobsService.getJobsList();
	}
	
	@ModelAttribute("departments")
	public List<DepartmentsVO> departments(){
		return departmentsService.getDeptList();
	}
	//이렇게 맵을 써도 된다.
	@ModelAttribute("opt")
	public Map<String, Object> opt(){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("jobs", jobsService.getJobsList() );
		map.put("departments", departmentsService.getDeptList());
		return map;
	}
	
	//등록폼
	@GetMapping("register")
	public String insertForm(EmployeesVO vo) {
		
		return "no/employees/register";
	}

	//수정폼
	@GetMapping("updateEmp")
	public String insertFormEmp(EmployeesVO vo, Model model) {
		model.addAttribute("emp",employeesService.read(vo));
		
		return "employees/register";
	}
	//등록처리
	@PostMapping("register")
	public String insert() {
	    
		return "redirect:/employees/list";
	}
	
	//수정처리
	@PostMapping("updateEmp")
	public String update() {
	    
		return "redirect:/employees/list";
	}

}
