package co.yedam.finalprj.feed.vo;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FeedVO {
	private String feed_id;
	private String user_id;
	private String content;
	private String photo;
	private Date reg_date;
	private String tags;
	
	private String findLan;
	
	//photo.vo
	private String photo_id;
	private String delete_yn;
	private String type;
	
	//photo_detail.vo
	private String original_name;
	private String uuid;
	private int file_size;
	private String directory;
	
	private MultipartFile file;
}
