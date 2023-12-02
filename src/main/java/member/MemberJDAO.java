package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	public int setMemberJoinOk(MemberJVO vo) {
		int res = 0;
		try {
			sql= "insert into memberJ values (default,?,?,?,?,?,?,?,?,?,default,default,default,default)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());;
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getNickName());
			pstmt.setString(5, vo.getAddress());
			pstmt.setString(6, vo.getTel());
			pstmt.setString(7, vo.getEmail());
			pstmt.setString(8, vo.getGender());
			pstmt.setString(9, vo.getProfile());
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(회원가입 처리)" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 아이디로 로그인 계정 확인
	public MemberJVO getLoginMidOk(String mid) {
		vo = new MemberJVO();
		try {
			sql = "select *,timestampdiff(day,startDate,now()) as day_diff,timestampdiff(hour,startDate,now()) as hour_diff  from memberJ where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				vo.setAddress(rs.getString("address"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setGender(rs.getString("gender"));
				vo.setProfile(rs.getString("profile"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setAdminYN(rs.getString("adminYN"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				
				vo.setDay_diff(rs.getString("day_diff"));
				vo.setHour_diff(rs.getString("hour_diff"));
			}
		} catch (SQLException e) {
			System.out.println("sql문 오류(아이디로 로그인 계정 확인)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vo;
	}

	// 최종 방문일 업데이트
	public void setLoginLastDateUpdate(String mid) {
		try {
			sql = "update memberJ set lastDate=now() where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(로그인시 최종 방문일 업데이트)" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 아이디 찾기
	public String getMemberMidSearch(String email) {
		String res = "0";
		try {
			sql ="select * from memberJ where email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
			if(rs.next()) res = rs.getString("mid");
		} catch (SQLException e) {
			System.out.println("sql문 오류(아이디 찾기)" + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}

	// 비밀번호 찾기
	public int getMemberPwdSearch(String mid, String email) {
		int res = 0;
		try {
			sql = "select * from memberJ where mid=? and email=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, email);
			rs = pstmt.executeQuery();
			if(rs.next()) res = 1;
		} catch (SQLException e) {
			System.out.println("sql문 오류(비밀번호 찾기)" + e.getMessage());
		} finally {
			rsClose();
		}
		return res;
	}

	// 임시 비밀번호 업데이트
	public void setUpdatePwd(String mid, String pwd) {
		try {
			sql = "update memberJ set pwd=? where mid=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(임시 비밀번호 업데이트)" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 계정정보 비밀번호 변경
	public int setMemberPwdUpdate(String mid, String newPwd) {
		int res = 0;
		try {
			sql = "update memberJ set pwd=? where mid=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, mid);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(계정정보 비밀번호 변경)" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	//개인계정 정보 수정
	public int setMemberInfoUpdate(MemberJVO vo, String mid) {
		int res=0;
		try {
			sql="update memberJ set name=?, nickName=?, address=?, tel=?, email=?, gender=?, profile=? where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getAddress());
			pstmt.setString(4, vo.getTel());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getGender());
			pstmt.setString(7, vo.getProfile());
			pstmt.setString(8, mid);
			res = pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(개인계정 정보 수정)" + e.getMessage());
		} finally {
			pstmtClose();
		}
		return res;
	}

	// 탈퇴 신청 처리
	public void setUserDelUpdate(String mid) {
		try {
			sql="update memberJ set userDel='Y' where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("sql문 오류(탈퇴 신청 처리)" + e.getMessage());
		} finally {
			pstmtClose();
		}
	}

	// 멤버 전체 레코드 개수
	public int getTotMemberRecCnt() {
		int totRecCnt =0;
		try {
			sql = "select count(*) as cnt from memberJ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			
			totRecCnt = rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("sql구문 오류(멤버 전체 레코드 개수)" + e.getMessage());
		} finally {
			rsClose();
		}
		return totRecCnt;
	}

	// 멤버 전체 리스트
	public ArrayList<MemberJVO> getMemberList(int startIndexNo, int pageSize) {
		ArrayList<MemberJVO> vos = new ArrayList<MemberJVO>();
		try {
			sql= "select * from memberJ order by idx desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberJVO vo = new MemberJVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				vo.setAddress(rs.getString("address"));
				vo.setTel(rs.getString("tel"));
				vo.setEmail(rs.getString("email"));
				vo.setGender(rs.getString("gender"));
				vo.setProfile(rs.getString("profile"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setAdminYN(rs.getString("adminYN"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql구문 오류(멤버 전체 리스트)" + e.getMessage());
		} finally {
			rsClose();
		}
		return vos;
	}

	
}
