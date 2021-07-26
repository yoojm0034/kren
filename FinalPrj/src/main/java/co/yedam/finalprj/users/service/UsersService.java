package co.yedam.finalprj.users.service;

import java.util.List;

import co.yedam.finalprj.users.vo.UsersVO;

public interface UsersService {
	List<UsersVO> usersSelectList();
	UsersVO usersSelect(UsersVO vo);
	int usersInsert(UsersVO vo);
	int usersUpdate(UsersVO vo);
	int usersDelete(UsersVO vo);
	
	//admin
	int adminUsersUpdate(UsersVO vo);
	List<UsersVO> adminUsersSelectList();
}
