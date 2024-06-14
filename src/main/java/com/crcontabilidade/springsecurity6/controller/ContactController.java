package com.crcontabilidade.springsecurity6.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ContactController {

    @GetMapping("/contact")
    public String getAccountDetails() {
        return "Here are the account details from the DB";
    }

}