package SaleBoard;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class SaleChangeOkCommand implements SaleBoardInterface {

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
			
		}
		// "/" 넣은거 빼기
		//filesystemName = filesystemName.substring(0, filesystemName.length()-1);	// 파일에 저장된 이름
		
		// request가 아닌, multipartRequest로 적어주어야 넘긴 값을 받을 수 있음 (enctype="multipart/form-data" 이걸 사용하여 request로 적으면 값을 가져올 수 없음.)
		int fileSize = multipartRequest.getParameter("fileSize")== null ? 0 : Integer.parseInt(multipartRequest.getParameter("fileSize"));
		int fSizeed = multipartRequest.getParameter("fSizeed")== null ? 0 : Integer.parseInt(multipartRequest.getParameter("fSizeed"));
		String title = multipartRequest.getParameter("title")== null ? "" : multipartRequest.getParameter("title");
		String categorys = multipartRequest.getParameter("categorys")== null ? "" : multipartRequest.getParameter("categorys");
		int money = multipartRequest.getParameter("money")== null ? 0 : Integer.parseInt(multipartRequest.getParameter("money"));
		String content = multipartRequest.getParameter("content")== null ? "" : multipartRequest.getParameter("content");
		String photo = multipartRequest.getParameter("photo")== null ? "" : multipartRequest.getParameter("photo");
		String fName = multipartRequest.getParameter("fName")== null ? "" : multipartRequest.getParameter("fName");
		int idx = multipartRequest.getParameter("idx")== null ? 0 : Integer.parseInt(multipartRequest.getParameter("idx"));
		
		// 기존에 등록했던 사진 파일 삭제 처리 (fName에 값이 들어오면)
		if(filesystemName != null) {
			new File(realPath + "/" + photo).delete();
		}
		
		// 현재 접속중인 아이디 가져오기
		HttpSession session = request.getSession();
		String mid = (String)session.getAttribute("sMid");
		
		// Back End 체크... 
		if(title.equals("") || title.length() > 20) {
			request.setAttribute("msg", "게시물 등록에 실패하였습니다.");
			request.setAttribute("url", "saleupdate.sa");
		}
		else if(categorys.equals("")) {
			request.setAttribute("msg", "게시물 등록에 실패하였습니다.");
			request.setAttribute("url", "saleupdate.sa");
		}
		else if(content.equals("")) {
			request.setAttribute("msg", "게시물 등록에 실패하였습니다.");
			request.setAttribute("url", "saleupdate.sa");
		}
		else {
			SaleBoardDAO dao = new SaleBoardDAO();
			
			/*
			 * System.out.println("fName"+fName); System.out.println("photo"+photo);
			 * System.out.println("fileSize"+fileSize);
			 * System.out.println("fSizeed"+fSizeed);
			 */
			
			//vo에 가져온 값 담기
			SaleBoardVO vo = new SaleBoardVO();
			if(filesystemName != null) {
				vo.setfSName(filesystemName);
			}
			else if(fName.equals("")) {
				//fName에 값이 없으면 기존에 있던 값 가져오기
				vo.setfSName(photo);
			}
			if(fileSize == 0) {
				// fileSize가 비여있으면 기존의 사이즈를 가져온다.
				vo.setfSize(fSizeed);
			}
			else {
				vo.setfSize(fileSize);
			}
			vo.setTitle(title);
			vo.setMoney(money);
			vo.setContent(content);
			vo.setMid(mid);
			vo.setCategory(categorys);
			vo.setIdx(idx);
			
			// 게시글 DB에 저장
			int res = dao.setSaleChangeOk(vo);
			
			if(res != 0) {
				request.setAttribute("msg", "게시물이 수정되었습니다.");
				request.setAttribute("url", "saleContent.sa?idx="+idx);
			}
			else {
				request.setAttribute("msg", "게시물 등록에 실패하였습니다.");
				request.setAttribute("url", "saleChange.sa?idx="+idx);
			}
		}

	}

}
