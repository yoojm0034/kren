package co.yedam.finalprj.likes.map;

import java.util.List;

import co.yedam.finalprj.likes.vo.LikesVO;

public interface LikesMap {
	List<LikesVO> likeSelectList(LikesVO vo);
	int likeChk(LikesVO vo);
	int likeInsert(LikesVO vo);
	int likeDelete(LikesVO vo);
}
