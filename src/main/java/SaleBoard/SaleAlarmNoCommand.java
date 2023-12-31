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

public class SaleAlarmNoCommand implements SaleBoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		SaleBoardDAO dao = new SaleBoardDAO();
		
		// 게시글 조회수 1 증가시키기(중복불허)
		HttpSession session = request.getSession();
		ArrayList<String> boardContentIdx = (ArrayList)session.getAttribute("sBoardContentIdx");
		//처음 들어가면 세션이 없기 때문에 세션을 만든다.
		if(boardContentIdx == null) {  
			boardContentIdx = new ArrayList<String>();
		}
		String imsiContentIdx = "saleBoard" + idx; //만약 다른 게시판을 처리하고 싶으면 "board" + idx 이런식으로 하면 된다
		// imsiContentIdx의 값이 있는지 없는지 확인하기 위해 contains로 비교(indexOf로 찾아도 상관 없음)
		if(!boardContentIdx.contains(imsiContentIdx)) {
			// 게시글의 값이 안들어가 있으면..(게시글에 처음 들어감)  DB에서 조회수 값을 올린다. 
			dao.setSaleBoardViewCntPlus(idx);
			boardContentIdx.add(imsiContentIdx); // ArrayList에 추가해준다.
		}
		// ArrayList에 추가된 것을 세션에 담는다.
		session.setAttribute("sBoardContentIdx", boardContentIdx);
		
		// 찜한 알림 삭제
		dao.setLikeAlarmNo(idx);
		
		// 현재 게시글 찜한 사람 있는지 확인 및 찜개수 받아오기
		int likeCnt = dao.getlikeCnt(idx);
		
		
		// 총 찜 개수 업데이트
		dao.setTotLikeUpdate(likeCnt,idx);
		
		
		// 현재 상품 게시글에 누가 찜을 했는지 확인
		String mid = (String)session.getAttribute("sMid");
		LikeJVO likeVO = dao.getWhoLikeMid(idx,mid);
		
		
		// 클릭한 게시물의 idx값으로 현재 게시물 찾기
		SaleBoardVO vo = dao.getIdxSaleContent(idx);
		
		
		// 현재 게시물 작성한 유저가 어떤 게시글을 적었는지 전체 보기 
		ArrayList<SaleBoardVO> vos = dao.getOneSaleBoardMidList(vo.getMid(),0,0);
		
		
		// 게시글 등록한 사람 정보 가져오기
		MemberJDAO mDAO = new MemberJDAO();
		MemberJVO mVO = mDAO.getLoginMidOk(vo.getMid());
		
		
		request.setAttribute("vo", vo); //게시물 1건 정보
		request.setAttribute("mVO", mVO); //게시물 작성한 유저 정보 1건
		request.setAttribute("likeVO", likeVO); 
		request.setAttribute("vos", vos);
		request.setAttribute("saleSize", vos.size());
		
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
		request.setAttribute("newLike", newLike);
		request.setAttribute("cgVOS", cgVOS);
		request.setAttribute("newLikeSize", newLike.size());
		request.setAttribute("ChatSize", cgVOS.size());
	}

}
