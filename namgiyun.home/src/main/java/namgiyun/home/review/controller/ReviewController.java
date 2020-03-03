package namgiyun.home.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import namgiyun.home.review.domain.Review;
import namgiyun.home.review.service.ReviewService;
import namgiyun.home.user.domain.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ReviewController {
	@Autowired
	ReviewService reviewService;

	// review
	@RequestMapping("review/01")
	public String reviewreview() {
		return "review/review";
	}

	@RequestMapping("review/02")
	public String review02(Model model) {
		System.out.println(reviewService.listReviews());
		model.addAttribute("list", reviewService.listReviews());
		return "review/reviewlist";
	}

	@RequestMapping("review/03")
	public String review03() {
		return "review/03";
	}
	
	@RequestMapping("review/recopopup")
	public String reviewrecopopup() {
		return "review/recopopup";
	}

	/* 기능 */
	@RequestMapping("/review/reviewjoin.do")
	@ResponseBody
	public boolean joinReview(Review review, HttpSession session) {
		System.out.println("reviewjoin.do");
		User user = (User) session.getAttribute("user");
		System.out.println(user.toString());
		review.setUserId(user.getUserId());
		String cont = review.getRevContent();

		System.out.println(review.toString());
		System.out.println("joinReview ===>");
		return reviewService.joinReview(review);
	}

	@RequestMapping("list.do")
	@ResponseBody
	public List<Review> list(Model model) {
		System.out.println("list.do===>");
		System.out.println(reviewService.listReviews());
		model.addAttribute("list", reviewService.listReviews());
		return reviewService.listReviews();
	}

	@RequestMapping("get.do")
	@ResponseBody
	public Review getReview(String name) {
		return reviewService.getReview(name);
	}

	@RequestMapping("/review/erase.do")
	@ResponseBody
	public boolean eraseReview(Review review, HttpSession session) throws Exception {
		System.out.println("/review/erase.do===>");
		
		User user = (User) session.getAttribute("user");
		System.out.println(review.toString());
		
		return reviewService.eraseReview(review);
	}

	@RequestMapping("/review/fix.do")
	@ResponseBody
	public boolean fixReview(Review review, HttpSession session) {
		System.out.println("/review/update.do===>");
		User user =(User)session.getAttribute("user");
		
		return reviewService.fixReview(review);
	}
	
	@RequestMapping("/review/getText.do")
	@ResponseBody
	public Review getText(Review review, Model model, HttpSession session){
		System.out.println(review.toString());
		
		User user = (User)session.getAttribute("user");
		System.out.println(user.toString());
		model.addAttribute("text", reviewService.getText(review));
		return reviewService.getText(review);
	}
}
