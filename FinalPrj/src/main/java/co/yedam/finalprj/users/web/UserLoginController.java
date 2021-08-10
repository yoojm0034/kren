package co.yedam.finalprj.users.web;

import java.io.IOException;
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
import org.springframework.stereotype.Controller;
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
	
	//우표 구매시 보유 우표수 증가...
	@RequestMapping("stampUpdate.do")
	public UsersVO stampUpdate(UsersVO vo) {
		usersDao.usersUpdate(vo);
		
		return vo;
	}
	
	// ------------------------------------아이디/비밀번호 찾기...
		@RequestMapping("find/find.do")
		public String findIdPw() {
			return "no/find/findIdPw";
		}

		// 아이디찾기 1페이지-이메일 인증...
		@RequestMapping("find/findID.do")
		public String findID(UsersVO vo, HttpServletRequest request) {

			return "no/find/findId";
		}

		// 아이디찾기 2페이지-아이디 노출, 로그인 페이지로 이동...
		@RequestMapping("find/findID2.do")
		public ModelAndView findID2(ModelAndView mav, HttpServletRequest request, UsersVO vo) {
			String email = request.getParameter("email");
			
			mav.addObject(usersDao.findId(email));
			mav.setViewName("no/find/findId3");
			
			return mav;
		}

		// 인증번호 이메일 발송 기능...
		@RequestMapping("find/mailCheck.do")
		@ResponseBody
		public int mailCheck(HttpServletRequest request, UsersVO vo) throws IOException {
			String email = vo.getEmail();
			int uvo = usersDao.emailCheck(email); // 쿼리 값을 받아옴

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
				return 1; 		// DB에 동일 이메일이 있으면...1로 뷰의 res에 넘기며 이메일을 발송한다.
			}
		}

		 //인증번호 확인 기능...
		 @RequestMapping("find/mailCheck2.do") 
		 @ResponseBody
		 public int findID2(HttpServletResponse response, HttpSession session, HttpServletRequest request) throws IOException { 
			 String dice = java.lang.String.valueOf(session.getAttribute("dice"));
			 String num = request.getParameter("number");
			 
			 System.out.println("input에 담긴 인증번호: " + num);
			 System.out.println("세션에 담긴 인증번호: " + dice);
			 
			 if (dice == num) {
					return 2;
				} else {
					return 0;
				}
		 }

		@RequestMapping("findPW.do")
		public String findPW() {

			return "find/findPw";
		}
	
}
