package co.yedam.finalprj.tag.service;

import java.util.List;

import co.yedam.finalprj.tag.vo.TagVO;

public interface TagService {
	List<TagVO> tagSelectList();
	TagVO tagSelect(TagVO vo);
	int tagInsert(TagVO vo);
	int tagUpdate(TagVO vo);
	int tagDelete(TagVO vo);
	int tagCnt(TagVO vo);										//태그체크
	int tagchkInsert(TagVO vo);									//태그등록
	List<TagVO> likeTag();										//인기있는태그
}
