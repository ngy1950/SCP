package namgiyun.home.customerservice.dao;

import java.util.List;

import namgiyun.home.customerservice.dao.mapper.CustomerSerivceMapper;
import namgiyun.home.customerservice.domain.CustomerService;

import org.aspectj.weaver.patterns.TypePatternQuestions.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerServiceDaoImpl implements CustomerServiceDao{
	@Autowired CustomerSerivceMapper customerSerivceMapper;

	@Override
	public List<CustomerService> getCustomerService() {
		return customerSerivceMapper.getCustomerService();
	}

	@Override
	public int customerServiceAdd(CustomerService customerService) {
		return customerSerivceMapper.customerServiceAdd(customerService);
	}

	@Override
	public CustomerService getCustomerService_detail(String custNum) {
		return customerSerivceMapper.getCustomerService_detail(custNum);
	}

	@Override
	public int customerServiceDelete(int custNum) {
		return customerSerivceMapper.customerServiceDelete(custNum);
	}

}
