package co.yedam.finalprj.push.service;

import java.util.List;

import co.yedam.finalprj.push.vo.PushVO;
import co.yedam.finalprj.users.vo.UsersVO;

public interface PushService {
	List<PushVO> pushSelectList(UsersVO vo);
	PushVO pushSelect(PushVO vo);
	int insertPush(PushVO vo);
	int updatePush(PushVO vo);
	int deletePush(PushVO vo);
	
	
}
