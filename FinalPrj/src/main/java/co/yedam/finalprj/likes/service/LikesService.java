package co.yedam.finalprj.likes.service;

import java.util.List;

import co.yedam.finalprj.likes.vo.LikesVO;

public interface LikesService {
	List<LikesVO> likeSelectList(LikesVO vo);
	int likeChk(LikesVO vo);
	int likeInsert(LikesVO vo);
	int likeDelete(LikesVO vo);
}
