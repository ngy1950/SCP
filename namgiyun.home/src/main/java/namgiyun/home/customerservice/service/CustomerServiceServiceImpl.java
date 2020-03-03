package namgiyun.home.customerservice.service;

import java.util.List;

import namgiyun.home.customerservice.dao.CustomerServiceDao;
import namgiyun.home.customerservice.domain.CustomerService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceServiceImpl implements CustomerServiceService{
	@Autowired CustomerServiceDao customerServiceDao;

	@Override
	public List<CustomerService> getCustomerService() {
		return customerServiceDao.getCustomerService();
	}

	@Override
	public boolean customerServiceAdd(CustomerService customerService) {
		return customerServiceDao.customerServiceAdd(customerService) > 0;
	}

	@Override
	public CustomerService getCustomerService_detail(String custNum) {
		return customerServiceDao.getCustomerService_detail(custNum);
	}

	@Override
	public boolean customerServiceDelete(int custNum) {
		
		return customerServiceDao.customerServiceDelete(custNum) > 0;
	}

}
