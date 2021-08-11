package co.yedam.finalprj.commentDetail.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class CommentDetailVO {
	private String line;
	private String content;
	private String origin;
	private String cc_id;
	
	//추가
	private String cc_seq;
}
