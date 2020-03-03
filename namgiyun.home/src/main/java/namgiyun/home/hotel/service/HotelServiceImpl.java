package namgiyun.home.hotel.service;

import java.util.List;

import namgiyun.home.hotel.dao.HotelDao;
import namgiyun.home.hotel.domain.Hotel;
import namgiyun.home.hotel.domain.HotelList;
import namgiyun.home.hotel.domain.MyHotel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HotelServiceImpl implements HotelService{
	@Autowired private HotelDao hotelDao;
	
	@Override
	public List<HotelList> hotelList() {
		System.out.println("===hotelList===");
		return hotelDao.getHotels();
	}
	
	@Override
	public List<MyHotel> myHotelList(String userId) {
		return hotelDao.myHotels(userId);
	}
	
	@Override
	public Hotel hotelInfo(int hotelNum) {
		return hotelDao.getHotel(hotelNum);
	}

	@Override
	public List<HotelList> searchHotelList(Hotel hotel) {
		return hotelDao.searchHotels(hotel);
	}
	
	@Override
	public boolean registerHotel(Hotel hotel) {
		return hotelDao.addHotel(hotel)>0;
	}

	@Override
	public boolean registerDetail(Hotel hotel) {
		return hotelDao.addDetail(hotel)>0;
	}
	
	@Override
	public boolean fixHotel(Hotel hotel) {
		return hotelDao.updateHotel(hotel)>0;
	}

	@Override
	public boolean fixDetail(Hotel hotel) {
		return hotelDao.updateDetail(hotel)>0;
	}
	
	@Override
	public boolean removeHotel(int hotelNum) {
		return hotelDao.delHotel(hotelNum)>0;
	}
}