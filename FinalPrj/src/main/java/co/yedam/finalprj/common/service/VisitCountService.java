package co.yedam.finalprj.common.service;

import java.util.List;
import java.util.Map;

public interface VisitCountService {
	public int insertVisitor();
	public int getVisitTotalCount();
	public int getVisitToday();
	public List<Map<String, Object>> dayCount();
}
