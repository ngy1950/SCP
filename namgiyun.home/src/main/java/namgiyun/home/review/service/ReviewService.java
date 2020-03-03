package namgiyun.home.review.service;

import java.util.List;

import namgiyun.home.review.domain.Review;

public interface ReviewService {
	List<Review> listReviews(); //후기리스트
	Review getReview(String name); //검색
	boolean joinReview (Review review); //후기 등록
	boolean eraseReview (Review review); //후기 삭제
	boolean fixReview(Review review); //후기 수정
	boolean idchk (String userId,int hotel_num); //숙박한 사람만 후기 작성
	boolean chk(String userId);
	Review getText(Review review);//getText
}
