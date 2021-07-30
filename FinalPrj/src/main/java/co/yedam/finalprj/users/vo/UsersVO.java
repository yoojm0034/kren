package co.yedam.finalprj.users.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

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
	private Date birth;
	private String gender;
	private String topic;
	private String language1;
	private String language2;
	private String country;
	private String city;
	private String visited;
	private Date reg_date;
	private Date edit_date;
	private String prifile;
	private int stamp;
	private String photo;
	private int report_cnt;
	private String status;
	private int lat;
	private int lon;
	private String timezone;
	private String flag;
	private int count; // 일치하는관심사 수

}
