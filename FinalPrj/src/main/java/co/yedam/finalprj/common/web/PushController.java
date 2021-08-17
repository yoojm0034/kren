package co.yedam.finalprj.common.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.commentc.vo.CommentcVO;
import co.yedam.finalprj.comments.vo.CommentsVO;
import co.yedam.finalprj.common.service.SearchService;
import co.yedam.finalprj.common.service.VisitCountService;
import co.yedam.finalprj.common.vo.SearchVO;
import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.notice.vo.NoticeVO;
import co.yedam.finalprj.push.service.PushService;
import co.yedam.finalprj.push.vo.PushVO;
import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;

@Controller
public class PushController {
	@Autowired
	PushService pushDao;
	@Autowired
	SearchService searchDao;
	@Autowired
	VisitCountService visitDao;
	@Autowired
	UsersService usersDao;

	@RequestMapping("pushSelectList.do")
	@ResponseBody
	public List<PushVO> pushSelectList(UsersVO vo, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		vo.setUser_id(id);

		return pushDao.pushSelectList(vo);
	}

	@RequestMapping("pushUpdate.do")
	@ResponseBody
	public int pushUpdate(PushVO vo) {
		System.out.println(vo.getPush_id());
		int r = pushDao.updatePush(vo);
		System.out.println(r + "건 입력");
		return r;
	}

	@RequestMapping("deletePushAll.do")
	@ResponseBody
	public int deletePush(Authentication auth, PushVO vo) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		vo.setTo_id(id);
		int r = pushDao.deletePush(vo);
		return r;
	}

	@RequestMapping("deleteLetterPushAll.do")
	@ResponseBody
	public int deleteLetterPush(Authentication auth, PushVO vo) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		vo.setTo_id(id);
		int r = pushDao.deleteLetterPush(vo);
		return r;
	}

	@RequestMapping("allSearch.do")
	public String allSearch(SearchVO vo, UsersVO uvo, FeedVO fvo, NoticeVO nvo, CommentcVO cvo, CommentsVO svo,
			Model model) {

		model.addAttribute("members", searchDao.allSearchUser(vo));
		model.addAttribute("feeds", searchDao.allSearchFeed(vo));
		model.addAttribute("notices", searchDao.allSearchNotice(vo));
		model.addAttribute("commentsList", searchDao.allSearchComments(vo));
		model.addAttribute("commentcList", searchDao.allSearchCommentc(vo));

		return "common/searchResult";
	}

	@RequestMapping("getChartData.do")
	@ResponseBody
	public List<Map<String, Object>> getChartData(HttpServletRequest req) {
		String data = req.getParameter("data");
		if(data.equals("1")) {
			return visitDao.weekCount();
		}else if(data.equals("3")) {
			return visitDao.yearCount();
		}else if(data.contains("2021")) {
			return visitDao.monthCount(data);
		}else if(data.equals("4")) {
			return visitDao.getPayment();
		}else {
			return visitDao.dayCount();
		}
	}
	@RequestMapping("admin/userdata.do")
	@ResponseBody
	public UsersVO userdata(HttpServletRequest req,UsersVO uvo) {
		String id = req.getParameter("data");
		uvo.setUser_id(id);
		
		return usersDao.usersSelect(uvo);
	}
	
}
