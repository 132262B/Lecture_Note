package com.app;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeCtr {

	@RequestMapping(value = "/home")
	public String Home() {
		
		return "board/home";
	}
	
}
