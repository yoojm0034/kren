package co.yedam.finalprj.tag.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.finalprj.tag.map.TagMap;
import co.yedam.finalprj.tag.service.TagService;
import co.yedam.finalprj.tag.vo.TagVO;
@Repository("tagDao")
public class TagServiceImpl implements TagService {
	@Autowired
	TagMap map;
	
	@Override
	public List<TagVO> tagSelectList() {
		// TODO Auto-generated method stub
		return map.tagSelectList();
	}

	@Override
	public TagVO tagSelect(TagVO vo) {
		// TODO Auto-generated method stub
		return map.tagSelect(vo);
	}

	@Override
	public int tagInsert(TagVO vo) {
		
		return map.tagInsert(vo);
	}

	@Override
	public int tagUpdate(TagVO vo) {
		
		return map.tagUpdate(vo);
	}

	@Override
	public int tagDelete(TagVO vo) {
		
		return map.tagDelete(vo);
	}

}
