package SaleBoard;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class SaleUpdateOkCommand implements SaleBoardInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 사진파일에 저장하기 위해서 만듦 (파일주소 , 파일최대크기, 인코딩방식)
		String realPath = request.getServletContext().getRealPath("/images/sale");  //이미지 저장할 파일경로 설정 and 경로를 변수에 담음
		int maxSize = 1024*1024*10; //서버에 저장시킬 파일의 최대용량을 10MB로 제한한다.(1회저장용량)
		String encoding = "UTF-8";
		
		// 파일 업로드 처리... (객체가 생성되면서 바로 파일이 업로드 처리된다.)
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath,maxSize,encoding, new DefaultFileRenamePolicy());
		
		// 업로드된 파일의 정보를 추출해보자...  /   Enumeration : 여러개 파일 넣을 시 적음(열거형으로 처리)
		Enumeration fileNames = multipartRequest.getFileNames(); // getFileNames(): 이미지 여러개 넣었을 때 처리 가능
		String file = "";
		String originalFileName = "";
		String filesystemName ="";
		
		while(fileNames.hasMoreElements()) { //iterator 혹은 Enumeration에 들어있는 것은 이런식으로 값을 가져올 수 있다.
			file = (String)fileNames.nextElement();
			originalFileName = multipartRequest.getOriginalFileName(file);
			filesystemName = multipartRequest.getFilesystemName(file);
			
			System.out.println("원본 파일명 : " + originalFileName);
			System.out.println("서버에 저장된 파일명 : " + filesystemName);
		}
		// "/" 넣은거 빼기
		originalFileName = originalFileName.substring(0, originalFileName.length()-1); //원본파일이름
		filesystemName = filesystemName.substring(0, filesystemName.length()-1);	// 파일에 저장된 이름
		
		// request가 아닌, multipartRequest로 적어주어야 넘긴 값을 받을 수 있음 (enctype="multipart/form-data" 이걸 사용하여 request로 적으면 값을 가져올 수 없음.)
		int fileSize = multipartRequest.getParameter("fileSize")== null ? 0 : Integer.parseInt(multipartRequest.getParameter("fileSize"));
		String title = multipartRequest.getParameter("title")== null ? "" : multipartRequest.getParameter("title");
		String categorys = multipartRequest.getParameter("categorys")== null ? "" : multipartRequest.getParameter("categorys");
		int money = multipartRequest.getParameter("money")== null ? 0 : Integer.parseInt(multipartRequest.getParameter("money"));
		String content = multipartRequest.getParameter("content")== null ? "" : multipartRequest.getParameter("content");
		
		// 현재 접속중인 아이디 가져오기
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		// Back End 체크... 
		
		
		SaleBoardDAO dao = new SaleBoardDAO();
		
		//vo에 가져온 값 담기
		SaleBoardVO vo = new SaleBoardVO();
		vo.setfName(originalFileName);
		vo.setfSName(filesystemName);
		vo.setfSize(fileSize);
		vo.setTitle(title);
		vo.setMoney(money);
		vo.setContent(content);
		vo.setMid(mid);
		vo.setCategory(categorys);
		
		// 게시글 DB에 저장
		int res = dao.setSaleUpdateOk(vo);
		
		if(res != 0) {
			request.setAttribute("msg", "게시물이 등록되었습니다.");
			request.setAttribute("url", "main.ad");
		}
		else {
			request.setAttribute("msg", "게시물 등록에 실패하였습니다.");
			request.setAttribute("url", "saleupdate.sa");
			
		}
		
	}
}
