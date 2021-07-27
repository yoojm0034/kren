package co.yedam.finalprj.payment.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.yedam.finalprj.payment.map.PaymentMap;
import co.yedam.finalprj.payment.service.PaymentService;
import co.yedam.finalprj.payment.vo.PaymentVO;
@Repository("paymentDao")
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	PaymentMap map;
	
	@Override
	public List<PaymentVO> paymentSelectList() {
		// TODO Auto-generated method stub
		return map.paymentSelectList();
	}

	@Override
	public PaymentVO paymentSelect(PaymentVO vo) {
		// TODO Auto-generated method stub
		return map.paymentSelect(vo);
	}

	@Override
	public int paymentInsert(PaymentVO vo) {
		// TODO Auto-generated method stub
		return map.paymentInsert(vo);
	}

	@Override
	public int paymentUpdate(PaymentVO vo) {
		// TODO Auto-generated method stub
		return map.paymentUpdate(vo);
	}

	@Override
	public int paymentDelete(PaymentVO vo) {
		// TODO Auto-generated method stub
		return map.paymentDelete(vo);
	}

}
