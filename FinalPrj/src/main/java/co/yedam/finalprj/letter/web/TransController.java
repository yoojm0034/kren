package co.yedam.finalprj.letter.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.yedam.finalprj.letter.service.TransService;
import co.yedam.finalprj.letter.vo.TransVO;

@Controller
public class TransController {
	@Autowired
	TransService transDao;

	@RequestMapping("/english")
	@ResponseBody
	public String english(@RequestParam(value = "korean", defaultValue = "-")String korean,
									Model model) throws Exception{		
		TransVO vo = new TransVO();
		vo.setKr(korean);		
		System.out.println(korean);
		String english= transDao.getEn(vo);
		return english;
	}
	
	@RequestMapping("/korean")
	@ResponseBody
	public String korean(@RequestParam(value = "english", defaultValue = "-")String english,
			Model model) throws Exception{		
		TransVO vo = new TransVO();
		vo.setEn(english);		
		System.out.println(english);
		String korean= transDao.getKr(vo);
		return korean;
	}

}
