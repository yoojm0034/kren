package co.yedam.finalprj.letterc.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LettercVO {
	private String letter_id;
	private String line;
	private String origin;
	private String correcting;

}
