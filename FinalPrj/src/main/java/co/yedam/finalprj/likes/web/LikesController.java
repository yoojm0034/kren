package co.yedam.finalprj.likes.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.likes.service.LikesService;
import co.yedam.finalprj.likes.vo.LikesVO;

@Controller
public class LikesController {
	@Autowired
	LikesService likeDao;
	
	@RequestMapping("likeCnt.do")
	@ResponseBody
	public List<LikesVO> likeCnt(@RequestParam(value = "feed_id", defaultValue = "-")String feedId,
						  LikesVO vo ,HttpServletRequest request,Authentication auth) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		vo.setFeed_id(feedId);
		vo.setUser_id(id);
		
		likeDao.likeChk(vo);	//삭제 or 등록
		List<LikesVO> result = likeDao.likeSelectList(vo);
		return result;
	}
	
}
