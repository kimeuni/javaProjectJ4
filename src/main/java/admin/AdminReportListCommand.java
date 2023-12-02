package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SaleBoard.ReportJVO;
import SaleBoard.SaleBoardDAO;

public class AdminReportListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SaleBoardDAO dao = new SaleBoardDAO();
		
		// 페이징처리
		int pageSu = request.getParameter("pageSu")== null ? 1 : Integer.parseInt(request.getParameter("pageSu"));
		int pageSize = request.getParameter("pageSize")==null ? 10 : Integer.parseInt(request.getParameter("pageSize"));
		int totRecode = dao.getTotReportRecCnt();
		int totPage = (totRecode%pageSize)== 0 ? (totRecode/pageSize) : (totRecode/pageSize)+1;
		int startIndexNo = (pageSu - 1 ) *pageSize;
		int startNo = totRecode - startIndexNo;
		
		// 블록 페이징 처리
		int blockSize = 3;
		int curBlock = (pageSu-1)/blockSize;
		int lastBlock = (totPage-1)/blockSize;
		
		ArrayList<ReportJVO> vos = dao.getReportBoardList(startIndexNo,pageSize);
		
		
		request.setAttribute("vos", vos);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageSu", pageSu);
		request.setAttribute("totPage", totPage);
		request.setAttribute("startNo", startNo);
		request.setAttribute("blockSize", blockSize);
		request.setAttribute("curBlock", curBlock);
		request.setAttribute("lastBlock", lastBlock);
		
	}

}
