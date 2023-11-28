package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SaleBoard.SaleBoardDAO;
import SaleBoard.SaleBoardVO;

public class MainCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 메인화면에 뿌릴 판매 게시글들의 리스트를 가져온다.
		SaleBoardDAO dao = new SaleBoardDAO();
		
		// limit 25~40 사이로 하여서 가져오기 (최신순)
		ArrayList<SaleBoardVO> allVOS = dao.getSaleAllList();
		
		//카테고리 랜덤 출력
		
		request.setAttribute("allVOS", allVOS);
	}
}
