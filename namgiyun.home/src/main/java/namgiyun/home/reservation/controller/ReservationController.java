package namgiyun.home.reservation.controller;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import namgiyun.home.payment.service.PaymentService;
import namgiyun.home.reservation.domain.Reservation;
import namgiyun.home.reservation.domain.ReservationList;
import namgiyun.home.reservation.service.ReservationService;
import namgiyun.home.user.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReservationController {
	@Autowired ReservationService reservationService;
	@Autowired PaymentService paymentService;
	// 예약추가
	@RequestMapping("reservation.do")
	@Transactional
	@ResponseBody
	public boolean reservation_add(Reservation reservation, HttpSession session){
		
		// 예약정보 테이블 insert
		User user = (User)session.getAttribute("user");
		reservation.setUserId(user.getUserId());
		
		// 예약내역 테이블 insert
		ReservationList reservationList = new ReservationList();
		reservationList.setPayState("결제 대기중");
		reservationList.setResvState("승인 대기중");

		try{
			reservationService.addReservation(reservation);
			reservationService.addReservationList(reservationList);
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	
	@RequestMapping("reservation_cancel.do")
	@Transactional
	@ResponseBody
	public List<Reservation> reservation_cancel(int resvNum, HttpSession session){
		
		// 로그인 된 유저정보 get
		User user = (User)session.getAttribute("user");
		
		try{
			System.out.println(reservationService.del_reservation(resvNum));
			System.out.println(reservationService.del_reservation_lists(resvNum));
			System.out.println(reservationService.del_payments(resvNum));
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return reservationService.userReservaton_List(user.getUserId());
	}

	
	// 유저 예약내역 리스트 보여주기
	@RequestMapping("/userReservation")
	public String userReservation(Model model, HttpSession session){
		User user = (User)session.getAttribute("user");
		model.addAttribute("userReservation_List", reservationService.userReservaton_List(user.getUserId()));
		
		return "reservation/userReservation";
	}
	
	
	// 호스트 예약내역 리스트 보여주기
	@RequestMapping("/hostReservation")
	public String hostReservation(HttpSession session, Model model){
		System.out.println("hostReservation===>");
		User user = (User)session.getAttribute("user");
		System.out.println(reservationService.hostReservation_List(user.getUserId()).toString());
		model.addAttribute("hostReservation", reservationService.hostReservation_List(user.getUserId()));
		
		return "reservation/hostReservation";
	}

	
	@RequestMapping("/calender")
	public String calender(){
		return "reservation/04";
	}
	
	@RequestMapping("/calender.do")
	@ResponseBody
	public List<Calendar> calender_do(HttpSession session){
		User user = (User)session.getAttribute("user");
		System.out.println(reservationService.getCalender(user.getUserId()).toString());
		return reservationService.getCalender(user.getUserId());
	}
	
	@RequestMapping("cost.do")
	@ResponseBody
	public int[] cost(int hotelNum){
		Reservation reservation1 = (Reservation) reservationService.cost(hotelNum);
		int [] cost = {reservation1.getResvCost(), reservation1.getHotelExtrafee()};
		
		return cost;
	}
	
	
	@RequestMapping("/booking.do")
	public boolean booking_do(){
		
		return true;
	}
	
	
	@RequestMapping("/booking")
	public String booking(Model model, int hotelNum){
		model.addAttribute("hotelNum", hotelNum);
		model.addAttribute("guest", reservationService.guest(hotelNum));
		
		return "reservation/booking";
	}
}
