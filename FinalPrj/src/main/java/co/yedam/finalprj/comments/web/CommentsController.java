package co.yedam.finalprj.comments.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.comments.service.CommentsService;
import co.yedam.finalprj.comments.vo.CommentsVO;

@Controller
public class CommentsController {
	@Autowired CommentsService CommentDao;
	
	@RequestMapping("commentInsert.do")
	@ResponseBody
	public int commentInsert(@RequestBody CommentsVO vo) {
		System.out.println(vo);
		int n = CommentDao.commentInsert(vo);
		return n;
	}
}
