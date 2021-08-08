package co.yedam.finalprj.letter.service;

import java.util.List;

import co.yedam.finalprj.letter.vo.LetterVO;

public interface LetterService {
	public List<LetterVO> selectAllFriend(LetterVO vo);
	public List<LetterVO> selectNewLetter(LetterVO vo);
	public List<LetterVO> selectFriendLetter(LetterVO vo);
	public List<LetterVO> selectSaveLetter(LetterVO vo);
	public LetterVO replyLetter(LetterVO vo);
	public int stampLetterCheck(LetterVO vo);
	public int insertLetter(LetterVO vo);
	public int updateLetterSendYN(LetterVO vo);
	public int updateLetterStampMinus(LetterVO vo);
	public int insertLetterStamph(LetterVO vo);
	public int updateSavedLetter(LetterVO vo);
	public int updateSavedSendYN(LetterVO vo);
	public int deleteLetter(LetterVO vo);
	public LetterVO oneSelect(LetterVO vo);
	public int updateAdminYN(LetterVO vo);
}
