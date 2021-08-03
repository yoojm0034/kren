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
import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.friends.vo.FriendsVO;
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
		
		System.out.println("1"+feedId);
		System.out.println("2"+vo.getContent());
		System.out.println("updateChk : "+updateChk);
		System.out.println("vo.getphoto : "+vo.getPhoto());
		MultipartFile file = vo.getFile();	
		
		System.out.println("3"+vo.getFile());
		
		System.out.println("3.1"+vo.getPhoto());
		vo.setUser_id(id);
		System.out.println("4"+vo.getUser_id());
		System.out.println("5"+vo.getTags());
		
		if(feedId.equals("")) {
			System.out.println("7등록");
			
			if(!file.isEmpty()) {
				System.out.println("요기");
				String fileName = file.getOriginalFilename();
				int fileSize = (int) file.getSize();
				String ext = null;
				int dot = fileName.lastIndexOf(".");
				
				if(dot != -1) {
					ext = fileName.substring(dot);
				}else {
					ext = "";
				}
				System.out.println("요기");
				UUID uuid = UUID.randomUUID();
				String fileUUID = uuid.toString() + ext;
				String path = request.getServletContext().getRealPath("/resources/upload/");
				System.out.println("요기");
				vo.setFile_size(fileSize);
				vo.setDirectory(path);
				vo.setUuid(fileUUID);
				vo.setOriginal_name(fileName);
				
				file.transferTo(new File(path, fileUUID));//파일을 경로로 저장
				
				 feedDao.feedInsert(vo);
				 
			}else {
				  feedDao.feedInsert(vo);
			}
		}else {
			String feedid = request.getParameter("feedid");
			String photo = request.getParameter("photo");
			vo.setFeed_id(feedid);
			System.out.println("==========업데이트 시작 비교 ==============");
			System.out.println("업데이트");
			System.out.println("파일 : "+vo.getFile());		//파일 .. 
		//	System.out.println("request포토 : "+photo);				//5df51f9d-6519-4f96-b358-a622da3f7846.png
			System.out.println("content : "+vo.getContent());	//컨텐츠
			System.out.println("get1 포토 : "+vo.getPhoto());		//널 포토 아이디5df51f9d-6519-4f96-b358-a622da3f7846.png
			System.out.println("tag1 : "+vo.getTags());		//업으면 값 안뜸 ""
			//원래의 사진은 넣지 않는다 
			if(!file.isEmpty()) {
				String fileName = file.getOriginalFilename();
				System.out.println(fileName);			
				int fileSize = (int) file.getSize();
				String ext = null;
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
				System.out.println("========== 사진이 있으면 ==============");
				System.out.println(vo.getUuid());
				System.out.println(vo.getOriginal_name());
				System.out.println("업데이트");
				System.out.println("파일 : "+vo.getFile());		//파일 .. 
			//	System.out.println("request포토 : "+photo);				//5df51f9d-6519-4f96-b358-a622da3f7846.png
				System.out.println("content : "+vo.getContent());	//컨텐츠
				System.out.println("get2 포토 : "+vo.getPhoto());		//널 포토 아이디5df51f9d-6519-4f96-b358-a622da3f7846.png
				System.out.println("tag2 : "+vo.getTags());		//업으면 값 안뜸 ""

				file.transferTo(new File(path, fileUUID));//파일을 경로로 저장
				
				 feedDao.feedUpdate(vo);
				 
			}else {
				 //사진이 없으면 
				if(updateChk.equals("")) {
					System.out.println("변경하지 않음 사진이 있어요");
					vo.setPhoto(photo);
					System.out.println(vo.getPhoto());
					 feedDao.feedUpdate(vo);		
				}else {
					vo.setPhoto(null);
					System.out.println(vo.getPhoto());
					 feedDao.feedUpdate(vo);
				}
//				System.out.println("========== 사진이 없으면 ==============");
//				System.out.println("업데이트");
//				System.out.println("파일 : "+vo.getFile());		//파일 .. 
////				System.out.println("request포토 : "+photo);				//5df51f9d-6519-4f96-b358-a622da3f7846.png
//				System.out.println("content : "+vo.getContent());	//컨텐츠
//				System.out.println("get3 포토 : "+vo.getPhoto());		//널 포토 아이디5df51f9d-6519-4f96-b358-a622da3f7846.png
//				System.out.println("tag3 : "+vo.getTags());		//업으면 값 안뜸 ""
//				
//				feedDao.feedUpdate(vo);
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

	
	
}