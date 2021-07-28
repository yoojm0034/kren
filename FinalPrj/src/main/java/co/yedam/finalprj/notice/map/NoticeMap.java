package co.yedam.finalprj.notice.map;

import java.util.List;

import co.yedam.finalprj.notice.vo.NoticeVO;

public interface NoticeMap {
	List<NoticeVO> noticeSelectList();
	NoticeVO noticeSelect(NoticeVO vo);
	int noticeInsert(NoticeVO vo);
	int noticeUpdate(NoticeVO vo);
	int noticeUpdateHit(NoticeVO vo);
	int noticeDelete(NoticeVO vo);
}
