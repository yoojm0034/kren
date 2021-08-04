package co.yedam.finalprj.friends.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.yedam.finalprj.friends.service.FriendsService;
import co.yedam.finalprj.users.vo.UsersVO;

@Controller
public class FriendsController {
	
	@Autowired FriendsService FriendsDao;
	
	@RequestMapping("friendSearch.do")
	public String feiendSearch() {
		return "friends/friendSearch";
	}
	
	@RequestMapping("follow.do")
	public String follow(@RequestParam("user_id") String user_id, UsersVO vo, Model model, Authentication auth, HttpServletRequest request) {
		
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		vo.setSession_id(Sessionid);
		vo.setUser_id(user_id);
		
		System.out.println("Session : " + Sessionid);
		System.out.println("UserID : "+ user_id);
		
		FriendsDao.follow(vo);
		
		return "users/profile";
	} 
}
