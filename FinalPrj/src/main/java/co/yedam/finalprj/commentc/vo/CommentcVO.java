package co.yedam.finalprj.commentc.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CommentcVO {
	private String cc_id;
	private String feed_id;
	private Date reg_date;
	private String user_id;
	private int line;
	private String origin;
	private String content;
}
