package co.yedam.finalprj.common.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.push.service.PushService;
import co.yedam.finalprj.push.vo.PushVO;
import co.yedam.finalprj.users.vo.UsersVO;

@Controller
public class PushController {
	@Autowired
	PushService pushDao;
	
	@RequestMapping("pushSelectList.do")
	@ResponseBody
	public List<PushVO> pushSelectList(UsersVO vo, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		vo.setUser_id(id);
		
		return pushDao.pushSelectList(vo);
	}
}
