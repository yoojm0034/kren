package co.yedam.finalprj.feed.vo;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class FeedVO {
	private String feed_id;
	private String user_id;
	private String content;
	private String photo;
	private Date reg_date;
	private String tags;
	

	
}
