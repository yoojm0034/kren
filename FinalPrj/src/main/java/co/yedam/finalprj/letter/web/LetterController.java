package co.yedam.finalprj.letter.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.letter.service.LetterService;
import co.yedam.finalprj.letter.vo.LetterVO;
import co.yedam.finalprj.letterc.service.LettercService;

@Controller
public class LetterController {
	@Autowired LetterService letterDao;
	@Autowired LettercService lettercDao;
	
	// 답장안한편지 조회
	@RequestMapping("letterBox.do")
	public String letterBox(Model model, LetterVO vo, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		vo.setTo_id(id);
		model.addAttribute("newLetter", letterDao.selectNewLetter(vo));
		model.addAttribute("friends", letterDao.selectAllFriend(vo));
		return "letter/letterBox";
	}

	// 친구목록조회
	@RequestMapping("letterFriends.do")
	public @ResponseBody List<LetterVO> letterFriends(LetterVO vo, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		vo.setTo_id(id);
		return letterDao.selectAllFriend(vo);
	}

	// 해당친구편지목록
	@RequestMapping("selectLetters.do")
	public String selectLetters(Model model, LetterVO vo, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		vo.setTo_id(id);
		model.addAttribute("friends", letterDao.selectAllFriend(vo)); //친구목록
		model.addAttribute("friendLetter", letterDao.selectFriendLetter(vo)); //해당친구와의 편지들
		model.addAttribute("replyLetter", letterDao.replyLetter(vo)); //마지막으로 편지를 보낸 회원
		System.out.println(letterDao.replyLetter(vo));
		// 교정편지 조회
		model.addAttribute("lettercs", lettercDao.selectLetterC());
		return "letter/selectLetters";
	}

	// 임시저장한 편지조회
	@RequestMapping("savedLetter.do")
	public String SavedLetter(Model model, LetterVO vo, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		vo.setTo_id(id);
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

	@RequestMapping(value="deleteLetter.do", method = RequestMethod.POST)
	@ResponseBody
	public void deleteLetter(@RequestBody LetterVO vo, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		vo.setUser_id(id);
		letterDao.deleteLetter(vo);
	}
	
	@RequestMapping(value="insertLetter.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertLetter(@RequestBody LetterVO vo, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		vo.setUser_id(id);
		letterDao.insertLetter(vo);
	}
}
