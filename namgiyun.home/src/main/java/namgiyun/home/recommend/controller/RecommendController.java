package namgiyun.home.recommend.controller;



import java.util.List;

import namgiyun.home.recommend.domain.Recommend;
import namgiyun.home.recommend.service.RecommendService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RecommendController {
	@Autowired RecommendService recommendService;
	
	@RequestMapping("listRecommend.do")
	@ResponseBody
	public List<Recommend> listRecommend(){
		return recommendService.listRecommend();
	}
	
	@RequestMapping("joinPing.do")
	@ResponseBody
	public boolean joinPing(Recommend recommend){
		return recommendService.joinPing(recommend);
	}
}
