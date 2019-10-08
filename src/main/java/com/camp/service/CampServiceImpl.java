package com.camp.service;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.mapper.CampMapper;
import com.camp.vo.Camp;
import com.camp.vo.CampFile;
import com.camp.vo.Criteria;
import com.camp.vo.Rental;
import com.camp.vo.Review;

@Service
public class CampServiceImpl implements CampService {
	
	@Autowired
	private CampMapper campMapper;

	@Override
	public Camp findCampByCampNo(int campNo) {
		Camp camp = campMapper.selectCampByCampNo(campNo);
		return camp;
	}

	@Override
	public List<CampFile> findCampFilesByCampNo(int campNo) {
		List<CampFile> campFile = campMapper.selectCampFilesByCampNo(campNo);
		return campFile;
	}
	

//	@Override
//	public List<Map<String, Object>> findCampList(Criteria cri) {
//		
//		return (List<Map<String, Object>>)campMapper.getCampList(cri); 
//		
//	}
	
	@Override
	public List<Camp> findCampList(Criteria cri) {
		List<Camp> camps = campMapper.getCampList(cri);
		return camps;
		
	}

	@Override
	public List<Camp> findCampKind(Criteria cri) {
		
		List<Camp> camps = campMapper.getCampKind(cri);
		return camps;
	}

	@Override
	public Integer registerCamp(Camp camp) {
		
		campMapper.insertCamp(camp);
		int newCampNo = camp.getCampNo();
		
//		대표이미지
		CampFile titleFile = camp.getFile();
		titleFile.setCampNo(newCampNo);
		campMapper.insertCampFile(titleFile);
		
		insertCampFiles(camp, newCampNo);
		
		return newCampNo;
		
	}

	@Override
	public int getListCnt() {
		int Cnt = campMapper.getCampListCnt();
		return Cnt;
	}

	
	@Override
	public int getKindCnt(String category) {
		int Cnt = campMapper.getCampKindCnt(category);
		return Cnt;
	}

	
	@Override
	public void insertCampFiles(Camp camp, int campNo) {

//		이미지
		for (CampFile file : camp.getFileList()) {
			file.setCampNo(campNo);
			campMapper.insertCampFile(file);
		}
	}

	@Override
	public CampFile findCampFile(int campNo) {
		CampFile file = campMapper.selectCampFile(campNo);
		return file;
	}
	
	@Override
	public void updateCamp(Camp camp) {
		campMapper.updateCamp(camp);
		
	}

	@Override
	public void updateCampFile(CampFile campFile) {
		campMapper.updateCampFile(campFile);
		
	}

	@Override
	public CampFile findCampFileByCampFileNo(int campFileNo) {
		CampFile file = campMapper.selectCampFileByCampFileNo(campFileNo);
		return file;
	}

	@Override
	public void deleteCamp(int campNo) {
		campMapper.deleteCamp(campNo);
		
	}

	@Override
	public void deleteCampFile(int campFileNo) {
		campMapper.deleteCampFile(campFileNo);
		
	}

	@Override
	public List<Review> selectReviewByCampNo(int campNo) {
		List<Review> review = campMapper.findReviewByCampNo(campNo);
		return review;
	}


}

