package co.yedam.finalprj.payment.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class PaymentVO {
	private String pay_id;
	private String user_id;
	private int price;
	private Date pay_dt;
}
