package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SaleBoard.SaleBoardDAO;

public class UserDelCheckCommend implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		MemberJDAO dao = new MemberJDAO();
		
		// 세션에 있는(로그인중인) 아이디를 가져와서 userDel을 Y로 업데이트 처리한다.
		dao.setUserDelUpdate(mid);

		// 회원 탈퇴시 usrDel을 'Y'로 바꾸어 main화면에 나오지 않도록 한다.
		SaleBoardDAO saDAO = new SaleBoardDAO();
		saDAO.setSaleBoardUserDelUpdate(mid);
		
		// 세션 삭제
		session.invalidate();
		
		request.setAttribute("msg", "회원 탈퇴되었습니다.");
		request.setAttribute("url", "main.ad");
	}

}
