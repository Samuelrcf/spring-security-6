package com.crcontabilidade.springsecurity6.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.crcontabilidade.springsecurity6.model.Customer;
import com.crcontabilidade.springsecurity6.reposiroty.CustomerRepository;

@Service
public class CrContabilidadeUserDetails implements UserDetailsService{

	@Autowired
	CustomerRepository customerRepository;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		String userName, password = null;
		List<GrantedAuthority> authorities = null;
		Customer customer = customerRepository.findByEmail(username);
		if(customer == null) {
			throw new UsernameNotFoundException("User details not found for the user: " + username);
		}else {
			userName = customer.getEmail();
			password = customer.getPwd();
			authorities = new ArrayList<>();
			authorities.add(new SimpleGrantedAuthority(customer.getRole()));
		}
		return new User(userName,password,authorities);
	}
}
