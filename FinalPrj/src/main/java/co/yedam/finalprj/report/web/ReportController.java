package co.yedam.finalprj.report.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
   
   @RequestMapping("admin/userReportList.do")
   public String reportList(ReportVO vo, Model model) {
      model.addAttribute("reportList", reportDao.reportSelectList());
      return "admin/reportList";
   }
   
   @RequestMapping("reportInsert.do")
   @ResponseBody
   public int reportInsert(@RequestBody ReportVO vo) {
	   int n = reportDao.reportInsert(vo);
	   if(n!=0 && vo.getBlocked()!=null) {
		   //차단처리필요
		   System.out.println(vo.getBlocked());
	   }
      return n;
   }
   
   @RequestMapping("admin/reportAdmin.do")
   public String reportAdmin(HttpServletRequest req, Model model, LetterVO vo, FeedVO fvo) {
	   String content = req.getParameter("data");
	   String path = "";
	   if(content.contains("feed")) {
		   //피드자체정보 + 피드와 연관된 댓글정보도 가져와야된다.
		   fvo.setFeed_id(content);
		   //model.addAttribute("content", 피드한건조회)
		   //model.addAttribute("comment", 피드에대한댓글조회)
		   path = "empty/reportAdmin";
	   }else if(content.contains("letter")) {
		   vo.setLetter_id(content);
		   model.addAttribute("content", letterDao.oneSelect(vo));
		   path = "empty/reportAdmin2";
	   }
	   
	   return path;
   }
   
   @RequestMapping("admin/delContent.do")
   @ResponseBody
   public int delContent(HttpServletRequest req,LetterVO vo, FeedVO fvo, ReportVO rvo) {
	   String content = req.getParameter("content");
	   int r = 0;
	   if(content.contains("feed")) {
		   
	   }else if(content.contains("letter")) {
		   vo.setLetter_id(content);
		   //r = letterDao. 삭제처리
		   System.out.println(0 + "건 삭제처리");
		   //신고들어온 게시물 삭제 처리 후 그 게시물에 관한 신고 읽음으로 처리.
		   rvo.setContent(content);
		   int k = reportDao.reportUpdate(rvo);
		   System.out.println(k + "건 읽음처리");
	   }
	  
	   return r;
   }
   
   
}