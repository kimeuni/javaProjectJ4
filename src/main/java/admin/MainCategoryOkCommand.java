package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SaleBoard.LikeJVO;
import SaleBoard.SaleBoardDAO;
import SaleBoard.SaleBoardVO;
import chat.ChatJVO;

public class MainCategoryOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category")== null ? "" : request.getParameter("category");
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		SaleBoardDAO saDAO = new SaleBoardDAO();
		
		// 클릭한 카테고리 가져오기
		ArrayList<SaleBoardVO> saleVOS = saDAO.getCategoryList(category, "", 0, 0);
		
		// 자신이 최근에 찜한 목록 보기
		// 현재 로그인한 사람의 찜 목록 가져오기
		ArrayList<LikeJVO> likeVOS = saDAO.getMyLikeBoard(mid);
		// 화면에 띄울 게시판 정보 likeVO에서 가져온 saleBoardIdx로 가져오기
		// likeVOS에서 가져온 saleBoardIdx의 값이 여러개이고 그 값들을 saleBoard에서 꺼내야 하기 때문에
		// for문을로 돌려서 VOS에 담아준다.
		ArrayList<SaleBoardVO> saVOS = new ArrayList<SaleBoardVO>();
		for(int i=0; i<likeVOS.size(); i++) {
			SaleBoardVO saVO = new SaleBoardVO();
			saVO = saDAO.getIdxSaleContent(likeVOS.get(i).getSaleBoardIdx());
			saVOS.add(saVO);
		}
		
		request.setAttribute("saleVOS", saleVOS);
		request.setAttribute("saleSize", saleVOS.size());
		request.setAttribute("category", category);
		request.setAttribute("saVOS", saVOS);
		request.setAttribute("likeSize", likeVOS.size());
		
		// 현재 로그인한 사람이 등록한 게시물 가져오기
		ArrayList<SaleBoardVO> saleMidVOS = saDAO.getOneSaleBoardMidList(mid, 0, 0);
		
		// 알림 띄울 내용 가져오기 (찜목록)
		ArrayList<SaleBoardVO> newLike = new ArrayList<SaleBoardVO>();
		for(int i=0; i<saleMidVOS.size(); i++) {
			SaleBoardVO saVO = new SaleBoardVO();
			saVO = saDAO.getSaleNewLikeCnt(saleMidVOS.get(i).getIdx(),mid);
			if(saVO.getTitle() != null) {
				newLike.add(saVO);
			}
		}
		
		// 알림 띄울 내용 가져오기(채팅)
		ArrayList<ChatJVO> cgVOS = saDAO.getMsgTotAlarm(mid);
		request.setAttribute("newLike", newLike);
		request.setAttribute("cgVOS", cgVOS);
		request.setAttribute("newLikeSize", newLike.size());
		request.setAttribute("ChatSize", cgVOS.size());
	}

}
