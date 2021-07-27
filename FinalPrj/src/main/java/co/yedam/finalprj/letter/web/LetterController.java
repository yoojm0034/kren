package co.yedam.finalprj.letter.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.finalprj.letter.service.LetterService;
import co.yedam.finalprj.letter.vo.LetterVO;

@Controller
public class LetterController {
	@Autowired
	LetterService letterDao;
	
	// 답장안한편지 조회
	@RequestMapping("letterBox.do")
	public String letterBox(Model model, LetterVO vo) {
		vo.setTo_id("user3");
		model.addAttribute("newLetter", letterDao.selectNewLetter(vo));
		model.addAttribute("friends", letterDao.selectAllFriend(vo));		
		return "letter/letterBox";
	}

	@RequestMapping("arriveLetter.do")
	public String ArriveLetter(Model model, LetterVO vo) {
		vo.setTo_id("user3");		
		model.addAttribute("friends", letterDao.selectAllFriend(vo));		
		model.addAttribute("friendLetter", letterDao.selectFriendLetter(vo));		
		return "letter/arriveLetter";
	}
	
	// 임시저장한 편지조회
	@RequestMapping("savedLetter.do")
	public String SavedLetter(Model model, LetterVO vo) {
		model.addAttribute("save", letterDao.selectSaveLetter(vo));				
		return "letter/savedLetter";
	}

	@RequestMapping("datatable.do")
	public String datatable() {
		return "main/datatable";
	}
}
