package co.yedam.finalprj.report.map;

import java.util.List;

import co.yedam.finalprj.report.vo.ReportVO;
import co.yedam.finalprj.users.vo.UsersVO;

public interface ReportMap {
	List<ReportVO> reportSelectList();
	ReportVO reportSelect(ReportVO vo);
	int reportInsert(ReportVO vo);
	int reportUpdate(ReportVO vo);
	int reportUpdateUser(ReportVO vo);
	int reportAllUpdate(ReportVO vo);
	int reportDelete(ReportVO vo);
	
	//정지회원으로 변경시 관려 데이터 일괄삭제
	int stopUserUpdate(UsersVO vo);
	
	//신고내역 확인
	int reportUserCheck(ReportVO vo);
	
	//신고내역 삭제된 것 읽음 처리
	int reportContentDeleteRead();
}
