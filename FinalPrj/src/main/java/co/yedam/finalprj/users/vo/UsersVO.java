package co.yedam.finalprj.users.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UsersVO {
	private String user_id;
	private String email;
	private String name;
	private String password;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String gender;
	private String topic;
	private String language1;
	private String language2;
	private String language2_level;
	private String country;
	private String city;
	private String visited;
	private Date reg_date;
	private Date edit_dt;
	private String profile;
	private int stamp;
	private String photo;
	private int report_cnt;
	private String status;
	private Double lat;
	private Double lon;
	private String timezone;
	private String flag;
	private String session_id; 	// 세션아이디
	private int followCheck; 	// 팔로잉 체크
	
	private int cnt;
	private String s_age;			
	private String e_age;			
	private String s_dage;			
	private String e_dage;			
	private String dgender;			
	private String dcountry;		
	private String dtopic;		
	private String feedCnt; 	
	private String followingCnt;
	private String followerCnt;
	private int countryCnt;
	private int dcountryCnt;
	private int topicCnt; 				
	private int dtopicCnt; 	
	
	private String base64Photo;
}
