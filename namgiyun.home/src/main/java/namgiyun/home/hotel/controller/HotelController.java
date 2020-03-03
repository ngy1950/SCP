package namgiyun.home.hotel.controller;

import javax.servlet.http.HttpSession;

import namgiyun.home.hotel.domain.Hotel;
import namgiyun.home.hotel.service.HotelService;
import namgiyun.home.user.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HotelController {
	@Autowired HotelService hotelService;

	@RequestMapping("register")
	@ResponseBody
	public boolean register(Hotel hotel){
		System.out.println("======hotel register======");
		boolean registResult = hotelService.registerHotel(hotel);
		boolean detailResult = hotelService.registerDetail(hotel);
		if(registResult && detailResult) return true;
		else return false;
	}
	
	@RequestMapping("detail")
	@ResponseBody
	public boolean register2(Hotel hotel){
		System.out.println("======hotel register======");
		return hotelService.registerDetail(hotel);
	}
	
	@RequestMapping("fix")
	@ResponseBody
	public boolean fix(Hotel hotel){
		System.out.println("======hotel fix======");
		boolean fixResult = hotelService.fixHotel(hotel);
		boolean detailResult = hotelService.fixDetail(hotel);
		if(fixResult && detailResult) return true;
		else return false;
	}
	
	@RequestMapping("delete")
	@ResponseBody
	public boolean removeHotel(int hotelNum){
		System.out.println("======remove hotel======");
		return hotelService.removeHotel(hotelNum);
	}
	
	//페이지 이동
	@RequestMapping("01")
	public String Hotel01(){
		return "hotel/registHotel";
	}
	
	@RequestMapping("02")
	public String Hotel02(Model model, HttpSession session){
		System.out.println("====02====");
		System.out.println("===myhotel===");
		User user = (User) session.getAttribute("user");
		model.addAttribute("myHotel", hotelService.myHotelList(user.getUserId()));
		return "hotel/myHotel";
	}
	
	@RequestMapping("03")
	public String Hotel03(Model model, int hotelNum){
		model.addAttribute("hotelInfo", hotelService.hotelInfo(hotelNum));
		return "hotel/fixHotel";
	}
	
	@RequestMapping("04")
	public String Hotel04(Model model, Hotel hotel){
		System.out.println("====04====");
		System.out.println("===list===");
		model.addAttribute("hotelList", hotelService.searchHotelList(hotel));
		model.addAttribute("hotel", hotel);
		System.out.println(hotel.toString());
		return "hotel/hotelList";
	}
	
	//숙소정보
	@RequestMapping("05")
	public String Hotel05(Model model, int hotelNum){
		System.out.println("====05====");
		System.out.println("====info====");
		model.addAttribute("hotelInfo", hotelService.hotelInfo(hotelNum));
		return "hotel/hotelDetail";
	}
}
