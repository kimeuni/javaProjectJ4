package SaleBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReportCommand implements SaleBoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String part = request.getParameter("part")== null ? "" : request.getParameter("part");
		int partIdx = request.getParameter("partIdx")== null ? 0 : Integer.parseInt(request.getParameter("partIdx"));
		String cpMid = request.getParameter("cpMid")== null ? "" : request.getParameter("cpMid");
		String title = request.getParameter("title")== null ? "" : request.getParameter("title");
		String cpContent = request.getParameter("cpContent")== null ? "" : request.getParameter("cpContent");
		String cpContOther = request.getParameter("cpContOther")== null ? "" : request.getParameter("cpContOther");
		
		ReportJVO vo = new ReportJVO();
		vo.setPart(part);
		vo.setPartIdx(partIdx);
		vo.setCpMid(cpMid);
		vo.setTitle(title);
		if(cpContent.equals("기타")) {
			vo.setCpContent(cpContOther);
		}
		else {
			vo.setCpContent(cpContent);
		}
		
		SaleBoardDAO dao = new SaleBoardDAO();
		
		int res = dao.setReportInsert(vo);
		
		response.getWriter().write(res + "");
	}

}
