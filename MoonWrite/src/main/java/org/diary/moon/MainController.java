package org.diary.moon;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/")
	public String main() {
		return "main";
	}
	
	
	
}
