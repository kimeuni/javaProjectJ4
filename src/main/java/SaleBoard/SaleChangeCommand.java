package SaleBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SaleChangeCommand implements SaleBoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		// 수정할 게시글 찾기
		SaleBoardDAO dao = new SaleBoardDAO();
		
		SaleBoardVO vo = dao.getIdxSaleContent(idx);
		
		request.setAttribute("vo", vo);
	}

}
