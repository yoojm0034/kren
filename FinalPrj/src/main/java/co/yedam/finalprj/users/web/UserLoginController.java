package co.yedam.finalprj.users.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;

//@Controller
public class UserLoginController {
	@Autowired
	UsersService usersDao;
	
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
	

}
