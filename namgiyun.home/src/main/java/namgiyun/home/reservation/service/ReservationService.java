package namgiyun.home.reservation.service;

import java.util.Calendar;
import java.util.List;

import namgiyun.home.reservation.domain.Reservation;
import namgiyun.home.reservation.domain.ReservationList;

public interface ReservationService{
	List<Reservation> userReservaton_List(String userId);
	boolean del_reservation(int resvNum);
	boolean del_reservation_lists(int resvNum);
	boolean del_payments(int resvNum);
	int guest(int hotelNum);
	Reservation cost(int hotelNum);
	boolean addReservation(Reservation reservation);
	boolean addReservationList(ReservationList reservationList);
	List<Reservation> hostReservation_List(String userId);
	List<Calendar> getCalender(String userId);
}