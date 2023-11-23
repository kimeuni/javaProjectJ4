package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.ad")
public class adminController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		String viewPage = "WEB-INF/admin";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		// 메인화면 보내기 (나중에 DB데이터 가져오기 위해 미리 만들어 놓음)-23.11.23
		if(com.equals("/main")) {
			viewPage = "/WEB-INF/main/main.jsp";
		}
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
