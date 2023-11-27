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

	// 대분류 전체 리스트
	public ArrayList<MajorCategoryVO> setMajorList(){
		ArrayList<MajorCategoryVO> vos = new ArrayList<MajorCategoryVO>();
		try {
			sql = "select * from majorCategory order by idx";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MajorCategoryVO vo = new MajorCategoryVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMajorCategory(rs.getString("majorCategory"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(대분류 전체 리스트)" + e.getMessage());
		} finally {
			rsClose();
		}
		
		return vos;
		
	}
}
