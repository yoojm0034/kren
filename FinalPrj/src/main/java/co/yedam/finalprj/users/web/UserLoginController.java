package co.yedam.finalprj.users.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;

@Controller
public class UserLoginController {
	@Autowired
	UsersService usersDao;
	
	@RequestMapping("login.do")
	public String login() {
		return "empty/home";
	}
	
	//로그인 기능
	@RequestMapping("loginCheck.do")
	public String loginCheck(Model model, UsersVO vo, HttpSession session) {
		
		if(vo != null) {
			session.setAttribute("user", vo);
			model.addAttribute("mesagge","님 환영합니다.");
			return "feed/mainFeed.do";
		}else {
			model.addAttribute("mesagge","존재하지 않는 회원입니다.");
			return "redirect:home.do";
		}
	
		
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/home.do";
	}
}
