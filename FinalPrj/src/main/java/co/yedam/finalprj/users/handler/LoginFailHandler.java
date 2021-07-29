package co.yedam.finalprj.users.handler;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Service;

@Service("loginFailHandler")
public class LoginFailHandler implements AuthenticationFailureHandler {

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		if(exception instanceof BadCredentialsException) {
			//비밀번호 불일치시 던지는 예외
			request.setAttribute("LoginFailMessage", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		else if(exception instanceof DisabledException) {
			//인증 거부 - 계정 비활성화
			request.setAttribute("LoginFailMessage", "현재 사용할 수 없는 계정입니다.");
		}
		else if(exception instanceof LockedException) {
			//인증 거부 - 잠긴 계정
			request.setAttribute("LoginFailMessage", "현재 잠긴 계정입니다.");
		}
		else if(exception instanceof AccountExpiredException) {
			//인증 거부 - 계정 유효기간 만료
			request.setAttribute("LoginFailMessage", "이미 만료된 계정입니다.");
		}
		else if(exception instanceof CredentialsExpiredException) {
			//CredentialExpiredException
			request.setAttribute("LoginFailMessage", "비밀번호가 만료된 계정입니다.");
		}
		else request.setAttribute("LoginFailMessage", "계정을 찾을 수 없습니다.");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/login.html");
		dispatcher.forward(request, response);
		
	}

}
