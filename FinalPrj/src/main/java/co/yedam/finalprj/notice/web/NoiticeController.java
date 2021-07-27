package co.yedam.finalprj.notice.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.finalprj.notice.service.NoticeService;
import co.yedam.finalprj.notice.vo.NoticeVO;

@Controller
public class NoiticeController {

	@Autowired
	NoticeService noticeDao;
	//공지사항리스트
	@RequestMapping("noticeList.do")
	public String noticeList(Model model, NoticeVO vo) {
		model.addAttribute("noticeList", noticeDao.noticeSelectList());
		return "admin/noticeList";
	}
	//공지사항작성페이지이동
	@RequestMapping("noticeForm.do")
	public String noticeForm() {
		return "admin/noticeForm";
	}
	//공지사항작성 db입력
	@RequestMapping("noticeInsert.do")
	public String noticeInsert(NoticeVO vo, Model model) {
		
		return "redirect:noticeList.do";
	}
	
}
