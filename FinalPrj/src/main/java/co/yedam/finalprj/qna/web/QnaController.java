package co.yedam.finalprj.qna.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.finalprj.qna.service.QnaService;
import co.yedam.finalprj.qna.vo.QnaVO;
import lombok.Data;
@Data
class QnaData {
	List<QnaVO> createdRows;
	List<QnaVO> updatedRows;
}
@Controller
public class QnaController {
	@Autowired
	QnaService qnaDao;
	//문의목록리스트
	@RequestMapping("admin/userQnaList.do")
	public String qnaList(QnaVO vo , Model model) {
		model.addAttribute("qnaList", qnaDao.qnaSelectList());
		return "admin/qnaList";
	}
	//답변메일작성폼
	@RequestMapping("admin/mailForm.do")
	public String mailForm(QnaVO vo, Model model) {
		model.addAttribute("qna", qnaDao.qnaSelect(vo));
		return "admin/mailForm";
	}
	
}
