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
	public List<UsersVO> sameTopicList(UsersVO vo) {
		return map.sameTopicList(vo);
	}

	@Override
	public int feedInsert(FeedVO vo) {
		return map.feedInsert(vo);
	}
	@Override
	public int feedDelete(FeedVO vo) {
		return map.feedDelete(vo);
	}
	@Override
	public int feedUpdate(FeedVO vo) {
		return map.feedUpdate(vo);
	}
	@Override
	public FeedVO oneSelectFeed(FeedVO vo) {
		return map.oneSelectFeed(vo);
	}
	@Override
	public List<Map<String, Object>> pushSelect(FeedVO vo) {
		return map.pushSelect(vo);
	}




}