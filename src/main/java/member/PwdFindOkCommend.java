package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class PwdFindOkCommend implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		
		MemberJDAO  dao = new MemberJDAO();
		
		int res = dao.getMemberPwdSearch(mid,email);
		
		String str = "";
		
		if(res == 1) {
			UUID uuid = UUID.randomUUID();
			String pwd = uuid.toString().substring(0,8);
			// 임시 발급된 비밀번호 저장;
			str = pwd;
			
			// 암호화
			SecurityUtil security = new SecurityUtil();
			pwd = security.encryptSHA256(pwd);
			
			// 임시비밀번호 업데이트
			dao.setUpdatePwd(mid,pwd);
			
		}
		else {
			str ="0";
		}
		
		response.getWriter().write(str);
		
	}

}
