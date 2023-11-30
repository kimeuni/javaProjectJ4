package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SaleBoard.SaleBoardDAO;
import SaleBoard.SaleBoardVO;

public class MainCategoryOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category")== null ? "" : request.getParameter("category");
		
		SaleBoardDAO saDAO = new SaleBoardDAO();
		
		// 클릭한 카테고리 가져오기
		ArrayList<SaleBoardVO> saVOS = saDAO.getCategoryList(category, "", 0, 0);
		
		request.setAttribute("saVOS", saVOS);
		request.setAttribute("saleSize", saVOS.size());
		request.setAttribute("category", category);
	}

}
