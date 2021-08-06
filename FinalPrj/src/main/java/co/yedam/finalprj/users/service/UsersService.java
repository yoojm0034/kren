package co.yedam.finalprj.users.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import co.yedam.finalprj.users.vo.UsersVO;

public interface UsersService {
	List<UsersVO> usersSelectList();
	UsersVO usersSelect(UsersVO vo);
	int usersInsert(UsersVO vo);
	int usersUpdate(UsersVO vo);
	int usersDelete(UsersVO vo);
	
	//------------------회원가입-------------------
	public UsersVO idCheck(String id);
	public UsersVO nameCheck(String name);
	public UsersVO emailCheck(String email);
	
	//------------------프로필---------------------
	//우표 구매시 보유 우표수 변경...
	public int stampUpdate(UsersVO vo);
	
	//관심사 리스트
	List<UsersVO> myTopicList(UsersVO vo);	

	//방문한 곳
	List<UsersVO> myTripList(UsersVO vo);	
	
	//작성글 카운트
	int postCnt(UsersVO vo);
	
	
	//-----------------로그인 로그아웃---------------
	public int loginCheck(UsersVO vo);
	public void logout(HttpSession session);
	
	//아이디 비밀번호 찾기...
	public String findId(String email);
	public void findPw(UsersVO vo);
	
	
	//-----------------관리자-----------------------
	int adminUsersUpdate(UsersVO vo);
	List<UsersVO> adminUsersSelectList();
}
