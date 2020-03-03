package namgiyun.home.recommend.dao;

import java.util.List;

import namgiyun.home.recommend.domain.Recommend;

public interface RecommendDao {
	List<Recommend> getRecommends();//좌표 리스트
	int updatePing (Recommend recommend);//추천등록
}
