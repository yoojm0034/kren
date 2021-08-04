package co.yedam.finalprj.feed.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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

import co.yedam.finalprj.feed.service.FeedService;
import co.yedam.finalprj.feed.service.LanguageService;
import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.letter.service.TransService;
import co.yedam.finalprj.letter.vo.TransVO;
import co.yedam.finalprj.likes.vo.LikesVO;
import co.yedam.finalprj.notice.service.NoticeService;
import co.yedam.finalprj.tag.service.TagService;
import co.yedam.finalprj.tag.vo.TagVO;
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
	@RequestMapping("feed.do")
	public String feedList(FeedVO vo, Model model, HttpServletRequest request,Authentication auth) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		
		//-------------피드 리스트 --------------------------------
		vo.setUser_id(id);
		Map<String, Object> datas = new HashMap<String, Object>();
		datas.put("feedList", feedDao.feedSelectList(vo));
		List<Map> temp = (List<Map>) datas.get("feedList");

		//-------------- 일치하는관심사수 -----------------------
		UsersVO uvo = new UsersVO();
		uvo.setUser_id(id);
		uvo.setTopic("topic_22,topic_22,topic_41");
		//세션에서 토픽은 못 넘겨 받아용?
		
		//-------------- 생일인유저-----------------------------
		FriendsVO fvo = new FriendsVO();
		fvo.setUser_id(id);
		
		//-------------- 피드 좋아요 --------------------------------
		Map<String, Object> fdatas = new HashMap<String, Object>();
		List list = new ArrayList();
		
		for(var i=0; i<temp.size(); i ++ ) {
			Map<String, Object> tMap = temp.get(i);
			String feedId = (String) tMap.get("feed_id");
			
			LikesVO lvo = new LikesVO();
			lvo.setFeed_id(feedId);
			
			fdatas.put("feedLike", feedDao.FeedLikeSelect(lvo));

			List<Map> temp1 = (List<Map>) fdatas.get("feedLike");
			
			if(temp1.size() != 0){
				list.add(temp1);
			}
		}
		//System.out.println("리스트야 " + list);

		model.addAttribute("sameTopic",feedDao.sameTopicList(uvo));		//일치하는관심사수
		model.addAttribute("likeTag",feedDao.likeTag());				//인기있는태그
		model.addAttribute("noticeList", noticeDao.noticeSelectList());	//공지사항리스트
		model.addAttribute("feedLike",list);							//
		model.addAttribute("birthUser",feedDao.birthUser(fvo));			//생일인유저
		model.addAttribute("feedList",feedDao.feedSelectList(vo));		//피드리스트
		return "feed/mainFeed";
	}
	
	@RequestMapping("tagInsert.do")
	public String tagInsert(TagVO vo, Model model) {
		int chk = feedDao.tagSelect(vo);
		
		if(chk == 0) {
			feedDao.tagInsert(vo);
		};
		
		return "redirect:feed.do";
	};
	
	// 피드 등록, 수정 
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
	

	@RequestMapping("autocpl.do")
	@ResponseBody
	public List<TagVO> TagAutocplList(@RequestParam Map<String, Object> params, HttpServletRequest request){
	    List<TagVO> result = new ArrayList<TagVO>();        
	    result = tagDao.tagSelectList();
	    return result;
	}
	
	@RequestMapping("feedDelete.do")
	public String feedDelete(FeedVO vo, Model model) {
		feedDao.feedDelete(vo);
		return "redirect:feed.do";
	}
	
	//번역 
	@RequestMapping(value="test11.do", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String test4(@RequestParam(value = "korean", defaultValue = "-")String korean,
						Model model) {	
		FeedVO vo = new FeedVO();
		vo.setWrite_lan(korean);		
	    String english= lanDao.transLan(vo);// 서비스에서 일을 진행 할 예정
	    TransVO tvo = new TransVO();
	    String result="";
	    english= english.substring(13, 15);
	    
	    if(english.equals("ko")) {
	    	tvo.setKr(korean);
	    	result = transDao.getEn(tvo);
	    }else{
	    	tvo.setEn(korean);
	    	result = transDao.getKr(tvo);
	    }
	    
	    model.addAttribute("launguge", english);
		return result;
	}
	
}