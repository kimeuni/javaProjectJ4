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
		
		// 백엔드 간단 유효성 처리
		if(profile.equals("")) {
			request.setAttribute("msg", "회원가입시 문제가 발생하였습니다.(프로필)");
			request.setAttribute("url", "main.ad");
		}
		else if(mid.equals("") || (mid.length() < 4 && mid.length() > 16 )) {
			request.setAttribute("msg", "회원가입시 문제가 발생하였습니다.(아이디)");
			request.setAttribute("url", "main.ad");
		}
		else if(pwd.equals("") || (pwd.length() < 8 && pwd.length() > 16 )) {
			request.setAttribute("msg", "회원가입시 문제가 발생하였습니다.(비밀번호)");
			request.setAttribute("url", "main.ad");
		}
		else if(name.equals("") || (name.length() < 2 && name.length() > 10 )) {
			request.setAttribute("msg", "회원가입시 문제가 발생하였습니다.(성명)");
			request.setAttribute("url", "main.ad");
		}
		else if(nickName.equals("") || (nickName.length() < 2 && nickName.length() > 12 )) {
			request.setAttribute("msg", "회원가입시 문제가 발생하였습니다.(닉네임)");
			request.setAttribute("url", "main.ad");
		}
		else if(address.equals("")) {
			request.setAttribute("msg", "회원가입시 문제가 발생하였습니다.(주소)");
			request.setAttribute("url", "main.ad");
		}
		else if(tel.equals("")) {
			request.setAttribute("msg", "회원가입시 문제가 발생하였습니다.(전화번호)");
			request.setAttribute("url", "main.ad");
		}
		else if(email.equals("")) {
			request.setAttribute("msg", "회원가입시 문제가 발생하였습니다.(이메일)");
			request.setAttribute("url", "main.ad");
		}
		else if(gender.equals("")) {
			request.setAttribute("msg", "회원가입시 문제가 발생하였습니다.(성별)");
			request.setAttribute("url", "main.ad");
		}
		
		// 비밀번호 암호화
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		// vo에 담기
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
		
		MemberJDAO dao = new MemberJDAO();
		
		// 회원가입 처리
		int res = dao.setMemberJoinOk(vo);
		
		if(res == 0) {
			request.setAttribute("msg", "회원가입에 실패하셨습니다.");
			request.setAttribute("url", "join.mem");
		}
		else {
			request.setAttribute("msg", "회원가입되었습니다.");
			request.setAttribute("url", "main.ad");
		}
	}

}
