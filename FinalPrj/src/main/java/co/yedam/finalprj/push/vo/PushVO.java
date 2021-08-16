package co.yedam.finalprj.push.vo;


import lombok.Data;

@Data
public class PushVO {
	private String push_id;
	private String to_id;
	private String user_id;
	private String type;
	private String content_id;
	private String msg;
	private String url;
	private String push_dt;
	private String check_dt;
	private String name;
	
}
