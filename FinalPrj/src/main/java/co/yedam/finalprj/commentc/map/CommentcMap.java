package co.yedam.finalprj.commentc.map;

import java.util.List;

import co.yedam.finalprj.commentc.vo.CommentcVO;

public interface CommentcMap {
	List<CommentcVO> commentcList();
	CommentcVO commentcSelect(CommentcVO vo);
	List<CommentcVO> oneSelect(CommentcVO vo);
	int commentcInsert(CommentcVO vo);
	int commentcDelete(CommentcVO vo);

}
