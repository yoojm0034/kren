package co.yedam.finalprj.commentDetail.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.commentDetail.service.CommentDetailService;
import co.yedam.finalprj.commentDetail.vo.CommentDetailVO;

@Controller
public class CommentDetailController {
	@Autowired CommentDetailService commentDetailDao;
	
	@RequestMapping("insertCommentDetail.do")
	@ResponseBody
	public int insertCommentDetail(@RequestBody CommentDetailVO vo) {
		int r = 0;
		System.out.println(vo);
		String[] line = vo.getLine().split(",");
		String[] origin = vo.getOrigin().split(".,");
		String[] content = vo.getContent().split(".,");
		 
		Map<String, Object> staffMap;
		    
		List<Map<String, Object>> staffList = new ArrayList<Map<String, Object>>();
	    for(int i=0; i<line.length; i++) {
	    	r = i;
	    	staffMap = new HashMap<String, Object>();
	    	staffMap.put("line", Integer.parseInt(line[i])+1);
	    	staffMap.put("origin", origin[i]);
	    	staffMap.put("content", content[i]);
	    	
	    	staffList.add(staffMap);
	    }
	    
	 // 넘어오는 값 확인
	    for(int i=0; i<line.length; i++) {
	    	if(content[i] != null) {
	    		System.out.println(line[i]);
	    		System.out.println(origin[i]);
	    		System.out.println(content[i]);	    		
	    	}
	    }
	    
	    r = commentDetailDao.insertCommentDetail(staffList);
	    if(r == 0) {
	    	r=0;
	    }
		return r;
	}
	
}
