package co.yedam.finalprj.report.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.comments.service.CommentsService;
import co.yedam.finalprj.comments.vo.CommentsVO;
import co.yedam.finalprj.feed.service.FeedService;
import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.letter.service.LetterService;
import co.yedam.finalprj.letter.vo.LetterVO;
import co.yedam.finalprj.report.service.ReportService;
import co.yedam.finalprj.report.vo.ReportVO;

@Controller
public class ReportController {
   
   @Autowired
   ReportService reportDao; 
   
   @Autowired
   FeedService feedDao;
   
   @Autowired
   LetterService letterDao;
   
   @Autowired
   CommentsService commentDao; 
   
   //신고리스트
   @RequestMapping("admin/userReportList.do")
   public String reportList(ReportVO vo, Model model) {
      model.addAttribute("reportList", reportDao.reportSelectList());
      return "admin/reportList";
   }
   //신고입력
   @RequestMapping("reportInsert.do")
   @ResponseBody
   public int reportInsert(@RequestBody ReportVO vo) {
	   int n = reportDao.reportInsert(vo);
	   if(n!=0 && vo.getBlocked()!=null) {
		   //차단처리필요
		   System.out.println(vo.getBlocked());
	   }
	   //신고후에 유저정보에 신고횟수 누적되어야함.
      return n;
   }
   //신고리스트에서 해당 게시물번호 클릭시 팝업창으로 가지고갈 정보
   @RequestMapping("admin/reportAdmin.do")
   public String reportAdmin(HttpServletRequest req, Model model, LetterVO vo, FeedVO fvo, CommentsVO cvo) {
	   String content = req.getParameter("data");
	   String path = "";
	   if(content.contains("feed")) {
		   //피드자체정보 
		   fvo.setFeed_id(content);
		   //model.addAttribute("content", 피드한건조회)
		   path = "empty/reportAdmin";
	   }else if(content.contains("letter")) {
		   vo.setLetter_id(content);
		   model.addAttribute("content", letterDao.oneSelect(vo));
		   path = "empty/reportAdmin2";
	   }else if(content.contains("comment")) {
		   cvo.setComment_id(content);
		   model.addAttribute("content", commentDao.commentSelect(cvo));
		   path = "empty/reportAdmin3";
	   }
	   
	   return path;
   }
   //팝업창에서 게시물삭제했을시 실행되는 컨트롤러
   @RequestMapping("admin/delContent.do")
   @ResponseBody
   public int delContent(HttpServletRequest req,LetterVO vo, FeedVO fvo, ReportVO rvo, CommentsVO cvo) {
	   String content = req.getParameter("content");
	   int r = 0;
	   if(content.contains("feed")) {
		   //프로시저를 통해 한번에 피드삭제, 댓글삭제
		   fvo.setFeed_id(content);
		   r = feedDao.feedDelete(fvo);
		   System.out.println(r + "건 삭제처리");
		   //신고리스트에서 피드읽고, 피드에대한 댓글도 읽음처리되야된다.
		   //--넘어오는feed_id로 댓글번호를 검색한다.
		   int k = reportDao.reportAllUpdate(rvo);
		   System.out.println(k + "건 읽음처리");
	   }else if(content.contains("letter")) {
		   vo.setLetter_id(content);
		   //r = letterDao. 삭제처리
		   System.out.println(0 + "건 삭제처리");
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
	   }
	  
	   return r;
   }
   
   
}