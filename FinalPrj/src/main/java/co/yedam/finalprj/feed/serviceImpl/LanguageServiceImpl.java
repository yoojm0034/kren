package co.yedam.finalprj.feed.serviceImpl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import javax.net.ssl.HttpsURLConnection;

import org.springframework.stereotype.Repository;

import co.yedam.finalprj.feed.service.LanguageService;
import co.yedam.finalprj.feed.vo.FeedVO;

@Repository("lanDao")
public class LanguageServiceImpl implements LanguageService{

	@Override
	public String transLan(FeedVO vo) {
        String clientId = "hImEpRKaCexIOcEluSRN"; //애플리케이션 클라이언트 아이디값";
        String clientSecret = "eID6HI3PiX"; //애플리케이션 클라이언트 시크릿값";
      
        String apiURL = "https://openapi.naver.com/v1/papago/detectLangs";
        String text;
        
		String una  = vo.getWrite_lan();
        String result = "";
		String line = "";
		
        try {
        	text = URLEncoder.encode(una, "UTF-8");
        	String param =  "query="  + text; 
            URL url1 = new URL(apiURL);
            HttpURLConnection con1 = (HttpsURLConnection) url1.openConnection();
            con1.setRequestProperty("X-Naver-Client-Id", clientId);
			con1.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			con1.setRequestMethod("POST");
			con1.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
			con1.setDoInput(true);
			con1.setDoOutput(true);
			con1.setUseCaches(false);
			con1.setDefaultUseCaches(false);
			
			OutputStreamWriter osw = new OutputStreamWriter(con1.getOutputStream());
			osw.write(param);
			osw.flush();
			
			int responseCode = con1.getResponseCode();

			BufferedReader br = new BufferedReader(new InputStreamReader(con1.getInputStream()));
			// 여긴 출력
			while ((line = br.readLine()) != null) {
				result += line + "\n";
			}
			br.close();
			
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("인코딩 실패", e);
        } catch (IOException e) {
        	result =e.getMessage();
		}

		return result;
	}



	
}
