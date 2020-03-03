package namgiyun.home.reservation.service;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import namgiyun.home.reservation.dao.ReservationDao;
import namgiyun.home.reservation.domain.Reservation;
import namgiyun.home.reservation.domain.ReservationList;

@Service
public class ReservationServiceImpl implements ReservationService{
	@Autowired ReservationDao reservationDao;

	@Override
	public List<Reservation> userReservaton_List(String userId) {
		return reservationDao.userReservaton_List(userId);
	}

	@Override
	public boolean del_reservation(int resvNum) {
		return reservationDao.del_reservation(resvNum) > 0;
	}

	@Override
	public boolean del_reservation_lists(int resvNum) {
		return reservationDao.del_payments(resvNum) > 0;
	}

	@Override
	public boolean del_payments(int resvNum) {
		return reservationDao.del_reservation_lists(resvNum) > 0;
	}

	@Override
	public int guest(int hotelNum) {
		return reservationDao.guest(hotelNum);
	}

	@Override
	public Reservation cost(int hotelNum) {
		return reservationDao.cost(hotelNum);
	}

	@Override
	public boolean addReservation(Reservation reservation) {
		return reservationDao.addReservation(reservation) > 0;
	}

	@Override
	public boolean addReservationList(ReservationList reservationList) {
		return reservationDao.addReservationList(reservationList) > 0;
	}

	@Override
	public List<Reservation> hostReservation_List(String userId) {
		return reservationDao.hostReservation_List(userId);
	}

	@Override
	public List<Calendar> getCalender(String userId) {
		return reservationDao.getCalender(userId);
	}
}