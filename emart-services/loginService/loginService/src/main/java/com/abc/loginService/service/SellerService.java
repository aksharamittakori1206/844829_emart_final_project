package com.abc.loginService.service;

import com.abc.loginService.model.SellerSignupPojo;

public interface SellerService {

	SellerSignupPojo validateSeller(SellerSignupPojo sellerSignupPojo);

	SellerSignupPojo getSeller(Integer sellerId);

	
	

}
