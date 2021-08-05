package co.yedam.finalprj.feed.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import co.yedam.finalprj.feed.service.FeedService;
import co.yedam.finalprj.feed.service.LanguageService;
import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.friends.service.FriendsService;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.letter.service.TransService;
import co.yedam.finalprj.letter.vo.TransVO;
import co.yedam.finalprj.likes.service.LikesService;
import co.yedam.finalprj.likes.vo.LikesVO;
import co.yedam.finalprj.notice.service.NoticeService;
import co.yedam.finalprj.tag.service.TagService;
import co.yedam.finalprj.tag.vo.TagVO;
import co.yedam.finalprj.topic.service.TopicService;
import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;

@Controller
public class FeedController {
	
	@Autowired
	FeedService feedDao;
	
	@Autowired
	NoticeService noticeDao;
	
	@Autowired
	TagService tagDao;
	
	@Autowired
	TransService transDao;
	
	@Autowired
	LanguageService lanDao;
	
	@Autowired
	UsersService userDao;
	
	@Autowired
	LikesService likeDao;
	
	@Autowired
	FriendsService friendDao;
	
	@Autowired
	TopicService topicDao;
	
	//메인피드
	@RequestMapping("feed.do")
	public String feedList(FeedVO vo, Model model, HttpServletRequest request,Authentication auth) {

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
		model.addAttribute("likeTag",feedDao.likeTag());				
		model.addAttribute("noticeList", noticeDao.noticeSelectList());	
		model.addAttribute("birthUser",feedDao.birthUser(fvo));			
		model.addAttribute("feedList",feedDao.feedSelectList(vo));
		
		return "feed/mainFeed";
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
		
		return "redirect:feed.do";
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
	
	//태그자동완성
	@RequestMapping("autocpl.do")
	@ResponseBody
	public List<TagVO> TagAutocplList(@RequestParam Map<String, Object> params, HttpServletRequest request){
	    List<TagVO> result = new ArrayList<TagVO>();        
	    result = tagDao.tagSelectList();
	    return result;
	}

	//태그등록
	@RequestMapping("tagInsert.do")
	public String tagInsert(TagVO vo, Model model) {
		int chk = feedDao.tagSelect(vo);
		if(chk == 0) {
			feedDao.tagInsert(vo);
		};
		return "redirect:feed.do";
	};
	
	@RequestMapping("friendSearch1.do")
	public String allUserList(FriendsVO vo,Model model,Authentication auth){
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();

		vo.setUser_id(id);
		model.addAttribute("allList",feedDao.allUser(vo));
		model.addAttribute("newList",feedDao.newUser(vo));
		model.addAttribute("myList",feedDao.myUser(vo));
		model.addAttribute("topicList",topicDao.topicSelectList());
		
		return "friends/friendSearch";
	};
	
	@RequestMapping("searchList.do")
	public String friendSearchList(Model model,UsersVO vo,HttpServletRequest request) {
		
		String age1 = request.getParameter("ageVal1");
		String age2 = request.getParameter("ageVal2");;
		String disAge1 = request.getParameter("dis-ageVal1");;
		String disAge2 = request.getParameter("dis-ageVal2");;
		String gender = request.getParameter("genderVal");;
		String country = request.getParameter("countryVal");;
		String disCountry = request.getParameter("dis-countryVal");;
		String lan = request.getParameter("lanVal");;
		String topic = request.getParameter("topicVal");;
		String disTopic = request.getParameter("dis-topicVal");;
		
		System.out.println("나이1 : "+age1 +"나이2 : "+ age2 +"나이3 : "+ disAge1 +"나이4 : "+ disAge2 + "성별 : "+gender+"국가 : "+country +"국가2 : "+ disCountry +"언어 : "+ lan + "토픽 : "+topic+ "ㄴ 토픽: "+disTopic );
		return "redirect:friendSearch1.do";
	}
	
}