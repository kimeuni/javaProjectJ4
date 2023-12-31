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
import chat.ChatGroupJVO;
import chat.ChatJVO;

public class MainCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		// 메인화면에 뿌릴 판매 게시글들의 리스트를 가져온다.
		SaleBoardDAO dao = new SaleBoardDAO();
		
		// limit 25~40 사이로 하여서 가져오기 (최신순)
		ArrayList<SaleBoardVO> allVOS = dao.getSaleAllList();
		
		
		// 자신이 최근에 찜한 목록 보기
		// 현재 로그인한 사람의 찜 목록 가져오기
		ArrayList<LikeJVO> likeVOS = dao.getMyLikeBoard(mid);
		// 화면에 띄울 게시판 정보 likeVO에서 가져온 saleBoardIdx로 가져오기
		// likeVOS에서 가져온 saleBoardIdx의 값이 여러개이고 그 값들을 saleBoard에서 꺼내야 하기 때문에
		// for문을로 돌려서 VOS에 담아준다.
		ArrayList<SaleBoardVO> saVOS = new ArrayList<SaleBoardVO>();
		for(int i=0; i<likeVOS.size(); i++) {
			SaleBoardVO saVO = new SaleBoardVO();
			saVO = dao.getIdxSaleContent(likeVOS.get(i).getSaleBoardIdx());
			saVOS.add(saVO);
		}
		
		// 현재 로그인한 사람이 등록한 게시물 가져오기
		ArrayList<SaleBoardVO> saleMidVOS = dao.getOneSaleBoardMidList(mid, 0, 0);
		
		// 알림 띄울 내용 가져오기 (찜목록)
		ArrayList<SaleBoardVO> newLike = new ArrayList<SaleBoardVO>();
		for(int i=0; i<saleMidVOS.size(); i++) {
			SaleBoardVO saVO = new SaleBoardVO();
			saVO = dao.getSaleNewLikeCnt(saleMidVOS.get(i).getIdx(),mid);
			if(saVO.getTitle() != null) {
				newLike.add(saVO);
			}
		}
		
		// 알림 띄울 내용 가져오기(채팅)
		ArrayList<ChatJVO> cgVOS = dao.getMsgTotAlarm(mid);
		
		
		request.setAttribute("allVOS", allVOS);
		request.setAttribute("saVOS", saVOS);
		request.setAttribute("likeSize", likeVOS.size());
		request.setAttribute("newLike", newLike);
		request.setAttribute("cgVOS", cgVOS);
		request.setAttribute("newLikeSize", newLike.size());
		request.setAttribute("ChatSize", cgVOS.size());
	}
}
