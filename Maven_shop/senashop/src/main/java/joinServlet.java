import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.ServletException;
// import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DatabaseConnectionPool;

// @WebServlet("/register")
public class joinServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        // 사용자가 입력한 회원 정보 받기
        String ID = request.getParameter("username");
        String NAME = request.getParameter("name");
        String PASSWD = request.getParameter("password");
        String CONFIRM_PASSWD = request.getParameter("confirmPassword");
        String EMAIL = request.getParameter("email");
        String MOBILE = request.getParameter("mobile");
        String ZIPCODE = request.getParameter("zipcode");
        String ADDRESS1 = request.getParameter("address1");
        String ADDRESS2 = request.getParameter("address2");
        int USER_LEVEL = Integer.parseInt(request.getParameter("user_level"));
        String TERMCHECK = request.getParameter("termCheck");
        Timestamp CREATED_AT = new Timestamp(new Date().getTime());

        if (isIdExists(ID)) {
            out.println("<script>");
            out.println("alert('이미 사용 중인 ID입니다. 다른 ID를 입력해주세요.');");
            out.println("window.history.back();");
            out.println("</script>");
            return; // 회원가입 거부
        }

        if (isNameExists(NAME)) {
            out.println("<script>");
            out.println("alert('이미 사용 중인 닉네임입니다. 다른 닉네임을 입력해주세요.');");
            out.println("window.history.back();");
            out.println("</script>");
            return; // 회원가입 거부
        }

        if (!PASSWD.equals(CONFIRM_PASSWD)) {
            out.println("<script>");
            out.println("alert('비밀번호가 일치하지 않습니다. 다시 시도해주세요.');");
            out.println("window.history.back();");
            out.println("</script>");
            return; // 회원가입 거부
        }

        // 비밀번호 유효성 검사 (최소 8자리 이상, 영문자와 숫자 조합)
        if (!isValidPassword(PASSWD)) {
            out.println("<script>");
            out.println("alert('비밀번호는 최소 8자리 이상이어야 하며, 영문자와 숫자를 포함해야 합니다.');");
            out.println("window.history.back();");
            out.println("</script>");
            return; // 회원가입 거부
        }

        // DB 연결 및 회원 정보 삽입
        Connection conn = null;
        Statement stmt = null;
        try {
            conn = DatabaseConnectionPool.getConnection();
            stmt = conn.createStatement();

            String sql = "INSERT INTO member (ID, PASSWD, NAME, EMAIL, MOBILE, ZIPCODE, ADDRESS1, ADDRESS2, USER_LEVEL, TERMCHECK, CREATED_AT) "
                    + "VALUES ('" + ID + "', '" + PASSWD + "', '" + NAME + "', '" + EMAIL + "', '" + MOBILE + "', '"
                    + ZIPCODE
                    + "', '" + ADDRESS1 + "', '" + ADDRESS2 + "', '" + USER_LEVEL + "', '" + TERMCHECK + "', '"
                    + CREATED_AT + "')";
            stmt.executeUpdate(sql);

            out.println("<script>");
            out.println("alert('회원 가입이 완료되었습니다!');");
            out.println("window.location.href='index.jsp';");
            out.println("</script>");

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>");
            out.println("alert('회원 가입 중 오류가 발생했습니다.\\n에러 메시지: " + e.getMessage() + "');");
            out.println("window.history.back();");
            out.println("</script>");
        } finally {
            try {
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    private boolean isValidPassword(String password) {
        // 비밀번호 조건을 정규식으로 검사
        String passwordPattern = "^(?=.*[A-Za-z])(?=.*\\d).{8,}$";
        return password.matches(passwordPattern);
    }

    // ID 중복 확인 메서드
    private boolean isIdExists(String ID) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseConnectionPool.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT COUNT(*) FROM member WHERE ID = '" + ID + "'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    // 이름 중복 확인 메서드
    private boolean isNameExists(String NAME) {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            conn = DatabaseConnectionPool.getConnection();
            stmt = conn.createStatement();
            String sql = "SELECT COUNT(*) FROM member WHERE NAME = '" + NAME + "'";
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null)
                    rs.close();
                if (stmt != null)
                    stmt.close();
                if (conn != null)
                    conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
