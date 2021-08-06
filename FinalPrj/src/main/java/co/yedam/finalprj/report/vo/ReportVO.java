package co.yedam.finalprj.report.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReportVO {
	private String report_id;
	private String msg;
	private Date reg_date;
	private String user_id;
	private String reported;
	private String content;
	
	//차단여부
	private String blocked;
}
