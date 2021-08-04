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
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.users.vo.UsersVO;

@Controller
public class FriendsController {
	
	@Autowired FriendsService FriendsDao;
	
	@RequestMapping("friendSearch.do")
	public String feiendSearch() {
		return "friends/friendSearch";
	}
	
	@RequestMapping("follow.do")
	public String follow(FriendsVO vo, Model model, Authentication auth, HttpServletRequest request) {
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		String following = request.getParameter("following");
		vo.setUser_id(Sessionid);
		vo.setFollowing(following);
		
		int r = FriendsDao.follow(vo);
		System.out.println(r);
		if (r>0) {
		System.out.println("[" + Sessionid + "]유저가 [" + following + "]를 팔로잉 했습니다.");
		}
		
		return "";
	} 
}
