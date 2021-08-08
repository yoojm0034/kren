package co.yedam.finalprj.report.service;

import java.util.List;

import co.yedam.finalprj.report.vo.ReportVO;

public interface ReportService {
	List<ReportVO> reportSelectList();
	ReportVO reportSelect(ReportVO vo);
	int reportInsert(ReportVO vo);
	int reportUpdate(ReportVO vo);
	int reportUpdateUser(ReportVO vo);
	int reportAllUpdate(ReportVO vo);
	int reportDelete(ReportVO vo);
}	
