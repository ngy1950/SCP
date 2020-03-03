package namgiyun.home.customerservice.dao;

import java.util.List;

import namgiyun.home.customerservice.domain.CustomerService;

public interface CustomerServiceDao {
	List<CustomerService> getCustomerService();
	CustomerService getCustomerService_detail(String custNum);
	int customerServiceAdd(CustomerService customerService);
	int customerServiceDelete(int custNum);

}
