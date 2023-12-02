package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SaleBoard.SaleBoardDAO;
import SaleBoard.SaleBoardVO;
import chat.ChatJVO;

public class MainCategoryOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category")== null ? "" : request.getParameter("category");
		
		SaleBoardDAO saDAO = new SaleBoardDAO();
		
		// 클릭한 카테고리 가져오기
		ArrayList<SaleBoardVO> saVOS = saDAO.getCategoryList(category, "", 0, 0);
		
		request.setAttribute("saVOS", saVOS);
		request.setAttribute("saleSize", saVOS.size());
		request.setAttribute("category", category);
		
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		// 현재 로그인한 사람이 등록한 게시물 가져오기
		ArrayList<SaleBoardVO> saleMidVOS = saDAO.getOneSaleBoardMidList(mid, 0, 0);
		
		// 알림 띄울 내용 가져오기 (찜목록)
		ArrayList<SaleBoardVO> newLike = new ArrayList<SaleBoardVO>();
		for(int i=0; i<saleMidVOS.size(); i++) {
			SaleBoardVO saVO = new SaleBoardVO();
			saVO = saDAO.getSaleNewLikeCnt(saleMidVOS.get(i).getIdx(),mid);
			newLike.add(saVO);
		}
		
		// 알림 띄울 내용 가져오기(채팅)
		ArrayList<ChatJVO> cgVOS = saDAO.getMsgTotAlarm(mid);
		request.setAttribute("newLike", newLike);
		request.setAttribute("cgVOS", cgVOS);
		request.setAttribute("newLikeSize", newLike.size());
	}

}
