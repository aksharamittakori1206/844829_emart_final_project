package com.abc.SellerSignupService.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.SellerSignupService.dao.entity.SellerSignupServiceEntity;

@Repository

public interface SellerSignupServiceDao extends JpaRepository<SellerSignupServiceEntity,Integer> {

}
