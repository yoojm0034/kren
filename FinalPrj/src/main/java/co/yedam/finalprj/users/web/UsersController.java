package co.yedam.finalprj.users.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsersController {

	@RequestMapping("test3.do")
	public String test2() {
		return "main/test3";
	} 

	@RequestMapping("profile.do")
	public String profile() {
		return "users/profile";
	} 
	
}
