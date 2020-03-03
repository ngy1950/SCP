package namgiyun.home.reservation.dao;

import java.util.Calendar;
import java.util.List;

import namgiyun.home.reservation.domain.Reservation;
import namgiyun.home.reservation.domain.ReservationList;

public interface ReservationDao {
	List<Reservation> userReservaton_List(String userId);
	int del_reservation(int resvNum);
	int del_reservation_lists(int resvNum);
	int del_payments(int resvNum);
	int guest(int hotelNum);		
	Reservation cost(int hotelNum);
	int addReservation(Reservation reservation);
	int addReservationList(ReservationList rerservationList);
	List<Reservation> hostReservation_List(String userId);
	List<Calendar> getCalender(String userId);
}
