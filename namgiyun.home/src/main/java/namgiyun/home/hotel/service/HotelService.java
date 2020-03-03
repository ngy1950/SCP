package namgiyun.home.hotel.service;

import java.util.List;

import namgiyun.home.hotel.domain.Hotel;
import namgiyun.home.hotel.domain.HotelList;
import namgiyun.home.hotel.domain.MyHotel;

public interface HotelService {
	List<HotelList> hotelList();
	List<MyHotel> myHotelList(String userId);
	Hotel hotelInfo(int hotelNum);
	List<HotelList> searchHotelList(Hotel hotel);
	boolean registerHotel(Hotel hotel);
	boolean registerDetail(Hotel hotel);
	boolean fixHotel(Hotel hotel);
	boolean fixDetail(Hotel hotel);
	boolean removeHotel(int hotelNum);
}