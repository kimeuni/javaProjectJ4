package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdCheckOkCommend implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
		
		MemberJDAO dao = new MemberJDAO();
		
		// mid 중복 검사
		int res = dao.memberDoubleCheckOk("mid",mid);
		
		response.getWriter().write(res+"");
	}
}
