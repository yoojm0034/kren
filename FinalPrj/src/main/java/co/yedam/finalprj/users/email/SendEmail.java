package co.yedam.finalprj.users.email;

import java.io.IOException;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/sendEmail.do")
public class SendEmail extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//사용자에게 보낼 메시지를 기입합니다.
		String host = "database-1.cujgaabefr8x.ap-northeast-2.rds.amazonaws.com/lib/";
		String from = "wjsgudals6@gmail.com";
		String to = request.getParameter("email");
		String subject = "KREN - Please confirm your email address.";
		String code = new SHA256().getSHA256(to);
		String content = "Your Code is [" + code + "]";

// SMTP에 접속하기 위한 정보를 기입합니다.

		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "456");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try {
			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF8");
			Transport.send(msg);

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print("오류가 발생했습니다.");
			return;
		}
		response.getWriter().print(code);
	}

}
