package co.yedam.finalprj.users.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.finalprj.friends.service.FriendsService;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.report.service.ReportService;
import co.yedam.finalprj.report.vo.ReportVO;
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
	@Autowired ReportService reportDao;

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
	public String followingList(UsersVO vo, Model model, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		vo.setSession_id(Sessionid);
		
		System.out.println(vo);
		
		model.addAttribute("followingList", usersDao.followingList(vo));
		return "no/users/followingList";
	}
	
	// 팔로워 리스트
	@RequestMapping("followerList.do")
	public String followerList(UsersVO vo, Model model, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		vo.setSession_id(Sessionid);
		
		System.out.println(vo);
		
		model.addAttribute("followerList", usersDao.followerList(vo));
		return "no/users/followerList";
	}
	
	// 프로필 업데이트
	@RequestMapping("usersUpdateForm.do")
	public String usersUpdateForm(UsersVO vo, Model model, Authentication auth) {
		return "no/users/usersUpdateForm";
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
	
	//아이디비밀번호 찾기...
	@RequestMapping("find.do")
	public String findIdPw() {
		return "find/findIdPw";
	}
	
	@RequestMapping("findID.do")
	public int findID(ModelAndView mav, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("email");
		//String id = usersDao.findId(email);
		
		int cnt = 0;
		if(usersDao.emailCheck(email) != null) {
			cnt = 1;
		}
		return cnt;
			
//		if(vo != null) {
//		Random r = new Random();
//		int num = r.nextInt(999999); // 랜덤난수설정
//		
//		if (vo.getEmail().equals(email)) {
//			session.setAttribute("email", vo.getEmail());
//
//			String setfrom = "yi_na@naver.com"; // naver 
//			String tomail = "yi_na@naver.com"; //받는사람
//			String title = "[kren] 인증 이메일 입니다"; 
//			String content = System.getProperty("line.separator") + "안녕하세요 회원님" + System.getProperty("line.separator")
//					+ "kren 이메일 인증번호는 " + num + " 입니다." + System.getProperty("line.separator"); // 
//
//			try {
//				MimeMessage message = mailSender.createMimeMessage();
//				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "utf-8");
//
//				messageHelper.setFrom(setfrom); 
//				messageHelper.setTo(tomail); 
//				messageHelper.setSubject(title);
//				messageHelper.setText(content); 
//
//				mailSender.send(message);
//			} catch (Exception e) {
//				System.out.println(e.getMessage());
//			}
//
//			mav.setViewName("find/findId");
//			mav.addObject("num", num);
//			return mav;
//		}else {
//			mav.setViewName("find/findId");
//			return mav;
//		}
//		}else {
//			mav.setViewName("find/findId");
//			return mav;
//		}
	}
	
	@RequestMapping("findID2.do")
	public String findID2() {
		
		return "find/findId2";
	}
	
	@RequestMapping("findID3.do")
	public String findID3() {
		
		return "find/findId3";
	}
	
	@RequestMapping("findPW.do")
	public String findPW() {
		
		return "find/findPw";
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
	public Map<String, Object> adminUsersUpdate(@RequestBody MemberData memberData, ReportVO vo) {
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(memberData);
		for(int i=0; i < memberData.updatedRows.size(); i++) {
			usersDao.adminUsersUpdate(memberData.updatedRows.get(i));
			vo.setReported(memberData.updatedRows.get(i).getUser_id());
			int r = reportDao.reportUpdateUser(vo);
			System.out.println(r + "건 수정");
		}
		data.put("result", true);
		data.put("data", memberData.updatedRows);
		return data;
	}	
	
	
}
