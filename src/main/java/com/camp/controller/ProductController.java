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
import com.camp.service.ProductService;
import com.camp.vo.Criteria;
import com.camp.vo.Member;
import com.camp.vo.PTReview;
import com.camp.vo.PageMaker;
import com.camp.vo.Product;
import com.camp.vo.ProductFile;

@Controller
@RequestMapping(path = "/product")
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@RequestMapping(path = "/productList", method = RequestMethod.GET)
	public String productListForm(Criteria cri, String category, Model model) {
		
		if(category.equals("텐트and탑프")||category.equals("침낭and매트리스")||category.equals("그릴and화로")||category.equals("버너and랜턴")||category.equals("취사도구")) {
			int kindCnt = productService.getKindCnt(category);
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(kindCnt);
			cri.setCategory(category);
			List<Product> products = productService.findProductKind(cri);
			for (Product product : products) {
				product.setFile(productService.findProductFile(product.getProductNo()));
			}
			model.addAttribute("category", category);
			model.addAttribute("products", products);
			model.addAttribute("pageMaker", pageMaker);
		}
		else {
			//조회 결과를 request 객체에 저장 (JSP에서 사용할 수 있도록)
			int listCnt = productService.getListCnt();
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(listCnt);
			List<Product> products = productService.findProductList(cri);
			
			for (Product product : products) {
				product.setFile(productService.findProductFile(product.getProductNo()));
			}
			model.addAttribute("category", "all");
			model.addAttribute("products", products);
			model.addAttribute("pageMaker", pageMaker);
	
		}
		
		return "product/productList";
		
	}
	
	@RequestMapping(path = "/productWrite", method = RequestMethod.GET)
	public String productWriteForm() {

		return "product/productWrite";
	}
	
	@RequestMapping(path = "/productWrite", method = RequestMethod.POST)
	public String productWrite(Product product, MultipartHttpServletRequest req, HttpSession session) {
		
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

					ProductFile productFile = new ProductFile();
					productFile.setSavedFileName(uniqueFileName);
					productFile.setUserFileName(userFileName);
					productFile.setFlag(true);
					product.setFile(productFile);
				}
			}

			List<MultipartFile> img = req.getFiles("imgFile");

			if (img != null) {
				File file = new File(path);
				ArrayList<ProductFile> files = new ArrayList<ProductFile>();

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

						ProductFile productFile = new ProductFile();
						productFile.setSavedFileName(uniqueFileName);
						productFile.setUserFileName(userFileName);
						productFile.setFlag(false);
						files.add(productFile);
						product.setFileList(files);
					}
				}
			}		
			
			Member loginuer = (Member)session.getAttribute("loginuser");
			product.setMemberId(loginuer.getMemberId());
			productService.writeProduct(product);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/product/productList?category=all";

	}
	
	@RequestMapping(path = "/productDetail/{productNo}", method = RequestMethod.GET)
	public String productDetail(@PathVariable int productNo, Model model) {
		
		Product products = productService.productByProductNo(productNo);
		List<ProductFile> productfiles = productService.prdocutFilesByProductNo(productNo);
		List<PTReview> ptreviews = productService.productReviewsByProductNo(productNo);
		
		products.setFileList((ArrayList<ProductFile>) productfiles);
		
		model.addAttribute("product", products);
		model.addAttribute("ptreview", ptreviews);
		return "product/productDetail";
			
	}
	
	@RequestMapping(path = "/productUpdate/{productNo}", method = RequestMethod.GET)
	public String productUpdateFrom(@PathVariable int productNo, Model model) {
		
		Product product = productService.productByProductNo(productNo);
		ProductFile titlefile = productService.findProductFile(productNo);
		List<ProductFile> productfiles = productService.prdocutFilesByProductNo(productNo);
		
		product.setFile(titlefile);
		product.setFileList((ArrayList<ProductFile>) productfiles);
		
		model.addAttribute("product", product);

		return "product/productUpdate";
	}
	
	@RequestMapping(path = "/productUpdate", method = RequestMethod.POST)
	public String productUpdate(Product product, MultipartHttpServletRequest req, HttpSession session, Model model) {
		
		product.setFile(productService.findProductFile(product.getProductNo()));
		
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

					ProductFile productFile = new ProductFile();
					productFile.setSavedFileName(uniqueFileName);
					productFile.setUserFileName(userFileName);
					productFile.setFlag(true);
					productFile.setProductNo(product.getProductNo());
					
					productService.updateProductFile(productFile);
					product.setFile(productFile);
				}
			}

			List<MultipartFile> img = req.getFiles("imgFile");

			if (img != null) {
				File file = new File(path);
				ArrayList<ProductFile> files = new ArrayList<ProductFile>();

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

						ProductFile productFile = new ProductFile();
						productFile.setSavedFileName(uniqueFileName);
						productFile.setUserFileName(userFileName);
						productFile.setFlag(false);
						productFile.setProductNo(product.getProductNo());
						files.add(productFile);
						
						product.setFileList(files);
						productService.insertProductFiles(product, product.getProductNo());
					}
				}
			}		
			productService.updateProduct(product);
			model.addAttribute("product", product);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/product/productDetail/"+ product.getProductNo();

	}
	
	@RequestMapping(path = "/productDelete/{productNo}", method = RequestMethod.GET)
	public String delete(@PathVariable int productNo) {

		productService.deleteProduct(productNo);

		return "redirect:/product/productList?category=all";
	}
	
	@RequestMapping(path = "/delete-file", method = RequestMethod.GET)
	@ResponseBody
	public String deletefile(int productFileNo, Model model) {
		
		//데이터베이스에서 파일 데이터 삭제
		productService.deleteProductFile(productFileNo);

		return "success" ; 
	}
}
