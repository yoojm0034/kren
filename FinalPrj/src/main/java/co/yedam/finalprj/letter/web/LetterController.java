package co.yedam.finalprj.letter.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.letter.service.LetterService;
import co.yedam.finalprj.letter.vo.LetterVO;
import co.yedam.finalprj.letterc.service.LettercService;
import co.yedam.finalprj.topic.service.TopicService;
import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;

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
	@RequestMapping("selectLetters.do/{id}")
	public String selectLetters(@PathVariable String id, Model model, LetterVO vo, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String sid = (String) user.getUsername();
		vo.setTo_id(sid); //세션아이디
		vo.setUser_id(id); //친구아이디
		model.addAttribute("friends", letterDao.selectAllFriend(vo)); //친구목록
		model.addAttribute("friendLetter", letterDao.selectFriendLetter(vo)); //해당친구와의 편지들

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
		vo.setUser_id(id);
		model.addAttribute("friends", letterDao.selectAllFriend(vo));
		model.addAttribute("save", letterDao.selectSaveLetter(vo));
		return "letter/savedLetter";
	}
	
	@RequestMapping(value="updateSavedLetter.do", method = RequestMethod.POST)
	@ResponseBody
	public void updateSavedLetter(@RequestBody LetterVO vo) {
		if(vo.getGubun().equals("일반")) { //내가 편지 전송
			int n = letterDao.updateSavedSendYN(vo);
			if(n!=0) { //일반편지라면
				System.out.println("편지전달");
				letterDao.updateSavedLetter(vo);
				letterDao.updateLetterStampMinus(vo);
				letterDao.insertLetterStamph(vo);	
			}	
		} else { // 편지 임시저장
			int j = letterDao.updateSavedLetter(vo);
			if(j!=0) {
				System.out.println("임시편지재저장");
			}
		}
	}

	@RequestMapping("letterBox2.do")
	public String letterBox2(Model model, LetterVO vo) {
		vo.setTo_id("user3");
		model.addAttribute("newLetter", letterDao.selectNewLetter(vo));
		model.addAttribute("friends", letterDao.selectAllFriend(vo));
		return "empty/letterBox2";
	}
	
	@Autowired
	UsersService usersDao;
	@RequestMapping("profileLetter.do")
	public String profileLetter(@ModelAttribute("FriendsVO") FriendsVO fvo, UsersVO vo,
			@RequestParam("user_id") String user_id, Model model, Authentication auth, HttpServletRequest request) {
		
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		vo.setSession_id(Sessionid);
		vo.setUser_id(user_id);
		
		System.out.println("Session : " + Sessionid);
		System.out.println("UserID : "+ user_id);
		
		model.addAttribute("profile", usersDao.usersSelect(vo));
		model.addAttribute("mytopic", usersDao.myTopicList(vo));
		model.addAttribute("mytrip", usersDao.myTripList(vo));
	
		return "letter/profileLetter";
	}

	@RequestMapping("writeLetter.do")
	public String writeLetter2(Authentication auth) {
		return "empty/writeLetter";
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
		int n = letterDao.insertLetter(vo);
		if(n!=0) { //답장여부Y,우표차감,우표사용내역기록
				System.out.println(vo);
				letterDao.updateLetterSendYN(vo);
				letterDao.updateLetterStampMinus(vo);
				letterDao.insertLetterStamph(vo);				
		} else {
			System.out.println("편지작성실패");
		}
	}

	@RequestMapping("stampLetterCheck.do")
	@ResponseBody
	public int stampLetterCheck(@RequestBody LetterVO vo) {
		int cnt = letterDao.stampLetterCheck(vo);
		if(letterDao.stampLetterCheck(vo) == 0) { //우표가 없으면 0
			cnt = 0;
		}
		return cnt;
	}
	
	
}
