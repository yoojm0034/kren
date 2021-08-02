package co.yedam.finalprj.users.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.finalprj.users.service.UsersService;

//@Controller
public class UserLoginController {
	@Autowired
	UsersService usersDao;
	
	@RequestMapping("login.do")
	public String login() {
		return "empty/home";
	}
	

}
