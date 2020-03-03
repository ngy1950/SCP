package namgiyun.home.customerservice.dao.mapper;

import java.util.List;

import namgiyun.home.customerservice.domain.*;

public interface CustomerSerivceMapper {
	List<CustomerService> getCustomerService();
	CustomerService getCustomerService_detail(String custNum);
	int customerServiceAdd(CustomerService customerService);
	int customerServiceDelete(int custNum);
}
