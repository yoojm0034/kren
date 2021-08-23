package co.yedam.finalprj.stamph.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class StamphVO {
	private String user_id;
	private String sh_type;
	@JsonFormat(pattern = "yyyy/MM/dd") 
	private Date sh_dt;
	private String stamph_id;
	private int cnt;
	private String to_id;
	private String name;
}
