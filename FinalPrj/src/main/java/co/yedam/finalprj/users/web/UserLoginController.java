package co.yedam.finalprj.users.web;

import java.io.IOException;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;

@Controller
public class UserLoginController {
	@Autowired
	UsersService usersDao;

	@Inject
	JavaMailSender mailSender;

	// ...이메일 인증을 위한 로깅을 위한 변수
	private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
	private static final String String = null;

	@RequestMapping("login.do")
	public String login() {
		return "empty/home";
	}

	// 우표 구매시 보유 우표수 증가...
	@RequestMapping("stampUpdate.do")
	public UsersVO stampUpdate(UsersVO vo) {
		usersDao.usersUpdate(vo);

		return vo;
	}

	// ------------------------------------아이디 찾기...
	@RequestMapping("find/find.do")
	public String findIdPw() {
		return "no/find/findIdPw";
	}

	// 아이디찾기 1페이지-이메일 인증...
	@RequestMapping("find/findID.do")
	public String findID(UsersVO vo, HttpServletRequest request) {

		return "no/find/findId";
	}

	// 인증번호 이메일 발송 기능...
	@RequestMapping("find/mailCheck.do")
	@ResponseBody
	public int mailCheck(HttpServletRequest request, UsersVO vo) throws IOException {
		String email = vo.getEmail();
		int uvo = usersDao.emailCheck(email); // 쿼리 값을 받아옴
		
		request.getSession().setAttribute("email", email);
		System.out.println("세션에 담긴 이메일: " + email);

		if (uvo == 0) {
			// DB에 동일 이메일이 없을 경우...0으로 뷰의 res에 넘긴다.
			return 0;
		} else {

			Random r = new Random();
			int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)

			String setfrom = "5524yina@gamil.com"; // 보내는 사람 이메일(삭제하면 기능하지않음)
			String tomail = vo.getEmail(); // 받는 사람 이메일
			String title = "[kren]아이디 찾기-이메일 인증번호 발송"; // 이메일 제목
			String content =

					System.getProperty("line.separator") + // 줄간격을 띄우기 위한 코드

							System.getProperty("line.separator") +

							" 인증번호 " + dice + ". "

							+ System.getProperty("line.separator") +

							System.getProperty("line.separator") +

							"인증번호를 홈페이지에 입력해 주세요."; // 내용

			request.getSession().setAttribute("dice", dice); // 인증번호 세션에 담아둠
			System.out.println("발송된 인증번호: " + dice);

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
			return 1; // DB에 동일 이메일이 있으면...1로 뷰의 res에 넘기며 이메일을 발송한다.
		}
	}

	// 인증번호 확인 기능...
	@RequestMapping("find/mailCheck2.do")
	@ResponseBody
	public boolean findID2(HttpSession session, HttpServletRequest request)throws IOException {
		String dice = java.lang.String.valueOf(session.getAttribute("dice"));
		String num = request.getParameter("number");

		System.out.println("input에 담긴 인증번호: " + num);
		System.out.println("세션에 담긴 인증번호: " + dice);

		if (dice.equals(num)) {
			session.setAttribute("email");
			
			return true;
		} 
		return false;
	}

	// 아이디찾기 2페이지-아이디 노출, 로그인 페이지로 이동...
	@RequestMapping("find/findID2.do")
	public String findID2(Model model, HttpServletRequest request, UsersVO vo, String email) {
		String userEmail = request.getParameter(email);
		java.lang.String uvo = request.getParameter("user_id");
		
		System.out.println("vo: " + vo);
		System.out.println("이메일: " + email);
		
		model.addAttribute("id", vo);
//		String id = vo.getUser_id();
//		System.out.println("조회된 아이디: " + id);
		
		//String id = usersDao.findId(id);
		return "no/find/findId2";
	}

	// ------------------------------------비밀번호 찾기...
	@RequestMapping("find/findPW.do")
	public String findPW() {

		return "no/find/findPw";
	}
	
	// 아이디 체크...
	@RequestMapping("find/idCheck.do")
	@ResponseBody
	public boolean idCheck(HttpServletRequest request, UsersVO vo)throws IOException {
		String id = vo.getUser_id();
		//UsersVO uvo = usersDao.findId(id);
		java.lang.String uvo2 = request.getParameter("user_id");
		
		System.out.println("input 아이디: " + id);
		//System.out.println("조회된 아이디: " + (uvo != null? uvo.getUser_id() :"없다"));
		System.out.println("조회된 아이디2: " + (uvo2));

		if (uvo2 != null) {
			return true;
		} 
		return false;
	}
	
	// 임시비밀번호 이메일 발송
	@RequestMapping("find/pwSendMail.do")
	@ResponseBody
	public int pwSendMail(HttpServletRequest request, HttpSession session, UsersVO vo) throws IOException {
		String email = vo.getEmail();
		int uvo = usersDao.emailCheck(email); // 쿼리 값을 받아옴
			
		request.getSession().setAttribute("email", email);

		if (uvo == 0) {
			// DB에 동일 이메일이 없을 경우...0으로 뷰의 res에 넘긴다.
			return 0;
		} else {

			Random r = new Random();
			int imsiPw = r.nextInt(4589362) + 49311; // 임시비밀번호 생성 (난수)

			String setfrom = "5524yina@gamil.com"; // 보내는 사람 이메일(삭제하면 기능하지않음)
			String tomail = vo.getEmail(); // 받는 사람 이메일
			String title = "[kren]아이디 찾기-이메일 인증번호 발송"; // 이메일 제목
			String content =

							System.getProperty("line.separator") + // 줄간격을 띄우기 위한 코드

							System.getProperty("line.separator") +

							" 임시비밀번호: " + imsiPw + ". "

							+ System.getProperty("line.separator") +

							System.getProperty("line.separator") +

							"일회성 비밀번호이기 때문에 로그인 후 비밀번호를 꼭 변경해주세요."; // 내용
			
			System.out.println("발송된 임시비밀번호: " + imsiPw);
			
			//임시비밀번호 업데이트...
			request.getSession().setAttribute("imsiPw", imsiPw); 
			String imsiPws = java.lang.String.valueOf(session.getAttribute("imsiPw"));
			
			//임시비밀번호 암호화
			BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
			vo.setPassword(scpwd.encode(imsiPws));
			System.out.println("DB에 들어갈 임시비밀번호: " + vo.getPassword());
			
			usersDao.findPwUpdate(vo);//DB에 update

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
			return 1; // DB에 동일 이메일이 있으면...1로 뷰의 res에 넘기며 이메일을 발송한다.
		}
	}

}
