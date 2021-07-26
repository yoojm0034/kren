package co.yedam.finalprj.feed.service;

import java.util.List;
import java.util.Map;

import co.yedam.finalprj.feed.vo.FeedVO;

public interface FeedService {
	List<Map<String,Object>> feedSelectList(FeedVO vo);
	int feedInsert(FeedVO vo);
	int feedUpdate(FeedVO vo);
	int feedDelete(FeedVO vo);

}
