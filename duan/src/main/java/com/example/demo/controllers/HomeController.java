package com.example.demo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/homeUser")
    private String showHome(){
        return "index";
    }
    /// tesst
}
