package co.yedam.finalprj.users.map;

import java.util.List;

import javax.servlet.http.HttpSession;

import co.yedam.finalprj.users.vo.UsersVO;

public interface UsersMap {
	List<UsersVO> usersSelectList();
	UsersVO usersSelect(UsersVO vo);
	int usersInsert(UsersVO vo);
	int usersUpdate(UsersVO vo);
	int usersDelete(UsersVO vo);
	
	//회원가입
	public UsersVO idCheck(String id);
	public UsersVO nameCheck(String name);
	public UsersVO emailCheck(String email);
	
	//프로필
	List<UsersVO> myTopicList(UsersVO vo);	
	List<UsersVO> myTripList(UsersVO vo);	
	int postCnt(UsersVO vo);
	
	//아이디 비밀번호 찾기...
	public void findId(UsersVO vo);
	public void findPw(UsersVO vo);

	//admin
	int adminUsersUpdate(UsersVO vo);
	List<UsersVO> adminUsersSelectList();

	
}