package com.camp.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.camp.common.Util;
import com.camp.service.CampService;
import com.camp.service.RentService;
import com.camp.vo.Camp;
import com.camp.vo.CampFile;
import com.camp.vo.Criteria;
import com.camp.vo.Member;
import com.camp.vo.PageMaker;
import com.camp.vo.Rental;
import com.camp.vo.Review;


@Controller
@RequestMapping(path = "/camp")
public class CampController {
	
	@InitBinder
	public void allowEmptyDateBinding( WebDataBinder binder )
	{
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	    sdf.setLenient(false);
	    binder.registerCustomEditor( Date.class, new CustomDateEditor( sdf,false));	   
	}
	
	@Autowired
	CampService campService;
	
	@Autowired
	RentService rentService;
	
	
	@RequestMapping(path = "/campList", method = RequestMethod.GET)
	public String campingList(Criteria cri, String category, Model model) {
		
		if(category.equals("숙소")||category.equals("카라반")||category.equals("글램핑")) {
			int kindCnt = campService.getKindCnt(category);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(kindCnt);
			cri.setCategory(category);
			List<Camp> camps = campService.findCampKind(cri);
			for (Camp camp : camps) {
				camp.setFile(campService.findCampFile(camp.getCampNo()));
			}
			model.addAttribute("category", category);
			model.addAttribute("camps", camps);
			model.addAttribute("pageMaker", pageMaker);
		}
		else {
			//조회 결과를 request 객체에 저장 (JSP에서 사용할 수 있도록)
			int listCnt = campService.getListCnt();
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(listCnt);
			List<Camp> camps = campService.findCampList(cri);
			
			for (Camp camp : camps) {
				camp.setFile(campService.findCampFile(camp.getCampNo()));
			}
			model.addAttribute("category", "all");
			model.addAttribute("camps", camps);
			model.addAttribute("pageMaker", pageMaker);
	
		}
		
	    return "camp/campList";
	}
	
	@RequestMapping(path = "/campDetail/{campNo}", method = RequestMethod.GET)
	public String campDetail(@PathVariable int campNo, Model model, HttpSession session) {
		
		Member loginuser = (Member) session.getAttribute("loginuser");
		
		Camp camp = campService.findCampByCampNo(campNo);
		if (camp == null) {
			return "redirect:/camp/campList?category=all";
		}

		List<CampFile> campfiles = campService.findCampFilesByCampNo(campNo);
		List<Review> reviews = campService.selectReviewByCampNo(campNo);
		camp.setFileList((ArrayList<CampFile>) campfiles);
		camp.setFile(campService.findCampFile(camp.getCampNo()));
		
		try {
			ArrayList<Rental> rents = rentService.findRentsByCampNo(campNo);
			
			model.addAttribute("rents", rents);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("camp", camp);
		model.addAttribute("loginuser", loginuser);
		model.addAttribute("reviews", reviews);

		return "camp/campDetail";
	}
	
	@RequestMapping(path = "/campRent", method = RequestMethod.POST)
	@ResponseBody
	public String campRent(Model model, Rental rent, Date startDate, Date endDate, HttpSession session) {
		
		Member loginuser = (Member) session.getAttribute("loginuser");
		rent.setMemberId(loginuser.getMemberId());
		
		rentService.registerRent(rent);
		
		return loginuser.getMemberId();
	}
	
	
	
	@RequestMapping(path = "/campWrite", method = RequestMethod.GET)
	public String campWriteFrom() {

		return "camp/campWrite";
	}
	
	@RequestMapping(path = "/campWrite", method = RequestMethod.POST)
	public String campWrite(Camp camp, MultipartHttpServletRequest req, HttpSession session) {
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resources/camp-files");// 최종 파일 저장 경로
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

					CampFile campFile = new CampFile();
					campFile.setSavedFileName(uniqueFileName);
					campFile.setUserFileName(userFileName);
					campFile.setFlag(true);
					camp.setFile(campFile);
				}
			}

			List<MultipartFile> img = req.getFiles("imgFile");

			if (img != null) {
				File file = new File(path);
				ArrayList<CampFile> files = new ArrayList<CampFile>();

				for (int i = 0; i < img.size(); i++) {
					userFileName = img.get(i).getOriginalFilename();
					if (userFileName.contains("\\")) { // iexplore 경우
						// C:\AAA\BBB\CCC.png -> CCC.png
						userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
					}
					if (userFileName != null && userFileName.length() > 0) { // 내용이 있는 경우

						System.out.println(userFileName + " 업로드");
						// 파일 업로드 소스 여기에 삽입
						String uniqueFileName = Util.makeUniqueFileName(path, userFileName);// 파일이름_1.jpg
						file = new File(path, uniqueFileName);
						img.get(i).transferTo(file);

						CampFile campFile = new CampFile();
						campFile.setSavedFileName(uniqueFileName);
						campFile.setUserFileName(userFileName);
						campFile.setFlag(false);
						files.add(campFile);
						camp.setFileList(files);
					}
				}
			}		
			
			Member loginuer = (Member)session.getAttribute("loginuser");
			camp.setMemberId(loginuer.getMemberId());
			campService.registerCamp(camp);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/camp/campList?category=all";

	}
	
	@RequestMapping(path = "/campUpdate/{campNo}", method = RequestMethod.GET)
	public String campUpdateFrom(@PathVariable int campNo, Model model) {
		
		Camp camp = campService.findCampByCampNo(campNo);
		CampFile titlefile = campService.findCampFile(campNo);
		List<CampFile> campfiles = campService.findCampFilesByCampNo(campNo);
		
		camp.setFile(titlefile);
		camp.setFileList((ArrayList<CampFile>) campfiles);
		
		model.addAttribute("camp", camp);

		return "camp/campUpdate";
	}
	
	@RequestMapping(path = "/campUpdate", method = RequestMethod.POST)
	public String campUpdate(Camp camp, MultipartHttpServletRequest req, HttpSession session, Model model, String category) {
		
		camp.setFile(campService.findCampFile(camp.getCampNo()));
		
		ServletContext application = req.getServletContext();
		String path = application.getRealPath("/resources/camp-files");// 최종 파일 저장 경로
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

					CampFile campFile = new CampFile();
					campFile.setSavedFileName(uniqueFileName);
					campFile.setUserFileName(userFileName);
					campFile.setFlag(true);
					campFile.setCampNo(camp.getCampNo());
					
					campService.updateCampFile(campFile);
					camp.setFile(campFile);
				}
			}

			List<MultipartFile> img = req.getFiles("imgFile");

			if (img != null) {
				File file = new File(path);
				ArrayList<CampFile> files = new ArrayList<CampFile>();

				for (int i = 0; i < img.size(); i++) {
					userFileName = img.get(i).getOriginalFilename();
					if (userFileName.contains("\\")) { // iexplore 경우
						// C:\AAA\BBB\CCC.png -> CCC.png
						userFileName = userFileName.substring(userFileName.lastIndexOf("\\") + 1);
					}
					if (userFileName != null && userFileName.length() > 0) { // 내용이 있는 경우

						System.out.println(userFileName + " 업로드");
						// 파일 업로드 소스 여기에 삽입
						String uniqueFileName = Util.makeUniqueFileName(path, userFileName);// 파일이름_1.jpg
						file = new File(path, uniqueFileName);
						img.get(i).transferTo(file);

						CampFile campFile = new CampFile();
						campFile.setSavedFileName(uniqueFileName);
						campFile.setUserFileName(userFileName);
						campFile.setFlag(false);
						campFile.setCampNo(camp.getCampNo());
						files.add(campFile);
						
						camp.setFileList(files);
						campService.insertCampFiles(camp, camp.getCampNo());
					}
				}
			}		
			campService.updateCamp(camp);
			model.addAttribute("camp", camp);
			model.addAttribute("category", category);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/camp/campDetail/"+ camp.getCampNo();

	}
	

	@RequestMapping(path = "/campDelete/{campNo}", method = RequestMethod.GET)
	public String delete(@PathVariable int campNo) {

		campService.deleteCamp(campNo);

		return "redirect:/camp/campList?category=all";
	}
	
	
	@RequestMapping(path = "/delete-file", method = RequestMethod.GET)
	@ResponseBody
	public String deletefile(int campFileNo, Model model) {
		//데이터베이스에서 파일 정보 조회
		CampFile file = campService.findCampFileByCampFileNo(campFileNo);
		
		//데이터베이스에서 파일 데이터 삭제
		campService.deleteCampFile(campFileNo);

		return "success" ; 
	}
	
	
}
