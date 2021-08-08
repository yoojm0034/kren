package co.yedam.finalprj.likes.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.finalprj.likes.map.LikesMap;
import co.yedam.finalprj.likes.service.LikesService;
import co.yedam.finalprj.likes.vo.LikesVO;

@Repository("likeDao")
public class LikesServiceImpl implements LikesService {
	@Autowired
	LikesMap map;
	
	@Override
	public int likeChk(LikesVO vo) {
		int cnt = map.likeChk(vo);
		
		if(cnt == 0) {
			map.likeInsert(vo);
		} else {
			map.likeDelete(vo);
		}
		return cnt;
	}

	@Override
	public int likeInsert(LikesVO vo) {
		return map.likeInsert(vo);
	}

	@Override
	public int likeDelete(LikesVO vo) {
		return map.likeDelete(vo);
	}

	@Override
	public List<LikesVO> likeSelectList(LikesVO vo) {
		return map.likeSelectList(vo);
	}

}
