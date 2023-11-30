package SaleBoard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberJDAO;
import member.MemberJVO;

public class MyStoreManageCommand implements SaleBoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")== null ? "" : request.getParameter("mid");
		String category = request.getParameter("category")== null ? "" : request.getParameter("category");
		String state = request.getParameter("state")== null ? "" : request.getParameter("state");
		int idx = request.getParameter("idx")== null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String stateChange = request.getParameter("stateChange")== null ? "" : request.getParameter("stateChange");
		int idxUp = request.getParameter("idxUp")== null ? 0 : Integer.parseInt(request.getParameter("idxUp"));
		String myStoreSearch = request.getParameter("myStoreSearch")== null ? "" : request.getParameter("myStoreSearch");
		
		
		SaleBoardDAO saDAO = new SaleBoardDAO();
		ArrayList<SaleBoardVO> saVOS = null;

		// 페이징처리
		int pageSu = request.getParameter("pageSu")== null ? 1 : Integer.parseInt(request.getParameter("pageSu"));
		int pageSize = request.getParameter("pageSize")==null ? 5 : Integer.parseInt(request.getParameter("pageSize"));
		int totRecode = saDAO.getTotRecCnt(mid);
		int totPage = (totRecode%pageSize)== 0 ? (totRecode/pageSize) : (totRecode/pageSize)+1;
		int startIndexNo = (pageSu - 1 ) *pageSize;
		int startNo = totRecode - startIndexNo;
		
		// 블록 페이징 처리
		int blockSize = 3;
		int curBlock = (pageSu-1)/blockSize;
		int lastBlock = (totPage-1)/blockSize;
		
		
		// 판매중/예약중/판매완료 선택박스 업데이트
		saDAO.setSaleStateUpdate(stateChange,idx);
		
		// up누를 시, 해당 게시물 uploadDate를 now()로 바꿔줌
		saDAO.setSaleUploadDateUp(idxUp);
		
		// 화면에 뿌릴 유저 정보 (1건)
		MemberJDAO mDAO = new MemberJDAO();
		MemberJVO mVO = mDAO.getLoginMidOk(mid);
		
		// 화면에 뿌릴 해당 유저가 작성한 상품 글
		if(category.equals("") && state.equals("") && myStoreSearch.equals("")) {
			saVOS = saDAO.getOneSaleBoardMidList(mid,startIndexNo,pageSize);
		}
		else if(!myStoreSearch.equals("")) {
			saVOS = saDAO.getmyStoreSearchList(myStoreSearch,mid,startIndexNo,pageSize);
		}
		// 화면에 뿌릴 현재 상태(판매중,예약중,판매완료)
		else if(!state.equals("")) {
			saVOS = saDAO.getStateList(state,mid,startIndexNo,pageSize);
		}
		
		// 해당 유저의 전체상품 개수를 알기 위해
		ArrayList<SaleBoardVO> saAllVOS = saDAO.getOneSaleBoardMidList(mid,0,0);
		
		// 찜 개수
		ArrayList<LikeJVO> likeVOS = saDAO.getMyLikeBoard(mid);
		
		
		request.setAttribute("mVO", mVO);
		request.setAttribute("saVOS", saVOS);
		request.setAttribute("saleSize", saVOS.size());
		request.setAttribute("likeSize", likeVOS.size());
		request.setAttribute("category", category);
		request.setAttribute("saleAllSize", saAllVOS.size());
		request.setAttribute("state", state);
		
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageSu", pageSu);
		request.setAttribute("totPage", totPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
	}

}
