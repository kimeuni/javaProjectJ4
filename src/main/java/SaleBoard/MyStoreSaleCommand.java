package SaleBoard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberJDAO;
import member.MemberJVO;

public class MyStoreSaleCommand implements SaleBoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")== null ? "" : request.getParameter("mid");
		
		// 화면에 뿌릴 유저 정보 (1건)
		MemberJDAO mDAO = new MemberJDAO();
		MemberJVO mVO = mDAO.getLoginMidOk(mid);
		
		// 화면에 뿌릴 해당 유저가 작성한 상품 글
		SaleBoardDAO saDAO = new SaleBoardDAO();
		ArrayList<SaleBoardVO> saVOS = saDAO.getOneSaleBoardMidList(mid);
		
		// 해당 유저가 사용한 카테고리
		String categorysName = saDAO.getUserUseCategory(mid);
		
		// 찜 개수
		ArrayList<LikeJVO> likeVOS = saDAO.getMyLikeBoard(mid);
		
		request.setAttribute("mVO", mVO);
		request.setAttribute("saVOS", saVOS);
		request.setAttribute("saleSize", saVOS.size());
		request.setAttribute("likeSize", likeVOS.size());
		request.setAttribute("categorysName", categorysName);
	}

}
