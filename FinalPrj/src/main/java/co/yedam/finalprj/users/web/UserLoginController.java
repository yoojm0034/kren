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
	public String loginCheck(Model model, UsersVO vo, HttpSession session, RedirectAttributes rttr) {
		
		int r = usersDao.loginCheck(vo);
		
		if(r < 1) {
			//로그인 실패
			rttr.addFlashAttribute("mesagge", false);
			return "redirect:home.do";
		}else {
			//로그인 성공
			session.setAttribute("users", vo);
			model.addAttribute("mesagge","님 환영합니다.");
			return "feed/mainFeed";
		}
		
		
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/home.do";
	}
}
