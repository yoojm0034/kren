package co.yedam.finalprj.stamp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.finalprj.stamp.service.StampService;
import co.yedam.finalprj.stamp.vo.StampVO;
import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;

@Controller
public class StampShopController {
	@Autowired
	StampService stampDao;
	
	@Autowired
	UsersService userDao;
	
	@RequestMapping("stampMainList.do")
	public String stampMainList() {
		return "stamp/stampShopList";
	}
	
	
	//우표-판매목록...
	@RequestMapping("stampShopList.do")
	public String stampShopList(Model model, StampVO vo, UsersVO uvo, Authentication auth) {
		
		model.addAttribute("list", stampDao.stampSelectList());
		
//		User user = (User) auth.getPrincipal();
//		String id = (String) user.getUsername();
//		uvo.setUser_id(id);
//		
//		uvo = userDao.userSelectStmap(id);
//		System.out.println("우표갯수"+uvo);
		
		return "stamp/stampShopList";
	}
}
