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

import co.yedam.finalprj.feed.service.FeedService;
import co.yedam.finalprj.friends.service.FriendsService;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.topic.service.TopicService;
import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;

@Controller
public class FriendsController {
	
	@Autowired FriendsService FriendsDao;
	
	@Autowired FeedService feedDao;
	
	@Autowired UsersService userDao;
	
	@Autowired TopicService topicDao;
	
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
	

	//친구검색화면 
	@RequestMapping("friendSearch11.do")
	public String allUserList1(UsersVO vo,Model model,Authentication auth){
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		
		vo.setUser_id(id);
		vo = userDao.usersSelect(vo);	
		vo.setTopic(vo.getTopic());
		System.out.println(vo);
		model.addAttribute("allList",feedDao.allUser(vo));
		model.addAttribute("searchList",feedDao.allUser(vo));
		model.addAttribute("newList",feedDao.newUser(vo));
		model.addAttribute("topicList",topicDao.topicSelectList());
		return "friends/friendSearch";
	};
	
	//친구검색
	@RequestMapping("searchList1.do")
	public String friendSearchList1(Model model,UsersVO vo,Authentication auth) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();

		vo.setUser_id(id);
		
		if(vo.getS_age().equals("") || vo.getE_age().equals("") ){
			vo.setS_age(null);
		}
		if(vo.getS_dage().equals("") || vo.getE_dage().equals("") ){
			vo.setS_dage(null);
		}
		if(vo.getGender().equals("")) {
			vo.setGender(null);
		}
		if(vo.getDgender().equals("")) {
			vo.setDgender(null);
		}
		if(vo.getCountry().equals("")) {
			vo.setCountry(null);
		}
		if(vo.getDcountry().equals("")) {
			vo.setDcountry(null);
		}
		if(vo.getLanguage1().equals("")) {
			vo.setLanguage1(null);
		}
		if(vo.getTopic().equals("")) {
			vo.setTopic(null);
		}
		if(vo.getDtopic().equals("")) {
			vo.setDtopic(null);
		}
		
		System.out.println("시작 나이: "+vo.getS_age());
		System.out.println("시작 나이2: "+vo.getE_age());
		System.out.println("끝 나이: "+vo.getS_dage());
		System.out.println("끝 나이2: "+vo.getE_dage());
		System.out.println("성별: "+vo.getGender());
		System.out.println("국가: "+vo.getCountry());
		System.out.println("제외국가: "+vo.getDcountry());
		System.out.println("언어: "+vo.getLanguage1());
		System.out.println("토픽: "+vo.getTopic());
		System.out.println("제외토픽: "+vo.getDtopic());
		
		System.out.println(feedDao.searchFriend(vo));

		model.addAttribute("searchList",feedDao.searchFriend(vo));
		return "friendSearch1.do";
	}
	
}
