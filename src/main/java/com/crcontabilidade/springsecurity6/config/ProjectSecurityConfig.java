package com.crcontabilidade.springsecurity6.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class ProjectSecurityConfig {

	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
		http
		.csrf((csrf) -> csrf.disable())
		.authorizeHttpRequests((requests)->requests
			.requestMatchers("/myAccount","/myBalance","/myLoans","/myCards").authenticated()
			.requestMatchers("/notices","/contact","/register").permitAll())
		.formLogin(Customizer.withDefaults())
		.httpBasic(Customizer.withDefaults());
		return http.build();
	}
	
	/*
	@Bean
	InMemoryUserDetailsManager userDetailsService() {
		UserDetails admin = User.withDefaultPasswordEncoder() //uses the default method to encoder -> DelegatingPasswordEncoder
				.username("admin")
				.password("12345")
				.authorities("admin")
				.build();
		UserDetails user = User.withDefaultPasswordEncoder()
				.username("user")
				.password("12345")
				.authorities("read")
				.build();
		return new InMemoryUserDetailsManager(admin,user);
	}*/
	
	/*@Bean
	InMemoryUserDetailsManager userDetailsService() {
		UserDetails admin = User.withUsername("admin")
				.password("12345")
				.authorities("admin")
				.build();
		UserDetails user = User.withUsername("user")
				.password("12345")
				.authorities("read")
				.build();
		return new InMemoryUserDetailsManager(admin,user);
	}*/
	
	/*
	 * @Bean UserDetailsService userDetailsService(DataSource dataSource) { return
	 * new JdbcUserDetailsManager(dataSource); }
	 */
	
	@Bean
	PasswordEncoder passwordEncoder() {
		return NoOpPasswordEncoder.getInstance();
	}
	
}
