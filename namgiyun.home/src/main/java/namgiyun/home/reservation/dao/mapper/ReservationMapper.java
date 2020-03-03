package namgiyun.home.reservation.dao.mapper;

import java.util.Calendar;
import java.util.List;

import namgiyun.home.reservation.domain.Reservation;
import namgiyun.home.reservation.domain.ReservationList;

public interface ReservationMapper {
	List<Reservation> userReservaton_List(String userId);		// 유저 예약목록 조회
	int del_reservation(int resvNum);							// 예약테이블 테이블 삭제
	int del_reservation_lists(int resvNum);						// 예약내역 테이블 삭제
	int del_payments(int resvNum);								// 결제 테이블 삭제
	int guest(int hotelNum);									// 호텔 최대 수용인원 계산
	Reservation cost(int hotelNum);								// 요금 계산
	
	int addReservation(Reservation reservation);				// 예약등록
	int addReservationList(ReservationList rerservationList);	// 예약등록 시 예약내역 추가
	List<Reservation> hostReservation_List(String userId);		// 호스트 예약목록 조회
	List<Calendar> getCalender(String userId);
	
}
