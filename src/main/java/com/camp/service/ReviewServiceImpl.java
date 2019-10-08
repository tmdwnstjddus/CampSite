package com.camp.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.camp.mapper.ReviewMapper;
import com.camp.vo.CampFile;
import com.camp.vo.Criteria;
import com.camp.vo.PTReview;
import com.camp.vo.PTReviewFile;
import com.camp.vo.Rental;
import com.camp.vo.Review;
import com.camp.vo.ReviewFile;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewMapper reviewMapper;

	@Override
	public void writeReview(Review review) {
		reviewMapper.insertReview(review);
		int newReviewNo = review.getReviewNo();
		
//		대표이미지
		ReviewFile titleFile = review.getFile();
		titleFile.setReviewNo(newReviewNo);
		reviewMapper.insertReviewFile(titleFile);
		
	}

	@Override
	public Review findReviewByRentNo(int rentNo) {
		Review review = reviewMapper.selectReviewByRentNo(rentNo);
		return review;
	}

	@Override
	public ReviewFile findReviewFile(int reviewNo) {
		ReviewFile file = reviewMapper.selectReviewFile(reviewNo);
		return file;
	}

	@Override
	public void updateReviewFile(ReviewFile reviewFile) {
		reviewMapper.updateReviewFile(reviewFile);
		
	}

	@Override
	public void updateReview(Review review) {
		reviewMapper.updateReview(review);
		
	}

	@Override
	public void deleteReview(int reviewNo) {
		reviewMapper.deleteReview(reviewNo);
		
	}

	@Override
	public ReviewFile findReviewFileByReviewFileNo(int reviewFileNo) {
		ReviewFile file = reviewMapper.selectReviewFileByReviewFileNo(reviewFileNo);
		return file;
	}

	@Override
	public void deleteReviewFile(int reviewNo) {
		reviewMapper.deleteReviewFile(reviewNo);
		
	}

	@Override
	public void updateBuyFlag(int buyNo) {
		reviewMapper.BuyFlag(buyNo);
		
	}

	@Override
	public void updateRentFlag(int rentNo) {
		reviewMapper.RentFlag(rentNo);
		
	}
	
	@Override
	public void zeroRentalFlag(int rentNo) {
		reviewMapper.zeroRentFlag(rentNo);
		
	}
	
	///////////product review ///////////////////////////////
	@Override
	public void writeptReview(PTReview ptreview) {
		reviewMapper.insertptReview(ptreview);
		int newptReviewNo = ptreview.getPtreviewNo();
		
//		대표이미지
		PTReviewFile titleFile = ptreview.getFile();
		titleFile.setPtreviewNo(newptReviewNo);
		reviewMapper.insertptReviewFile(titleFile);
		
	}

	@Override
	public PTReview findptReviewByBuyNo(int buyNo) {
		PTReview ptreview = reviewMapper.selectptReviewByBuyNo(buyNo);
		return ptreview;
		
	}

	@Override
	public PTReviewFile findptReviewFile(int ptreviewNo) {
		PTReviewFile file = reviewMapper.selectptReviewFile(ptreviewNo);
		return file;
	}

	@Override
	public void updateptReviewFile(PTReviewFile ptreviewFile) {
		reviewMapper.updateptReviewFile(ptreviewFile);
		
	}

	@Override
	public void updateptReview(PTReview ptreview) {
		reviewMapper.updateptReview(ptreview);
		
	}

	@Override
	public void zeroBuyFlag(int buyNo) {
		reviewMapper.zeroBuyFlag(buyNo);
		
	}

	@Override
	public void deleteptReviewFile(int ptreviewNo) {
		reviewMapper.deleteptReviewFile(ptreviewNo);
		
	}

	@Override
	public void deleteptReview(int ptreviewNo) {
		reviewMapper.deleteptReview(ptreviewNo);
		
	}

	

	

	


}

