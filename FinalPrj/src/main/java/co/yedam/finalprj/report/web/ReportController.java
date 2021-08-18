package co.yedam.finalprj.report.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.block.service.BlockService;
import co.yedam.finalprj.block.vo.BlockVO;
import co.yedam.finalprj.commentDetail.service.CommentDetailService;
import co.yedam.finalprj.commentDetail.vo.CommentDetailVO;
import co.yedam.finalprj.commentc.service.CommentcService;
import co.yedam.finalprj.commentc.vo.CommentcVO;
import co.yedam.finalprj.comments.service.CommentsService;
import co.yedam.finalprj.comments.vo.CommentsVO;
import co.yedam.finalprj.feed.service.FeedService;
import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.letter.service.LetterService;
import co.yedam.finalprj.letter.vo.LetterVO;
import co.yedam.finalprj.report.service.ReportService;
import co.yedam.finalprj.report.vo.ReportVO;
import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;

@Controller
public class ReportController {
   @Autowired ReportService reportDao; 
   @Autowired FeedService feedDao;
   @Autowired LetterService letterDao;
   @Autowired CommentsService commentDao; 
   @Autowired UsersService usersDao;
   @Autowired BlockService blockDao;
   @Autowired CommentcService commentcDao;
   @Autowired CommentDetailService commentDetailDao;
   
   //신고여부 확인
   @RequestMapping("reportUserCheck.do")
   @ResponseBody
   public int reportUserCheck(ReportVO vo) {
	   int n = reportDao.reportUserCheck(vo);
	   if(n == 0) {
		   n = 0;
	   }
	   return n;
   }
   
   
   //신고리스트
   @RequestMapping("admin/userReportList.do")
   public String reportList(ReportVO vo, Model model) {
	  //content가 삭제되었다면 불러올때부터 update가 실행되도록.
	   if(reportDao.reportContentDeleteRead() != 0) {
		   reportDao.reportContentDeleteRead();		   
	   }
      model.addAttribute("reportList", reportDao.reportSelectList());
      
      return "admin/reportList";
   }
   //신고입력
   @RequestMapping("reportInsert.do")
   @ResponseBody
   public int reportInsert(@RequestBody ReportVO vo, UsersVO uvo, BlockVO bvo) {
	   int n = 0;
	   if(vo.getBlocked()!=null) {
		   n = reportDao.reportInsert(vo);
		   //차단처리필요
		   bvo.setUser_id(vo.getUser_id());
		   bvo.setBlocked(vo.getReported());
		   int j = blockDao.blockInsert(bvo);
		   System.out.println(j + "건 입력 및 "+vo.getReported()+"유저 차단");
		   //신고후에 유저정보에 신고횟수 누적되어야함.
		   uvo.setUser_id(vo.getReported());
		   int k = usersDao.reportUpdatePlus(uvo);
		   System.out.println(k + "건 입력");
	   }else {
		   n = reportDao.reportInsert(vo);
		   uvo.setUser_id(vo.getReported());
		   int k = usersDao.reportUpdatePlus(uvo);
		   System.out.println(k + "건 입력");
	   }
	   
      return n;
   }

   //신고리스트에서 해당 게시물번호 클릭시 팝업창으로 가지고갈 정보
   @RequestMapping("admin/reportAdmin.do")
   public String reportAdmin(@RequestParam("data") String str, Model model, LetterVO vo, FeedVO fvo, CommentsVO cvo, CommentcVO ccvo) {
	   String path = "";
	   if(str.contains("feed")) {
		   //피드자체정보 
		   fvo.setFeed_id(str);
		   model.addAttribute("content", feedDao.oneSelectFeed(fvo));
		   path = "empty/reportAdmin";
	   }else if(str.contains("letter")) {
		   vo.setLetter_id(str);
		   model.addAttribute("content", letterDao.oneSelect(vo));
		   path = "empty/reportAdmin2";
	   }else if(str.contains("comment")) {
		   cvo.setComment_id(str);
		   model.addAttribute("content", commentDao.commentSelect(cvo));
		   path = "empty/reportAdmin3";
	   }else if(str.startsWith("cc_")) {
		   ccvo.setCc_id(str);
		   model.addAttribute("content", commentcDao.oneSelect(ccvo));
		   path = "empty/reportCcid";
	   }
	   
	   return path;
   }
   //팝업창에서 게시물삭제했을시 실행되는 컨트롤러
   @RequestMapping("admin/delContent.do")
   @ResponseBody
   public int delContent(HttpServletRequest req,LetterVO vo, FeedVO fvo, ReportVO rvo, CommentsVO cvo, CommentcVO ccvo, CommentDetailVO cdvo) {
	   String content = req.getParameter("content");
	   int r = 0;
	   if(content.contains("feed")) {
			/*
			 * 신고리스트에서 피드읽고, 피드에대한 댓글도 읽음처리되야된다. 넘어오는feed_id로 댓글번호를 검색한다. 읽음처리를 먼저해주고 피드삭제
			 */
		   System.out.println(rvo.getContent());
		   int k = reportDao.reportAllUpdate(rvo);
		   System.out.println(k + "건 읽음처리");
		   
		   //프로시저를 통해 한번에 피드삭제, 댓글삭제
		   fvo.setFeed_id(content);
		   r = feedDao.feedDelete(fvo);
		   System.out.println(r + "건 삭제처리");
		   
	   }else if(content.contains("letter")) {
		   vo.setLetter_id(content);
		   r = letterDao.updateAdminYN(vo);
		   System.out.println(r + "건 삭제처리");
		   //신고들어온 게시물 삭제 처리 후 그 게시물에 관한 신고 읽음으로 처리.
		   rvo.setContent(content);
		   int k = reportDao.reportUpdate(rvo);
		   System.out.println(k + "건 읽음처리");
	   }else if(content.contains("comment")) {
		   cvo.setComment_id(content);
		   r = commentDao.commentDelete(cvo);
		   System.out.println(r + "건 삭제처리");
		   //신고들어온 게시물 삭제 처리 후 그 게시물에 관한 신고 읽음으로 처리.
		   rvo.setContent(content);
		   int k = reportDao.reportUpdate(rvo);
		   System.out.println(k + "건 읽음처리");
	   }else if(content.contains("cc_")) {
		   //교정테이블에서 삭제
		   ccvo.setCc_id(content);
		   r = commentcDao.commentcDelete(ccvo);
		   System.out.println("교정댓글테이블"+ r + "건 삭제처리");
		   //교정상세테이블에서도 삭제
		   cdvo.setCc_id(content);
		   int j = commentDetailDao.deleteCommentDetail(cdvo);
		   System.out.println("교정댓글상세테이블" + j + "건 삭제처리");
		   //신고들어온 게시물 삭제 처리 후 그 게시물에 관한 신고 읽음으로 처리.
		   rvo.setContent(content);
		   int k = reportDao.reportUpdate(rvo);
		   System.out.println(k + "건 읽음처리");
	   }
	  
	   return r;
   }
   //신고가 들어왔지만 이상없을경우 읽음처리
   @RequestMapping("admin/readContent.do")
   @ResponseBody
   public int readContent(HttpServletRequest req,LetterVO vo, FeedVO fvo, ReportVO rvo, CommentsVO cvo, UsersVO uvo, CommentcVO ccvo) {
	   String content = req.getParameter("content");
	   String id = req.getParameter("user_id");
	   rvo.setContent(content);
	   int r = reportDao.reportUpdate(rvo);
	   System.out.println(r + "건 읽음");
	   //읽음처리하면 유저 신고카운트 1개 차감
	   uvo.setUser_id(id);
	   uvo.setCnt(r);
	   int k = usersDao.reportUpdateMinus(uvo);
	   System.out.println(k + "건 수정");
	   return r;
   }
   
}