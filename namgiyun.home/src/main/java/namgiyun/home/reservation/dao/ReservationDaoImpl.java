package namgiyun.home.reservation.dao;

import java.util.Calendar;
import java.util.List;

import namgiyun.home.reservation.dao.mapper.ReservationMapper;
import namgiyun.home.reservation.domain.Reservation;
import namgiyun.home.reservation.domain.ReservationList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReservationDaoImpl implements ReservationDao{
	@Autowired private ReservationMapper reservtionMapper;

	@Override
	public List<Reservation> userReservaton_List(String userId) {
		return reservtionMapper.userReservaton_List(userId);
	}

	@Override
	public int del_reservation(int resvNum) {
		return reservtionMapper.del_reservation(resvNum);
	}

	@Override
	public int del_reservation_lists(int resvNum) {
		return reservtionMapper.del_payments(resvNum);
	}

	@Override
	public int del_payments(int resvNum) {
		return reservtionMapper.del_reservation_lists(resvNum);
	}

	@Override
	public int guest(int hotelNum) {
		return reservtionMapper.guest(hotelNum);
	}

	@Override
	public Reservation cost(int hotelNum) {
		return reservtionMapper.cost(hotelNum);
	}

	@Override
	public int addReservation(Reservation reservation) {
		return reservtionMapper.addReservation(reservation);
	}

	@Override
	public int addReservationList(ReservationList rerservationList) {
		return reservtionMapper.addReservationList(rerservationList) ;
	}

	@Override
	public List<Reservation> hostReservation_List(String userId) {
		return reservtionMapper.hostReservation_List(userId);
	}

	@Override
	public List<Calendar> getCalender(String userId) {
		return reservtionMapper.getCalender(userId);
	}

}
 