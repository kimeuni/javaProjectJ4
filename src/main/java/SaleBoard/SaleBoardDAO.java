package SaleBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
			sql = "insert into saleBoardJ values(default,?,?,?,?,default,default,default,?,?,default,?) ";
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
			sql = "select *,timestampDiff(hour,uploadDate,now()) as hour_diff, timestampDiff(day,uploadDate,now()) as date_diff from saleBoardJ order by uploadDate desc limit 0,30";
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
			sql = "select * from saleBoardJ where idx=?";
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
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(idx로 현재 게시물 찾기)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// mid를 통하여 해당 유저가 작성한 게시글 확인
	public ArrayList<SaleBoardVO> getOneSaleBoardMidList(String mid) {
		ArrayList<SaleBoardVO> vos = new ArrayList<SaleBoardVO>();
		try {
			sql = "select *,timestampDiff(hour,uploadDate,now()) as hour_diff, timestampDiff(day,uploadDate,now()) as date_diff from saleBoardJ where mid = ? order by uploadDate desc ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
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
			sql = "insert into reportJ values(default,?,?,?,?,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPart());
			pstmt.setInt(2, vo.getPartIdx());
			pstmt.setString(3, vo.getCpMid());
			pstmt.setString(4, vo.getTitle());
			pstmt.setString(5, vo.getCpContent());
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
	public String getUserUseCategory(String mid) {
		String str = "";
		try {
			sql="select category from saleBoardJ where mid=? group by category";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				str += rs.getString("category") + "-";
			}
			
		} catch (SQLException e) {
			System.out.println("sql문 오류(현재 로그인한 사람의 찜 목록 게시글 리스트)" + e.getMessage());
		} finally {
			rsClose();
		}
		return str.substring(0,str.length()-1);
	}
	
}
