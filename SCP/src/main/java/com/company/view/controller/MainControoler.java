package com.company.view.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.SCP.cart.cartDAO;
import com.company.SCP.cart.cartVO;
import com.company.SCP.notic.NoticeDAO;
import com.company.SCP.notic.NoticeVO;
import com.company.SCP.pdetail.pdetailDAO;
import com.company.SCP.pdetail.pdetailVO;
import com.company.SCP.product.productDAO;
import com.company.SCP.product.productVO;
import com.company.SCP.user.UserVO;

@Controller
public class MainControoler {
	// 전체 상품 뿌려주기
	@RequestMapping("/index.do")
	public String getProductList(productVO vo, productDAO productDao, Model model) {
		System.out.println("getProductList !! ");
		model.addAttribute("productList", productDao.getProductList(vo));
		return "main.jsp";
	}
	// 상품 검색
	@RequestMapping("/search.do")
	public String getSearch(productVO vo, productDAO productDao, Model model, HttpServletRequest request) {
		model.addAttribute("productList", productDao.getSearchList(vo, request.getParameter("searchText")));
		return "main.jsp";
	}
	
	// 상품 세부 정보
	@RequestMapping("/getProduct.do")
	public String getProdict(productVO vo, productDAO productDao, pdetailVO pvo, pdetailDAO pdetailDAO, Model model, HttpServletRequest request) {
		System.out.println("getProduct.do !!");
		
		model.addAttribute("product", productDao.getProduct(vo));
		model.addAttribute("optionList", pdetailDAO.GetOption1(pvo));
		return "getProduct.jsp";
	}


	
	@RequestMapping("/getCategory.do")
	public String getCategory(productVO vo, productDAO productDAO, Model model) {
		System.out.println("getCategory.do !!");
		List<productVO> category = productDAO.getCategory(vo);

		model.addAttribute("category",  category.get(0).getCategory());
		model.addAttribute("productList", productDAO.getCategory(vo));
		return "cateProductList.jsp";
	}
	//전체 게시글 목록 보기
	@RequestMapping("/getNoticeList.do")
	public String getBoardList(NoticeVO vo, NoticeDAO noticeDAO, Model model) {
		System.out.println("NoticeList.do ===>");
		model.addAttribute("noticeList", noticeDAO.getNoticeList(vo));
		return "q&a.jsp";
	}
	
	//글 상세 조회
	@RequestMapping("/getNotice.do")
	public String getBoard(NoticeVO vo, NoticeDAO noticeDAO, Model model) {
		model.addAttribute("notice", noticeDAO.getNotice(vo));
		return "Noticeboard.jsp";
	}
	
	// 옵션선택1
	@RequestMapping("/GetOption.do")
	@ResponseBody
	public List<pdetailVO> GetOption2(pdetailDAO pdetailDAO, Model model, @RequestParam("optionList") String optionList) {
		//model.addAttribute("optionList2", pdetailDAO.GetOption2(optionList));
		List<pdetailVO> list = pdetailDAO.GetOption2(optionList);
		
		return list;
	}
	
	//장바구니 담기
	@RequestMapping("/cart.do")
	@ResponseBody
	public void cart(cartVO vo, cartDAO cartDao,Model model, @RequestParam("cartList") String cartList) {
		cartDao.insertCartVO(cartList);		// DB INSERT
	}
	
	//장바구니 조회
	@RequestMapping("/getCartList.do")
	public String getCart(cartVO vo, cartDAO cartDao,Model model) {
		List<cartVO> cartList = new ArrayList<cartVO>();
		cartList = cartDao.getCartList(vo);
		model.addAttribute("Listcart", cartList); 

		return "cart.jsp";
	}
	//장바구니 조회
	@RequestMapping("/delete.do")
	public String deleteCart(cartVO vo, cartDAO cartDao,Model model) {
		cartDao.deleteCart(vo);
		
		return "getCartList.do";
	}
}
