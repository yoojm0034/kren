package co.yedam.finalprj.tag.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("admin/userTagList.do")
	public String tagList() {
		
		return "admin/tagList";
	}
	
	//관리자 
	//태그목록
	@RequestMapping("admin/tagList.do")
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
	//태그추가
	@PostMapping("admin/tagInsert.do")
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
	@RequestMapping("admin/tagDelete.do")
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
	
	//피드
	//태그자동완성
	@RequestMapping("autocpl.do")
	@ResponseBody
	public List<TagVO> TagAutocplList(@RequestParam Map<String, Object> params, HttpServletRequest request){
	    List<TagVO> result = new ArrayList<TagVO>();        
	    result = tagDao.tagSelectList();
	    return result;
	}


	
	
}
