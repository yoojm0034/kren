package co.yedam.finalprj.report.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.finalprj.report.service.ReportService;
import co.yedam.finalprj.report.vo.ReportVO;

@Controller
public class ReportController {
	
	@Autowired
	ReportService reportDao; 
	
	@RequestMapping("admin/userReportList.do")
	public String reportList(ReportVO vo, Model model) {
		model.addAttribute("reportList", reportDao.reportSelectList());	
		return "admin/reportList";
	}
}
