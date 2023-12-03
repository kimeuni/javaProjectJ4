package chat;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SaleBoard.SaleBoardDAO;
import SaleBoard.SaleBoardVO;
import member.MemberJDAO;
import member.MemberJVO;

public class ChattingCommand implements ChatInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int saleBoardIdx = request.getParameter("saleBoardIdx")==null? 0 : Integer.parseInt(request.getParameter("saleBoardIdx"));
		String saleMid = request.getParameter("saleMid")==null? "" : request.getParameter("saleMid");
		String myMid = request.getParameter("myMid")==null? "" : request.getParameter("myMid");
		String chat = request.getParameter("chat")== null ? "" : request.getParameter("chat");
		chat = chat.replace("<", "&lt;");  //태그 사용 못하도록 막기 위해 변환
		chat = chat.replace(">", "&gt;");
		
		// 아이디 등록하는 사람을 알기 위한 sMid 세션 가져오기
		HttpSession session = request.getSession();
		String sMid = (String)session.getAttribute("sMid");
		
		ChatDAO chatDAO = new ChatDAO();
		
		//채팅 그룹에 해당하는 내용 vo에 담아서 가져오기
		ChatGroupJVO cgVO = chatDAO.getChatGroupOneInfo(saleBoardIdx,saleMid,myMid);
		
		// 개인 채팅방이 있는지 확인
		int res = chatDAO.getChattingCheck(cgVO);
		
		// 채팅방 만들기(방이 없으면 방 만들기)
		if(res == 0) {
			chatDAO.setChatting(cgVO,sMid);
		}
		// 만약 채팅이 공백이 넘어온다면... 추가 x
		else if(res != 0 && !chat.equals("")) {
			// 채팅 방이 있을 시, 해당 채팅방에 채팅 올라오는 것을 DB에 넣기
			chatDAO.setChattingInputOk(cgVO,chat,sMid);
			
			// 채팅 방에 들어왔을 시, 알람 N으로 업데이트 처리
			chatDAO.setUpdateChatDate(sMid,cgVO.getIdx());
		}
		
		// 화면에 뿌리기 위하여 판매자의 mid를 통하여 판매자 정보를 가져온다.
		MemberJDAO mDAO = new MemberJDAO();
		MemberJVO mVO = mDAO.getLoginMidOk(saleMid);
		
		SaleBoardDAO saDAO = new SaleBoardDAO();
		SaleBoardVO saleVO = saDAO.getIdxSaleContent(saleBoardIdx);
		
		request.setAttribute("saleBoardIdx", saleBoardIdx);
		request.setAttribute("saleMid", saleMid);
		request.setAttribute("myMid", myMid);
		request.setAttribute("chatIdx", cgVO.getIdx());
		request.setAttribute("mVO", mVO);
		request.setAttribute("saleVO", saleVO);
		
		
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
		
		System.out.println(newLike.size());
		
		// 알림 띄울 내용 가져오기(채팅)
		ArrayList<ChatJVO> cgVOS = saDAO.getMsgTotAlarm(mid);
		request.setAttribute("newLike", newLike);
		request.setAttribute("cgVOS", cgVOS);
		request.setAttribute("newLikeSize", newLike.size());
		request.setAttribute("ChatSize", cgVOS.size());
	}
}
