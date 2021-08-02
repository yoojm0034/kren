package co.yedam.finalprj.payment.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@Data
public class PaymentVO {
	private String pay_id;
	private String user_id;
	private int price;
	@JsonFormat(pattern = "yyyy/MM/dd") 
	private Date pay_dt;

}
