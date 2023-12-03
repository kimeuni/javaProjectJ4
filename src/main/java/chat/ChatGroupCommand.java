package chat;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SaleBoard.SaleBoardDAO;
import SaleBoard.SaleBoardVO;

public class ChatGroupCommand implements ChatInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int saleBoardIdx = request.getParameter("saleBoardIdx")==null? 0 : Integer.parseInt(request.getParameter("saleBoardIdx"));
		String saleMid = request.getParameter("saleMid")==null? "" : request.getParameter("saleMid");
		String myMid = request.getParameter("myMid")==null? "" : request.getParameter("myMid");
		
		
		SaleBoardDAO saDAO = new SaleBoardDAO();
		// 만들어진 채팅 그룹이 있는지 확인
		ChatDAO dao = new ChatDAO();
		
		// 채팅 그룹이 있는지 확인용
		int res = dao.getChatGroupCheck(saleBoardIdx,saleMid,myMid);
	
		if(res == 0 && !myMid.equals("") && saleBoardIdx !=0 ) {
			// 채팅 그룹이 없으면 만들기
			dao.setChatGroupInsert(saleBoardIdx,saleMid,myMid);
		}
		
		// 채팅 그룹 화면에 뿌릴 값 리스트 가져오기
		ArrayList<ChatGroupJVO> cgListVOS = dao.getChatGroupList(myMid);
		
		request.setAttribute("cgListVOS", cgListVOS);
		request.setAttribute("saleBoardIdx", saleBoardIdx);
		request.setAttribute("saleMid", saleMid);
		request.setAttribute("myMid", myMid);
		
		
		
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
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
