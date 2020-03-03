package namgiyun.home.payment.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import namgiyun.home.payment.dao.mapper.PaymentMapper;
import namgiyun.home.payment.domain.Payment;

@Repository
public class PaymentDaoImpl implements PaymentDao {
	@Autowired private PaymentMapper paymentMapper;
	@Override
	public int addPay(Payment payment) {
		return paymentMapper.addPay(payment);
	}

}
