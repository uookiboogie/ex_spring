package com.dbal.app.book.controller;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dbal.app.book.domain.BookVO;
import com.dbal.app.book.service.BookService;

@Controller
@RequestMapping("/book/*")
public class BookController {

	@Autowired BookService bookService;
	
	//전체조회
	@GetMapping("/list")
	public String list(Model model) {
		model.addAttribute("list",bookService.getList());    
		return "book/list";
	}
	
	//등록페이지
	@GetMapping("/register")
	public String registerForm(Model model) {
		model.addAttribute("No",bookService.getNo());    
		return "book/register";
	}
	//등록
	@PostMapping("/register")
	public String register(Model model, BookVO vo) {
		bookService.insert(vo);
		model.addAttribute("list",bookService.getList()); 
		return "book/list";
	}
	
	//전체조회
	@GetMapping("/list2")
	public String list2(Model model) {
		model.addAttribute("list",bookService.get2List());    
		return "book/list2";
	}
}
