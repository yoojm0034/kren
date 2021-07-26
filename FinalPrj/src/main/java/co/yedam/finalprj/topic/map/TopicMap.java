package co.yedam.finalprj.topic.map;

import java.util.List;

import co.yedam.finalprj.topic.vo.TopicVO;

public interface TopicMap {
	List<TopicVO> topicSelectList();
	TopicVO topicSelect(TopicVO vo);
	int topicInsert(TopicVO vo);
	int topicUpdate(TopicVO vo);
	int topicDelete(TopicVO vo);
}
