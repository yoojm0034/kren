package co.yedam.finalprj.users.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.friends.service.FriendsService;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.topic.service.TopicService;
import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;
import lombok.Data;

@Data
class MemberData {
	List<UsersVO> createdRows;
	List<UsersVO> updatedRows;
	List<UsersVO> deletedRows;
}

@Controller
public class UsersController {
	@Autowired UsersService usersDao;
	@Autowired TopicService topicDao;
	@Autowired FriendsService friendsDao;

	@RequestMapping("test3.do")
	public String test3() {
		return "main/test3";
	} 
	
	// 프로필화면
	@RequestMapping("profile.do")
	public String profile(@RequestParam("user_id") String user_id, UsersVO vo, FriendsVO fvo, Model model, Authentication auth, HttpServletRequest request) {
		
		//로그인한 아이디 
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		
		System.out.println("Session : " + Sessionid);
		System.out.println("UserID : "+ user_id);
		
		vo.setSession_id(Sessionid);
		vo.setUser_id(user_id);
		
		fvo.setUser_id(Sessionid);
		fvo.setFollowing(user_id);
		
		model.addAttribute("followCheck", friendsDao.followCheck(fvo));
		model.addAttribute("followingCnt", friendsDao.followingCnt(fvo));
		model.addAttribute("followerCnt", friendsDao.followerCnt(fvo));
		
		
		model.addAttribute("profile", usersDao.usersSelect(vo));
		model.addAttribute("postCnt", usersDao.postCnt(vo));
		model.addAttribute("mytopic", usersDao.myTopicList(vo));
		model.addAttribute("mytrip", usersDao.myTripList(vo));
		
		return "users/profile";
	} 
	
	// 팔로잉 리스트
	@RequestMapping("followingList.do")
	public String followingList() {
		return "no/users/followingList";
	}
	
	
	
	// 회원가입
	@RequestMapping("userJoinForm.do")
	public String userJoinForm(@ModelAttribute("UsersVO") UsersVO vo, Model model) {
	model.addAttribute("topiclist", topicDao.topicSelectList());
		return "empty/userJoinForm";
	} 	
	
	// ID 중복체크
	@RequestMapping("/userIdCheck.do")
	@ResponseBody
	public int userIdCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println(id);
		int cnt = 0;
		if(usersDao.idCheck(id) != null) {
			cnt = 1;
		}
		return cnt;
	}

	// 이름 중복체크
	@RequestMapping("/userNameCheck.do")
	@ResponseBody
	public int userNameCheck(HttpServletRequest request) {
		String name = request.getParameter("name");
		int cnt = 0;
		if(usersDao.nameCheck(name) != null) {
			cnt = 1;
		}
		return cnt;
	}
	
	// 이메일 중복체크
	@RequestMapping("/userEmailCheck.do")
	@ResponseBody
	public int userEmailCheck(HttpServletRequest request) {
		String email = request.getParameter("email");
		int cnt = 0;
		if(usersDao.emailCheck(email) != null) {
			cnt = 1;
		}
		return cnt;
	}
	
	// 회원가입 폼 제출
	@RequestMapping("userJoin.do")
	public String userJoin(@ModelAttribute("UsersVO") UsersVO vo, Model model, byte[] imageByte) throws Exception {
//		ByteArrayInputStream inputStream = new ByteArrayInputStream(imageByte);
//		BufferedImage bufferedImage = ImageIO.read(inputStream);
//		ImageIO.write(bufferedImage, "png", new File("/resources/fileupload/image.png")); //저장하고자 하는 파일 경로를 입력합니다.
		
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		vo.setPassword(scpwd.encode(vo.getPassword()));
		usersDao.usersInsert(vo);
		System.out.println("유저 등록 완료");
	    return "";
	}
	
	
	//관리자 
	//유저목록
	@RequestMapping("admin/usersList.do")
	@ResponseBody
	public Map<String, Object> adminUsersList(UsersVO vo){
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", usersDao.adminUsersSelectList());
		data.put("data", datas);
		return data;
	}
	
	//관리자
	//유저상태업데이트
	@PutMapping("admin/usersUpdate.do")
	@ResponseBody
	public Map<String, Object> adminUsersUpdate(@RequestBody MemberData memberData) {
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(memberData);
		for(int i=0; i < memberData.updatedRows.size(); i++) {
			usersDao.adminUsersUpdate(memberData.updatedRows.get(i));
		}
		data.put("result", true);
		data.put("data", memberData.updatedRows);
		return data;
	}	
	
	
}
