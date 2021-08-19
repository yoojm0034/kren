package co.yedam.finalprj.letter.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LetterVO {
	private String letter_id;
	private String to_id;
	private String user_id;
	private Date send_date;
	private String content;
	private String photo;
	private Date read_date;
	private String to_delete;
	private String from_delete;
	private Date arrive_date;
	private String send_yn;
	private String gubun;
	private String cor_yn;
	
	// 없는 필드
	private String name;
	private String to_name;
	private String cate;
	private String uid;
	private String lid;
	private int distance;
	private String status;
	private String cnt;
	private String uuid;

}
