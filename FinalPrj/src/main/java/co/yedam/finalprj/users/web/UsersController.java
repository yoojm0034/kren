package co.yedam.finalprj.users.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;
import lombok.Data;

@Controller
public class UsersController {
	@Autowired
	UsersService usersDao;

	@Data
class MemberData {
	List<UsersVO> createdRows;
	List<UsersVO> updatedRows;
	List<UsersVO> deletedRows;
}

	@RequestMapping("test3.do")
	public String test3() {
		return "main/test3";
	} 
	
	@RequestMapping("profile.do")
	public String profile() {
		return "users/profile";
	} 
	
	// 회원가입
	@RequestMapping("userJoinForm1.do")
	public String userJoinForm1() {
		return "empty/userJoinForm1";
	} 	
	
	
	
	//관리자 
	//유저목록
	@RequestMapping("adminUsersList.do")
	@ResponseBody
	public Map<String, Object> adminUsersList(UsersVO vo){
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", usersDao.adminUsersSelectList());
		data.put("data", datas);
		return data;
	}
	
	//관리자
	//유저상태업데이트
	@PutMapping("adminUsersUpdate.do")
	@ResponseBody
	public Map<String, Object> adminUsersUpdate(@RequestBody MemberData memberData) {
		Map<String, Object> data = new HashMap<String, Object>();
		System.out.println(memberData);
		for(int i=0; i < memberData.updatedRows.size(); i++) {
			usersDao.adminUsersUpdate(memberData.updatedRows.get(i));
		}
		data.put("result", true);
		data.put("data", memberData.updatedRows);
		return data;
	}	
	
	
}
