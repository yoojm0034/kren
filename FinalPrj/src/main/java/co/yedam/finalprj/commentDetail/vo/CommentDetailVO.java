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
	private int line;
	private String content;
	private String cc_id;
}
