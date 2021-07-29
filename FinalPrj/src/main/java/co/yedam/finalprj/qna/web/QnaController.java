package co.yedam.finalprj.qna.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.qna.service.QnaService;
import co.yedam.finalprj.qna.vo.QnaVO;
import co.yedam.finalprj.topic.vo.TopicVO;
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
	
	@RequestMapping("admin/userQnaList.do")
	public String qnaList() {
		return "admin/qnaList";
	}
	//관리자 
	//문의사항목록
	@RequestMapping("admin/qnaList.do")
	@ResponseBody
	public Map<String, Object> adminQnaList(QnaVO vo){
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", qnaDao.qnaSelectList());
		data.put("data", datas);
		return data;
	}
	//관리자
	//문의사항업데이트
	@PutMapping("admin/qnaUpdate.do")
	@ResponseBody
	public Map<String, Object> adminQnaUpdate(@RequestBody QnaData qnaData) {
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(qnaData);
		for(int i=0; i < qnaData.updatedRows.size(); i++) {
			qnaDao.qnaUpdate(qnaData.updatedRows.get(i));
		}
		data.put("result", true);
		data.put("data", qnaData.updatedRows);
		return data;
	}
	
}
