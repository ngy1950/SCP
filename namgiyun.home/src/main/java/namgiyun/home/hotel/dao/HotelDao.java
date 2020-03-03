package namgiyun.home.hotel.dao;

import java.util.List;

import namgiyun.home.hotel.domain.Hotel;
import namgiyun.home.hotel.domain.HotelList;
import namgiyun.home.hotel.domain.MyHotel;

public interface HotelDao {
	List<HotelList> getHotels();
	List<MyHotel> myHotels(String userId);
	Hotel getHotel(int hotelNum);
	List<HotelList> searchHotels(Hotel hotel);
	int addHotel(Hotel hotel);
	int addDetail(Hotel hotel);
	int updateHotel(Hotel hotel);
	int updateDetail(Hotel hotel);
	int delHotel(int hotelNum);
}
