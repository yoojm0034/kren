package co.yedam.finalprj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class HomeController {
	
	@RequestMapping("home.do")
	public String home() {
		return "empty/home";
	}

	@RequestMapping("test.do")
	public String test() {
		return "main/test";
	} 

	@RequestMapping("test2.do")
	public String test2() {
		return "main/test2";
	} 
	
}
