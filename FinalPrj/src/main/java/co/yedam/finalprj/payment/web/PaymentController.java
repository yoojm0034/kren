package co.yedam.finalprj.payment.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.payment.service.PaymentService;
import co.yedam.finalprj.payment.vo.PaymentVO;

@Controller
public class PaymentController {
	@Autowired
	PaymentService paymentDao;
	
	@RequestMapping("admin/userPaymentList.do") 
	public String paymentList() {
		return "admin/paymentList";
	}
	
	//관리자 
	//결제내역목록
	@RequestMapping("admin/paymentList.do")
	@ResponseBody
	public Map<String, Object> adminPaymentList(PaymentVO vo){
		Map<String, Object> datas = new HashMap<String, Object>();
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("result", true);
		datas.put("contents", paymentDao.paymentSelectList());
		data.put("data", datas);
		return data;
	}
	
	//insert...
	@ResponseBody
	@RequestMapping(value="paymentInsert.do")
	public PaymentVO paymentInsert(HttpServletRequest request, Authentication auth, PaymentVO vo, Model model) {
		User user = (User) auth.getPrincipal();
		String id = (String) user.getUsername();
		vo.setUser_id(id);
		
		paymentDao.paymentInsert(vo);
		
		
		//결제 완료 후, 마이페이스나 우표 보유현황 페이지로 넘어가야함...
		return vo;
	}

}