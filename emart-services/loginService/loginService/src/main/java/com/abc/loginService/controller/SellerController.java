package com.abc.loginService.controller;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.abc.loginService.model.SellerSignupPojo;

import com.abc.loginService.service.SellerService;

@CrossOrigin
@RestController
@RequestMapping("emart")
public class SellerController {
	static Logger LOG = Logger.getLogger(SellerController.class.getClass());

  @Autowired
SellerService sellerService;

  @GetMapping("sellervalidate")
SellerSignupPojo validateSeller(@RequestHeader("Authorization") String data) {
	  BasicConfigurator.configure();
		LOG.info("Entered end point \'emart/sellervalidate \' ");
		LOG.info("Exited end point \'emart/sellervalidate \' ");
	  	  String token[] = data.split(":");
	  	  SellerSignupPojo sellerSignupPojo = new SellerSignupPojo();
	  	sellerSignupPojo.setSellerUsername(token[0]);
	  	sellerSignupPojo.setSellerPassword(token[1]);
		  return sellerService.validateSeller(sellerSignupPojo);
	  
  }
  @GetMapping("/selleritems/{sellerId}")
  SellerSignupPojo getSeller(@PathVariable("sellerId") Integer sellerId) {
	  return sellerService.getSeller(sellerId);
  }
 

}
