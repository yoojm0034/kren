package co.yedam.finalprj.letter.serviceImpl;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.stereotype.Repository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import co.yedam.finalprj.letter.service.TransService;
import co.yedam.finalprj.letter.vo.TransVO;

@Repository("transDao")
public class TransServiceImpl implements TransService {

	// 한국어 -> 영어
	@Override
	public String getEn(TransVO vo) {
		String clientId = "X4xlVOUcuQ4i5cf6ObPo";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "0WFpGklAkz";// 애플리케이션 클라이언트 시크릿값";

		String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
		String text;

		String korean = vo.getKr();
		String result = "";
		String line = "";

		try {
			text = URLEncoder.encode(korean, "UTF-8");
			String param = "source=ko&target=en&text=" + text;
			URL url = new URL(apiURL);
			HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setUseCaches(false);
			con.setDefaultUseCaches(false);

			OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream());
			osw.write(param);
			osw.flush();

			int responseCode = con.getResponseCode();
//			result += "responseCode  : " + responseCode;
//			result += "\n";
			// 200코드가 아니면 오류인데 무엇이 오류 인지 디버깅
			if (responseCode != 200) {
				Map<String, List<String>> map = con.getRequestProperties();
				result += "Printing Response Header...\n";
				for (Map.Entry<String, List<String>> entry : map.entrySet()) {
					if (entry.getKey().equals("apikey")) {
						result += "";
					} else {
						result += "Key : " + entry.getKey() + " ,Value : " + entry.getValue();
					}
				}
			}

			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			// 여긴 출력
			while ((line = br.readLine()) != null) {
				result += line + "\n";
			}
			br.close();

		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("인코딩 실패", e);
		} catch (IOException e) {
			result = e.getMessage();
		}

		return result;
	}

	// 영어 -> 한국어
	@Override
	public String getKr(TransVO vo) {
		String clientId = "X4xlVOUcuQ4i5cf6ObPo";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "0WFpGklAkz";// 애플리케이션 클라이언트 시크릿값";

		String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
		String text;

		String english = vo.getEn();
		String result = "";
		String line = "";

		try {
			text = URLEncoder.encode(english, "UTF-8");
			String param = "source=en&target=ko&text=" + text;
			URL url = new URL(apiURL);
			HttpsURLConnection con = (HttpsURLConnection) url.openConnection();
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setUseCaches(false);
			con.setDefaultUseCaches(false);
		
			OutputStreamWriter osw = new OutputStreamWriter(con.getOutputStream());
			osw.write(param);
			osw.flush();

			int responseCode = con.getResponseCode();
//			result += "responseCode  : " + responseCode;
//			result += "\n";
			// 200코드가 아니면 오류인데 무엇이 오류 인지 디버깅
			if (responseCode != 200) {
				Map<String, List<String>> map = con.getRequestProperties();
				result += "Printing Response Header...\n";
				for (Map.Entry<String, List<String>> entry : map.entrySet()) {
					if (entry.getKey().equals("apikey")) {
						result += "";
					} else {
						result += "Key : " + entry.getKey() + " ,Value : " + entry.getValue();
					}
				}
			}

			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			// 여긴 출력
			while ((line = br.readLine()) != null) {
				result += line + "\n";
			}
			br.close();

		} catch (UnsupportedEncodingException e) {
			throw new RuntimeException("인코딩 실패", e);
		} catch (IOException e) {
			result = e.getMessage();
		}
		
		return result;
	}

}
