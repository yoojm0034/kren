package co.yedam.finalprj.common.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.finalprj.notice.service.NoticeService;
import co.yedam.finalprj.notice.vo.NoticeVO;

@Controller
public class aboutusController {
	@Autowired
	NoticeService noticeDao;
	//aboutus 페이지이동
	@RequestMapping("aboutus.do")
	public String aboutus() {
		
		return "common/aboutus";
	}
	//공지사항리스트
	@RequestMapping("userNoticeList.do")
	public String userNoticeList(NoticeVO vo, Model model) {
		model.addAttribute("noticeList", noticeDao.noticeSelectList());
		return "common/userNoticeList";
	}
	//공지사항 한건 조회
	@RequestMapping("userSelectNotice.do")
	public String userSelectNotice(NoticeVO vo, Model model) {
		System.out.println(vo.getNotice_id());
		String path = "";
		//공지사항클릭시 조회수1증가
		int r = noticeDao.noticeUpdateHit(vo);
		if(r > 0) {
			System.out.println("조회");
			model.addAttribute("notice", noticeDao.noticeSelect(vo));
			path = "common/userSelectNotice";
		}else {
			path = "redirect:userNoticeList.do";
		}
		return path;
	}
	
	
	
	
}
