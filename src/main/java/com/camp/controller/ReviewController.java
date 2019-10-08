package com.camp.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.camp.common.Util;
import com.camp.service.ReviewService;
import com.camp.vo.Buy;
import com.camp.vo.Member;
import com.camp.vo.PTReview;
import com.camp.vo.PTReviewFile;
import com.camp.vo.Rental;
import com.camp.vo.Review;
import com.camp.vo.ReviewFile;

@Controller
@RequestMapping(path = "/review")
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping(path = "/reviewWrite", method = RequestMethod.GET)
	public String reviewWriteFrom(Review review, Model model) {
		
		model.addAttribute("review",review);
		return "review/reviewWrite";
	}
	
	@RequestMapping(path = "/ptreviewWrite", method = RequestMethod.GET)
	public String ptreviewWriteFrom(PTReview ptreview, Model model) {
		
		
		model.addAttribute("ptreview",ptreview);
		return "review/ptreviewWrite";
	}
	
	@RequestMapping(path = "/reviewWrite", method = RequestMethod.POST)
	public String reviewUpload(Review review, MultipartHttpServletRequest req, HttpSession session) {
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resources/review-files");// 최종 파일 저장 경로
		String userFileName = "";
		
		try {
			MultipartFile titleImg = req.getFile("titleImgFile");
			if (titleImg != null) {
				userFileName = titleImg.getOriginalFilename();
				if (userFileName.contains("\\")) { // iexplore 경우
					// C:\AAA\BBB\CCC.png -> CCC.png
					userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
				}
				if (userFileName != null && userFileName.length() > 0) { // 내용이 있는 경우
					if (userFileName.contains("\\")) { // iexplore 경우
						// C:\AAA\BBB\CCC.png -> CCC.png
						userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
					}
					String uniqueFileName = Util.makeUniqueFileName(path, userFileName);// 파일이름_1.jpg
					titleImg.transferTo(new File(path, uniqueFileName));// 파일 저장

					ReviewFile reviewFile = new ReviewFile();
					reviewFile.setSavedFileName(uniqueFileName);
					reviewFile.setUserFileName(userFileName);
					reviewFile.setFlag(true);
					review.setFile(reviewFile);
				}
			}
		
			Member loginuer = (Member)session.getAttribute("loginuser");
			review.setMemberId(loginuer.getMemberId());
			
			reviewService.updateRentFlag(review.getRentNo());
				
			reviewService.writeReview(review);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/member/orderlist?memberId="+review.getMemberId();
	}
	
	@RequestMapping(path = "/ptreviewWrite", method = RequestMethod.POST)
	public String ptreviewUpload(PTReview ptreview, MultipartHttpServletRequest req, HttpSession session) {
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resources/review-files");// 최종 파일 저장 경로
		String userFileName = "";
		
		try {
			MultipartFile titleImg = req.getFile("titleImgFile");
			if (titleImg != null) {
				userFileName = titleImg.getOriginalFilename();
				if (userFileName.contains("\\")) { // iexplore 경우
					// C:\AAA\BBB\CCC.png -> CCC.png
					userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
				}
				if (userFileName != null && userFileName.length() > 0) { // 내용이 있는 경우
					if (userFileName.contains("\\")) { // iexplore 경우
						// C:\AAA\BBB\CCC.png -> CCC.png
						userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
					}
					String uniqueFileName = Util.makeUniqueFileName(path, userFileName);// 파일이름_1.jpg
					titleImg.transferTo(new File(path, uniqueFileName));// 파일 저장

					PTReviewFile ptreviewFile = new PTReviewFile();
					ptreviewFile.setSavedFileName(uniqueFileName);
					ptreviewFile.setUserFileName(userFileName);
					ptreviewFile.setFlag(true);
					ptreview.setFile(ptreviewFile);
				}
			}
		
			Member loginuer = (Member)session.getAttribute("loginuser");
			ptreview.setMemberId(loginuer.getMemberId());
			
			reviewService.updateBuyFlag(ptreview.getBuyNo());
				
			reviewService.writeptReview(ptreview);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/member/orderlist?memberId="+ptreview.getMemberId();
	}
	
	@RequestMapping(path = "/reviewUpdate", method = RequestMethod.GET)
	public String reviewUpdateFrom(int rentNo, Model model) {
		
		Review review = reviewService.findReviewByRentNo(rentNo);
		ReviewFile titlefile = reviewService.findReviewFile(review.getReviewNo());
		
		review.setFile(titlefile);
		
		model.addAttribute("review", review);
		System.out.println(review.getTitle());
		System.out.println(review.getContent());
		

		return "review/reviewUpdate";
	}
	
	@RequestMapping(path = "/ptreviewUpdate", method = RequestMethod.GET)
	public String ptreviewUpdateFrom(int buyNo, Model model) {
		
		PTReview ptreview = reviewService.findptReviewByBuyNo(buyNo);
		PTReviewFile titlefile = reviewService.findptReviewFile(ptreview.getPtreviewNo());
		
		ptreview.setFile(titlefile);
		
		model.addAttribute("ptreview", ptreview);

		return "review/ptreviewUpdate";
	}
	
	@RequestMapping(path = "/reviewUpdate", method = RequestMethod.POST)
	public String campUpdate(Review review, String memberId, MultipartHttpServletRequest req, HttpSession session, Model model) {
		
		review.setFile(reviewService.findReviewFile(review.getReviewNo()));
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resources/review-files");// 최종 파일 저장 경로
		String userFileName = "";
		
		try {
			MultipartFile titleImg = req.getFile("titleImgFile");
			if (titleImg != null) {
				userFileName = titleImg.getOriginalFilename();
				if (userFileName.contains("\\")) { // iexplore 경우
					// C:\AAA\BBB\CCC.png -> CCC.png
					userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
				}
				if (userFileName != null && userFileName.length() > 0) { // 내용이 있는 경우
					if (userFileName.contains("\\")) { // iexplore 경우
						// C:\AAA\BBB\CCC.png -> CCC.png
						userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
					}
					String uniqueFileName = Util.makeUniqueFileName(path, userFileName);// 파일이름_1.jpg
					titleImg.transferTo(new File(path, uniqueFileName));// 파일 저장

					ReviewFile reviewFile = new ReviewFile();
					reviewFile.setSavedFileName(uniqueFileName);
					reviewFile.setUserFileName(userFileName);
					reviewFile.setFlag(true);
					reviewFile.setReviewNo(review.getReviewNo());
					
					reviewService.updateReviewFile(reviewFile);
					review.setFile(reviewFile);
				}
			

			
			}		
			reviewService.updateReview(review);
			model.addAttribute("review", review);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return  "redirect:/member/orderlist?memberId="+memberId;

	}
	
	@RequestMapping(path = "/ptreviewUpdate", method = RequestMethod.POST)
	public String productUpdate(PTReview ptreview, String memberId, MultipartHttpServletRequest req, HttpSession session, Model model) {
		
		ptreview.setFile(reviewService.findptReviewFile(ptreview.getPtreviewNo()));
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resources/review-files");// 최종 파일 저장 경로
		String userFileName = "";
		
		try {
			MultipartFile titleImg = req.getFile("titleImgFile");
			if (titleImg != null) {
				userFileName = titleImg.getOriginalFilename();
				if (userFileName.contains("\\")) { // iexplore 경우
					// C:\AAA\BBB\CCC.png -> CCC.png
					userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
				}
				if (userFileName != null && userFileName.length() > 0) { // 내용이 있는 경우
					if (userFileName.contains("\\")) { // iexplore 경우
						// C:\AAA\BBB\CCC.png -> CCC.png
						userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
					}
					String uniqueFileName = Util.makeUniqueFileName(path, userFileName);// 파일이름_1.jpg
					titleImg.transferTo(new File(path, uniqueFileName));// 파일 저장

					PTReviewFile ptreviewFile = new PTReviewFile();
					ptreviewFile.setSavedFileName(uniqueFileName);
					ptreviewFile.setUserFileName(userFileName);
					ptreviewFile.setFlag(true);
					ptreviewFile.setPtreviewNo(ptreview.getPtreviewNo());
					
					reviewService.updateptReviewFile(ptreviewFile);
					ptreview.setFile(ptreviewFile);
				}
			

			
			}		
			reviewService.updateptReview(ptreview);
			model.addAttribute("ptreview", ptreview);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return  "redirect:/member/orderlist?memberId="+memberId;

	}
	
	@RequestMapping(path = "/reviewDelete", method = RequestMethod.GET)
	public String delete(int rentNo, String memberId) {
		reviewService.zeroRentalFlag(rentNo);
		Review review = reviewService.findReviewByRentNo(rentNo);
		reviewService.deleteReviewFile(review.getReviewNo());
		reviewService.deleteReview(review.getReviewNo());

		return "redirect:/member/orderlist?memberId="+memberId;
	}
	
	@RequestMapping(path = "/ptreviewDelete", method = RequestMethod.GET)
	public String ptdelete(int buyNo, String memberId) {
		reviewService.zeroBuyFlag(buyNo);
		PTReview ptreview = reviewService.findptReviewByBuyNo(buyNo);
		reviewService.deleteptReviewFile(ptreview.getPtreviewNo());
		reviewService.deleteptReview(ptreview.getPtreviewNo());

		return "redirect:/member/orderlist?memberId="+memberId;
	}
	
	
	@RequestMapping(path = "/delete-reviewfile", method = RequestMethod.GET)
	@ResponseBody
	public String deletefile(int reviewFileNo, Model model) {
		//데이터베이스에서 파일 정보 조회
		ReviewFile review = reviewService.findReviewFileByReviewFileNo(reviewFileNo);
		
		//데이터베이스에서 파일 데이터 삭제
		reviewService.deleteReviewFile(reviewFileNo);

		return "success" ; 
	}
	
}
