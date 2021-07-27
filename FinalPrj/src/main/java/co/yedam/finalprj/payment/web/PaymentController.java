package co.yedam.finalprj.payment.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.payment.service.PaymentService;
import co.yedam.finalprj.payment.vo.PaymentVO;

@Controller
public class PaymentController {
	@Autowired
	PaymentService paymentDao;
	
	@RequestMapping("paymentList.do") 
	public String paymentList() {
		return "admin/paymentList";
	}
	
	//관리자 
	//결제내역목록
	@RequestMapping("adminPaymentList.do")
	@ResponseBody
	public Map<String, Object> adminPaymentList(PaymentVO vo){
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", paymentDao.paymentSelectList());
		data.put("data", datas);
		return data;
	}
}
