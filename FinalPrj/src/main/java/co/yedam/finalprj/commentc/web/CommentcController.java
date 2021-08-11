package co.yedam.finalprj.commentc.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.commentc.service.CommentcService;
import co.yedam.finalprj.commentc.vo.CommentcVO;

@Controller
public class CommentcController {
	@Autowired CommentcService commentcDao;
	
	@RequestMapping("commentcInsert.do")
	@ResponseBody
	public int commentcInsert(CommentcVO vo) {
		System.out.println(vo);
		int n = commentcDao.commentcInsert(vo);
		if(n == 0) {
			n = 0;
		}
		return n;
	}

	@RequestMapping("commentcDelete.do")
	@ResponseBody
	public int commentcDelete(CommentcVO vo) {
		System.out.println(vo);
		int n = commentcDao.commentcDelete(vo);
		if(n == 0) {
			n = 0;
		}
		return n;
	}
	
	
}
