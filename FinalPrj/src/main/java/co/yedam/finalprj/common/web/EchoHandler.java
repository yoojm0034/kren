package co.yedam.finalprj.common.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import co.yedam.finalprj.users.vo.UsersVO;


public class EchoHandler extends TextWebSocketHandler {
	//로그인 한 전체
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 1대1
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();
		
	//서버에 접속이 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessions.add(session);
		
		String senderEmail = getEmail(session);
		userSessionsMap.put(senderEmail , session);
	}
	
	//소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
//		String senderEmail = getEmail(session);
		//모든 유저에게 보낸다 - 브로드 캐스팅
//		for (WebSocketSession sess : sessions) {
//			sess.sendMessage(new TextMessage(senderNickname + ": " +  message.getPayload()));
//		}
		
		//protocol : cmd , 댓글작성자, 게시글 작성자 , seq (reply , user2 , user1 , 12)
		String msg = message.getPayload();
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			
			if(strs != null && strs.length == 5) {
				String cmd = strs[0]; // 알람종류
				String caller = strs[1];  //댓글작성자, 좋아요누른사람, 팔로우누른사람
				String receiver = strs[2]; // 게시글작성자, 팔로우당한사람
				String receiverEmail = strs[3]; //
				String seq = strs[4]; //게시글번호? 
				
				//작성자가 로그인 해서 있다면
				WebSocketSession boardWriterSession = userSessionsMap.get(receiverEmail);
				
				if("reply".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(caller + "님이 " + 
										"<a type='external' href='${pageContext.request.contextPath}/feed.do?seq="+seq+"'>" + seq + "</a> 번 게시글에 댓글을 남겼습니다.");
					boardWriterSession.sendMessage(tmpMsg);
				
				}else if("follow".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(caller + "님이 " + receiver +
							 "님을 팔로우를 시작했습니다.");
					boardWriterSession.sendMessage(tmpMsg);
				//좋아요로 변경	
				}else if("like".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(caller + "님이 " +
										//변수를 하나더 보낼수 없어서 receiver 변수에 member_seq를 넣어서 썼다.
										"<a type='external' href='${pageContext.request.contextPath}/feed.do?feed_id="+seq+"&mentors="+ receiver +"'>" + seq + "</a>를 좋아합니다.");
					boardWriterSession.sendMessage(tmpMsg);
				}
			}
			//편지오는 알람
			if(strs != null && strs.length == 4) {
				String cmd = strs[0];
				String send_name = strs[1];
				String mentor_email = strs[2];
				String letter_seq = strs[3]; //편지번호
				
				// 편지 받은사람이 로그인해있으면
				WebSocketSession mentorSession = userSessionsMap.get(mentor_email);
				if(cmd.equals("apply") && mentorSession != null) {
					TextMessage tmpMsg = new TextMessage(
							send_name + "님이 편지를 보냈습니다. " +"<a type='external' href='${pageContext.request.contextPath}/letterBox.do?letter_id="+ letter_seq+"'>편지함 보기</a>");
					mentorSession.sendMessage(tmpMsg);
				}
			}
		}
	}
	
	//연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//System.out.println("afterConnectionClosed " + session + ", " + status);
		userSessionsMap.remove(session.getId());
		sessions.remove(session);
	}
	
	//웹소켓 email 가져오기
	private String getEmail(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		UsersVO loginUser = (UsersVO)httpSession.get("user");
		
		if(loginUser == null) {
			return session.getId();
		} else {
			return loginUser.getEmail();
		}
	}
}
