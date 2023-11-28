package SaleBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.sa")
public class SaleBoardController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SaleBoardInterface command = null;
		String viewPage = "WEB-INF/SaleBoard";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		// 판매 게시글 등록하기 화면
		if(com.equals("/saleupdate")) {
			viewPage += "/saleupdate.jsp";
		}
		// 판매 게시글 등록하기 처리
		else if(com.equals("/saleUpdateOk")) {
			command = new SaleUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/msg.jsp";
		}
		// 올라온 판매 게시글 상세보기
		else if(com.equals("/saleContent")) {
			command = new SaleContentCommand();
			command.execute(request, response);
			viewPage += "/saleContent.jsp";
		}
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
