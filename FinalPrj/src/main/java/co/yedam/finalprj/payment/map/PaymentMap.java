package co.yedam.finalprj.payment.map;

import java.util.List;

import co.yedam.finalprj.payment.vo.PaymentVO;

public interface PaymentMap {
	List<PaymentVO> paymentSelectList();
	PaymentVO paymentSelect(PaymentVO vo);
	int paymentInsert(PaymentVO vo);
	int paymentUpdate(PaymentVO vo);
	int paymentDelete(PaymentVO vo);
}
