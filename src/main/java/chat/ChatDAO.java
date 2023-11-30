package chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import common.GetConn;

public class ChatDAO {
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

	// 채팅 그룹이 있는지 확인용
	public int getChatGroupCheck(int saleBoardIdx, String saleMid, String myMid) {
		int res =0;
		try {
			sql = "select count(*) as cnt from chatGroupJ where saleBoardIdx=? and saleMid=? and myMid=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, saleBoardIdx);
			pstmt.setString(2, saleMid);
			pstmt.setString(3, myMid);
			rs = pstmt.executeQuery();
			if(rs.next());
			res = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("sql문 오류(채팅 그룹이 있는지 확인용)" + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}

	// 채팅 그룹 만들기 (1:1)
	public void setChatGroupInsert(int saleBoardIdx, String saleMid, String myMid) {
		try {
			sql = "insert into chatGroupJ values(default,?,?,?,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, saleBoardIdx);
			pstmt.setString(2, saleMid);
			pstmt.setString(3, myMid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(채팅 그룹 만들기 (1:1))" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	
}
