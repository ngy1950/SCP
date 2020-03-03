package namgiyun.home.review.dao.mapper;

import java.util.List;

import namgiyun.home.review.domain.Review;

public interface ReviewMapper {
	List<Review> getReviews(); //후기리스트
	Review getReview(String name); //검색
	int addReview (Review review); //후기 등록
	int delReview (Review review); //후기 삭제
	int updateReview(Review review); //후기 수정
	int idchk (String userId,int hotel_num); //숙박한 사람만 후기 작성
	int star (int star); //별점 계산 
	int chk (String userId);
	Review getinfo (Review review); // getText
}
