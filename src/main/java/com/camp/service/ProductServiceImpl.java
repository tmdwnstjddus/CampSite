package com.camp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.camp.mapper.ProductMapper;
import com.camp.vo.Criteria;
import com.camp.vo.PTReview;
import com.camp.vo.Product;
import com.camp.vo.ProductFile;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductMapper productMapper;
	

	@Override
	public Product productByProductNo(int productNo) {
		
		Product products = productMapper.selectProductByProductNo(productNo);
		
		return products;
		
	}


	@Override
	public List<ProductFile> prdocutFilesByProductNo(int productNo) {
		
		List<ProductFile> productFile = productMapper.selectProductFilesByProductNo(productNo);
		
		return productFile;
		
	}

	@Override
	public Integer writeProduct(Product product) {
		
		productMapper.insertProduct(product);
		int newProductNo = product.getProductNo();
		
		//대표이미지 등록
		ProductFile titleFile = product.getFile();
		titleFile.setProductNo(newProductNo);
		productMapper.insertProductFile(titleFile);
		
		insertProductFiles(product, newProductNo);
		
		return newProductNo;
		
	}

	@Override
	public ProductFile findProductFile(int productNo) {
		
		ProductFile file = productMapper.selectProductFile(productNo);
		
		return file;
	}

	public void insertProductFiles(Product product, int productNo) {
		
		//다중이미지 등록
		for (ProductFile file : product.getFileList()) {
			file.setProductNo(productNo);
			productMapper.insertProductFile(file);
		}
		
	}

	@Override
	public List<Product> findProductKind(Criteria cri) {
		
		List<Product> products = productMapper.getProductKind(cri);
		return products;
		
	}

	@Override
	public int getKindCnt(String category) {
		
		int Cnt = productMapper.getProductKindCnt(category);
		return Cnt;
		
	}

	@Override
	public List<Product> findProductList(Criteria cri) {
		
		List<Product> products = productMapper.getProductList(cri);
		return products;
	}

	@Override
	public int getListCnt() {
		
		int Cnt = productMapper.getProductListCnt();
		return Cnt;
	}


	@Override
	public void deleteProduct(int productNo) {
		
		productMapper.deleteProduct(productNo);
		
	}


	@Override
	public void deleteProductFile(int productFileNo) {
		
		productMapper.deleteProductFile(productFileNo);
		
	}


	@Override
	public void updateProductFile(ProductFile productFile) {
		
		productMapper.updateProductFile(productFile);
	}

	@Override
	public void updateProduct(Product product) {
		productMapper.updateProduct(product);
		
	}
	
	@Override
	public List<PTReview> productReviewsByProductNo(int productNo) {
		List<PTReview> ptreview = productMapper.selectPTReviewByProductNo(productNo);
		return ptreview;
	}
	
//	@Override
//	public List<CampFile> findCampFilesByCampNo(int campNo) {
//		
//		List<CampFile> campFile = campMapper.selectCampFilesByCampNo(campNo);
//		return campFile;
//		
//	}
//
//	@Override
//	public Camp findCampByCampNo(int campNo) {
//		
//		Camp camp = campMapper.selectCampByCampNo(campNo);
//		return camp;
//		
//	}
//
//
//	@Override
//	public List<Camp> findCampKind(String category) {
//		
//		List<Camp> camps = campMapper.getCampKind(category);
//		return camps;
//		
//	}

	


}

