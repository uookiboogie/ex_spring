package co.hans.app.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

	@GetMapping("/userPage")
	public String userPage() {
		return "users/users";
	}
	
	@GetMapping("/loginForm")
	  public String String() {
		return "users/login";
	}
}
