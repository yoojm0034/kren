package co.yedam.finalprj.friends.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// 팔로우
	@RequestMapping(value="follow.do", method = RequestMethod.POST)
	@ResponseBody
	public String follow(@RequestBody FriendsVO vo, Authentication auth, HttpServletRequest request) {
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		String following = vo.getFollowing();
		vo.setUser_id(Sessionid);
		
		int r = FriendsDao.follow(vo);
		if (r>0) {
			System.out.println("[" + Sessionid + "]유저가 [" + following + "]를 팔로잉 했습니다.");
			return "FollowOK";
		}
		return "fail";
	} 
	
	// 언팔로우
	@RequestMapping(value="unfollow.do", method = RequestMethod.POST)
	@ResponseBody
	public String unfollow(@RequestBody FriendsVO vo, Authentication auth, HttpServletRequest request) {
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		String following = vo.getFollowing();
		vo.setUser_id(Sessionid);
		
		int r = FriendsDao.unfollow(vo);
		if (r>0) {
			System.out.println("[" + Sessionid + "]유저가 [" + following + "]를 언팔로우 했습니다.");
			return "UnFollowOK";
		}
		return "fail";		
	} 
}
