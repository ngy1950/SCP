package namgiyun.home.recommend.service;

import java.util.List;

import namgiyun.home.recommend.domain.Recommend;

public interface RecommendService {
	List<Recommend> listRecommend(); //추천지리스트
	boolean joinPing (Recommend recommend); //추천지 등록
}
