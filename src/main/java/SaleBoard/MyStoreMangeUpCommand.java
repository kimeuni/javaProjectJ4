package SaleBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyStoreMangeUpCommand implements SaleBoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idxUp = request.getParameter("idxUp")== null ? 0 : Integer.parseInt(request.getParameter("idxUp"));
		
		SaleBoardDAO saDAO = new SaleBoardDAO();
		
		// up누를 시, 해당 게시물 uploadDate를 now()로 바꿔줌
		saDAO.setSaleUploadDateUp(idxUp);
		
		response.getWriter().write("1");
	}

}
