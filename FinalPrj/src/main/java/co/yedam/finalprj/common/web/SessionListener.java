package co.yedam.finalprj.common.web;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import co.yedam.finalprj.common.service.VisitCountService;

public class SessionListener implements HttpSessionListener {
	
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession(); 
		ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext()); 
		VisitCountService visitDao = (VisitCountService) context.getBean("VisitService");

		
		visitDao.insertVisitor();
		
		int todayCount = visitDao.getVisitToday();
		int totalCount = visitDao.getVisitTotalCount();
		
		session.getServletContext().setAttribute("totalCount", totalCount); // 전체 방문자 수
	    session.getServletContext().setAttribute("todayCount", todayCount); // 오늘 방문자 수
	         
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

}
