package co.yedam.finalprj.feed.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.finalprj.feed.map.FeedMap;
import co.yedam.finalprj.feed.service.FeedService;
import co.yedam.finalprj.feed.vo.FeedVO;

@Repository("feedDao")
public class FeedServiceImpl implements FeedService {
	@Autowired
	private FeedMap map;
	
	@Override
	public List<Map<String,Object>> feedSelectList(FeedVO vo) {
		return map.feedSelectList(vo);
	}

	@Override
	public int feedInsert(FeedVO vo) {
		return map.feedInsert(vo);
	}

	@Override
	public int feedUpdate(FeedVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int feedDelete(FeedVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
