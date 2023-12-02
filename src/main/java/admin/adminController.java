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
		// 관리자 메뉴 메인화면 이동
		else if(com.equals("/adminHome")) {
			viewPage += "/adminHome.jsp";
		}
		// 어드민 화면 왼쪽(메뉴) view에 띄우기
		else if(com.equals("/adminLeft")) {
			viewPage += "/adminLeft.jsp";
		}
		// 어드민 화면 Content 데이터 처리 후 view띄우기
		else if(com.equals("/adminContent")) {
//			command = new AdminContentCommand();
//			command.execute(request, response);
			
			viewPage += "/adminContent.jsp";
		}
		// 관리자 메뉴 신고관리
		else if(com.equals("/adminReportList")) {
			command = new AdminReportListCommand();
			command.execute(request, response);
			
			viewPage += "/adminReportList.jsp";
		}
		// 관리자 메뉴 신고 , 게시글에 문제 없을 시 신고글만 삭제
		else if(com.equals("/adminReportNo")) {
			command = new AdminReportNoCommand();
			command.execute(request, response);
			return;
		}
		// 관리자 메뉴 신고 , 게시글에 문제 있을 시 글 삭제
		else if(com.equals("/deleteReportSale")) {
			command = new DeleteReportSaleCommand();
			command.execute(request, response);
			return;
		}
		// 관리자 메뉴 회원 리스트 
		else if(com.equals("/memberAllList")) {
			command = new MemberAllListCommand();
			command.execute(request, response);
			viewPage += "/memberAllList.jsp";
		}
		
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
