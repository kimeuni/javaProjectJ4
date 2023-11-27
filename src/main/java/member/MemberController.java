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
		// 닉네임 중복 화면 이동
		else if(com.equals("/nickCheck")) {
			viewPage += "/nickCheck.jsp";
		}
		// 이메일 중복 화면 이동
		else if(com.equals("/emailCheck")) {
			viewPage += "/emailCheck.jsp";
		}
		// 아이디 중복 처리
		else if(com.equals("/idCheckOk")) {
			commend = new IdCheckOkCommend();
			commend.execute(request, response);
			return;
		}
		// 닉네임 중복 처리
		else if(com.equals("/nickCheckOk")) {
			commend = new NickCheckOkCommend();
			commend.execute(request, response);
			return;
		}
		// 이메일 중복 처리
		else if(com.equals("/emailCheckOk")) {
			commend = new EmailCheckOkCommend();
			commend.execute(request, response);
			return;
		}
		// 회원가입 처리
		else if(com.equals("/joinOk")) {
			commend = new JoinOkCommend();
			commend.execute(request, response);
			viewPage = "/include/msg.jsp";
		}
		// 로그인 처리
		else if(com.equals("/loginOk")) {
			commend = new LoginOkCommend();
			commend.execute(request, response);
			return;
		}
		// 로그아웃 처리
		else if(com.equals("/logout")) {
			commend = new LogoutCommend();
			commend.execute(request, response);
			viewPage = "/include/msg.jsp";
		}
		// 아이디 찾기 처리
		else if(com.equals("/idFindOk")) {
			commend = new IdFindOkCommend();
			commend.execute(request, response);
			return;
		}
		// 임시 비밀번호 발급
		else if(com.equals("/pwdFindOk")) {
			commend = new PwdFindOkCommend();
			commend.execute(request, response);
			return;
		}
		// 유정 계정 설정 화면 이동 (header_hoem.jsp)
		else if(com.equals("/myPage")) {
			viewPage += "/myPage.jsp";
		}
		// 계정정보 비밀번호 변경 화면 이동
		else if(com.equals("/pwdChange")) {
			viewPage += "/pwdChange.jsp";
		}
		// 계정정보 비밀번호 변경 처리
		else if(com.equals("/pwdChangeOk")) {
			commend = new PwdChangeOkCommend();
			commend.execute(request, response);
			return;
		}
		// 계정정보 개인정보 변경 화면 및 로그인한 사람 값 가져가기
		else if(com.equals("/infoChange")) {
			commend = new InfoChangeCommend();
			commend.execute(request, response);
			viewPage += "/infoChange.jsp";
		}
		// 계정정보 개인정보 변경 하기 처리
		else if(com.equals("/infoChangeOk")) {
			commend = new InfoChangeOkCommend();
			commend.execute(request, response);
			return;
		}
		// 계정정보 탈퇴 신청
		else if(com.equals("/userDelCheck")) {
			commend = new UserDelCheckCommend();
			commend.execute(request, response);
			viewPage = "/include/msg.jsp";
		}
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
	
}
