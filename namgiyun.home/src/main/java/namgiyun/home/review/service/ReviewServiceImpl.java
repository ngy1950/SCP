package namgiyun.home.review.service;

import java.util.List;

import namgiyun.home.review.dao.ReviewDao;
import namgiyun.home.review.domain.Review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired private ReviewDao reviewDao;

	@Override
	public List<Review> listReviews() {
		return reviewDao.getReviews();
	}

	@Override
	public Review getReview(String name) {
		return reviewDao.getReview(name);
	}

	@Override
	public boolean joinReview(Review review) {
		return reviewDao.addReview(review)>0;
	}


	@Override
	public boolean fixReview(Review review) {
		return reviewDao.updateReview(review)>0;
	}

	@Override
	public boolean idchk(String userId, int hotel_num) {
		return reviewDao.idchk(userId, hotel_num)>0;
	}

	@Override
	public boolean chk(String userId) {
		return reviewDao.chk(userId)>0;
	}

	
	public boolean eraseReview(Review review) {
		return reviewDao.delReview(review) > 0;
	}

	@Override
	public Review getText(Review review) {
		return reviewDao.getinfo(review);
	}

}
