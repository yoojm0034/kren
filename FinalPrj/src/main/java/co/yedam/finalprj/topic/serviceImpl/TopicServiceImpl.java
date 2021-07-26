package co.yedam.finalprj.topic.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.finalprj.topic.map.TopicMap;
import co.yedam.finalprj.topic.service.TopicService;
import co.yedam.finalprj.topic.vo.TopicVO;

@Repository("topicDao")
public class TopicServiceImpl implements TopicService {
	@Autowired
	TopicMap map;
	
	@Override
	public List<TopicVO> topicSelectList() {
		// TODO Auto-generated method stub
		return map.topicSelectList();
	}

	@Override
	public TopicVO topicSelect(TopicVO vo) {
		// TODO Auto-generated method stub
		return map.topicSelect(vo);
	}

	@Override
	public int topicInsert(TopicVO vo) {
		// TODO Auto-generated method stub
		return map.topicInsert(vo);
	}

	@Override
	public int topicUpdate(TopicVO vo) {
		// TODO Auto-generated method stub
		return map.topicUpdate(vo);
	}

	@Override
	public int topicDelete(TopicVO vo) {
		// TODO Auto-generated method stub
		return map.topicDelete(vo);
	}

}
