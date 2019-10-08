package com.camp.service;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;

import com.camp.vo.Camp;
import com.camp.vo.CampFile;
import com.camp.vo.Criteria;
import com.camp.vo.Rental;
import com.camp.vo.Review;

public interface CampService {

	Camp findCampByCampNo(int campNo);
	List<CampFile> findCampFilesByCampNo(int campNo);
	CampFile findCampFile(int campNo);	
	CampFile findCampFileByCampFileNo(int campFileNo);

	List<Camp> findCampList(Criteria cri);
	
	List<Camp> findCampKind(Criteria cri);
	
	int getListCnt();
	int getKindCnt(String category);

	Integer registerCamp(Camp camp);
	void insertCampFiles(Camp camp, int campNo);		

	void updateCamp(Camp camp);	
	void updateCampFile(CampFile campFile);

	void deleteCamp(int campNo);
	void deleteCampFile(int campFileNo);
	List<Review> selectReviewByCampNo(int campNo);

}
