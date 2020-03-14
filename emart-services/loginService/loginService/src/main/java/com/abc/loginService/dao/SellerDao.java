package com.abc.loginService.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.loginService.dao.entity.BuyerSignupEntity;
import com.abc.loginService.dao.entity.SellerSignupEntity;

@Repository
public interface SellerDao extends JpaRepository<SellerSignupEntity,Integer> {

	SellerSignupEntity findBySellerUsernameAndSellerPassword(String sellerUsername, String sellerPassword);

}
