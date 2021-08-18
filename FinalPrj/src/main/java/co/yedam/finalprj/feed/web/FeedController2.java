package co.yedam.finalprj.feed.web;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.finalprj.commentDetail.service.CommentDetailService;
import co.yedam.finalprj.comments.service.CommentsService;
import co.yedam.finalprj.feed.service.FeedService;
import co.yedam.finalprj.feed.service.LanguageService;
import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.letter.service.TransService;
import co.yedam.finalprj.likes.service.LikesService;
import co.yedam.finalprj.notice.service.NoticeService;
import co.yedam.finalprj.stamph.service.StamphService;
import co.yedam.finalprj.stamph.vo.StamphVO;
import co.yedam.finalprj.tag.service.TagService;
import co.yedam.finalprj.topic.service.TopicService;
import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;

@Controller
public class FeedController2 {
	@Autowired UsersService userDao;
	@Autowired FeedService feedDao;
	@Autowired NoticeService noticeDao;
	@Autowired TagService tagDao;
	@Autowired TransService transDao;
	@Autowired LanguageService lanDao;
	@Autowired TopicService topicDao;
	@Autowired CommentsService CommentDao;
	@Autowired CommentDetailService commentDetailDao;
	@Autowired StamphService stamphDao;
	@RequestMapping("feed2.do")
	public String feed(FeedVO vo, Model model, HttpServletRequest request, Authentication auth) {

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
		fvo.setUser_id(id);

		model.addAttribute("sameTopic",feedDao.sameTopicList(uvo));		
		model.addAttribute("likeTag",tagDao.likeTag());				
		model.addAttribute("noticeList", noticeDao.noticeSelectList());	
		model.addAttribute("birthUser",feedDao.birthUser(uvo));			
		model.addAttribute("feedList",feedDao.feedSelectList(vo));
		
		//댓글
		model.addAttribute("commentList",CommentDao.commentSelectList());
		model.addAttribute("cdList",commentDetailDao.CommentDetailList());
		model.addAttribute("likeUsers",feedDao.feedLikeUser());
		//출석여부
		StamphVO sh = new StamphVO();
		sh.setUser_id(id);
		model.addAttribute("loginStamp",stamphDao.stamphLoginCheck(sh));
		return "feed/mainFeed2";
	} 
	
}