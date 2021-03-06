package co.yedam.finalprj.common.serviceImpl;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<Map<String, Object>> dayCount() {
		// TODO Auto-generated method stub
		return map.dayCount();
	}

	@Override
	public List<Map<String, Object>> weekCount() {
		// TODO Auto-generated method stub
		return map.weekCount();
	}

	

	@Override
	public List<Map<String, Object>> yearCount() {
		// TODO Auto-generated method stub
		return map.yearCount();
	}

	@Override
	public List<Map<String, Object>> monthCount(String date) {
		// TODO Auto-generated method stub
		return map.monthCount(date);
	}

	@Override
	public List<Map<String, Object>> getPayment() {
		// TODO Auto-generated method stub
		return map.getPayment();
	}

}
