package co.yedam.finalprj.likes.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class LikesVO {
	private String feed_id;
	private String user_id;
	private Date like_date;
	
	//좋아요 유저 사진
	private String uuid;
	
	
}
