package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConn {
	private static Connection conn = null;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/javaProject";
	private String user ="root";
	private String password ="1234";
	
	private static final GetConn instance = new GetConn();
	
	private GetConn() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 오류" + e.getMessage());
		} catch (SQLException e) {
			System.out.println("데이터베이스 오류" + e.getMessage());
		}
	}
	
	public static Connection getConn() {
		return conn;
	}
}
