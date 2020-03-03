package namgiyun.home.recommend.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import namgiyun.home.recommend.dao.mapper.RecommendMapper;
import namgiyun.home.recommend.domain.Recommend;

@Repository
public class RecommendDaoImpl implements RecommendDao {
	@Autowired private RecommendMapper recommendMapper;

	@Override
	public List<Recommend> getRecommends() {
		return recommendMapper.getRecommends();
	}

	@Override
	public int updatePing(Recommend recommend) {
		return recommendMapper.updatePing(recommend);
	}

}
