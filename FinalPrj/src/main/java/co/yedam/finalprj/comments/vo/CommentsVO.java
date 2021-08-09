package co.yedam.finalprj.comments.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class CommentsVO {
	private String comment_id;
	private String feed_id;
	private Date reg_date;
	private String content;
	private String user_id;
	
	//추가
	private String name;
}
