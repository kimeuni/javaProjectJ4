package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class PwdChangeOkCommend implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String newPwd = request.getParameter("newPwd")==null ? "" : request.getParameter("newPwd");
		String newPwdCheck = request.getParameter("newPwdCheck")==null ? "" : request.getParameter("newPwdCheck");
		
		String str = "";
		
		// 비밀번호 암호화(현재 비밀번호)
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		// 로그인한 세션 sMid 를 가져와서 현재 비밀번호 찾기
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		MemberJDAO dao = new MemberJDAO();
		
		MemberJVO vo = dao.getLoginMidOk(mid);
		
		// null이거나 작성한 비밀번호와 다르면
		if(vo.getPwd() == null ||!vo.getPwd().equals(pwd)) {
			str = "0";
		}
		// 새비밀번호와 새비밀번호 확인 같은지 한번더 체크
		else if(!newPwd.equals(newPwdCheck)) {
			str = "1";
		}
		else {
			// 새 비밀번호 암호화
			newPwd = security.encryptSHA256(newPwd);
			
			// 비밀번호 수정
			int res = dao.setMemberPwdUpdate(mid,newPwd);
			
			if(res == 0) {
				str="2";
			}
			else {
				str="3";
			}
		}
		
		response.getWriter().write(str);
	}
}
