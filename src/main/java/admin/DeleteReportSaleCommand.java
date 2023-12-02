package admin;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SaleBoard.SaleBoardDAO;

public class DeleteReportSaleCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("partIdx")==null ? 0 : Integer.parseInt(request.getParameter("partIdx"));
		String fSName = request.getParameter("fSName")==null ? "" : request.getParameter("fSName");
		
		// 여러개의 파일일때 '/'로 분리처리
		String[] fSNames = fSName.split("/");
		
		// 파일 삭제 처리
		String realPath = request.getServletContext().getRealPath("/images/sale/");
		for(String fName : fSNames) {
			new File(realPath + fName).delete();
		}
		
		SaleBoardDAO dao = new SaleBoardDAO();
		
		// 해당 게시물 신고 삭제
		String part = "saleBoard";
		dao.setReportSaleDeleteAll(idx,part);
		
		// 해당 게시물 찜 삭제
		dao.setLikeSaleDeleteAll(idx);
		
		// 데이터 베이스 삭제
		int res = dao.setDeleteSale(idx);
		
		response.getWriter().write(res + "");
		
	}

}
