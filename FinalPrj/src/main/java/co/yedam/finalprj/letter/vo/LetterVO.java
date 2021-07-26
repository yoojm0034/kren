package co.yedam.finalprj.letter.vo;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
	private String letter_gubun;

}
