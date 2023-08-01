import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.annotation.Generated;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import db.DatabaseConnectionPool;

public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        try {
            Connection connection = DatabaseConnectionPool.getConnection();

            Statement stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM MEMBER WHERE ID = '" + id + "' AND PASSWD = '" + pw + "'");

            if (rs.next()) { // 로그인 성공(인증의 수단 session)
                id = rs.getString("ID");
                String name = rs.getString("PASSWD");

                HttpSession session = request.getSession();
                session.setAttribute("user_id", id);
                session.setAttribute("user_name", name);

                response.sendRedirect("index.jsp"); // 페이지 이동

            } else { // 로그인 실패
                response.sendRedirect("login_fail.jsp"); // 실패 페이지
            }

        } catch (SQLException se) {
            se.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
    /*
     * String url = "jdbc:oracle:thin:@localhost:1521:orcl";
     * String user = "c##shopm";
     * String password = "0000";
     * 
     * String id = request.getParameter("id");
     * String pw = request.getParameter("pw");
     * String selectQuery = "SELECT * FROM id_pw WHERE u_id = '" + id +
     * "' AND u_pw = '" + pw + "'";
     * 
     * try (Connection conn = DriverManager.getConnection(url, user, password);
     * Statement stmt = conn.createStatement();
     * ResultSet rs = stmt.executeQuery(selectQuery)) {
     * 
     * if (rs.next()) { // 로그인 성공(인증의 수단 session)
     * id = rs.getString("u_id");
     * String name = rs.getString("u_pw");
     * 
     * HttpSession session = request.getSession();
     * session.setAttribute("user_id", id);
     * session.setAttribute("user_name", name);
     * 
     * response.sendRedirect("index.jsp"); // 페이지 이동
     * 
     * } else { // 로그인 실패
     * response.sendRedirect("login_fail.jsp"); // 실패 페이지
     * }
     * } catch (SQLException se) {
     * se.printStackTrace();
     * response.sendRedirect("error.jsp"); // 에러 페이지
     * }
     * }
     */
}
