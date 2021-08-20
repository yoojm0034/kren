package co.yedam.finalprj.feed.web;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import co.yedam.finalprj.commentDetail.service.CommentDetailService;
import co.yedam.finalprj.comments.service.CommentsService;
import co.yedam.finalprj.feed.service.FeedService;
import co.yedam.finalprj.feed.service.LanguageService;
import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.letter.service.TransService;
import co.yedam.finalprj.letter.vo.TransVO;
import co.yedam.finalprj.notice.service.NoticeService;
import co.yedam.finalprj.stamph.service.StamphService;
import co.yedam.finalprj.stamph.vo.StamphVO;
import co.yedam.finalprj.tag.service.TagService;
import co.yedam.finalprj.topic.service.TopicService;
import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;

@Controller
public class FeedController {
	
	@Autowired FeedService feedDao;
	@Autowired NoticeService noticeDao;
	@Autowired TagService tagDao;
	@Autowired TransService transDao;
	@Autowired LanguageService lanDao;
	@Autowired UsersService userDao;
	@Autowired TopicService topicDao;
	
	@Autowired CommentsService CommentDao;
	@Autowired CommentDetailService commentDetailDao;
	
	@Autowired StamphService stamphDao;
	
	//메인피드
	@RequestMapping("feed.do")
	public String feedList(FeedVO vo, Model model, HttpServletRequest request, Authentication auth) {

		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		
		UsersVO uvo = new UsersVO();
		FriendsVO fvo = new FriendsVO();
		
		vo.setUser_id(id);
		
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("feedList", feedDao.feedSelectList(vo));
		String feedId = null;

		uvo.setUser_id(id);
		uvo = userDao.usersSelect(uvo);		
		uvo.setTopic(uvo.getTopic());


		model.addAttribute("sameTopic",feedDao.sameTopicList(uvo));		
		model.addAttribute("likeTag",tagDao.likeTag());				
		model.addAttribute("noticeList", noticeDao.noticeSelectList());	
		model.addAttribute("birthUser",feedDao.birthUser(uvo));			
		model.addAttribute("feedList",feedDao.feedSelectList(vo));
	
		//댓글
		model.addAttribute("commentList",CommentDao.commentSelectList());
		model.addAttribute("cdList",commentDetailDao.CommentDetailList());
		
		//출석여부
		StamphVO sh = new StamphVO();
		sh.setUser_id(id);
		model.addAttribute("loginStamp",stamphDao.stamphLoginCheck(sh));
		return "feed/mainFeed";
	}
	
	//피드 Div
	@RequestMapping("feedSelect.do")
	public String tagSelect(FeedVO vo, Model model, HttpServletRequest request, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		
		vo.setUser_id(id);
		model.addAttribute("feedList",feedDao.feedSelectList(vo));
		//댓글
		model.addAttribute("commentList",CommentDao.commentSelectList());
		model.addAttribute("cdList",commentDetailDao.CommentDetailList());
		
		//출석여부
		StamphVO sh = new StamphVO();
		sh.setUser_id(id);
		model.addAttribute("loginStamp",stamphDao.stamphLoginCheck(sh));
		return "no/feed/post";
	}
	
	//피드등록,수정 
		@RequestMapping("feedInsert.do")
		public String feedInsert(FeedVO vo, Model model, HttpServletRequest request, Authentication auth) throws IllegalStateException, IOException{
			User user = (User) auth.getPrincipal();
			String id = (String) user.getUsername();
			String feedId = request.getParameter("feedid");
			String updateChk = request.getParameter("photoChk");
			MultipartFile file = vo.getFile();	
			
			vo.setWrite_lan(vo.getContent());
			String findLan= lanDao.transLan(vo);// 서비스에서 일을 진행 할 예정
			findLan= findLan.substring(13, 15);

		    vo.setWrite_lan(findLan);
		    vo.setUser_id(id);

			if(feedId.equals("")) {
				
				if(!file.isEmpty()) {
					String fileName = file.getOriginalFilename();
					String ext = null;

					int fileSize = (int) file.getSize();
					int dot = fileName.lastIndexOf(".");
					
					if(dot != -1) {
						ext = fileName.substring(dot);
					}else {
						ext = "";
					}

					UUID uuid = UUID.randomUUID();
					String fileUUID = uuid.toString() + ext;
					String path = request.getServletContext().getRealPath("/resources/upload/");
					
					vo.setOriginal_name(fileName);
					vo.setFile_size(fileSize);
					vo.setDirectory(path);
					vo.setUuid(fileUUID);
					file.transferTo(new File(path, fileUUID));
					
					feedDao.feedInsert(vo);
				}else {
					  feedDao.feedInsert(vo);
				}
				
			}else {
				
				String feedid = request.getParameter("feedid");
				String photo = request.getParameter("photo");
				vo.setFeed_id(feedid);
				
				if(!file.isEmpty()) {
					String fileName = file.getOriginalFilename();		
					String ext = null;
					int fileSize = (int) file.getSize();
					int dot = fileName.lastIndexOf(".");
		
					if(dot != -1) {
						ext = fileName.substring(dot);
					}else {
						ext = "";
					}
					
					UUID uuid = UUID.randomUUID();
					String fileUUID = uuid.toString() + ext;
					String path = request.getServletContext().getRealPath("/resources/upload/");
			
					vo.setFile_size(fileSize);
					vo.setDirectory(path);
					vo.setUuid(fileUUID);
					vo.setOriginal_name(fileName);
					
					file.transferTo(new File(path, fileUUID));
					feedDao.feedUpdate(vo);
					 
				}else {
					
					if(updateChk.equals("")) {
						vo.setPhoto(photo);
						feedDao.feedUpdate(vo);		
					}else {
						vo.setPhoto(null);
						feedDao.feedUpdate(vo);
					}
				}
			}
			String referer = request.getHeader("Referer"); // 헤더에서 이전 페이지를 읽는다.
			return "redirect:"+ referer; // 이전 페이지로 리다이렉트
		}
	//피드삭제
	@RequestMapping("feedDelete.do")
	public String feedDelete(FeedVO vo, Model model) {
		feedDao.feedDelete(vo);
		return "redirect:feed.do";
	}
	
	//피드번역 
	@RequestMapping(value="transContent.do", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String transContent(@RequestParam(value = "korean", defaultValue = "-")String text,
						Model model,FeedVO vo ) {	
		String result = vo.getWrite_lan();
	    System.out.println(result);
	    System.out.println(text);
		TransVO tvo = new TransVO();
	    if(result.equals("ko")) {
	    	tvo.setKr(text);
	    	result = transDao.getEn(tvo);
	    }else{
	    	tvo.setEn(text);
	    	result = transDao.getKr(tvo);
	    }
	    return result;
	}
	
}