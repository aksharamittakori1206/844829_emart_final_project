package com.abc.BuyerSignupService.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.BuyerSignupService.dao.entity.BuyerSignupEntity;



@Repository
public interface BuyerSignupDao extends JpaRepository<BuyerSignupEntity,Integer>{

}
