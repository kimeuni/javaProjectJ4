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
			command = new MainCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/main/main.jsp";
		}
		// 메인화면에서 검색 처리
		else if(com.equals("/mainSearch")) {
			command = new MainSearchCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/main/mainSearch.jsp";
		}
		// 메인화면에서 카테고리 클릭 시 처리
		else if(com.equals("/mainCategoryOk")) {
			command = new MainCategoryOkCommand();
			command.execute(request, response);
			viewPage = "/WEB-INF/main/mainCategoryOk.jsp";
		}
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
