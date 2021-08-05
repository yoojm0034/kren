package co.yedam.finalprj.feed.serviceImpl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.finalprj.feed.map.FeedMap;
import co.yedam.finalprj.feed.service.FeedService;
import co.yedam.finalprj.feed.vo.FeedVO;
import co.yedam.finalprj.friends.vo.FriendsVO;
import co.yedam.finalprj.likes.vo.LikesVO;
import co.yedam.finalprj.tag.vo.TagVO;
import co.yedam.finalprj.users.vo.UsersVO;

@Repository("feedDao")
public class FeedServiceImpl implements FeedService {
	@Autowired
	private FeedMap map;
	
	@Override 
	public List<Map<String,Object>> feedSelectList(FeedVO vo) {
		//피드리스트
		return map.feedSelectList(vo);
	}
	@Override
	public List<UsersVO> birthUser(FriendsVO vo) {
		//생일인유저
		return map.birthUser(vo);
	}
	@Override
	public List<TagVO> likeTag() {
		//인기있는태그
		return map.likeTag();
	}
	@Override
	public List<UsersVO> sameTopicList(UsersVO vo) {
		//나와일치하는관심사수
		return map.sameTopicList(vo);
	}
	@Override
	public int tagSelect(TagVO vo) {
		//태그 체크
		return map.tagSelect(vo);
	}
	@Override
	public int tagInsert(TagVO vo) {
		//태그 등록
		return map.tagInsert(vo);
	}
	@Override
	public int feedInsert(FeedVO vo) {
		//피드등록
		return map.feedInsert(vo);
	}
	@Override
	public int feedDelete(FeedVO vo) {
		//피드삭제
		return map.feedDelete(vo);
	}
	@Override
	public int feedUpdate(FeedVO vo) {
		//피드 수정
		return map.feedUpdate(vo);
	}
	@Override
	public int likeCntUPdate(LikesVO vo) {
		//좋아요 좋아요 갯수
		return map.likeCntUPdate(vo);
	}
	@Override
	public List<FriendsVO> allUser(FriendsVO vo) {
		// TODO Auto-generated method stub
		return map.allUser(vo);
	}
	@Override
	public List<FriendsVO> newUser(FriendsVO vo) {

		return map.newUser(vo);
	}
	@Override
	public List<FriendsVO> myUser(FriendsVO vo) {
		// TODO Auto-generated method stub
		return map.myUser(vo);
	}




}