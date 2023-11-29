package SaleBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LikeCheckCommand implements SaleBoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String likeMid = request.getParameter("likeMid")== null ? "" : request.getParameter("likeMid");
		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		
		SaleBoardDAO dao = new SaleBoardDAO();
		LikeJVO vo = new LikeJVO();
		vo.setLikeMid(likeMid);
		vo.setSaleBoardIdx(idx);
		
		// 찜하기 업데이트 처리
		int res = dao.setLikeUp(vo);
		
		response.getWriter().write(res+"");
	}

}
