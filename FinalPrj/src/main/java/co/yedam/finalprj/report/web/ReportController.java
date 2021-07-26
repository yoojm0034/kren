package co.yedam.finalprj.report.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.finalprj.report.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	ReportService reportDao; 
	
	@RequestMapping("reportList.do")
	public String reportList() {
		
		return "admin/reportList";
	}
}
