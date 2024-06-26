package com.crcontabilidade.springsecurity6.config;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.crcontabilidade.springsecurity6.model.Authority;
import com.crcontabilidade.springsecurity6.model.Customer;
import com.crcontabilidade.springsecurity6.repository.CustomerRepository;

@Component
public class CrContabilidadeUsernamePasswordAuthenticationProvider implements AuthenticationProvider {

	@Autowired
	CustomerRepository customerRepository;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String username = authentication.getName();
		String pwd = authentication.getCredentials().toString();
		Customer customer = customerRepository.findByEmail(username);
		if (customer != null) {
			if (passwordEncoder.matches(pwd, customer.getPwd())) {
				return new UsernamePasswordAuthenticationToken(username, pwd, getGrantedAuthorities(customer.getAuthorities()));
			} else {
				throw new BadCredentialsException("Invalid password.");
			}
		} else {
			throw new BadCredentialsException("No user registered with this details.");
		}
	}
	
	public List<GrantedAuthority> getGrantedAuthorities(Set<Authority> authorities){
		List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
		for(Authority authority : authorities) {
			grantedAuthorities.add(new SimpleGrantedAuthority(authority.getName()));
		}
		return grantedAuthorities;
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return (UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication));
	}

}
