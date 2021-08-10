package co.yedam.finalprj.users.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.finalprj.feed.service.FeedService;
import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.friends.service.FriendsService;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.letter.service.LetterService;
import co.yedam.finalprj.letter.vo.LetterVO;
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
	@Autowired FeedService feedDao;
	@Autowired LetterService letterDao;
	
	@Inject JavaMailSender mailSender;   
	
	//...이메일 인증을 위한 로깅을 위한 변수
    private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
    private static final String String = null;

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
		//로그인한 아이디 
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		
		vo.setSession_id(Sessionid);
		
		model.addAttribute("profile", usersDao.usersSelect(vo));
		model.addAttribute("mytopic", usersDao.myTopicList(vo));
		model.addAttribute("mytrip", usersDao.myTripList(vo));
		model.addAttribute("topiclist", topicDao.topicSelectList());
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
	
	//------------------------------------아이디/비밀번호 찾기...
	@RequestMapping("find/find.do")
	public String findIdPw() {
		return "no/find/findIdPw";
	}
	
	//아이디찾기 1페이지-이메일 인증...
	@RequestMapping("find/findID.do")
	public String findID(UsersVO vo, HttpServletRequest request) {
		
		return "no/find/findId";
	}
	
	//아이디찾기 2페이지-아이디 노출, 로그인 페이지로 이동...
	@RequestMapping("find/findID2.do")
	public String findID2() {
			
		return "no/find/findId3";
	}
	
	//인증번호 이메일 발송 기능...
	@RequestMapping("find/mailCheck.do")
	@ResponseBody
	public int mailCheck(HttpServletRequest request, UsersVO vo) throws IOException {
		UsersVO uvo = usersDao.emailCheck(vo.getEmail()); //쿼리 값을 받아옴
		
		if(uvo == null) {
			//DB에 동일 이메일이 없을 경우...0으로 뷰의 res에 넘긴다.
			return 0;
		}
		
		//DB에 동일 이메일이 있으면...1로 뷰의 res에 넘기며 이메일을 발송한다.
		
		Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "5524yina@gamil.com"; //보내는 사람 이메일(삭제하면 기능하지않음)
        String tomail = vo.getEmail(); // 받는 사람 이메일
        String title = "[kren]아이디 찾기-이메일 인증번호 발송"; // 이메일 제목
        String content =
        
        System.getProperty("line.separator")+ //줄간격을 띄우기 위한 코드
        
        System.getProperty("line.separator")+

        " 인증번호 " +dice+ ". "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "인증번호를 홈페이지에 입력해 주세요."; // 내용
        
        request.getSession().setAttribute("dice", dice); //인증번호 세션에 담아둠
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }  
        
        return 1;
	}
	
	/*
	 * //인증번호 확인 기능...
	 * 
	 * @RequestMapping("find/mailCheck2.do") public int findID2(HttpServletResponse
	 * response, HttpSession session) throws IOException { dice =
	 * session.getAttribute("dice");
	 * 
	 * if(dice == null) { //세션값과 동일치 않으면...0으로 뷰의 res에 넘긴다. return 0; } return 1; }
	 */
	
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
	public Map<String, Object> adminUsersUpdate(@RequestBody MemberData memberData, ReportVO vo,FeedVO fvo, LetterVO lvo) {
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(memberData);
		for(int i=0; i < memberData.updatedRows.size(); i++) {
			usersDao.adminUsersUpdate(memberData.updatedRows.get(i));
			//신고목록중 유저에 대한 모든 신고 읽음처리
			vo.setReported(memberData.updatedRows.get(i).getUser_id());
			int r = reportDao.reportUpdateUser(vo);
			System.out.println(r + "건 수정");
			//피드 - 회원아이디로 회원이작성한 모든 댓글, 좋아요, 피드, 삭제해야됨
			
			//편지 - 회원아이디로 회원이 작성한 편지 모두 삭제
	
		}
		data.put("result", true);
		data.put("data", memberData.updatedRows);
		return data;
	}	
	
	
}
