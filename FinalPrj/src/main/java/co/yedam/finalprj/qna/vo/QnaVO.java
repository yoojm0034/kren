package co.yedam.finalprj.qna.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class QnaVO {
	private String qna_id;
	private String email;
	private String content;
	private Date qna_dt;
	private String answer;

}
