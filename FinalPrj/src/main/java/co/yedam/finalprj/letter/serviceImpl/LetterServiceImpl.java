package co.yedam.finalprj.letter.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.finalprj.letter.map.LetterMap;
import co.yedam.finalprj.letter.service.LetterService;
import co.yedam.finalprj.letter.vo.LetterVO;
import co.yedam.finalprj.users.vo.UsersVO;

@Repository("letterDao")
public class LetterServiceImpl implements LetterService {
	@Autowired
	LetterMap map;
	
	@Override
	public List<LetterVO> selectAllFriend(LetterVO vo) {
		return map.selectAllFriend(vo);
	}

	@Override
	public List<LetterVO> selectNewLetter(LetterVO vo) {
		return map.selectNewLetter(vo);
	}

	@Override
	public List<LetterVO> selectFriendLetter(LetterVO vo) {
		return map.selectFriendLetter(vo);
	}

	@Override
	public List<LetterVO> selectSaveLetter(LetterVO vo) {
		return map.selectSaveLetter(vo);
	}

	@Override
	public LetterVO replyLetter(LetterVO vo) {
		return map.replyLetter(vo);
	}

	@Override
	public int insertLetter(LetterVO vo) {
		return map.insertLetter(vo);
	}

	@Override
	public int deleteLetter(LetterVO vo) {
		return map.deleteLetter(vo);
	}

	@Override
	public int stampLetterCheck(LetterVO vo) {
		return map.stampLetterCheck(vo);
	}

	@Override
	public int updateLetterStampMinus(LetterVO vo) {
		return map.updateLetterStampMinus(vo);
	}

	@Override
	public int insertLetterStamph(LetterVO vo) {
		return map.insertLetterStamph(vo);
	}

	@Override
	public int updateLetterSendYN(LetterVO vo) {
		return map.updateLetterSendYN(vo);
	}

	@Override
	public int updateSavedLetter(LetterVO vo) {
		return map.updateSavedLetter(vo);
	}

	@Override
	public int updateSavedSendYN(LetterVO vo) {
		return map.updateSavedSendYN(vo);
	}

	@Override
	public LetterVO oneSelect(LetterVO vo) {
		return map.oneSelect(vo);
	}

	@Override
	public int updateAdminYN(LetterVO vo) {
		return map.updateAdminYN(vo);
	}

	@Override
	public int cntLetterCheck(LetterVO vo) {
		return map.cntLetterCheck(vo);
	}

	@Override
	public int deleteSaveLetter(LetterVO vo) {
		return map.deleteSaveLetter(vo);
	}

	@Override
	public UsersVO letterDistance(UsersVO vo) {
		return map.letterDistance(vo);
	}

	@Override
	public int letterTodayHistory(LetterVO vo) {
		return map.letterTodayHistory(vo);
	}

	@Override
	public int letterHistoryCheck(LetterVO vo) {
		return map.letterTodayHistory(vo);
	}


}
