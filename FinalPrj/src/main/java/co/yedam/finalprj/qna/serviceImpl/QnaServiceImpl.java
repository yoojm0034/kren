package co.yedam.finalprj.qna.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.finalprj.qna.map.QnaMap;
import co.yedam.finalprj.qna.service.QnaService;
import co.yedam.finalprj.qna.vo.QnaVO;
@Repository("qnaDao")
public class QnaServiceImpl implements QnaService {
	@Autowired
	QnaMap map;
	
	@Override
	public List<QnaVO> qnaSelectList() {
		// TODO Auto-generated method stub
		return map.qnaSelectList();
	}

	@Override
	public QnaVO qnaSelect(QnaVO vo) {
		// TODO Auto-generated method stub
		return map.qnaSelect(vo);
	}

	@Override
	public int qnaInsert(QnaVO vo) {
		// TODO Auto-generated method stub
		return map.qnaInsert(vo);
	}

	@Override
	public int qnaUpdate(QnaVO vo) {
		// TODO Auto-generated method stub
		return map.qnaUpdate(vo);
	}

	@Override
	public int qnaDelete(QnaVO vo) {
		// TODO Auto-generated method stub
		return map.qnaDelete(vo);
	}

}
