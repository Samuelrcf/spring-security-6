package com.crcontabilidade.springsecurity6.reposiroty;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.crcontabilidade.springsecurity6.model.Customer;

@Repository
public interface CustomerRepository extends CrudRepository<Customer, Long>{

	Customer findByEmail(String email);
}
