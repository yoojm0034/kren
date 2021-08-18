package co.yedam.finalprj.users.map;

import java.util.List;

import javax.servlet.http.HttpSession;

import co.yedam.finalprj.users.vo.UsersVO;

public interface LoginMap {
	List<UsersVO> usersSelectList();
	UsersVO usersSelect(UsersVO vo);
	int usersInsert(UsersVO vo);
	int usersUpdate(UsersVO vo);
	int usersDelete(UsersVO vo);
	
	//login
	public UsersVO loginCheck(UsersVO vo);
		
	//logout
	public void logout(HttpSession session);
	
	//아이디 비밀번호 찾기...
	UsersVO findId(String email);
	int findPwUpdate(UsersVO vo);
	
	//우표 구매시 보유 우표수 변경...
	public int stampUpdate(UsersVO vo);
	
	UsersVO userSelectStmap(String user_id);
	
	//세션에 사진 가져오기
	UsersVO sessionProfilePhoto(UsersVO vo);
	
	//-----------------신고-----------------------
	int reportUpdatePlus(UsersVO vo);
	int reportUpdateMinus(UsersVO vo);
	
}