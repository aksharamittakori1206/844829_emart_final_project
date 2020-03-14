package com.abc.SellerSignupService.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.SellerSignupService.dao.SellerSignupServiceDao;
import com.abc.SellerSignupService.dao.entity.SellerSignupServiceEntity;
import com.abc.SellerSignupService.model.SellerSignupServicePojo;
import com.abc.SellerSignupService.service.SellerSignupService;

@Service

public class SellerSignupServiceImpl implements SellerSignupService {
	
	static Logger LOG = Logger.getLogger(SellerSignupServiceImpl.class.getClass());
	@Autowired
	SellerSignupServiceDao sellerDao;

	

	@Override
	public SellerSignupServicePojo addSeller(SellerSignupServicePojo sellerPojo) {
		LOG.info("entered addSeller()");
		SellerSignupServiceEntity SellerSignupEntity = new SellerSignupServiceEntity(sellerPojo.getId(),sellerPojo.getUsername(),sellerPojo.getPassword(),
			sellerPojo.getCompany(),sellerPojo.getBrief(),sellerPojo.getGst(),sellerPojo.getAddress(),sellerPojo.getEmail(),sellerPojo.getWebsite(),sellerPojo.getContact());
		sellerDao.save(SellerSignupEntity);
		LOG.info("Exited addSeller()");
		return sellerPojo;

		
	}

}
