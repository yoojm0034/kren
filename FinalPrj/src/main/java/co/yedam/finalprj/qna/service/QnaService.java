package co.yedam.finalprj.qna.service;

import java.util.List;

import co.yedam.finalprj.qna.vo.QnaVO;

public interface QnaService {
	List<QnaVO> qnaSelectList();
	QnaVO qnaSelect(QnaVO vo);
	int qnaInsert(QnaVO vo);
	int qnaUpdate(QnaVO vo);
	int qnaDelete(QnaVO vo);
}
