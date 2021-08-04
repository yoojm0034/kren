package co.yedam.finalprj.push.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.finalprj.push.map.PushMap;
import co.yedam.finalprj.push.service.PushService;
import co.yedam.finalprj.push.vo.PushVO;
import co.yedam.finalprj.users.vo.UsersVO;

@Service
public class PushServiceImpl implements PushService {
	@Autowired
	PushMap map;
	
	@Override
	public List<PushVO> pushSelectList(UsersVO vo) {
		// TODO Auto-generated method stub
		return map.pushSelectList(vo);
	}

	@Override
	public PushVO pushSelect(PushVO vo) {
		// TODO Auto-generated method stub
		return map.pushSelect(vo);
	}

	@Override
	public int insertPush(PushVO vo) {
		// TODO Auto-generated method stub
		return map.insertPush(vo);
	}

	@Override
	public int updatePush(PushVO vo) {
		// TODO Auto-generated method stub
		return map.updatePush(vo);
	}

	@Override
	public int deletePush(PushVO vo) {
		// TODO Auto-generated method stub
		return map.deletePush(vo);
	}

}
