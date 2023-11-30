package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SaleBoard.SaleBoardDAO;
import SaleBoard.SaleBoardVO;

public class MainSearchCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String search = request.getParameter("search")== null ? "" : request.getParameter("search");
		
		//search로 검색한게 있는지 찾기
		SaleBoardDAO saDAO = new SaleBoardDAO();
		ArrayList<SaleBoardVO> saVOS = saDAO.getmyStoreSearchList(search, "", 0, 0);
		
		//가져온 값 넘기기
		request.setAttribute("saVOS", saVOS);
		request.setAttribute("search", search);
		request.setAttribute("saleSize", saVOS.size());
	}

}
