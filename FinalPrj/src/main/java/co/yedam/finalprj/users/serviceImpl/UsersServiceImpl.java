package co.yedam.finalprj.users.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.finalprj.users.map.UsersMap;
import co.yedam.finalprj.users.service.UsersService;
import co.yedam.finalprj.users.vo.UsersVO;

@Repository("usersDao")
public class UsersServiceImpl implements UsersService {
	@Autowired
	UsersMap map;
	
	@Override
	public List<UsersVO> usersSelectList() {

		return map.usersSelectList();
	}

	@Override
	public UsersVO usersSelect(UsersVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int usersInsert(UsersVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int usersUpdate(UsersVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int usersDelete(UsersVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}
	//admin user update
	@Override
	public int adminUsersUpdate(UsersVO vo) {
		// TODO Auto-generated method stub
		return map.adminUsersUpdate(vo);
	}
	//admin user selectList
	@Override
	public List<UsersVO> adminUsersSelectList() {
		// TODO Auto-generated method stub
		return map.adminUsersSelectList();
	}

}
