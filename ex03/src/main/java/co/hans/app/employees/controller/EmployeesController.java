package co.hans.app.employees.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.hans.app.board.domain.Criteria;
import co.hans.app.board.domain.PageVO;
import co.hans.app.employees.domain.EmployeesVO;
import co.hans.app.employees.service.EmployeesService;

@Controller
@RequestMapping("/employees/*")
//@SessionAttributes("cri")
public class EmployeesController {
	
	@Autowired EmployeesService employeesService;
	
	//전체조회
	@GetMapping("/list")
	public void list(Model model, @ModelAttribute("cri") Criteria cri) {
		
		int total = employeesService.getTotalCount(cri);
		
		model.addAttribute("list",employeesService.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}
	
	//단건조회
	@GetMapping("/get")
	public void get(Model model, EmployeesVO employeesVO, @ModelAttribute("cri") Criteria cri) {  //bno 파라미터 -> 커맨드 객체
		model.addAttribute("board",employeesService.read(employeesVO));
	}

}
