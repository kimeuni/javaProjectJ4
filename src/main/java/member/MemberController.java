package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.mem")
public class MemberController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface commend = null;
		String viewPage = "/WEB-INF/member";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		// 로그인 화면 이동
		if(com.equals("/login")) {
			viewPage += "/login.jsp";
		}
		// 회원가입 화면 이동
		else if(com.equals("/join")) {
			viewPage += "/join.jsp";
		}
		// 아이디 찾기 화면 이동
		else if(com.equals("/idFind")) {
			viewPage += "/idFind.jsp";
		}
		// 비밀번호 찾기(임시 비밀번호 발급) 화면 이동
		else if(com.equals("/pwdFind")) {
			viewPage += "/pwdFind.jsp";
		}
		// 아이디 중복 화면 이동
		else if(com.equals("/idCheck")) {
			viewPage += "/idCheck.jsp";
		}
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
