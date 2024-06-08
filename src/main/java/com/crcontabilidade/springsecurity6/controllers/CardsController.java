package com.crcontabilidade.springsecurity6.controllers;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CardsController {

	@GetMapping("/myCards")
	public String getCardDetails() {
		return "Here are the cards details from the DB";
	}
}