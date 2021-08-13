package co.yedam.finalprj.common.map;

import java.util.List;
import java.util.Map;

public interface VisitCountMap {
	public int getVisitTotalCount();
	public int getVisitToday();
	public int insertVisitor();
	public List<Map<String, Object>> dayCount();
	public List<Map<String, Object>> weekCount();
	public List<Map<String, Object>> monthCount(String date);
	public List<Map<String, Object>> yearCount();
	public List<Map<String, Object>> getPayment();
}
