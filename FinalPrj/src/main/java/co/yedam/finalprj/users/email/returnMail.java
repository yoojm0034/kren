package co.yedam.finalprj.users.email;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import co.yedam.finalprj.qna.service.QnaService;
import co.yedam.finalprj.qna.vo.QnaVO;

@Controller
public class returnMail {
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	QnaService qnaDao;
	
	@RequestMapping("admin/returnMail.do")
    public String returnMail(HttpServletRequest req, QnaVO vo) throws Exception{
        //제목
		String title = req.getParameter("title");
		//받는사람이메일
		String rEmail = req.getParameter("returnEmail");
		//보내는 사람 이메일
		String sEmail = req.getParameter("sendEmail");
		//내용
		String contents = req.getParameter("content");
		
        String subject = title;
        String content = contents;
        String from = sEmail;
        String to = rEmail;
        
        try {
            MimeMessage mail = mailSender.createMimeMessage();
            MimeMessageHelper mailHelper = new MimeMessageHelper(mail,true,"UTF-8");
            // true는 멀티파트 메세지를 사용하겠다는 의미
            
            /*
             * 단순한 텍스트 메세지만 사용시엔 아래의 코드도 사용 가능 
             * MimeMessageHelper mailHelper = new MimeMessageHelper(mail,"UTF-8");
             */
            
            mailHelper.setFrom(from);
            // 빈에 아이디 설정한 것은 단순히 smtp 인증을 받기 위해 사용 따라서 보내는이(setFrom())반드시 필요
            // 보내는이와 메일주소를 수신하는이가 볼때 모두 표기 되게 원하신다면 아래의 코드를 사용하시면 됩니다.
            //mailHelper.setFrom("보내는이 이름 <보내는이 아이디@도메인주소>");
            mailHelper.setTo(to);
            mailHelper.setSubject(subject);
            mailHelper.setText(content, true);
            // true는 html을 사용하겠다는 의미입니다.
            /*
             * 단순한 텍스트만 사용하신다면 다음의 코드를 사용하셔도 됩니다. mailHelper.setText(content);
             */
            mailSender.send(mail);
            //문의사항테이블 답변완료로 처리
            int r = qnaDao.qnaUpdate(vo);
            System.out.println(r + "건 수정");
            
        } catch(Exception e) {
            e.printStackTrace();
        }
        return "redirect:userQnaList.do";
    }
	
}
