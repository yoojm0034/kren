package co.yedam.finalprj.payment.service;

import java.util.List;

import co.yedam.finalprj.payment.vo.PaymentVO;


public interface PaymentService {
	List<PaymentVO> paymentSelectList();
	PaymentVO paymentSelect(PaymentVO vo);
	int paymentInsert(PaymentVO vo);
	int paymentUpdate(PaymentVO vo);
	int paymentDelete(PaymentVO vo);
	//결제합
	int allSales();
	//하루매출
	int daySales();
	//일주일매출
	int weekSales();
	//한달매출
	int monthSales();
	//연매출
	int yearSales();
}
