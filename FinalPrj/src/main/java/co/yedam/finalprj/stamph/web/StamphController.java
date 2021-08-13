package co.yedam.finalprj.stamph.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.finalprj.stamph.service.StamphService;
import co.yedam.finalprj.stamph.vo.StamphVO;

@Controller
public class StamphController {
	@Autowired
	StamphService stamphDao;
	
	//마이페이지 - 우표함
	@RequestMapping("myStamp.do")
	public ModelAndView myStampList(ModelAndView mav, Authentication auth, StamphVO vo) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		vo.setUser_id(id);
		
		mav.addObject("slist", stamphDao.stamphSelectList(vo));
		mav.setViewName("no/stamp/myStamp");
		
		return mav;
	}
	
	@RequestMapping("stamphLoginCheck.do")
	@ResponseBody
	public int stamphLoginCheck(StamphVO vo) {
		return stamphDao.stamphLoginCheck(vo);
	}
	
	@RequestMapping("stamphLoginInsert.do")
	@ResponseBody
	public int stamphLoginInsert(StamphVO vo) {
		int n = stamphDao.stamphLoginInsert(vo);
		if(n == 0) {
			n = 0;
		}
		return n;
	}

	@RequestMapping("stamphLoginUserPlus.do")
	@ResponseBody
	public int stamphLoginUserPlus(StamphVO vo) {
		int n = stamphDao.stamphLoginUserPlus(vo);
		if(n == 0) {
			n = 0;
		}
		return n;
	}
	
	
	
	
	
}
