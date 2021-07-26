package co.yedam.finalprj.feed.map;

import java.util.List;
import java.util.Map;

import co.yedam.finalprj.feed.vo.FeedVO;

public interface FeedMap {
	int feedInsert(FeedVO vo);
	List<Map<String,Object>> feedSelectList(FeedVO vo);
}
