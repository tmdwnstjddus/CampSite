package com.camp.service;

import java.util.List;

import com.camp.vo.Criteria;
import com.camp.vo.PTReview;
import com.camp.vo.Product;
import com.camp.vo.ProductFile;

public interface ProductService {

	Product productByProductNo(int productNo);

	List<ProductFile> prdocutFilesByProductNo(int productNo);

	Integer writeProduct(Product product);

	ProductFile findProductFile(int productNo);

	List<Product> findProductKind(Criteria cri);
	int getKindCnt(String category);

	List<Product> findProductList(Criteria cri);
	int getListCnt();

	void deleteProduct(int productNo);
	void deleteProductFile(int productFileNo);

	void updateProductFile(ProductFile productFile);
	void updateProduct(Product product);
	void insertProductFiles(Product product, int productNo);
	List<PTReview> productReviewsByProductNo(int productNo);
	

	
	//void insertProductFiles(Product product, int productNo);

	//List<CampFile> findCampFilesByCampNo(int campNo);
	
	//Camp findCampByCampNo(int campNo);

	//List<Camp> findCampKind(String category);

}
