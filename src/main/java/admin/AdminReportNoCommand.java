package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SaleBoard.SaleBoardDAO;

public class AdminReportNoCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int partIdx = request.getParameter("partIdx")==null ? 0 : Integer.parseInt(request.getParameter("partIdx"));
		
		SaleBoardDAO dao = new SaleBoardDAO();
		
		System.out.println(partIdx);
		int res = dao.setDeleteReport(partIdx);
		
		response.getWriter().write(res + "");
	}

}
