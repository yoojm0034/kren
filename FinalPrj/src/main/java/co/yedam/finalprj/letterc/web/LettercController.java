package co.yedam.finalprj.letterc.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.letter.service.LetterService;
import co.yedam.finalprj.letterc.service.LettercService;
import co.yedam.finalprj.letterc.vo.LettercVO;

@Controller
public class LettercController {
	@Autowired LetterService letterDao;
	@Autowired LettercService lettercDao;
	
	// 교정편지 입력
	@RequestMapping("insertCorLetter.do")
	@ResponseBody
	public int insertCorLetter(Model model, @RequestBody LettercVO vo, HttpServletRequest req) {
		System.out.println(vo);
		String[] line = vo.getLine().split(",");
		String[] origin = vo.getOrigin().split(".,");
		String[] correcting = vo.getCorrecting().split(".,");
		
		 
		Map<String, Object> staffMap;
		    
		List<Map<String, Object>> staffList = new ArrayList<Map<String, Object>>();
	    for(int i=0; i<line.length; i++) {
	    	staffMap = new HashMap<String, Object>();
	    	staffMap.put("line", Integer.parseInt(line[i])+1);
	    	staffMap.put("origin", origin[i]);
	    	staffMap.put("correcting", correcting[i]);
	    	staffMap.put("letter_id", vo.getLetter_id());
	    	
	    	staffList.add(staffMap);
	    }
	    
// 넘어오는 값 확인
//	    for(int i=0; i<line.length; i++) {
//	    	if(correcting[i] != null) {
//	    		System.out.println(line[i]);
//	    		System.out.println(origin[i]);
//	    		System.out.println(correcting[i]);	    		
//	    	}
//	    }
	    
		return lettercDao.insertLetterC(staffList);
	}
	
}
