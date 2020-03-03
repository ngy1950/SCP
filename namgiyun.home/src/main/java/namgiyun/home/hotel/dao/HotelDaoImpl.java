package namgiyun.home.hotel.dao;

import java.util.List;

import namgiyun.home.hotel.dao.mapper.HotelMapper;
import namgiyun.home.hotel.domain.Hotel;
import namgiyun.home.hotel.domain.HotelList;
import namgiyun.home.hotel.domain.MyHotel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HotelDaoImpl implements HotelDao{
	@Autowired private HotelMapper hotelMapper;

	public List<HotelList> getHotels() {
		System.out.println("===getHotels===");
		return hotelMapper.getHotels();
	}

	public List<MyHotel> myHotels(String userId) {
		System.out.println("===myHotels===");
		return hotelMapper.myHotels(userId);
	}
	
	@Override
	public Hotel getHotel(int hotelNum) {
		return hotelMapper.getHotel(hotelNum);
	}
	
	@Override
	public List<HotelList> searchHotels(Hotel hotel) {
		return hotelMapper.searchHotels(hotel);
	}
	
	@Override
	public int addHotel(Hotel hotel) {
		return hotelMapper.addHotel(hotel);
	}
	
	@Override
	public int addDetail(Hotel hotel){
		return hotelMapper.addDetail(hotel);
	}

	@Override
	public int updateHotel(Hotel hotel) {
		return hotelMapper.updateHotel(hotel);
	}

	@Override
	public int updateDetail(Hotel hotel) {
		return hotelMapper.updateDetail(hotel);
	}
	
	@Override
	public int delHotel(int hotelNum) {
		return hotelMapper.delHotel(hotelNum);
	}
}