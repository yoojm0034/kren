package co.yedam.finalprj.common.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import co.yedam.finalprj.push.service.PushService;
import co.yedam.finalprj.push.vo.PushVO;
import co.yedam.finalprj.users.vo.UsersVO;



public class EchoHandler extends TextWebSocketHandler {
	@Autowired
	PushService pushDao;
	
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	// 로그인중인 개별유저
	Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
	//서버에 접속이 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		String senderEmail = getEmail(session);
		if(senderEmail!=null) {	// 로그인 값이 있는 경우만
			System.out.println(senderEmail + "연결 됨");
			users.put(senderEmail, session);   // 로그인중 개별유저 저장
		}
		
	}
	
	//클라이언트가 데이터 전송시
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String senderEmail = getEmail(session);

		//protocol : cmd , 댓글작성자, 게시글 작성자 , seq (reply , user2 , user1 , 12)
		String msg = message.getPayload();
		if(!StringUtils.isEmpty(msg)) {
			String[] strs = msg.split(",");
			
			//댓글, 좋아요, 편지작성시
			if(strs != null && strs.length == 4) {
				String cmd = strs[0]; // 알람종류
				String caller = strs[1];  //댓글작성자, 좋아요누른사람, 팔로우누른사람
				String receiver = strs[2]; // 게시글작성자, 팔로우당한사람
				String seq = strs[3]; //게시글번호? 
				System.out.println(cmd);
				//작성자가 로그인 해서 있다면
				System.out.println(users);
				WebSocketSession boardWriterSession = users.get(receiver);
				//댓글작성시
				if("reply".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(caller + "님이 " + 
										"<a href=feed.do?feed_id="+seq+">" + seq + "</a> 번 게시글에 댓글을 남겼습니다.");
					
					PushVO vo = new PushVO();
					
					vo.setTo_id(receiver);
					vo.setUser_id(caller);
					vo.setMsg("댓글알림");
					vo.setType(cmd);
					vo.setUrl("");
					vo.setContent_id(seq);
					System.out.println(vo);
					//int r = pushDao.insertPush(vo);
					//System.out.println(r + "건 입력");
					
					boardWriterSession.sendMessage(tmpMsg);
				//좋아요누를시	
				}else if("like".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(caller + "님이 " +
										"<a type='external' href='${pageContext.request.contextPath}/feed.do?feed_id="+seq+"&mentors="+ receiver +"'>" + seq + "</a>를 좋아합니다.");
					boardWriterSession.sendMessage(tmpMsg);
				//편지작성시	
				}else if("letter".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(
							caller + "님이 편지를 보냈습니다. " +"<a href=letterBox.do?letter_id="+ seq+">편지함 보기</a>");
					boardWriterSession.sendMessage(tmpMsg);
				}
			}
			//팔로우했을시
			if(strs != null && strs.length == 3) {
				String cmd = strs[0]; // 알람종류
				String caller = strs[1];  //팔로우누른사람
				String receiver = strs[2]; //팔로우당한사람
				
				System.out.println(users);
				WebSocketSession boardWriterSession = users.get(receiver);
				
				if("follow".equals(cmd) && boardWriterSession != null) {
					TextMessage tmpMsg = new TextMessage(caller + "님이 " + receiver +
							 "님을 팔로우를 시작했습니다.");
					boardWriterSession.sendMessage(tmpMsg);
				}	
			}
			
		}
	}
	
	//연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		String senderEmail = getEmail(session);
		if(senderEmail!=null) {	// 로그인 값이 있는 경우만
			System.out.println(senderEmail + " 연결 종료됨");
			users.remove(senderEmail);
			sessions.remove(session);
		}
	}
	
	//웹소켓 email 가져오기
	private String getEmail(WebSocketSession session) {
		
		Map<String, Object> httpSession = session.getAttributes();
		UsersVO loginUser = (UsersVO)httpSession.get("loginvo");
		
		if(loginUser == null) {
			return session.getId();
			
		}else {
			return loginUser.getUser_id();
		}
			
		
		
	}

}