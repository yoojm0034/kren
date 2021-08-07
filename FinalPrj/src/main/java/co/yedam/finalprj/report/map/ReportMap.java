package co.yedam.finalprj.report.map;

import java.util.List;

import co.yedam.finalprj.report.vo.ReportVO;

public interface ReportMap {
	List<ReportVO> reportSelectList();
	ReportVO reportSelect(ReportVO vo);
	int reportInsert(ReportVO vo);
	int reportUpdate(ReportVO vo);
	int reportAllUpdate(ReportVO vo);
	int reportDelete(ReportVO vo);
}
