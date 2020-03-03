package namgiyun.home.customerservice.service;

import java.util.List;

import namgiyun.home.customerservice.domain.CustomerService;

public interface CustomerServiceService {
	List<CustomerService> getCustomerService();
	CustomerService getCustomerService_detail(String custNum);
	boolean customerServiceAdd(CustomerService customerService);
	boolean customerServiceDelete(int custNum);

}
