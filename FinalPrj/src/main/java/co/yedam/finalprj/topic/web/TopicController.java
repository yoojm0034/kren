package co.yedam.finalprj.topic.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.topic.service.TopicService;
import co.yedam.finalprj.topic.vo.TopicVO;
import lombok.Data;

@Data
class TopicData {
	List<TopicVO> createdRows;
	List<TopicVO> updatedRows;
	List<TopicVO> deletedRows;
}
@Controller
public class TopicController {
	@Autowired
	TopicService topicDao;
	
	@RequestMapping("admin/userTopicList.do")
	public String topicList() {
		
		return "admin/topicList";
	}
	
	//관리자 
	//관심사목록
	@RequestMapping("admin/topicList.do")
	@ResponseBody
	public Map<String, Object> adminTopicList(TopicVO vo){
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", topicDao.topicSelectList());
		data.put("data", datas);
		return data;
	}
	//관리자
	//관심사업데이트
	@PutMapping("admin/topicUpdate.do")
	@ResponseBody
	public Map<String, Object> adminTopicUpdate(@RequestBody TopicData topicData) {
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(topicData);
		for(int i=0; i < topicData.updatedRows.size(); i++) {
			topicDao.topicUpdate(topicData.updatedRows.get(i));
		}
		data.put("result", true);
		data.put("data", topicData.updatedRows);
		return data;
	}
	//관리자
	//관심사추가
	@PostMapping("admin/topicInsert.do")
	@ResponseBody
	public Map<String, Object> adminTopicInsert(@RequestBody TopicData topicData) {
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(topicData);
		for(int i=0; i < topicData.createdRows.size(); i++) {
			topicDao.topicInsert(topicData.createdRows.get(i));
		}
		data.put("result", true);
		data.put("data", topicData.createdRows);
		return data;
	}
	//관리자
	//관심사삭제
	@RequestMapping("admin/topicDelete.do")
	@ResponseBody
	public Map<String, Object> adminTopicDelete(@RequestBody TopicData topicData) {
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(topicData);
			for(int i=0; i < topicData.deletedRows.size(); i++) {
				topicDao.topicDelete(topicData.deletedRows.get(i));
			}
			data.put("result", true);
			data.put("data", topicData.deletedRows);
			return data;
		}
	
}
