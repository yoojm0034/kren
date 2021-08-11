package co.yedam.finalprj.users.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.feed.service.FeedService;
import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.friends.service.FriendsService;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.letter.service.LetterService;
import co.yedam.finalprj.letter.vo.LetterVO;
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
	
	@Inject JavaMailSender mailSender;   
	
	//...이메일 인증을 위한 로깅을 위한 변수
    private static final Logger logger = LoggerFactory.getLogger(UsersController.class);
    private static final String String = null;

	@RequestMapping("test3.do")
	public String test3() {
		return "main/test3";
	} 
	
	// 프로필화면
	@RequestMapping("profile.do")
	public String profile(@RequestParam("user_id") String user_id, UsersVO vo, FriendsVO fvo, Model model, Authentication auth, HttpServletRequest request) {
		
		//로그인한 아이디 
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
		
		return "users/profile";
	} 
	
	// 팔로잉 리스트
	@RequestMapping("followingList.do")
	public String followingList(UsersVO vo, Model model, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		vo.setSession_id(Sessionid);
		
		model.addAttribute("followingList", usersDao.followingList(vo));
		return "no/users/followingList";
	}
	
	// 팔로워 리스트
	@RequestMapping("followerList.do")
	public String followerList(UsersVO vo, Model model, Authentication auth) {
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		vo.setSession_id(Sessionid);
		
		model.addAttribute("followerList", usersDao.followerList(vo));
		return "no/users/followerList";
	}
	
	// 프로필 업데이트 폼 호출
	@RequestMapping("usersUpdateForm.do")
	public String usersUpdateForm(UsersVO vo, Model model, Authentication auth) {
		//로그인한 아이디 
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		vo.setSession_id(Sessionid);
		
		model.addAttribute("profile", usersDao.usersSelect(vo));
		model.addAttribute("mytopic", usersDao.myTopicList(vo));
		model.addAttribute("mytrip", usersDao.myTripList(vo));
		model.addAttribute("topiclist", topicDao.topicSelectList());
		return "no/users/usersUpdateForm";
	}	
	
	// 프로필 업데이트 실행
	@RequestMapping("usersUpdate.do")
	public String usersUpdate(UsersVO vo, Model model, Authentication auth) {
		//로그인한 아이디 
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		vo.setUser_id(Sessionid);
		
		// 비밀번호 암호화
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		vo.setPassword(scpwd.encode(vo.getPassword()));
		
		System.out.println(vo);
		usersDao.usersUpdate(vo);
		return "redirect:profile.do?user_id="+Sessionid;
	}	
	
	
	// 회원가입 폼
	@RequestMapping("userJoin/userJoinForm.do")
	public String userJoinForm(@ModelAttribute("UsersVO") UsersVO vo, Model model) {
	model.addAttribute("topiclist", topicDao.topicSelectList());
		return "empty/userJoinForm";
	} 	
	
	// ID 중복체크
	@RequestMapping("userJoin/userIdCheck.do")
	@ResponseBody
	public int userIdCheck(HttpServletRequest request) {
		String id = request.getParameter("id");
		int cnt = usersDao.idCheck(id);
		return cnt;
	}

	// 이름 중복체크
	@RequestMapping("userJoin/userNameCheck.do")
	@ResponseBody
	public int userNameCheck(HttpServletRequest request) {
		String name = request.getParameter("name");
		int cnt = usersDao.nameCheck(name);
		return cnt;
	}
	
	// 이메일 중복체크
	@RequestMapping("userJoin/userEmailCheck.do")
	@ResponseBody
	public int userEmailCheck(HttpServletRequest request) {
		String email = request.getParameter("email");
		int cnt = usersDao.emailCheck(email);
		return cnt;
	}
	
	// 회원가입 폼 제출
	@RequestMapping("userJoin/userJoin.do")
	public String userJoin(UsersVO vo, Model model, byte[] imageByte) throws Exception {
		
//		ByteArrayInputStream inputStream = new ByteArrayInputStream(imageByte);
//		BufferedImage bufferedImage = ImageIO.read(inputStream);
//		ImageIO.write(bufferedImage, "png", new File("/resources/fileupload/image.png")); //저장하고자 하는 파일 경로를 입력합니다.
		String data = vo.getBase64Photo();
		data = data.replaceAll("data:image/png;base64,","");

		byte[] imgBytes = Base64.getDecoder().decode(data);
		
//		byte[] imgBytes = Base64.decodeBase64(data.getBytes());
		
		System.out.println(vo);
		BCryptPasswordEncoder scpwd = new BCryptPasswordEncoder();
		vo.setPassword(scpwd.encode(vo.getPassword()));
		usersDao.usersInsert(vo);
	    return "empty/home";
	}
	
//	public BitMap ConvertToImage(String image){
//	    try{
//	    	InputStream stream = new ByteArrayInputStream(Base64.decode(image.getBytes(), Base64.DEFAULT));
//	        Bitmap bitmap = BitmapFactory.decodeStream(stream);                 
//	        return bitmap;  
//	    }
//	    catch (Exception e) {
//	        return null;            
//	    }
//	}
//	
//	
//	public boolean writeImageToDisk(FileItem item, File imageFile) {
//	    // clear error message
//	    String errorMessage = null;
//	    FileOutputStream out = null;
//	    boolean ret = false;
//	    try {
//	        // write thumbnail to output folder
//	        out = createOutputStream(imageFile);
//
//	        // Copy input stream to output stream
//	        byte[] headerBytes = new byte[22];
//	        InputStream imageStream = item.getInputStream();
//	        imageStream.read(headerBytes);
//
//	        String header = new String(headerBytes);
//	        // System.out.println(header);
//
//	        byte[] b = new byte[4 * 1024];
//	        byte[] decoded;
//	        int read = 0;
//	        while ((read = imageStream.read(b)) != -1) {
//	            // System.out.println();
//	            if (Base64.isArrayByteBase64(b)) {
//	                decoded = Base64.decodeBase64(b);
//	                out.write(decoded);
//	            }
//	        }
//
//	        ret = true;
//	    } catch (IOException e) {
//	        StringWriter sw = new StringWriter();
//	        e.printStackTrace(new PrintWriter(sw));
//	        errorMessage = "error: " + sw;
//
//	    } finally {
//	        if (out != null) {
//	            try {
//	                out.close();
//	            } catch (Exception e) {
//	                StringWriter sw = new StringWriter();
//	                e.printStackTrace(new PrintWriter(sw));
//	                System.out.println("Cannot close outputStream after writing file to disk!" + sw.toString());
//	            }
//	        }
//
//	    }
//
//	    return ret;
//	}

	/**
	 * Helper method for the creation of a file output stream.
	 * 
	 * @param imageFolder
	 *            : folder where images are to be saved.
	 * @param id
	 *            : id of spcefic image file.
	 * @return FileOutputStream object prepared to store images.
	 * @throws FileNotFoundException
	 */
	protected FileOutputStream createOutputStream(File imageFile) throws FileNotFoundException {

	    imageFile.getParentFile().mkdirs();

	    return new FileOutputStream(imageFile);
	}

	//회원탈퇴 페이지
	@RequestMapping("usersDeleteForm.do")
	public String usersDeleteForm() {
		return "users/usersDeleteForm";
	} 	

	//회원탈퇴 실행
	@RequestMapping("usersDelete.do")
	@ResponseBody
	public int usersDelete(UsersVO vo, Model model, Authentication auth) {
		//로그인한 아이디 
		User user = (User) auth.getPrincipal();
		String Sessionid = (String) user.getUsername();
		vo.setUser_id(Sessionid);
		
		int r = usersDao.usersDelete(vo);
		SecurityContextHolder.clearContext();	// 세션끊어주기
		return r;
	} 	
	
	//관리자 
	//유저목록
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
	
	//관리자
	//유저상태업데이트
	@PutMapping("admin/usersUpdate.do")
	@ResponseBody
	public Map<String, Object> adminUsersUpdate(@RequestBody MemberData memberData, ReportVO vo,FeedVO fvo, LetterVO lvo, UsersVO uvo) {
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(memberData);
		for(int i=0; i < memberData.updatedRows.size(); i++) {
			usersDao.adminUsersUpdate(memberData.updatedRows.get(i));
			//신고목록중 유저에 대한 모든 신고 읽음처리
			vo.setReported(memberData.updatedRows.get(i).getUser_id());
			int r = reportDao.reportUpdateUser(vo);
			System.out.println(r + "건 수정");
			//피드 - 회원아이디로 회원이작성한 모든 댓글, 좋아요, 피드, 삭제해야됨
			uvo.setUser_id(memberData.updatedRows.get(i).getUser_id());
			int k = reportDao.stopUserUpdate(uvo);
			System.out.println(k + "건 수정");
			//편지 - 회원아이디로 회원이 작성한 편지 모두 삭제
		}
		data.put("result", true);
		data.put("data", memberData.updatedRows);
		return data;
	}	
}
