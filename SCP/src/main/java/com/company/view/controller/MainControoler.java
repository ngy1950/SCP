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
	// ��ü ��ǰ �ѷ��ֱ�
	@RequestMapping("/index.do")
	public String getProductList(productVO vo, productDAO productDao, Model model) {
		System.out.println("getProductList !! ");
		model.addAttribute("productList", productDao.getProductList(vo));
		return "main.jsp";
	}
	// ��ǰ �˻�
	@RequestMapping("/search.do")
	public String getSearch(productVO vo, productDAO productDao, Model model, HttpServletRequest request) {
		model.addAttribute("productList", productDao.getSearchList(vo, request.getParameter("searchText")));
		return "main.jsp";
	}
	
	// ��ǰ ���� ����
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
	//��ü �Խñ� ��� ����
	@RequestMapping("/getNoticeList.do")
	public String getBoardList(NoticeVO vo, NoticeDAO noticeDAO, Model model) {
		System.out.println("NoticeList.do ===>");
		model.addAttribute("noticeList", noticeDAO.getNoticeList(vo));
		return "q&a.jsp";
	}
	
	//�� �� ��ȸ
	@RequestMapping("/getNotice.do")
	public String getBoard(NoticeVO vo, NoticeDAO noticeDAO, Model model) {
		model.addAttribute("notice", noticeDAO.getNotice(vo));
		return "Noticeboard.jsp";
	}
	
	// �ɼǼ���1
	@RequestMapping("/GetOption.do")
	@ResponseBody
	public List<pdetailVO> GetOption2(pdetailDAO pdetailDAO, Model model, @RequestParam("optionList") String optionList) {
		//model.addAttribute("optionList2", pdetailDAO.GetOption2(optionList));
		List<pdetailVO> list = pdetailDAO.GetOption2(optionList);
		
		return list;
	}
	
	//��ٱ��� ���
	@RequestMapping("/cart.do")
	@ResponseBody
	public void cart(cartVO vo, cartDAO cartDao,Model model, @RequestParam("cartList") String cartList) {
		cartDao.insertCartVO(cartList);		// DB INSERT
	}
	
	//��ٱ��� ��ȸ
	@RequestMapping("/getCartList.do")
	public String getCart(cartVO vo, cartDAO cartDao,Model model) {
		List<cartVO> cartList = new ArrayList<cartVO>();
		cartList = cartDao.getCartList(vo);
		model.addAttribute("Listcart", cartList); 

		return "cart.jsp";
	}
	//��ٱ��� ��ȸ
	@RequestMapping("/delete.do")
	public String deleteCart(cartVO vo, cartDAO cartDao,Model model) {
		cartDao.deleteCart(vo);
		
		return "getCartList.do";
	}
}
