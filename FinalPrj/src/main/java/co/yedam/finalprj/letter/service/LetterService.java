package co.yedam.finalprj.letter.service;

import java.util.List;

import co.yedam.finalprj.letter.vo.LetterVO;
import co.yedam.finalprj.users.vo.UsersVO;

public interface LetterService {
	//LETTERBOX
	public List<LetterVO> selectAllFriend(LetterVO vo);
	public List<LetterVO> selectNewLetter(LetterVO vo);
	public List<LetterVO> selectFriendLetter(LetterVO vo);
	public List<LetterVO> selectSaveLetter(LetterVO vo);
	
	//CHECK
	public LetterVO replyLetter(LetterVO vo);
	public int stampLetterCheck(LetterVO vo);
	public int cntLetterCheck(LetterVO vo);
	public int insertLetter(LetterVO vo);
	public int updateLetterSendYN(LetterVO vo);
	public int updateLetterStampMinus(LetterVO vo);
	public int insertLetterStamph(LetterVO vo);
	
	//SAVEDLETTER
	public int updateSavedLetter(LetterVO vo);
	public int updateSavedSendYN(LetterVO vo);
	public int deleteLetter(LetterVO vo);
	public int deleteSaveLetter(LetterVO vo);
	public LetterVO oneSelect(LetterVO vo);
	public int updateAdminYN(LetterVO vo);
	
	//PROFILE
	public UsersVO letterDistance(UsersVO vo);
	
	//TODAY
	public int letterTodayHistory(LetterVO vo);
	public int letterHistoryCheck(LetterVO vo);
}
