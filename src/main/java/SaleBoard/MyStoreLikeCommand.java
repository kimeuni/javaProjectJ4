package SaleBoard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import chat.ChatJVO;
import member.MemberJDAO;
import member.MemberJVO;

public class MyStoreLikeCommand implements SaleBoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")== null ? "" : request.getParameter("mid");
		
		// 화면에 뿌릴 유저 정보 (1건)
		MemberJDAO mDAO = new MemberJDAO();
		MemberJVO mVO = mDAO.getLoginMidOk(mid);
		
		// 찜 개수
		SaleBoardDAO saDAO = new SaleBoardDAO();
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
		
		// 화면에 띄울 해당 유저가 작성한 상품 개수
		ArrayList<SaleBoardVO> saCnt = saDAO.getOneSaleBoardMidList(mid,0,0);
		
		request.setAttribute("mVO", mVO);
		request.setAttribute("likeSize", likeVOS.size());
		request.setAttribute("saleAllSize", saCnt.size());
		request.setAttribute("saVOS", saVOS);
		
		HttpSession session = request.getSession();
		String sMid = (String)session.getAttribute("sMid");
		// 현재 로그인한 사람이 등록한 게시물 가져오기
		ArrayList<SaleBoardVO> saleMidVOS = saDAO.getOneSaleBoardMidList(sMid, 0, 0);
		
		// 알림 띄울 내용 가져오기 (찜목록)
		ArrayList<SaleBoardVO> newLike = new ArrayList<SaleBoardVO>();
		for(int i=0; i<saleMidVOS.size(); i++) {
			SaleBoardVO saVO = new SaleBoardVO();
			saVO = saDAO.getSaleNewLikeCnt(saleMidVOS.get(i).getIdx(),sMid);
			if(saVO.getTitle() != null) {
				newLike.add(saVO);
			}
		}
		
		// 알림 띄울 내용 가져오기(채팅)
		ArrayList<ChatJVO> cgVOS = saDAO.getMsgTotAlarm(sMid);
		request.setAttribute("newLike", newLike);
		request.setAttribute("cgVOS", cgVOS);
		request.setAttribute("newLikeSize", newLike.size());
		request.setAttribute("ChatSize", cgVOS.size());
	}
}
