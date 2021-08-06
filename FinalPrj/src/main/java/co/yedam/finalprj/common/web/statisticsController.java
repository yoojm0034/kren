package co.yedam.finalprj.common.web;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import co.yedam.finalprj.common.service.VisitCountService;
import co.yedam.finalprj.users.service.UsersService;

@Controller
public class statisticsController {
	@Autowired
	UsersService usersDao;
	
	@Autowired
	VisitCountService visitDao;
	
	@RequestMapping("admin/statisticsPage.do")
	public String statisticsPage() {
		
		return "admin/statisticsPage";
	}
	
	

	
}
