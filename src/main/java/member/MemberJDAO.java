package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.GetConn;

public class MemberJDAO {
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	MemberJVO vo = null;
	
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

	// 1개 중복 확인용 dao (mid,nickName,email 등)
	public int memberDoubleCheckOk(String str, String field) {
		int res = 0;
		try {
			sql = "select count(" + str + ") as cnt from memberJ where " + str + "=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, field);
			rs = pstmt.executeQuery();
			rs.next();
			System.out.println(rs.getInt("cnt"));
			res = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("sql문 오류(1개 중복 확인용)" + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}

	// 회원가입 처리
	public void setMemberJoinOk(MemberJVO vo) {
		try {
			sql= "";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(회원가입 처리)" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

}
