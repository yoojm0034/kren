package co.yedam.finalprj.topic.service;

import java.util.List;

import co.yedam.finalprj.topic.vo.TopicVO;

public interface TopicService {
	List<TopicVO> topicSelectList();
	TopicVO topicSelect(TopicVO vo);
	int topicInsert(TopicVO vo);
	int topicUpdate(TopicVO vo);
	int topicDelete(TopicVO vo);
}
