package co.yedam.finalprj.users.handler;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;

import co.yedam.finalprj.users.map.LoginMap;
import co.yedam.finalprj.users.map.UsersMap;
import co.yedam.finalprj.users.vo.UsersVO;


public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

	@Autowired LoginMap usersDao;
	
	public CustomSuccessHandler() {}
	
	public CustomSuccessHandler(String defaultTargetUrl) {
		setDefaultTargetUrl(defaultTargetUrl);
	}
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		super.onAuthenticationSuccess(request, response, authentication);
		
		User user = (User)authentication.getPrincipal();
		
		UsersVO vo = new UsersVO();
		vo.setUser_id(user.getUsername());
		UsersVO vo2 = usersDao.usersSelect(vo);
		request.getSession().setAttribute("user", vo2);
		System.out.println(vo2);
	}

}
