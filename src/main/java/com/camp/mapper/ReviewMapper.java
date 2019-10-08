package com.camp.mapper;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.camp.vo.Camp;
import com.camp.vo.CampFile;
import com.camp.vo.Criteria;
import com.camp.vo.PTReview;
import com.camp.vo.PTReviewFile;
import com.camp.vo.Rental;
import com.camp.vo.Review;
import com.camp.vo.ReviewFile;

@Mapper
public interface ReviewMapper {
 /////////////////////////////////camp review//////////////////////////
	void insertReview(Review review);

	void insertReviewFile(ReviewFile titleFile);

	Review selectReviewByRentNo(int rentNo);

	ReviewFile selectReviewFile(int reviewNo);

	void updateReviewFile(ReviewFile reviewFile);

	void updateReview(Review review);

	void deleteReview(int reviewNo);

	ReviewFile selectReviewFileByReviewFileNo(int reviewFileNo);

	void deleteReviewFile(int reviewNo);

	void BuyFlag(int buyNo);

	void RentFlag(int rentNo);
	void zeroRentFlag(int rentNo);
	//////////////////////////////////product review////////////////////////
	void insertptReview(PTReview ptreview);

	void insertptReviewFile(PTReviewFile titleFile);

	PTReview selectptReviewByBuyNo(int buyNo);

	PTReviewFile selectptReviewFile(int ptreviewNo);

	void updateptReviewFile(PTReviewFile ptreviewFile);

	void updateptReview(PTReview ptreview);

	void zeroBuyFlag(int buyNo);

	void deleteptReviewFile(int ptreviewNo);

	void deleteptReview(int ptreviewNo);
	
	

	
	
		
}
