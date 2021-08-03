package co.yedam.finalprj.stamph.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.finalprj.stamph.service.StamphService;
import co.yedam.finalprj.stamph.vo.StamphVO;

@Controller
public class StamphController {
	@Autowired
	StamphService dao;
	
	@RequestMapping("myStamp.do")
	public String myStamp() {
		return "stamp/myStamp";
	}
	
	@RequestMapping("myStampList.do")
	public ModelAndView myStampList(ModelAndView mav, StamphVO vo) {
		mav.addObject("stamplist", dao.stamphSelect(vo));
		mav.setViewName("stamp/myStamp");
		
		return mav;
	}
}
