package SaleBoard;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.sa")
public class SaleBoardController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SaleBoardInterface command = null;
		String viewPage = "WEB-INF/SaleBoard";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/"),com.lastIndexOf("."));
		
		// 판매 게시글 등록하기 화면
		if(com.equals("/saleupdate")) {
			viewPage += "/saleupdate.jsp";
		}
		// 판매 게시글 등록하기 처리
		else if(com.equals("/saleUpdateOk")) {
			command = new SaleUpdateOkCommand();
			command.execute(request, response);
			viewPage = "/include/msg.jsp";
		}
		// 올라온 판매 게시글 상세보기
		else if(com.equals("/saleContent")) {
			command = new SaleContentCommand();
			command.execute(request, response);
			viewPage += "/saleContent.jsp";
		}
		// 판매 게시글 삭제
		else if(com.equals("/deleteSale")) {
			command = new DeleteSaleCommand();
			command.execute(request, response);
			viewPage = "/include/msg.jsp";
		}
		// 판매 게시글 찜하기
		else if(com.equals("/likeCheck")) {
			command = new LikeCheckCommand();
			command.execute(request, response);
			return;
		}
		// 판매 게시글 찜취소 하기
		else if(com.equals("/likeDelete")) {
			command = new LikeDeleteCommand();
			command.execute(request, response);
			return;
		}
		// 판매 게시글 신고하기
		else if(com.equals("/report")) {
			command = new ReportCommand();
			command.execute(request, response);
			return;
		}
		// 판매 게시글 수정하기 화면 이동
		else if(com.equals("/saleChange")) {
			command = new SaleChangeCommand();
			command.execute(request, response);
			viewPage += "/saleChange.jsp";
		}
		// 판매 게시글 수정하기 처리
		else if(com.equals("/saleChangeOk")) {
			command = new SaleChangeOkCommand();
			command.execute(request, response);
			viewPage = "/include/msg.jsp";
		}
		// 내 상점 (상품) 부분 들어가기
		else if(com.equals("/myStoreSale")) {
			command = new MyStoreSaleCommand();
			command.execute(request, response);
			viewPage += "/myStoreSale.jsp";
		}
		// 내 상점 (찜하기) 부분 들어가기
		else if(com.equals("/myStoreLike")) {
			command = new MyStoreLikeCommand();
			command.execute(request, response);
			viewPage += "/myStoreLike.jsp";
		}
		// 내 상점 (상점) 부분 카테고리 선택박스
		else if(com.equals("/userCategorysChangeSale")) {
			command = new MyStoreSaleCommand();
			command.execute(request, response);
			viewPage += "/myStoreSale.jsp";
		}
		// 내 상점 (상점관리) 부분 들어가기
		else if(com.equals("/myStoreManagement")) {
			command = new MyStoreManageCommand();
			command.execute(request, response);
			viewPage += "/myStoreManagement.jsp";
		}
		// 내 상점 (상점관리) 부분 판매완료... 선택박스
		else if(com.equals("/myStoreManagementSearchStateChang")) {
			command = new MyStoreManageCommand();
			command.execute(request, response);
			viewPage += "/myStoreManagement.jsp";
		}
		// 내 상점 (상점관리) 부분 state 변경 처리
		else if(com.equals("/myStoreManagementstateChange")) {
			command = new MyStoreManageCommand();
			command.execute(request, response);
			viewPage += "/myStoreManagement.jsp";
		}
		// 내 상점 (상점관리) 부분 state 변경 처리
		else if(com.equals("/myStoreMangeUp")) {
			command = new MyStoreManageCommand();
			command.execute(request, response);
			viewPage += "/myStoreManagement.jsp";
		}
		// 내 상점 (상점관리) 부분 검색 처리
		else if(com.equals("/myStoreSearchList")) {
			command = new MyStoreManageCommand();
			command.execute(request, response);
			viewPage += "/myStoreManagement.jsp";
		}
		request.getRequestDispatcher(viewPage).forward(request, response);
	}
}
