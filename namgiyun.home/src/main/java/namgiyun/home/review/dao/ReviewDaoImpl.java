package namgiyun.home.review.dao;

import java.util.List;

import namgiyun.home.review.dao.mapper.ReviewMapper;
import namgiyun.home.review.domain.Review;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Autowired private ReviewMapper reviewMapper;
		
	@Override
	public List<Review> getReviews() {
		return reviewMapper.getReviews();
	}

	@Override
	public Review getReview(String name) {
		return reviewMapper.getReview(name);
	}

	@Override
	public int addReview(Review review) {
		return reviewMapper.addReview(review);
	}

	@Override
	public int delReview(Review review) {
		return reviewMapper.delReview(review);
	}

	@Override
	public int updateReview(Review review) {
		return reviewMapper.updateReview(review);
	}

	@Override
	public int idchk(String userId, int hotel_num) {
		return reviewMapper.idchk(userId, hotel_num);
	}

	@Override
	public int star(int star) {
		return reviewMapper.star(star);
	}

	@Override
	public int chk(String userId) {
		return reviewMapper.chk(userId);
	}

	@Override
	public Review getinfo(Review review) {
		return reviewMapper.getinfo(review);
	}

	
}
