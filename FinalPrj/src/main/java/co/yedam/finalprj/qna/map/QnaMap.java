package co.yedam.finalprj.qna.map;

import java.util.List;

import co.yedam.finalprj.qna.vo.QnaVO;

public interface QnaMap {
	List<QnaVO> qnaSelectList();
	QnaVO qnaSelect(QnaVO vo);
	int qnaInsert(QnaVO vo);
	int qnaUpdate(QnaVO vo);
	int qnaDelete(QnaVO vo);
}
