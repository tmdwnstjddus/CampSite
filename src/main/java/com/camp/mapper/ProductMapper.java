package com.camp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.camp.vo.Criteria;
import com.camp.vo.PTReview;
import com.camp.vo.Product;
import com.camp.vo.ProductFile;

@Mapper
public interface ProductMapper {
	
	Product selectProductByProductNo(int productNo);

	List<ProductFile> selectProductFilesByProductNo(int productNo);
	
	ProductFile selectProductFile(int productNo);

	int insertProduct(Product product);

	void insertProductFile(ProductFile titleFile);

	List<Product> getProductKind(Criteria cri);
	int getProductKindCnt(String category);

	List<Product> getProductList(Criteria cri);
	int getProductListCnt();

	void deleteProduct(int productNo);
	void deleteProductFile(int productFileNo);

	void updateProductFile(ProductFile productFile);
	void updateProduct(Product product);
	List<PTReview> selectPTReviewByProductNo(int productNo);
	
//	List<CampFile> selectCampFilesByCampNo(int campNo);
//	
//	Camp selectCampByCampNo(int campNo);
//	
//	List<Camp> getCampKind(String category);

		
}
