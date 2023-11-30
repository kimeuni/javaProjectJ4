package chat;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.cht")
public class ChatController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ChatInterface command = null;
		String viewPage = "WEB-INF/chat";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		
		// 채팅 그룹 화면 들어가기
		if(com.equals("/chatGroup")) {
			command = new ChatGroupCommand();
			command.execute(request, response);
			viewPage += "/chatGroup.jsp"; 
		}
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
