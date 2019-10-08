package com.camp.service;

import com.camp.vo.PTReview;
import com.camp.vo.PTReviewFile;
import com.camp.vo.Review;
import com.camp.vo.ReviewFile;

public interface ReviewService {
	
	///////////////////////////////////camp review
	void writeReview(Review review);

	Review findReviewByRentNo(int rentNo);

	ReviewFile findReviewFile(int reviewNo);

	void updateReviewFile(ReviewFile reviewFile);

	void updateReview(Review review);

	void deleteReview(int reviewNo);

	ReviewFile findReviewFileByReviewFileNo(int reviewFileNo);

	void deleteReviewFile(int reviewNo);

	void updateBuyFlag(int buyNo);

	void updateRentFlag(int rentNo);
	void zeroRentalFlag(int rentNo);
	
	///////////////////////////////////product review
	void writeptReview(PTReview ptreview);

	PTReview findptReviewByBuyNo(int buyNo);

	PTReviewFile findptReviewFile(int ptreviewNo);

	void updateptReviewFile(PTReviewFile ptreviewFile);

	void updateptReview(PTReview ptreview);

	void zeroBuyFlag(int buyNo);

	void deleteptReviewFile(int ptreviewNo);

	void deleteptReview(int ptreviewNo);
	
	

	
	

}
