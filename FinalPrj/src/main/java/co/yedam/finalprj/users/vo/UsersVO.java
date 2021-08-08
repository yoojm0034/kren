package co.yedam.finalprj.users.vo;

import java.util.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

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
	private int count; // 일치하는관심사 수
	private String session_id; // 세션아이디
	private int followCheck; // 팔로잉 체크
	
	private int cnt;
	private String s_age;		//검색시작나이
	private String e_age;		//검색끝나이
	private String s_dage;		//제외시작나이
	private String e_dage;		//검색끝나이
	private String dcountry;	//제외국가
	private String dtopic;		//제외관심사
	private String feedCnt; 	//작성자글수
	private String followingCnt;
	private String followerCnt;
}
