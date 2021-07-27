package co.yedam.finalprj.payment.service;

import java.util.List;

import co.yedam.finalprj.payment.vo.PaymentVO;


public interface PaymentService {
	List<PaymentVO> paymentSelectList();
	PaymentVO paymentSelect(PaymentVO vo);
	int paymentInsert(PaymentVO vo);
	int paymentUpdate(PaymentVO vo);
	int paymentDelete(PaymentVO vo);
}
