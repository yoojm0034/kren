package co.yedam.finalprj.stamp.web;

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

import co.yedam.finalprj.stamp.service.StampService;
import co.yedam.finalprj.stamp.vo.StampVO;
import lombok.Data;
@Data
class StampData {
	List<StampVO> createdRows;
	List<StampVO> updatedRows;
	List<StampVO> deletedRows;
}
@Controller
public class StampController {
	@Autowired
	StampService stampDao;
	
	@RequestMapping("stampList.do")
	public String stampList() {
		return "admin/stampList";
	}
	
	//관리자 
	//우표상품목록
	@RequestMapping("adminStampList.do")
	@ResponseBody
	public Map<String, Object> adminStampList(StampVO vo){
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", stampDao.stampSelectList());
		data.put("data", datas);
		return data;
	}
	//관리자
	//우표상품업데이트
	@PutMapping("adminStampUpdate.do")
	@ResponseBody
	public Map<String, Object> adminStampUpdate(@RequestBody StampData stampData) {
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(stampData);
		for(int i=0; i < stampData.updatedRows.size(); i++) {
			stampDao.stampUpdate(stampData.updatedRows.get(i));
		}
		data.put("result", true);
		data.put("data", stampData.updatedRows);
		return data;
	}
	//관리자
	//우표상품추가
	@PostMapping("adminStampInsert.do")
	@ResponseBody
	public Map<String, Object> adminStampInsert(@RequestBody StampData stampData) {
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(stampData);
		for(int i=0; i < stampData.createdRows.size(); i++) {
			stampDao.stampInsert(stampData.createdRows.get(i));
		}
		data.put("result", true);
		data.put("data", stampData.createdRows);
		return data;
	}
	//관리자
	//우표상품삭제
	@RequestMapping("adminStampDelete.do")
	@ResponseBody
	public Map<String, Object> adminStampDelete(@RequestBody StampData stampData) {
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(stampData);
			for(int i=0; i < stampData.deletedRows.size(); i++) {
				stampDao.stampDelete(stampData.deletedRows.get(i));
			}
			data.put("result", true);
			data.put("data", stampData.deletedRows);
			return data;
		}
			
}
