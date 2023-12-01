package chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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

	// 화면에 뿌릴 채팅 그룹 방 리스트
	public ArrayList<ChatGroupJVO> getChatGroupList(String myMid) {
		ArrayList<ChatGroupJVO> vos = new ArrayList<ChatGroupJVO>();
		try {
			// saleMid 또는 myMid 가 로그인한 아이디(myMid는 (sMid)를 받아옴)일 경우 리스트에 뿌리기
			sql = "select * from chatGroupJ where saleMid=? or myMid=? order by idx desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, myMid);
			pstmt.setString(2, myMid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ChatGroupJVO vo = new ChatGroupJVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setSaleBoardIdx(rs.getInt("saleBoardIdx"));
				vo.setSaleMid(rs.getString("saleMid"));
				vo.setMyMid(rs.getString("myMid"));
				vo.setTotAlarm(rs.getInt("totAlarm"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(화면에 뿌릴 채팅 그룹 방 리스트)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 채팅방 들어왔을 때 채팅 그룹에 대한 정보를 담기 위함
	public ChatGroupJVO getChatGroupOneInfo(int saleBoardIdx, String saleMid, String myMid) {
		ChatGroupJVO vo = new ChatGroupJVO();
		try {
			sql = "select * from chatGroupJ where saleBoardIdx=? and saleMid=? and myMid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, saleBoardIdx);
			pstmt.setString(2, saleMid);
			pstmt.setString(3, myMid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setSaleBoardIdx(rs.getInt("saleBoardIdx"));
				vo.setSaleMid(rs.getString("saleMid"));
				vo.setMyMid(rs.getString("myMid"));
				vo.setTotAlarm(rs.getInt("totAlarm"));
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(채팅방 들어왔을 때 채팅 그룹에 대한 정보를 담기 위함)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 채팅방 만들기
	public void setChatting(ChatGroupJVO cgVO, String sMid) {
		try {
			sql = "insert into chatJ values(default,?,?,?,?,?,default,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cgVO.getIdx());
			pstmt.setInt(2, cgVO.getSaleBoardIdx());
			pstmt.setString(3, cgVO.getSaleMid());
			pstmt.setString(4, cgVO.getMyMid());
			pstmt.setString(5, "대화를 시작합니다.");
			pstmt.setString(6, sMid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(채팅방 만들기)" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 채팅 방에 들어왔을 시, 알람 N으로 업데이트 처리 (채팅 보낸 사람이 아닌 사람이 들어왔을 때)
	public void setUpdateChatDate(String sMid, int chatIdx) {
		try {
			sql = "update chatJ set alarm='N' where whoChatMid !=? and chatIdx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sMid);
			pstmt.setInt(2, chatIdx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(채팅 방에 들어왔을 시, 알람 N으로 업데이트 처리)" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	//1:1 채팅 등록
	public void setChattingInputOk(ChatGroupJVO cgVO, String chat, String sMid) {
		try {
			sql = "insert into chatJ values(default,?,?,?,?,?,default,default,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cgVO.getIdx());
			pstmt.setInt(2, cgVO.getSaleBoardIdx());
			pstmt.setString(3, cgVO.getSaleMid());
			pstmt.setString(4, cgVO.getMyMid());
			pstmt.setString(5, chat);
			pstmt.setString(6, sMid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(1:1 채팅 등록)" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 1:1 채팅 리스트
	public ArrayList<ChatJVO> getMemberChatList(int chatIdx) {
		ArrayList<ChatJVO> vos = new ArrayList<ChatJVO>();
		try {
			sql ="select * from chatJ where chatIdx=? order by chatDate ";
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, chatIdx);
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
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(1:1 채팅 리스트)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	// 개인 채팅방이 있는지 확인
	public int getChattingCheck(ChatGroupJVO cgVO) {
		int res = 0;
		try {
			sql = "select count(*) as cnt from chatJ where saleBoardIdx=? and saleMid=? and myMid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cgVO.getSaleBoardIdx());
			pstmt.setString(2, cgVO.getSaleMid());
			pstmt.setString(3, cgVO.getMyMid());
			rs = pstmt.executeQuery();
			rs.next();
			
			res = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("sql문 오류(개인 채팅방이 있는지 확인)" + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}

	// 채팅 알람 Y가 있을 시 채팅그룹에 알림 cnt 업데이트
	public void chatGroupTotAlarm(int idx) {
		try {
			sql ="update chatGroupJ set totAlarm=(select count(alarm) from chatJ where alarm='Y' and chatIdx=?) where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(채팅 알람 Y가 있을 시 채팅그룹에 알림 cnt 업데이트)" + e.getMessage());
		} finally {
			rsClose();
		}
	}
}
