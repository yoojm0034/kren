package co.yedam.finalprj.comments.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@RequestMapping("commentDelete.do")
	@ResponseBody
	public int commentDelete(@RequestBody CommentsVO vo) {
		System.out.println(vo.getComment_id());
		int n = CommentDao.commentDelete(vo);
		return n;
	}
	
	@RequestMapping("commentCnt.do")
	@ResponseBody
	public int commentCnt(CommentsVO vo) {
		return CommentDao.commentCnt(vo);
	}

//	@RequestMapping("commentInsertData.do")
//	@ResponseBody
//	public CommentsVO commentInsertData(CommentsVO vo) {
//		return CommentDao.commentInsertData(vo);
//	}
	
	// 댓글입력 jsp
	@RequestMapping("commentInsertData.do")
	public String commentInsertData(CommentsVO vo, Model model, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		vo.setUser_id(Sessionid);
	
		model.addAttribute("cmt", CommentDao.commentInsertData(vo));
		System.out.println(CommentDao.commentInsertData(vo));
	return "no/feed/comment";
	}
	
}
