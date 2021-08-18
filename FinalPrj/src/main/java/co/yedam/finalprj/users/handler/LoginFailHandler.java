package co.yedam.finalprj.users.handler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

import co.yedam.finalprj.users.map.LoginMap;
import co.yedam.finalprj.users.map.UsersMap;
import co.yedam.finalprj.users.vo.UsersVO;

@Service("loginFailHandler")
public class LoginFailHandler implements AuthenticationFailureHandler {

	private String user_id;
	private String password;
	private String errorMsg;
	private String defaultTargetUrl;
	
	public String getDefaultTargetUrl() {
		return defaultTargetUrl;
	}

	public void setDefaultTargetUrl(String defaultTargetUrl) {
		this.defaultTargetUrl = defaultTargetUrl;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}
	
	
	@Autowired
	UsersMap usersDao;
	
//	@Autowired
//	BCryptPasswordEncoder scpwd;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		UsersVO vo = new UsersVO();
		
		//입력된 아이디와 비밀번호...
		String id = request.getParameter(user_id);
		String pw = request.getParameter(password);
		vo.setUser_id(id);

		UsersVO vo2 = usersDao.usersSelect(vo);
		
//		String lg = request.getParameter(param);
//		String lgsession = request.getSession().setAttribute("param", param);
//		Boolean cpw = scpwd.matches(pw, vo2);
		String errMsg = null;
		
		request.setAttribute(user_id, id);
//		request.setAttribute(password, cpw);
		request.setAttribute(errorMsg, errMsg);
		
//		System.out.println("아아악: "+ "/" + id +"/" + pw + "/" + vo2 + "/" + cpw);
		System.out.println("아아악: "+ "/" + id +"/" + pw + "/" + vo2);
		System.out.println(usersDao.usersSelect(vo));
		
		if(exception instanceof BadCredentialsException) {
			if(vo2 != null) {
				//비밀번호 불일치시 던지는 예외
				request.setAttribute("LoginFailMessage", "아이디 또는 비밀번호가 일치하지 않습니다.");	
				if(!vo2.getStatus().equals("일반회원")) {
					request.setAttribute("LoginFailMessage", "만료된 계정입니다. 관리자 문의 요망.");													
				}
			} else {
				request.setAttribute("LoginFailMessage", "가입되지 않은 아이디입니다. 회원가입을 해주세요.");								
			}
		}
		else if(exception instanceof LockedException) {
			//인증 거부 - 잠긴 계정
			request.setAttribute("LoginFailMessage", "현재 잠긴 계정입니다.");
		}
		else request.setAttribute("LoginFailMessage", "회원을 찾을 수 없는 계정입니다. 회원가입을 해주세요.");
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/home.do");
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/home.do?lang=" + lgsession);
		dispatcher.forward(request, response);
	}
}
