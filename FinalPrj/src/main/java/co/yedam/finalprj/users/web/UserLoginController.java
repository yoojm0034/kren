package co.yedam.finalprj.users.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;

//@Controller
public class UserLoginController {
	@Autowired
	UsersService usersDao;
	
	@RequestMapping("login.do")
	public String login() {
		return "empty/home";
	}
	

}
