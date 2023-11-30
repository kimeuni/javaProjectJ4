package chat;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChatGroupCommand implements ChatInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int saleBoardIdx = request.getParameter("saleBoardIdx")==null? 0 : Integer.parseInt(request.getParameter("saleBoardIdx"));
		String saleMid = request.getParameter("saleMid")==null? "" : request.getParameter("saleMid");
		String myMid = request.getParameter("myMid")==null? "" : request.getParameter("myMid");
		
		System.out.println(saleBoardIdx);
		System.out.println(saleMid);
		System.out.println(myMid);
		
		// 만들어진 채팅 그룹이 있는지 확인
		ChatDAO dao = new ChatDAO();
		
		// 채팅 그룹이 있는지 확인용
		int res = dao.getChatGroupCheck(saleBoardIdx,saleMid,myMid);
	
		if(res == 0 && !myMid.equals("")) {
			// 채팅 그룹이 없으면 만들기
			dao.setChatGroupInsert(saleBoardIdx,saleMid,myMid);
		}
		
		// 채팅 그룹 화면에 뿌릴 값 리스트 가져오기
		
		
	}
}
