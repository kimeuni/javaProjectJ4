package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NickCheckOkCommend implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName")==null? "" : request.getParameter("nickName");
		
		MemberJDAO dao = new MemberJDAO();
		
		// nickName 중복 검사
		int res = dao.memberDoubleCheckOk("nickName",nickName);
		
		response.getWriter().write(res+"");
	}
}
