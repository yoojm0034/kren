package co.yedam.finalprj.common.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yedam.finalprj.common.map.VisitCountMap;
import co.yedam.finalprj.common.service.VisitCountService;

@Service("VisitService")
public class VisitCountServiceImpl implements VisitCountService {
	@Autowired
	VisitCountMap map;
	
	@Override
	public int insertVisitor() {
		return map.insertVisitor();
	}

	@Override
	public int getVisitTotalCount() {
		// TODO Auto-generated method stub
		return map.getVisitTotalCount();
	}

	@Override
	public int getVisitToday() {
		// TODO Auto-generated method stub
		return map.getVisitToday();
	}

}
