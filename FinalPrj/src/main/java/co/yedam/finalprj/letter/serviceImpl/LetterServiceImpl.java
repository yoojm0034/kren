package co.yedam.finalprj.letter.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.finalprj.letter.map.LetterMap;
import co.yedam.finalprj.letter.service.LetterService;
import co.yedam.finalprj.letter.vo.LetterVO;

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


}
