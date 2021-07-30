package co.yedam.finalprj.stamp.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import co.yedam.finalprj.stamp.service.StampService;
import co.yedam.finalprj.stamp.vo.StampVO;

@Controller
public class StampShopController {
	@Autowired
	StampService stampDao;
	
	@RequestMapping("stampMainList.do")
	public String stampMainList() {
		return "stamp/stampShopList";
	}
	
	
	//우표-판매목록...
	@RequestMapping("stampShopList.do")
	public ModelAndView stampShopList(ModelAndView mav, StampVO vo) {
		
		mav.addObject("list", stampDao.stampSelectList());
		mav.setViewName("stamp/stampShopList");
		
		return mav;
	}
}
