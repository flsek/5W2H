package users.model.dao;

import static common.JDBCTemplate.*;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import users.model.vo.PageInfo;
import users.model.vo.Users;

public class UsersDAO {
	private Properties prop = new Properties();

	public UsersDAO() {
		String filename = UsersDAO.class.getResource("/sql/users/users-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 로그인
	public Users loginUser(Connection conn, Users user) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Users loginUser = null;

		String query = prop.getProperty("loginUser");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPwd());
			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginUser = new Users(rset.getString("U_ID"), rset.getString("U_PWD"), rset.getString("U_NAME"),
						rset.getString("NICKNAME"), rset.getString("PHONE"), rset.getString("EMAIL"),
						rset.getString("ADDRESS"), rset.getInt("ADMIN_CK"), rset.getDate("ENROLL_DATE"),
						rset.getDate("MODIFY_DATE"), rset.getString("STATUS"), rset.getDate("DELETE_DATE"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;
	}

	// 회원가입
	public int insertUsers(Connection conn, Users users) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertUsers");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, users.getUserId());
			pstmt.setString(2, users.getUserPwd());
			pstmt.setString(3, users.getUserName());
			pstmt.setString(4, users.getNickname());
			pstmt.setString(5, users.getPhone());
			pstmt.setString(6, users.getEmail());
			pstmt.setString(7, users.getAddress());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 회원탈퇴
	public int deleteUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement(prop.getProperty("deleteUser"));
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Users selectUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Users user = null;

		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectUser"));
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				user = new Users(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getString(6), rset.getString(7), rset.getInt(8), rset.getDate(9),
						rset.getDate(10), rset.getString(11), rset.getDate(12));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return user;
	}

	public int modifyUser(Connection conn, Users user) {
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement(prop.getProperty("modifyUser"));
			pstmt.setString(1, user.getNickname());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getAddress());
			pstmt.setString(4, user.getUserId());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 비밀번호 변경
	public int modifyPwd(Connection conn, String userId, String newPwd) {
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement(prop.getProperty("modifyPwd"));
			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn);
		}
		return result;
	}

	// ADMIN 페이지에서 회원 관련 페이징 처리
	public int getListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement(prop.getProperty("getListCount"));
			rset = pstmt.executeQuery();

			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}

	// ADMIN인지 확인하기
	public int getAdminCk(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int adminCk = 0;

		try {
			pstmt = conn.prepareStatement(prop.getProperty("getAdminCk"));
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				adminCk = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return adminCk;
	}

	// User List 가져오기
	public ArrayList<Users> selectUserList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Users> userList = new ArrayList<Users>();

		int startRow = (pi.getCurrentPage() - 1) * pi.getUserLimit() + 1;
		int endRow = startRow + pi.getUserLimit() - 1;

		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectUserList"));
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				userList.add(new Users(rset.getString(2), rset.getString(3), rset.getString(4), rset.getString(5),
						rset.getString(6), rset.getString(7), rset.getString(8), rset.getInt(9), rset.getDate(10),
						rset.getDate(11), rset.getString(12), rset.getDate(13)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return userList;
	}

	// 회원 정보 저장하기
	public int saveUser(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;

		try {
			pstmt = conn.prepareStatement(prop.getProperty("saveUser"));
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 아이디 중복 체크
	public int checkId(Connection conn, String inputId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;

		String query = prop.getProperty("checkId");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, inputId);
			rset = pstmt.executeQuery();

			// 어차피 한 개의 행밖에 없기 때문에 if
			if (rset.next()) {
//					result = rset.getInt("count(*)");
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 아이디 찾기
	public String findId(Connection conn, String name, String phone) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String findId = null;

		String query = prop.getProperty("findId");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				findId = rset.getString("U_ID");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return findId;

	}

	// 비밀번호 찾기
	public String findPwd(Connection conn, String userId, String phone) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String findPwd = null;

		String query = prop.getProperty("findPwd");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, phone);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				findPwd = rset.getString("U_PWD");
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return findPwd;
	}

	public Users selectUserByAD(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Users user = null;

		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectUserByAD"));
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				user = new Users(rset.getString(1), rset.getString(2), rset.getString(3), rset.getString(4),
						rset.getString(5), rset.getString(6), rset.getString(7), rset.getInt(8), rset.getDate(9),
						rset.getDate(10), rset.getString(11), rset.getDate(12));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return user;
	}
}