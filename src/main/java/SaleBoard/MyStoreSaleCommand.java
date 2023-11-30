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
		String category = request.getParameter("category")== null ? "" : request.getParameter("category");
		String state = request.getParameter("state")== null ? "" : request.getParameter("state");
		
		SaleBoardDAO saDAO = new SaleBoardDAO();
		ArrayList<SaleBoardVO> saVOS = null;
		// 화면에 뿌릴 유저 정보 (1건)
		MemberJDAO mDAO = new MemberJDAO();
		MemberJVO mVO = mDAO.getLoginMidOk(mid);
		
		// 화면에 뿌릴 해당 유저가 작성한 상품 글
		if(category.equals("") && state.equals("")) {
			saVOS = saDAO.getOneSaleBoardMidList(mid,0,0);
		}
		else if(!state.equals("")) {
			saVOS = saDAO.getStateList(state,mid,0,0);
		}
		else if(!category.equals("")) {
			//선택한 카테고리에 따라 리스트 출력 다르게
			saVOS = saDAO.getCategoryList(category,mid,0,0);
		}
		
		// 해당 유저의 전체상품 개수를 알기 위해
		ArrayList<SaleBoardVO> saAllVOS = saDAO.getOneSaleBoardMidList(mid,0,0);
		
		// 해당 유저가 사용한 카테고리
		ArrayList<String> categorysName = saDAO.getUserUseCategory(mid);
		
		// 찜 개수
		ArrayList<LikeJVO> likeVOS = saDAO.getMyLikeBoard(mid);
		
		
		request.setAttribute("mVO", mVO);
		request.setAttribute("saVOS", saVOS);
		request.setAttribute("saleSize", saVOS.size());
		request.setAttribute("likeSize", likeVOS.size());
		request.setAttribute("categorysName", categorysName);
		request.setAttribute("category", category);
		request.setAttribute("saleAllSize", saAllVOS.size());
		request.setAttribute("state", state);
	}

}
