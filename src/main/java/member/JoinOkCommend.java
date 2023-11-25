package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class JoinOkCommend implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String profile = request.getParameter("profile")==null ? "" : request.getParameter("profile");
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		String tel = request.getParameter("tel")==null ? "" : request.getParameter("tel");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
		
		MemberJVO vo = new MemberJVO();
		vo.setProfile(profile);
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setNickName(nickName);
		vo.setAddress(address);
		vo.setTel(tel);
		vo.setEmail(email);
		vo.setGender(gender);
		
		
		// 간단 유효성 처리
		if(profile.equals("")) {
			
		}
		else if(mid.equals("") || (mid.length() < 4 && mid.length() > 16 )) {
			
		}
		else if(pwd.equals("") || (pwd.length() < 8 && pwd.length() > 16 )) {
			
		}
		else if(name.equals("") || (name.length() < 2 && name.length() > 10 )) {
			
		}
		else if(nickName.equals("") || (nickName.length() < 2 && nickName.length() > 12 )) {
			
		}
		else if(address.equals("")) {
			
		}
		else if(tel.equals("")) {
			
		}
		else if(email.equals("")) {
			
		}
		else if(gender.equals("")) {
			
		}
		
		// 비밀번호 암호화
		SecurityUtil security = new SecurityUtil();
		security.encryptSHA256(pwd);
		
		MemberJDAO dao = new MemberJDAO();
		
		// 회원가입 처리
		dao.setMemberJoinOk(vo);
	}

}
