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
			sql = "insert into saleBoardJ values(default,?,?,?,?,?,default,default,default,?,?,default,?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getfName());
			pstmt.setString(2, vo.getfSName());
			pstmt.setInt(3, vo.getfSize());
			pstmt.setString(4, vo.getTitle());
			pstmt.setInt(5, vo.getMoney());
			pstmt.setString(6, vo.getContent());
			pstmt.setString(7, vo.getMid());
			pstmt.setString(8, vo.getCategory());
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
			sql = "select * from saleBoardJ order by uploadDate limit 0,30";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new SaleBoardVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setfName(rs.getString("fName"));
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
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(전체 리스트 limit 25~40 사이로 하여서 가져오기 (최신순))" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return vos;
	}
	
}
