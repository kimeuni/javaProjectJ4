package SaleBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import chat.ChatGroupJVO;
import chat.ChatJVO;
import common.GetConn;

public class SaleBoardDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	SaleBoardVO vo =null;
	
	// pstmt 객체 반납
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	// rs 객체 반납
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {}
		}
		pstmtClose();
	}

	// 중고 상품 등록 처리
	public int setSaleUpdateOk(SaleBoardVO vo) {
		int res = 0;
		try {
			sql = "insert into saleBoardJ values(default,?,?,?,?,default,default,default,?,?,default,?,default) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getfSName());
			pstmt.setInt(2, vo.getfSize());
			pstmt.setString(3, vo.getTitle());
			pstmt.setInt(4, vo.getMoney());
			pstmt.setString(5, vo.getContent());
			pstmt.setString(6, vo.getMid());
			pstmt.setString(7, vo.getCategory());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(중고 상품 등록 처리)" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 전체 리스트 limit 25~40 사이로 하여서 가져오기 (최신순)
	public ArrayList<SaleBoardVO> getSaleAllList() {
		ArrayList<SaleBoardVO> vos = new ArrayList<SaleBoardVO>();
		try {
			sql = "select *,timestampDiff(hour,uploadDate,now()) as hour_diff, timestampDiff(day,uploadDate,now()) as date_diff "
					+ "from saleBoardJ where userDel='N' order by uploadDate desc limit 0,30 ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new SaleBoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				vo.setMoney(rs.getInt("money"));
				vo.setTotLike(rs.getInt("totLike"));
				vo.setViewCnt(rs.getInt("viewCnt"));
				vo.setUploadDate(rs.getString("uploadDate"));
				vo.setContent(rs.getString("content"));
				vo.setMid(rs.getString("mid"));
				vo.setState(rs.getString("state"));
				vo.setCategory(rs.getString("category"));
				vo.setUserDel(rs.getString("userDel"));;
				
				vo.setHour_diff(rs.getString("hour_diff"));
				vo.setDate_diff(rs.getString("date_diff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(전체 리스트 limit 25~40 사이로 하여서 가져오기 (최신순))" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// idx로 현재 게시물 찾기
	public SaleBoardVO getIdxSaleContent(int idx) {
		vo = new SaleBoardVO();
		try {
			sql = "select *,timestampDiff(hour,uploadDate,now()) as hour_diff, timestampDiff(day,uploadDate,now()) as date_diff from saleBoardJ where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				vo.setMoney(rs.getInt("money"));
				vo.setTotLike(rs.getInt("totLike"));
				vo.setViewCnt(rs.getInt("viewCnt"));
				vo.setUploadDate(rs.getString("uploadDate"));
				vo.setContent(rs.getString("content"));
				vo.setMid(rs.getString("mid"));
				vo.setState(rs.getString("state"));
				vo.setCategory(rs.getString("category"));
				vo.setUserDel(rs.getString("userDel"));

				vo.setHour_diff(rs.getString("hour_diff"));
				vo.setDate_diff(rs.getString("date_diff"));
				
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(idx로 현재 게시물 찾기)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// mid를 통하여 해당 유저가 작성한 게시글 확인
	public ArrayList<SaleBoardVO> getOneSaleBoardMidList(String mid, int startIndexNo, int pageSize) {
		ArrayList<SaleBoardVO> vos = new ArrayList<SaleBoardVO>();
		try {
			if(startIndexNo == 0 && pageSize == 0) {
				sql = "select *,timestampDiff(hour,uploadDate,now()) as hour_diff, timestampDiff(day,uploadDate,now()) as date_diff from saleBoardJ where mid = ? order by uploadDate desc ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
			}
			else {
				sql = "select *,timestampDiff(hour,uploadDate,now()) as hour_diff, timestampDiff(day,uploadDate,now()) as date_diff from saleBoardJ where mid = ? order by uploadDate desc limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, pageSize);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new SaleBoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				vo.setMoney(rs.getInt("money"));
				vo.setTotLike(rs.getInt("totLike"));
				vo.setViewCnt(rs.getInt("viewCnt"));
				vo.setUploadDate(rs.getString("uploadDate"));
				vo.setContent(rs.getString("content"));
				vo.setMid(rs.getString("mid"));
				vo.setState(rs.getString("state"));
				vo.setCategory(rs.getString("category"));
				vo.setUserDel(rs.getString("userDel"));
				
				vo.setHour_diff(rs.getString("hour_diff"));
				vo.setDate_diff(rs.getString("date_diff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(mid를 통하여 해당 유저가 작성한 게시글 확인)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 등록한 상품 삭제 (1건)
	public int setDeleteSale(int idx) {
		int res = 0;
		try {
			sql = "delete from saleBoardJ where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(등록한 상품 삭제 (1건))" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 조회수 업데이트 처리
	public void setSaleBoardViewCntPlus(int idx) {
		try {
			sql = "update saleBoardJ set viewCnt = viewCnt + 1 where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(조회수 업데이트 처리)" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 찜하기 추가 처리
	public int setLikeUp(LikeJVO vo) {
		int res = 0;
		try {
			sql = "insert into likeJ values(default,?,?,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getSaleBoardIdx());
			pstmt.setString(2, vo.getLikeMid());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("sql문 오류(찜하기 추가 처리)" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 현재 게시글 찜 개수 가져오기
	public int getlikeCnt(int idx) {
		int likeCnt = 0;
		try {
			sql ="select count(*) as cnt from likeJ where saleBoardIdx = ?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			rs.next();
			
			likeCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("sql문 오류(현재 게시글 찜 개수 가져오기)" + e.getMessage());
		} finally {
			rsClose();
		}
		return likeCnt;
	}

	// 총 찜 개수 업데이트
	public void setTotLikeUpdate(int likeCnt, int idx) {
		try {
			sql = "update saleBoardJ set totLike = ? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, likeCnt);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(총 찜 개수 업데이트)" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 현재 상품 게시글에 누가 찜을 했는지 확인
	public LikeJVO getWhoLikeMid(int idx, String mid) {
		LikeJVO vo = new LikeJVO();
		try {
			sql = "select * from likeJ where saleBoardIdx=? and likeMid=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setSaleBoardIdx(rs.getInt("saleBoardIdx"));
				vo.setLikeMid(rs.getString("likeMid"));
				vo.setLikeYN(rs.getString("likeYN"));
				vo.setAlarm(rs.getString("alarm"));
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(현재 상품 게시글에 누가 찜을 했는지 확인)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 현재 상품 게시글 찜하기 취소 처리
	public int setLikeDelete(LikeJVO vo) {
		int res = 0;
		try {
			sql = "delete from likeJ where saleBoardIdx=? and likeMid=?";
			pstmt = conn.prepareCall(sql);
			pstmt.setInt(1, vo.getSaleBoardIdx());
			pstmt.setString(2, vo.getLikeMid());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(현재 상품 게시글 찜하기 취소 처리)" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 신고 처리
	public int setReportInsert(ReportJVO vo) {
		int res = 0;
		try {
			sql = "insert into reportJ values(default,?,?,?,?,?,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPart());
			pstmt.setInt(2, vo.getPartIdx());
			pstmt.setString(3, vo.getCpMid());
			pstmt.setString(4, vo.getTitle());
			pstmt.setString(5, vo.getCpContent());
			pstmt.setString(6, vo.getfSName());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql구문 오류(신고 처리)" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 상품 게시물 수정 처리
	public int setSaleChangeOk(SaleBoardVO vo) {
		int res = 0;
		try {
			sql = "update saleBoardJ set fSName=?, fSize=?,title=?, money=?, uploadDate=now(), content=?, category=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getfSName());
			pstmt.setInt(2, vo.getfSize());
			pstmt.setString(3, vo.getTitle());
			pstmt.setInt(4, vo.getMoney());
			pstmt.setString(5, vo.getContent());
			pstmt.setString(6, vo.getCategory());
			pstmt.setInt(7, vo.getIdx());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql구문 오류(상품 게시물 수정 처리)" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 현재 로그인한 사람의 찜 목록 가져오기
	public ArrayList<LikeJVO> getMyLikeBoard(String mid) {
		ArrayList<LikeJVO> vos = new ArrayList<LikeJVO>();
		try {
			sql ="select * from likeJ where likeMid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LikeJVO vo = new LikeJVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setSaleBoardIdx(rs.getInt("saleBoardIdx"));
				vo.setLikeMid(rs.getString("likeMid"));
				vo.setLikeYN(rs.getString("likeYN"));
				vo.setAlarm(rs.getString("alarm"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql구문 오류(현재 로그인한 사람의 찜 목록 가져오기)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 현재 로그인한 사람의 찜 목록 게시글 리스트
	public ArrayList<SaleBoardVO> getMyLikeBoardList(int saleBoardIdx) {
		ArrayList<SaleBoardVO> vos = new ArrayList<SaleBoardVO>();
		try {
			sql = "select *,timestampDiff(hour,uploadDate,now()) as hour_diff, timestampDiff(day,uploadDate,now()) as date_diff from saleBoardJ where idx = ? order by uploadDate desc ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, saleBoardIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new SaleBoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				vo.setMoney(rs.getInt("money"));
				vo.setTotLike(rs.getInt("totLike"));
				vo.setViewCnt(rs.getInt("viewCnt"));
				vo.setUploadDate(rs.getString("uploadDate"));
				vo.setContent(rs.getString("content"));
				vo.setMid(rs.getString("mid"));
				vo.setState(rs.getString("state"));
				vo.setCategory(rs.getString("category"));
				
				vo.setHour_diff(rs.getString("hour_diff"));
				vo.setDate_diff(rs.getString("date_diff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(현재 로그인한 사람의 찜 목록 게시글 리스트)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}
	
	// mid에 해당하는  유저가 사용한 카테고리
	public ArrayList<String> getUserUseCategory(String mid) {
		ArrayList<String> vos = new ArrayList<String>();
		try {
			sql="select category from saleBoardJ where mid=? group by category";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String category = "";
				category += rs.getString("category");
				vos.add(category);
			}
			
		} catch (SQLException e) {
			System.out.println("sql문 오류(현재 로그인한 사람의 찜 목록 게시글 리스트)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 회원 탈퇴시 usrDel을 바꾸어 main화면에 나오지 않도록 한다.
	public void setSaleBoardUserDelUpdate(String mid) {
		try {
			sql = "update saleBoardJ set userDel='Y' where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(회원 탈퇴시 usrDel을 바꾸어 main화면에 나오지 않도록 한다.)" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 카테고리별 출력 리스트
	public ArrayList<SaleBoardVO> getCategoryList(String category, String mid, int startIndexNo, int pageSize) {
		ArrayList<SaleBoardVO> vos = new ArrayList<SaleBoardVO>();
		try {
			if(startIndexNo == 0 && pageSize == 0 && !mid.equals("")) {
				sql = "select *,timestampDiff(hour,uploadDate,now()) as hour_diff, timestampDiff(day,uploadDate,now()) as date_diff from saleBoardJ where category=? and mid=? order by uploadDate desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setString(2, mid);
			}
			//메인 카테고리 클릭 시 사용
			else if(startIndexNo == 0 && pageSize == 0 && mid.equals("")) {
				sql = "select *,timestampDiff(hour,uploadDate,now()) as hour_diff, timestampDiff(day,uploadDate,now()) as date_diff from saleBoardJ where category=? and userDel='N'order by uploadDate desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
			}
			else {
				sql = "select *,timestampDiff(hour,uploadDate,now()) as hour_diff, timestampDiff(day,uploadDate,now()) as date_diff from saleBoardJ where category=? and mid=? order by uploadDate desc limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, category);
				pstmt.setString(2, mid);
				pstmt.setInt(3, startIndexNo);
				pstmt.setInt(4, pageSize);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new SaleBoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				vo.setMoney(rs.getInt("money"));
				vo.setTotLike(rs.getInt("totLike"));
				vo.setViewCnt(rs.getInt("viewCnt"));
				vo.setUploadDate(rs.getString("uploadDate"));
				vo.setContent(rs.getString("content"));
				vo.setMid(rs.getString("mid"));
				vo.setState(rs.getString("state"));
				vo.setCategory(rs.getString("category"));
				vo.setUserDel(rs.getString("userDel"));
				
				vo.setHour_diff(rs.getString("hour_diff"));
				vo.setDate_diff(rs.getString("date_diff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(카테고리별 출력 리스트)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// state 선택시(판매중,판매완료,예약중) 리스트 출력
	public ArrayList<SaleBoardVO> getStateList(String state, String mid, int startIndexNo, int pageSize) {
		ArrayList<SaleBoardVO> vos = new ArrayList<SaleBoardVO>();
		try {
			if(startIndexNo == 0 && pageSize == 0) {
				sql = "select *,timestampDiff(hour,uploadDate,now()) as hour_diff, timestampDiff(day,uploadDate,now()) as date_diff from saleBoardJ where state=? and mid=? order by uploadDate desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, state);
				pstmt.setString(2, mid);
			}
			else {
				sql = "select *,timestampDiff(hour,uploadDate,now()) as hour_diff, timestampDiff(day,uploadDate,now()) as date_diff from saleBoardJ where state=? and mid=? order by uploadDate desc limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, state);
				pstmt.setString(2, mid);
				pstmt.setInt(3, startIndexNo);
				pstmt.setInt(4, pageSize);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new SaleBoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				vo.setMoney(rs.getInt("money"));
				vo.setTotLike(rs.getInt("totLike"));
				vo.setViewCnt(rs.getInt("viewCnt"));
				vo.setUploadDate(rs.getString("uploadDate"));
				vo.setContent(rs.getString("content"));
				vo.setMid(rs.getString("mid"));
				vo.setState(rs.getString("state"));
				vo.setCategory(rs.getString("category"));
				vo.setUserDel(rs.getString("userDel"));
				
				vo.setHour_diff(rs.getString("hour_diff"));
				vo.setDate_diff(rs.getString("date_diff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(state 선택시(판매중,판매완료,예약중) 리스트 출력)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 판매중/예약중/판매완료 선택박스 업데이트
	public void setSaleStateUpdate(String state, int idx) {
		try {
			sql = "update saleBoardJ set state=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, state);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(판매중/예약중/판매완료 선택박스 업데이트)" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 해당 유저 상품 총 레코드 건수 (상품관리)
	public int getTotRecCnt(String mid, String myStoreSearch, String state) {
		int totRecCnt =0;
		try {
			if(myStoreSearch.equals("") && state.equals("")) {
				sql = "select count(*) as cnt from saleBoardJ where mid=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
			}
			else if(!myStoreSearch.equals("")) {
				// 검색했을 시
				sql = "select count(*) as cnt from saleBoardJ where mid=? and title like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.setString(2, "%"+myStoreSearch+"%");
			}
			// state를 변경 검색 했을 시
			else if(!state.equals("")) {
				sql = "select count(*) as cnt from saleBoardJ where mid=? and state =?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mid);
				pstmt.setString(2, state);
				
			}
			rs = pstmt.executeQuery();
			rs.next();
			
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("sql구문 오류(해당 유저 상품 총 레코드 건수 (상품관리))" + e.getMessage());
		} finally {
			rsClose();
		}
		return totRecCnt;
	}

	// up누를 시, 해당 게시물 uploadDate를 now()로 바꿔줌
	public void setSaleUploadDateUp(int idx) {
		try {
			sql ="update saleBoardJ set uploadDate=now() where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql구문 오류(up누를 시, 해당 게시물 uploadDate를 now()로 바꿔줌)" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 상품 검색할때 사용
	public ArrayList<SaleBoardVO> getmyStoreSearchList(String search, String mid, int startIndexNo, int pageSize) {
		ArrayList<SaleBoardVO> vos = new ArrayList<SaleBoardVO>();
		try {
			if(startIndexNo == 0 && pageSize == 0 && !mid.equals("")) {
				sql = "select *,timestampDiff(hour,uploadDate,now()) as hour_diff, timestampDiff(day,uploadDate,now()) as date_diff from saleBoardJ where title like ? and mid=? order by uploadDate desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setString(2, mid);
			}
			//메인 검색에서 사용
			else if(startIndexNo == 0 && pageSize == 0 && mid.equals("")) {
				sql = "select *,timestampDiff(hour,uploadDate,now()) as hour_diff, timestampDiff(day,uploadDate,now()) as date_diff from saleBoardJ where title like ? and userDel='N' order by uploadDate desc";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
			}
			else {
				sql = "select *,timestampDiff(hour,uploadDate,now()) as hour_diff, timestampDiff(day,uploadDate,now()) as date_diff from saleBoardJ where title like ? and mid=? order by uploadDate desc limit ?,?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+search+"%");
				pstmt.setString(2, mid);
				pstmt.setInt(3, startIndexNo);
				pstmt.setInt(4, pageSize);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new SaleBoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				vo.setMoney(rs.getInt("money"));
				vo.setTotLike(rs.getInt("totLike"));
				vo.setViewCnt(rs.getInt("viewCnt"));
				vo.setUploadDate(rs.getString("uploadDate"));
				vo.setContent(rs.getString("content"));
				vo.setMid(rs.getString("mid"));
				vo.setState(rs.getString("state"));
				vo.setCategory(rs.getString("category"));
				vo.setUserDel(rs.getString("userDel"));
				
				vo.setHour_diff(rs.getString("hour_diff"));
				vo.setDate_diff(rs.getString("date_diff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(상품 검색할때 사용)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 알림 띄울 내용 가져오기
	public SaleBoardVO getSaleNewLikeCnt(int idx, String mid) {
		SaleBoardVO vo = new SaleBoardVO();
		try {
			sql = "select (select count(*) from likeJ where saleBoardIdx = ? and alarm='Y') as newLike, sj.title, sj.idx "
					+ "from saleBoardJ sj, likeJ lj where sj.idx = ? and sj.mid=? and  lj.saleBoardIdx=? and lj.alarm='Y' group by sj.idx";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setInt(2, idx);
			pstmt.setString(3, mid);
			pstmt.setInt(4, idx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setTitle(rs.getString("title"));
				vo.setNewLike(rs.getInt("newLike"));
				vo.setIdx(rs.getInt("idx"));
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(알림 띄울 내용 가져오기(찜목록))" + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 알림 띄울 내용 가져오기(채팅)
	public ArrayList<ChatJVO> getMsgTotAlarm(String mid) {
		ArrayList<ChatJVO> vos = new ArrayList<ChatJVO>();
		try {
			sql = "select *,count(*) as totAlarm from chatJ where (saleMid=? or myMid=?) "
					+ "and whoChatMid != ? and alarm='Y' group by chatIdx";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, mid);
			pstmt.setString(3, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ChatJVO vo = new ChatJVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setChatIdx(rs.getInt("chatIdx"));
				vo.setSaleBoardIdx(rs.getInt("saleBoardIdx"));
				vo.setSaleMid(rs.getString("saleMid"));
				vo.setMyMid(rs.getString("myMid"));
				vo.setChat(rs.getString("chat"));
				vo.setAlarm(rs.getString("alarm"));
				vo.setChatDate(rs.getString("chatDate"));
				vo.setWhoChatMid(rs.getString("whoChatMid"));
				
				vo.setTotAlarm(rs.getInt("totAlarm"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(알림 띄울 내용 가져오기(채팅))" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 헤더 알림 찜 목록에서 클릭시 알림 N로 변경
	public void setLikeAlarmNo(int idx) {
		try {
			sql = "update likeJ set alarm='N' where saleBoardIdx=? ";
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(헤더 알림 찜 목록에서 클릭시 알림 N로 변경)" + e.getMessage());
		} finally {
			pstmtClose();
		}
		
	}

	// 게시글이 삭제되면 해당 게시글에 존재한 찜 전부 삭제
	public void setLikeSaleDeleteAll(int idx) {
		try {
			sql = "delete from likeJ where saleBoardIdx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(게시글이 삭제되면 해당 게시글에 존재한 찜 전부 삭제)" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 해당 게시물 신고 삭제
	public void setReportSaleDeleteAll(int idx, String part) {
		try {
			sql = "delete from reportJ where partIdx = ? and part=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setString(2, part);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(해당 게시물 신고 삭제)" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}
	
	// 신고된 게시글 총 레코드 개수 
	public int getTotReportRecCnt() {
		int totRecCnt =0;
		try {
			sql = "select count(*) as cnt from reportJ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("sql구문 오류(신고된 게시글 총 레코드 개수 )" + e.getMessage());
		} finally {
			rsClose();
		}
		return totRecCnt;
	}

	// 신고된 게시글 리스트
	public ArrayList<ReportJVO> getReportBoardList(int startIndexNo, int pageSize) {
		ArrayList<ReportJVO> vos =  new ArrayList<ReportJVO>();
		try {
			sql = "select *,timestampDiff(hour,cpDate,now()) as hour_diff, timestampDiff(day,cpDate,now()) as date_diff from reportJ order by idx desc limit ?,?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ReportJVO vo = new ReportJVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setPart(rs.getString("part"));
				vo.setPartIdx(rs.getInt("partIdx"));
				vo.setCpMid(rs.getString("cpMid"));
				vo.setTitle(rs.getString("title"));
				vo.setCpContent(rs.getString("cpContent"));
				vo.setCpDate(rs.getString("cpDate"));
				vo.setfSName(rs.getString("fSName"));
				
				vo.setHour_diff(rs.getString("hour_diff"));
				vo.setDate_diff(rs.getString("date_diff"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql구문 오류(신고된 게시글 리스트)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 게시글에 문제가 없으면 신고되었던 신고글 삭제하기(모두)
	public int setDeleteReport(int partIdx) {
		int res = 0;
		try {
			sql = "delete from reportJ where partIdx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, partIdx);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql구문 오류(게시글에 문제가 없으면 신고되었던 신고글 삭제하기(모두))" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 글 삭제시 채팅 그룹도 삭제
	public void setChatGroupDelete(int idx) {
		try {
			sql = "delete from chatGroupJ where saleBoardIdx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql구문 오류( 글 삭제시 채팅 그룹도 삭제)" + e.getMessage());
		} finally {
			pstmtClose();
		}
		
	}
	
	// 글 삭제시 채팅도 삭제
	public void setChatDelete(int idx) {
		try {
			sql = "delete from chatJ where saleBoardIdx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql구문 오류(글 삭제시 채팅도 삭제)" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}
}
