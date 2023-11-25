package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EmailCheckOkCommend implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email")==null? "" : request.getParameter("email");
		
		MemberJDAO dao = new MemberJDAO();
		
		// nickName 중복 검사
		int res = dao.memberDoubleCheckOk("email",email);
		
		response.getWriter().write(res+"");
	}
}
