package co.yedam.finalprj.friends.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FriendsController {
	
	
	@RequestMapping("friendSearch.do")
	public String feiendSearch() {
		return "friends/friendSearch";
	}
}
