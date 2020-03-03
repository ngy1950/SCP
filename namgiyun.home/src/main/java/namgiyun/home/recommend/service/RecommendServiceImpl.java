package namgiyun.home.recommend.service;

import java.util.List;

import namgiyun.home.recommend.dao.RecommendDao;
import namgiyun.home.recommend.domain.Recommend;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecommendServiceImpl implements RecommendService {
	@Autowired private RecommendDao recommendDao;

	@Override
	public List<Recommend> listRecommend() {
		return recommendDao.getRecommends();
	}

	@Override
	public boolean joinPing(Recommend recommend) {
		return recommendDao.updatePing(recommend)>0;
	}
}
