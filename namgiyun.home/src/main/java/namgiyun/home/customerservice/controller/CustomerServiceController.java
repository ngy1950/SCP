package namgiyun.home.customerservice.controller;

import java.util.List;

import namgiyun.home.customerservice.domain.CustomerService;
import namgiyun.home.customerservice.service.CustomerServiceService;
import namgiyun.home.customerservice.service.CustomerServiceServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/customerservice")
public class CustomerServiceController {
	@Autowired private CustomerServiceService customerServiceService;
	
	// customerservice
	@RequestMapping("/01")
	public String customerservice01() {
		return "customerservice/01";
	}

	@RequestMapping(value="/02", method = RequestMethod.GET)
	public String customerservice02() {
		return "/customerservice/02";
	}

	@RequestMapping("/03")
	public String customerservice03() {
		return "customerservice/03";
	}
	
	@RequestMapping("/04")
	public String customerservice04() {
		return "customerservice/04";
	}
	
	@RequestMapping("/05")
	public String customerservice05(String custNum, Model model) {
		System.out.println(custNum);
		CustomerService detail = customerServiceService.getCustomerService_detail(custNum);
		model.addAttribute("detail", detail);
		return "customerservice/05";
	}
	
	@RequestMapping("/customerServiceList")
	@ResponseBody
	public List<CustomerService> customerServiceList() {
		return customerServiceService.getCustomerService();
	}

	@RequestMapping("/customerService")
	@ResponseBody
	public void customerService(String custNum){
		System.out.println("customerService 실행: " + custNum);
	}
	
	
	@RequestMapping(value="/02")
	@ResponseBody
		public boolean add(String custName, String custContent, String userId){
		CustomerService customerService = new CustomerService(custName, custContent, userId);
		return customerServiceService.customerServiceAdd(customerService);
	}
	
	@RequestMapping("/delete")
	public String Delete(int custNum){
		System.out.println(custNum);
		customerServiceService.customerServiceDelete(custNum);
		return "redirect:/customerservice/01";
	}

}
