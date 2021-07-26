package co.yedam.finalprj.feed.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.finalprj.feed.service.FeedService;
import co.yedam.finalprj.feed.vo.FeedVO;

@Controller
public class FeedController {
	
	@Autowired
	private FeedService feedDao;
	
	
	@RequestMapping("FeedInsert.do")
	public int feedInsert(FeedVO vo) {
		System.out.println(vo);
		return 0;
	}
	
	@RequestMapping("feed.do")
	public String feedList(FeedVO vo, Model model) {
		vo.setUser_id("user1");
		model.addAttribute("feedList",feedDao.feedSelectList(vo));
		return "feed/mainFeed";
	}
	
}
