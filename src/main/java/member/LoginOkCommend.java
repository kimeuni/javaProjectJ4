package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginOkCommend implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String idCheck = request.getParameter("idCheck")==null ? "NO" : request.getParameter("idCheck");
		
		MemberJDAO dao = new MemberJDAO();
		
		// 아이디가 있는지 확인 후 vo에 담기
		MemberJVO vo = dao.getLoginMidOk(mid);
		
		String res = "";
		
		// 작성한 아이디가 존재하지 않으면
		if(vo.getMid() == null || vo.getUserDel().equals("Y") || !vo.getMid().equals(mid) ) {
			res = "3";
		}
		// 비밀번호가 같지 않을시
		else if(!vo.getPwd().equals(pwd)) {
			res = "2";
		}
		else {
			// 1. 세션 저장
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sNickName", vo.getNickName());
			
			// 2. 쿠키 저장
			if(idCheck.equals("save")) {
				Cookie cookie = new Cookie("cMid", mid);
				cookie.setMaxAge(60*60*24*5);
				cookie.setPath("/");
				
				response.addCookie(cookie);
			}
			// 아이디 저장 체크 x시 쿠기 삭제
			else if(idCheck.equals("NO")) {
				Cookie[] cookies = request.getCookies();
				for(int i=0; i<cookies.length; i++) {
					if(cookies[i].getName().equals("cMid")) {
						cookies[i].setMaxAge(0);
						cookies[i].setPath("/");
						
						response.addCookie(cookies[i]);
					}
				}
			}
			
			// 3. 최종방문일 업데이트
			dao.setLoginLastDateUpdate(mid);
			
			res="1";
		}
		
		response.getWriter().write(res);
	}
}
