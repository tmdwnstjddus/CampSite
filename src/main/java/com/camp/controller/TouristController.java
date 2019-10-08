package com.camp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path = "/upload")
public class TouristController {

	@RequestMapping(path = "/tourist", method = RequestMethod.GET)
	public String touristList() {
		
		return "upload/tourist";
	}
}
