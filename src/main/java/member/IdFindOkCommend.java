package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IdFindOkCommend implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email")== null ? "" : request.getParameter("email");
		
		MemberJDAO dao = new MemberJDAO();
		
		String res = dao.getMemberMidSearch(email);
				
		response.getWriter().write(res);
	}

}
