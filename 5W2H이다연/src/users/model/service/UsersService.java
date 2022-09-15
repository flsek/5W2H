package users.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import users.model.dao.UsersDAO;
import users.model.vo.PageInfo;
import users.model.vo.Users;

public class UsersService {

	// 로그인
	public Users loginUser(Users user) {
		Connection conn = getConnection();

		Users loginUser = new UsersDAO().loginUser(conn, user);

		close(conn);

		return loginUser;
	}

// 회원가입
	public int insertUsers(Users users) {
		Connection conn = getConnection();
		// 필드를 따로 안 만들고 new로 만듦
		int result = new UsersDAO().insertUsers(conn, users);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

// 회원 탈퇴
	public int deleteUser(String userId) {
		Connection conn = getConnection();

		int result = new UsersDAO().deleteUser(conn, userId);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	// 회원 관련 정보
	public Users selectUser(String userId) {
		Connection conn = getConnection();

		Users user = new UsersDAO().selectUser(conn, userId);

		close(conn);

		return user;
	}

	// 회원 정보 수정
	public int modifyUser(Users user) {
		Connection conn = getConnection();

		int result = new UsersDAO().modifyUser(conn, user);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	// 비밀번호 변경
	public int modifyPwd(String userId, String newPwd) {
		Connection conn = getConnection();

		int result = new UsersDAO().modifyPwd(conn, userId, newPwd);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	// ADMIN에서 페이지 수 세기
	public int getListCount() {
		Connection conn = getConnection();

		int result = new UsersDAO().getListCount(conn);

		close(conn);

		return result;
	}

	// ADMIN인지 확인하기
	public int getAdminCk(String userId) {
		Connection conn = getConnection();

		int adminCk = new UsersDAO().getAdminCk(conn, userId);

		close(conn);

		return adminCk;
	}

	public ArrayList<Users> selectUserList(PageInfo pi) { // User 리스트 가져오기
		Connection conn = getConnection();

		ArrayList<Users> userList = new UsersDAO().selectUserList(conn, pi);

		close(conn);

		return userList;
	}

	public int saveUser(String userId) {
		Connection conn = getConnection();

		int result = new UsersDAO().saveUser(conn, userId);

		close(conn);

		return result;
	}

	// 아이디 중복 체크
	public int checkId(String inputId) {
		Connection conn = getConnection();

		int result = new UsersDAO().checkId(conn, inputId);

		close(conn);

		return result;
	}

	// 아이디 찾기
	public String findId(String name, String phone) {
		Connection conn = getConnection();

		String findId = new UsersDAO().findId(conn, name, phone);

		close(conn);

		return findId;
	}

	// 비밀번호 찾기
	public String findPwd(String userId, String phone) {
		Connection conn = getConnection();

		String findPwd = new UsersDAO().findPwd(conn, userId, phone);

		close(conn);

		return findPwd;
	}

	public Users deleteUserByAd(String userId) {
		Connection conn = getConnection();

		Users user = null;
		int result = new UsersDAO().deleteUser(conn, userId);
		
		if (result > 0) {
			user = new UsersDAO().selectUserByAD(conn, userId);
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);

		return user;
	}
}