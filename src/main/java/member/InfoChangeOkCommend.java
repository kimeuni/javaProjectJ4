package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class InfoChangeOkCommend implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String profile = request.getParameter("profile")==null ? "" : request.getParameter("profile");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		String tel = request.getParameter("tel")==null ? "" : request.getParameter("tel");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		// vo에 담기
		MemberJVO vo = new MemberJVO();
		vo.setProfile(profile);
		vo.setName(name);
		vo.setNickName(nickName);
		vo.setAddress(address);
		vo.setTel(tel);
		vo.setEmail(email);
		vo.setGender(gender);
		
		MemberJDAO dao = new MemberJDAO();
		
		// 개인계정 정보 수정
		int res = dao.setMemberInfoUpdate(vo,mid);
		
		response.getWriter().write(res + "");
	}

}
