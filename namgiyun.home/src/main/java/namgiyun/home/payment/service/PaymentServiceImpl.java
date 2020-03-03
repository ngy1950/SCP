package namgiyun.home.payment.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import namgiyun.home.payment.dao.PaymentDao;
import namgiyun.home.payment.domain.Payment;

@Service
public class PaymentServiceImpl implements PaymentService{
	@Autowired private PaymentDao paymentDao; 
	
	@Override
	public boolean joinPay(Payment payment) {
		return paymentDao.addPay(payment) > 0;
	}

}
