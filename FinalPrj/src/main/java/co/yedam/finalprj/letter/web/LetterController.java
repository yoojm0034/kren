package co.yedam.finalprj.letter.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	// 친구목록조회
	@RequestMapping("letterFriends.do")
	public @ResponseBody List<LetterVO> letterFriends(LetterVO vo) {
		vo.setTo_id("user3");
		return letterDao.selectAllFriend(vo);
	}

	// 해당친구편지목록
	@RequestMapping("selectLetters.do")
	public String selectLetters(Model model, LetterVO vo) {
		vo.setTo_id("user3");
		model.addAttribute("friends", letterDao.selectAllFriend(vo));	
		model.addAttribute("friendLetter", letterDao.selectFriendLetter(vo));		
		return "letter/selectLetters";
	}

	// 임시저장한 편지조회
	@RequestMapping("savedLetter.do")
	public String SavedLetter(Model model, LetterVO vo) {
		vo.setTo_id("user3");
		model.addAttribute("friends", letterDao.selectAllFriend(vo));	
		model.addAttribute("save", letterDao.selectSaveLetter(vo));	
		return "letter/savedLetter";
	}

	@RequestMapping("letterBox2.do")
	public String letterBox2(Model model, LetterVO vo) {
		vo.setTo_id("user3");
		model.addAttribute("newLetter", letterDao.selectNewLetter(vo));
		model.addAttribute("friends", letterDao.selectAllFriend(vo));		
		return "letter/letterBox2";
	}


}
