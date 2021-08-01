package co.yedam.finalprj.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.finalprj.users.service.UsersService;

@Controller
public class statisticsController {
	@Autowired
	UsersService usersDao;
	
	@RequestMapping("admin/statisticsPage.do")
	public String statisticsPage() {
		
		return "admin/statisticsPage";
	}
	
}
