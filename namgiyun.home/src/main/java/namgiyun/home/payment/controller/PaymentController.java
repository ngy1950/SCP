package namgiyun.home.payment.controller;

import namgiyun.home.payment.domain.Payment;
import namgiyun.home.payment.kakao.KakaoPay;
import namgiyun.home.payment.service.PaymentService;
import namgiyun.home.reservation.service.ReservationService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PaymentController {
	@Autowired ReservationService reservationService;
	@Autowired PaymentService paymentService;
	KakaoPay kakaopay;

		@RequestMapping("payment/pay.do")
		@Transactional
		@ResponseBody
		public boolean payInsert(Payment payment){
			try {paymentService.joinPay(payment);}
			catch(Exception e){
				e.printStackTrace();
				return false;
			}
			return true;
		}

		@RequestMapping("payment/01")
		public String payment01(){
			return "payment/01";
		}
		
		@RequestMapping("payment/reservation01")
		public String userReservation_02(){
			return "reservation/02";
		}	
		/*
		@RequestMapping("payment/pay.do")
		public String kakaoPay(){
			 System.out.println("kakaoPay post............................................");
		     return "redirect:" + kakaopay.kakaoPayReady();
		}
		*/
}
