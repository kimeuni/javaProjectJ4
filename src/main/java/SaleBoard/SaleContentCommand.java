package SaleBoard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberJDAO;
import member.MemberJVO;

public class SaleContentCommand implements SaleBoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		SaleBoardDAO dao = new SaleBoardDAO();
		
		// 클릭한 게시물의 idx값으로 현재 게시물 찾기
		SaleBoardVO vo = dao.getIdxSaleContent(idx);
		
		ArrayList<SaleBoardVO> vos = dao.getOneSaleBoardMidList(vo.getMid());
		
		// 게시글 등록한 사람 정보 가죠오기
		MemberJDAO mDAO = new MemberJDAO();
		
		MemberJVO mVO = mDAO.getLoginMidOk(vo.getMid());
		
		
		request.setAttribute("vo", vo); //게시물 1건 정보
		request.setAttribute("mVO", mVO); //게시물 작성한 유저 정보 1건
		request.setAttribute("vos", vos);
		request.setAttribute("saleSize", vos.size());
	}
}
