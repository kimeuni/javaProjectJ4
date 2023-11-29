package SaleBoard;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteSaleCommand implements SaleBoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String fSName = request.getParameter("fSName")==null ? "" : request.getParameter("fSName");
		
		// 여러개의 파일일때 '/'로 분리처리
		String[] fSNames = fSName.split("/");
		
		// 파일 삭제 처리
		String realPath = request.getServletContext().getRealPath("/images/sale/");
		for(String fName : fSNames) {
			new File(realPath + fName).delete();
		}
		
		// 데이터 베이스에서도 삭제
		SaleBoardDAO dao = new SaleBoardDAO();
		
		int res = dao.setDeleteSale(idx);
		
		if(res == 0) {
			request.setAttribute("msg", "등록한 상품 삭제에 실패하였습니다.");
			request.setAttribute("url", "saleContent.sa?idx="+idx);
		}
		else {
			request.setAttribute("msg", "등록한 상품이 삭제되었습니다.");
			request.setAttribute("url", "main.ad");
		}
		
	}

}
