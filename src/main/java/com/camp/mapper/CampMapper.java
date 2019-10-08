package com.camp.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.camp.vo.Camp;
import com.camp.vo.CampFile;
import com.camp.vo.Criteria;
import com.camp.vo.Rental;
import com.camp.vo.Review;

@Mapper
public interface CampMapper {

	Camp selectCampByCampNo(int campNo);
	List<CampFile> selectCampFilesByCampNo(int campNo);

	CampFile selectCampFile(int campNo);
	CampFile selectCampFileByCampFileNo(int campFileNo);
	
//	List<Map<String, Object>> getCampList(Criteria cri);
	List<Camp> getCampList(Criteria cri);
	
	List<Camp> getCampKind(Criteria cri);
	
	int getCampListCnt();
	int getCampKindCnt(String category);
	
	int insertCamp(Camp camp);
	void insertCampFile(CampFile titleFile);

	void updateCamp(Camp camp);
	void updateCampFile(CampFile campFile);

	void deleteCamp(int campNo);
	void deleteCampFile(int campFileNo);
	List<Review> findReviewByCampNo(int campNo);
		
}
