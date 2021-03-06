package co.yedam.finalprj.users.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.yedam.finalprj.commentDetail.service.CommentDetailService;
import co.yedam.finalprj.comments.service.CommentsService;
import co.yedam.finalprj.feed.service.FeedService;
import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.friends.service.FriendsService;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.letter.service.LetterService;
import co.yedam.finalprj.letter.vo.LetterVO;
import co.yedam.finalprj.photo.vo.PhotoVO;
import co.yedam.finalprj.photoDetail.vo.PhotoDetailVO;
import co.yedam.finalprj.report.service.ReportService;
import co.yedam.finalprj.report.vo.ReportVO;
import co.yedam.finalprj.topic.service.TopicService;
import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;
import lombok.Data;

@Data
class MemberData {
	List<UsersVO> createdRows;
	List<UsersVO> updatedRows;
	List<UsersVO> deletedRows;
}

@Controller
public class UsersController {
	@Autowired UsersService usersDao;
	@Autowired TopicService topicDao;
	@Autowired FriendsService friendsDao;
	@Autowired ReportService reportDao;
	@Autowired FeedService feedDao;
	@Autowired LetterService letterDao;
	@Autowired CommentsService CommentDao;
	@Autowired CommentDetailService commentDetailDao;
	
	
	@Inject JavaMailSender mailSender;   
	
	//...????????? ????????? ?????? ????????? ?????? ??????
    private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
    private static final String String = null;

	@RequestMapping("test3.do")
	public String test3() {
		return "main/test3";
	} 
	
	// ???????????????
	@RequestMapping("profile.do")
	public String profile(Locale locale,
			@RequestParam("user_id") String user_id, UsersVO vo, FriendsVO fvo, Model model, Authentication auth, HttpServletRequest request) {
		
		//???????????? ????????? 
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		
		vo.setSession_id(Sessionid);
		vo.setUser_id(user_id);
		
		fvo.setUser_id(Sessionid);
		fvo.setFollowing(user_id);
		
		model.addAttribute("followCheck", friendsDao.followCheck(fvo));
		model.addAttribute("followingCnt", friendsDao.followingCnt(fvo));
		model.addAttribute("followerCnt", friendsDao.followerCnt(fvo));
		
		model.addAttribute("profile", usersDao.usersSelect(vo));
		model.addAttribute("postCnt", usersDao.postCnt(vo));
		model.addAttribute("mytopic", usersDao.myTopicList(vo));
		model.addAttribute("mytrip", usersDao.myTripList(vo));
		model.addAttribute("userPhoto", usersDao.userProfilePhoto(user_id));
		model.addAttribute("posts", usersDao.usersFeedList(vo));
		model.addAttribute("locale", locale.getLanguage());
		
		model.addAttribute("commentList",CommentDao.commentSelectList());
		model.addAttribute("cdList",commentDetailDao.CommentDetailList());
		
		model.addAttribute("time", letterDao.letterDistance(vo));		
		
		return "users/profile";
	} 
	
	// ????????? ?????????
	@RequestMapping("followingList.do")
	public String followingList(UsersVO vo, Model model, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		vo.setSession_id(Sessionid);
		model.addAttribute("followingList", usersDao.followingList(vo));
		return "no/users/followingList";
	}
	
	// ????????? ?????????
	@RequestMapping("followerList.do")
	public String followerList(UsersVO vo, Model model, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		vo.setSession_id(Sessionid);
		
		model.addAttribute("followerList", usersDao.followerList(vo));
		return "no/users/followerList";
	}
	
	// ????????? ???????????? ??? ??????
	@RequestMapping("usersUpdateForm.do")
	public String usersUpdateForm(UsersVO vo, Model model, Authentication auth, HttpServletRequest request) {
		//???????????? ????????? 
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		vo.setSession_id(Sessionid);
		String locale = request.getParameter("locale");
		
		model.addAttribute("profile", usersDao.usersSelect(vo));
		model.addAttribute("mytopic", usersDao.myTopicList(vo));
		model.addAttribute("mytrip", usersDao.myTripList(vo));
		model.addAttribute("topiclist", topicDao.topicSelectList());
		model.addAttribute("locale", locale);
		return "no/users/usersUpdateForm";
	}	
	
	// ??????X ????????? ???????????? ??????
	@RequestMapping("usersUpdateNoPhoto.do")
	public String usersUpdateNoPhoto(UsersVO vo, Model model, Authentication auth, HttpServletRequest request) {
		//???????????? ????????? 
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		vo.setUser_id(Sessionid);
		
		// ???????????? ?????????
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		vo.setPassword(scpwd.encode(vo.getPassword()));
		
		System.out.println(vo);
		System.out.println("?????? ??????" + Sessionid + "??? ????????? ????????? ?????????.");
		usersDao.usersUpdateNoPhoto(vo);
		String referer = request.getHeader("Referer"); // ???????????? ?????? ???????????? ?????????.
		return "redirect:"+ referer; // ?????? ???????????? ???????????????
	}	
	
	
	// ?????? + ????????? ???????????? ??????
	@RequestMapping("usersUpdate.do")
	public String usersUpdate(UsersVO vo, Model model, Authentication auth, HttpServletRequest request) throws Exception {
		//???????????? ????????? 
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		vo.setUser_id(Sessionid);
		
		// ?????? ??????
		MultipartFile file  = vo.getBase64Photo();
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
		
		System.out.println(vo);
		
		// ???????????? ?????????
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		vo.setPassword(scpwd.encode(vo.getPassword()));
		
		usersDao.usersUpdate(vo);
		
		//????????? ?????? ?????? ??? ????????? ?????? ????????????
		request.getSession().removeAttribute("photo");
		request.getSession().setAttribute("photo", usersDao.sessionProfilePhoto(vo));
		
		return "redirect:profile.do?user_id="+Sessionid;
	}	
	
	
	// ???????????? ???
	@RequestMapping("userJoin/userJoinForm.do")
	public String userJoinForm(@ModelAttribute("UsersVO") UsersVO vo, Model model, Locale locale) {
	model.addAttribute("topiclist", topicDao.topicSelectList());
	model.addAttribute("locale", locale);
		return "empty/userJoinForm";
	} 	
	
	// ID ????????????
	@RequestMapping("userJoin/userIdCheck.do")
	@ResponseBody
	public int userIdCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		int cnt = usersDao.idCheck(id);
		return cnt;
	}

	// ?????? ????????????
	@RequestMapping("userJoin/userNameCheck.do")
	@ResponseBody
	public int userNameCheck(HttpServletRequest request) {
		String name = request.getParameter("name");
		int cnt = usersDao.nameCheck(name);
		return cnt;
	}
	
	// ????????? ????????????
	@RequestMapping("userJoin/userEmailCheck.do")
	@ResponseBody
	public int userEmailCheck(HttpServletRequest request) {
		String email = request.getParameter("email");
		int cnt = usersDao.emailCheck(email);
		return cnt;
	}
	
	// ???????????? ??? ??????
	@RequestMapping("userJoin/userJoin.do")
	public String userJoin(UsersVO vo, Model model, HttpServletRequest request, PhotoVO pvo, PhotoDetailVO pdvo) throws Exception {
		
		MultipartFile file  = vo.getBase64Photo();
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
		System.out.println(vo);
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		vo.setPassword(scpwd.encode(vo.getPassword()));
		int r = usersDao.usersPhotoInsert(vo);
		System.out.println(r + "??? ??????");
		
	    return "empty/home";
	}
	
	//???????????? ?????????
	@RequestMapping("usersDeleteForm.do")
	public String usersDeleteForm() {
		return "users/usersDeleteForm";
	} 	

	//???????????? ??????
	@RequestMapping("usersDelete.do")
	@ResponseBody
	public int usersDelete(UsersVO vo, Model model, Authentication auth) {
		//???????????? ????????? 
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		vo.setUser_id(Sessionid);
		
		int r = usersDao.usersDelete(vo);
		SecurityContextHolder.clearContext();	// ??????????????????
		return r;
	} 	
	
	//????????? 
	//????????????
	@RequestMapping("admin/usersList.do")
	@ResponseBody
	public Map<String, Object> adminUsersList(UsersVO vo){
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", usersDao.adminUsersSelectList());
		data.put("data", datas);
		return data;
	}
	
	//?????????
	//????????????????????????
	@PutMapping("admin/usersUpdate.do")
	@ResponseBody
	public Map<String, Object> adminUsersUpdate(@RequestBody MemberData memberData, ReportVO vo,FeedVO fvo, LetterVO lvo, UsersVO uvo) {
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(memberData);
		for(int i=0; i < memberData.updatedRows.size(); i++) {
			usersDao.adminUsersUpdate(memberData.updatedRows.get(i));
			//??????????????? ????????? ?????? ?????? ?????? ????????????
			vo.setReported(memberData.updatedRows.get(i).getUser_id());
			int r = reportDao.reportUpdateUser(vo);
			System.out.println(r + "??? ??????");
			//?????? - ?????????????????? ?????????????????? ?????? ??????, ?????????, ??????, ???????????????
			uvo.setUser_id(memberData.updatedRows.get(i).getUser_id());
			int k = reportDao.stopUserUpdate(uvo);
			System.out.println(k + "??? ??????");
			//?????? - ?????????????????? ????????? ????????? ?????? ?????? ??????
		}
		data.put("result", true);
		data.put("data", memberData.updatedRows);
		return data;
	}	
}
