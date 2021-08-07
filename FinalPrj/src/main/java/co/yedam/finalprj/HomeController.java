package co.yedam.finalprj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.finalprj.users.service.UsersService;


@Controller
public class HomeController {
	@Autowired
	UsersService userDao;
	
	@RequestMapping("home.do")
	public String home() {
		return "empty/home";
	}

	@RequestMapping("test.do")
	public String test() {
		return "main/test";
	} 

	@RequestMapping("test2.do")
	public String test2() {
		return "main/test2";
	} 

	@RequestMapping("admin/admin.do")
	public String admin(Model model) {
		model.addAttribute("userList", userDao.usersSelectList());
		return "admin/main";
	} 
	@RequestMapping("feed1.do")
	public String feed() {
		return "feed/mainFeed";
	} 
}
