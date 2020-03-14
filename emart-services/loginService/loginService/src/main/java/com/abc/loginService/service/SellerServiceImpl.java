package com.abc.loginService.service;

import java.util.HashSet;
import java.util.Set;

import org.apache.log4j.BasicConfigurator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.loginService.dao.SellerDao;
import com.abc.loginService.dao.entity.CategoryEntity;
import com.abc.loginService.dao.entity.ItemEntity;
import com.abc.loginService.dao.entity.SellerSignupEntity;
import com.abc.loginService.dao.entity.SubCategoryEntity;
import com.abc.loginService.model.CategoryPojo;
import com.abc.loginService.model.ItemPojo;
import com.abc.loginService.model.SellerSignupPojo;
import com.abc.loginService.model.SubCategoryPojo;

@Service
public class SellerServiceImpl implements SellerService{
	
	@Autowired
	SellerDao sellerDao;
	
	@Override
	public SellerSignupPojo validateSeller(SellerSignupPojo sellerSignupPojo) {
		//LOG.info("Entered validateSeller() ");
		BasicConfigurator.configure();

		SellerSignupEntity sellerSignupEntity = sellerDao.findBySellerUsernameAndSellerPassword(sellerSignupPojo.getSellerUsername(),
		sellerSignupPojo.getSellerPassword());

		if (sellerSignupEntity != null) {
		Set<ItemEntity> allItemsEntity = sellerSignupEntity.getAllItems();
		Set<ItemPojo> allItems = new HashSet<ItemPojo>();

		for (ItemEntity itemEntity : allItemsEntity) {
		SubCategoryEntity subCategoryEntity = itemEntity.getSubcategory();
		CategoryEntity categoryEntity = subCategoryEntity.getCategory();

		CategoryPojo categoryPojo = new CategoryPojo(
				categoryEntity.getCategoryId(),
				categoryEntity.getCategoryName(),
				categoryEntity.getCategoryBrief()
				);
		SubCategoryPojo subCategoryPojo = new SubCategoryPojo(
				subCategoryEntity.getSubCategoryId(),
				subCategoryEntity.getSubCategoryName(),
				categoryPojo,
				subCategoryEntity.getSubCategoryBrief(),
				subCategoryEntity.getSubCategoryGst());
		ItemPojo itemPojo = new ItemPojo(
		itemEntity.getItemId(),
		itemEntity.getItemName(),
		itemEntity.getItemImage(),
		itemEntity.getItemPrice(),
		itemEntity.getItemStock(),
		itemEntity.getItemDescription(),
		subCategoryPojo,
		itemEntity.getItemRemarks(),
		null);
		allItems.add(itemPojo);
		}
		sellerSignupPojo = new SellerSignupPojo(
		sellerSignupEntity.getSellerId(),
		sellerSignupEntity.getSellerUsername(),
		sellerSignupEntity.getSellerPassword(),
		sellerSignupEntity.getSellerCompany(),
		sellerSignupEntity.getSellerBrief(),
		sellerSignupEntity.getSellerGst(),
		sellerSignupEntity.getSellerAddress(),
		sellerSignupEntity.getSellerEmail(),
		sellerSignupEntity.getSellerContact(),
		sellerSignupEntity.getSellerWebsite(),
		null);


		}
		return sellerSignupPojo;
	}

	@Override
	public SellerSignupPojo getSeller(Integer sellerId) {
		SellerSignupPojo  sellerSignupPojo=null;
		SellerSignupEntity sellerSignupEntity = sellerDao.findById(sellerId).get();

				if (sellerSignupEntity != null) {
				Set<ItemEntity> allItemsEntity = sellerSignupEntity.getAllItems();
				Set<ItemPojo> allItems = new HashSet<ItemPojo>();

				for (ItemEntity itemEntity : allItemsEntity) {
					
				SubCategoryEntity subCategoryEntity = itemEntity.getSubcategory();
				CategoryEntity categoryEntity = subCategoryEntity.getCategory();
				CategoryPojo categoryPojo = new CategoryPojo(
						categoryEntity.getCategoryId(),
						categoryEntity.getCategoryName(),
						categoryEntity.getCategoryBrief()
						);
				SubCategoryPojo subCategoryPojo = new SubCategoryPojo(
						subCategoryEntity.getSubCategoryId(),
						subCategoryEntity.getSubCategoryName(),
						categoryPojo,
						subCategoryEntity.getSubCategoryBrief(),
						subCategoryEntity.getSubCategoryGst());
				ItemPojo itemPojo = new ItemPojo(
				itemEntity.getItemId(),
				itemEntity.getItemName(),
				itemEntity.getItemImage(),
				itemEntity.getItemPrice(),
				itemEntity.getItemStock(),
				itemEntity.getItemDescription(),
				subCategoryPojo,
				itemEntity.getItemRemarks(),
				null);
				allItems.add(itemPojo);
				}
				sellerSignupPojo = new SellerSignupPojo(
				sellerSignupEntity.getSellerId(),
				sellerSignupEntity.getSellerUsername(),
				sellerSignupEntity.getSellerPassword(),
				sellerSignupEntity.getSellerCompany(),
				sellerSignupEntity.getSellerBrief(),
				sellerSignupEntity.getSellerGst(),
				sellerSignupEntity.getSellerAddress(),
				sellerSignupEntity.getSellerEmail(),
				sellerSignupEntity.getSellerContact(),
				sellerSignupEntity.getSellerWebsite(),
				allItems);


				}
				return sellerSignupPojo;
	}

}
