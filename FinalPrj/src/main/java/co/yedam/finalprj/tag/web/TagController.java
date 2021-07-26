package co.yedam.finalprj.tag.web;

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

import co.yedam.finalprj.tag.service.TagService;
import co.yedam.finalprj.tag.vo.TagVO;
import lombok.Data;
@Data
class TagData {
	List<TagVO> createdRows;
	List<TagVO> updatedRows;
	List<TagVO> deletedRows;
}
@Controller
public class TagController {
	@Autowired
	TagService tagDao;
	
	@RequestMapping("tagList.do")
	public String tagList() {
		
		return "admin/tagList";
	}
	
	//관리자 
	//태그목록
	@RequestMapping("adminTagList.do")
	@ResponseBody
	public Map<String, Object> adminTagList(TagVO vo){
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", tagDao.tagSelectList());
		data.put("data", datas);
		return data;
	}
	//관리자
	//태그업데이트
	@PutMapping("adminTagUpdate.do")
	@ResponseBody
	public Map<String, Object> adminTagUpdate(@RequestBody TagData tagData) {
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(tagData);
		for(int i=0; i < tagData.updatedRows.size(); i++) {
			tagDao.tagUpdate(tagData.updatedRows.get(i));
		}
		data.put("result", true);
		data.put("data", tagData.updatedRows);
		return data;
	}
	//관리자
	//태그추가
	@PostMapping("adminTagInsert.do")
	@ResponseBody
	public Map<String, Object> adminTagInsert(@RequestBody TagData tagData) {
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(tagData);
		for(int i=0; i < tagData.createdRows.size(); i++) {
			tagDao.tagInsert(tagData.createdRows.get(i));
		}
		data.put("result", true);
		data.put("data", tagData.createdRows);
		return data;
	}
	//관리자
	//태그삭제
	@RequestMapping("adminTagDelete.do")
	@ResponseBody
	public Map<String, Object> adminTagDelete(@RequestBody TagData tagData) {
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(tagData);
			for(int i=0; i < tagData.deletedRows.size(); i++) {
				tagDao.tagDelete(tagData.deletedRows.get(i));
			}
			data.put("result", true);
			data.put("data", tagData.deletedRows);
			return data;
		}
	
}
