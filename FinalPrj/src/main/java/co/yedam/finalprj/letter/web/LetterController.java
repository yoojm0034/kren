package co.yedam.finalprj.letter.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.friends.service.FriendsService;
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
		model.addAttribute("req",vo);
		
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
	
	@Autowired UsersService usersDao;
	@Autowired TopicService topicDao;
	@Autowired FriendsService friendsDao;
	@RequestMapping("profileTest.do")
	public String profileTest(@RequestParam("user_id") String user_id, UsersVO vo, FriendsVO fvo, Model model, Authentication auth, HttpServletRequest request) {
		
		//로그인한 아이디 
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		
		System.out.println("Session : " + Sessionid);
		System.out.println("UserID : "+ user_id);
		
		vo.setSession_id(Sessionid);
		vo.setUser_id(user_id);
		
		fvo.setUser_id(Sessionid);
		fvo.setFollowing(user_id);
		
		model.addAttribute("followCheck", friendsDao.followCheck(fvo));
		model.addAttribute("followingCnt", friendsDao.followingCnt(fvo));
		model.addAttribute("followerCnt", friendsDao.followerCnt(fvo));
		
		
		model.addAttribute("profile", usersDao.usersSelect(vo));
		model.addAttribute("postCnt", usersDao.postCnt(vo));
		model.addAttribute("mytopic", usersDao.myTopicList(vo));
		model.addAttribute("mytrip", usersDao.myTripList(vo));
		return "letter/profileTest";
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
	
	@RequestMapping(value="deleteSaveLetter.do", method = RequestMethod.POST)
	@ResponseBody
	public void deleteSaveLetter(@RequestBody LetterVO vo, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		vo.setUser_id(id);
		letterDao.deleteSaveLetter(vo);
	}
	
	@RequestMapping(value="insertLetter.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertLetter(@RequestBody LetterVO vo, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		vo.setUser_id(id);
		int n = letterDao.insertLetter(vo);
		
		if(n!=0 && vo.getGubun().equals("일반")) { //답장여부Y,우표차감,우표사용내역기록
			System.out.println(vo);
			if(vo.getLetter_id()!=null) {
				letterDao.updateLetterSendYN(vo);					
			}
			letterDao.updateLetterStampMinus(vo);
			letterDao.insertLetterStamph(vo);				
		} else {
			System.out.println("임시저장");
		}
	}

	@RequestMapping(value="insertSavedLetter.do", method = RequestMethod.POST)
	@ResponseBody
	public void insertSavedLetter(@RequestBody LetterVO vo, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		vo.setUser_id(id);

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
	
	@RequestMapping("cntLetterCheck.do")
	@ResponseBody
	public int cntLetterCheck(LetterVO vo) {
		int cnt = letterDao.cntLetterCheck(vo); //오늘 보낸 편지횟수
		if(letterDao.cntLetterCheck(vo) == 0) { //0이면 0
			cnt = 0;
		}
		return cnt;
	}
	
	@RequestMapping("pad.do")
	public String pad() {
		return "letter/pad";
	}
	
	@RequestMapping("letterTodayHistory.do")
	@ResponseBody
	public int letterTodayHistory(LetterVO vo) {//오늘 보낸 편지가 있는지 count
		int today = letterDao.letterTodayHistory(vo);
		System.out.println(today);
		if(letterDao.letterTodayHistory(vo) == 0) {
			today = 0;
		}
		return today;
	}
	
	@RequestMapping("letterHistoryCheck.do")
	@ResponseBody
	public int letterHistoryCheck(LetterVO vo) {//주고받은 편지내역 수 확인
		int letter = letterDao.letterHistoryCheck(vo);		
		System.out.println(letter);
		if(letterDao.letterHistoryCheck(vo)==0) {
			letter=0;
		}
		return letter;
	}
	
	
}
