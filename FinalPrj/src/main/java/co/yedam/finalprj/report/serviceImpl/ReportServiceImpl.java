package co.yedam.finalprj.report.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.finalprj.report.map.ReportMap;
import co.yedam.finalprj.report.service.ReportService;
import co.yedam.finalprj.report.vo.ReportVO;
import co.yedam.finalprj.users.vo.UsersVO;

@Repository("reportDao")
public class ReportServiceImpl implements ReportService {
	@Autowired
	ReportMap map;
	
	@Override
	public List<ReportVO> reportSelectList() {
		return map.reportSelectList();
	}

	@Override
	public ReportVO reportSelect(ReportVO vo) {
		return map.reportSelect(vo);
	}

	@Override
	public int reportInsert(ReportVO vo) {
		return map.reportInsert(vo);
	}

	@Override
	public int reportUpdate(ReportVO vo) {

		return map.reportUpdate(vo);
	}

	@Override
	public int reportDelete(ReportVO vo) {
		return map.reportDelete(vo);
	}

	@Override
	public int reportAllUpdate(ReportVO vo) {
		return map.reportAllUpdate(vo);
	}

	@Override
	public int reportUpdateUser(ReportVO vo) {
		return map.reportUpdateUser(vo);
	}

	@Override
	public int stopUserUpdate(UsersVO vo) {
		return map.stopUserUpdate(vo);
	}

	@Override
	public int reportUserCheck(ReportVO vo) {
		return map.reportUserCheck(vo);
	}

}
