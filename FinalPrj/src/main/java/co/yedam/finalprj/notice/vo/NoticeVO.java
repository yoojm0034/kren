package co.yedam.finalprj.notice.vo;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
@Data
public class NoticeVO {
	private String notice_id;
	private String title;
	private String content;
	private Date reg_date;
	private int hit;
	private String photo;
	private MultipartFile file;
}
