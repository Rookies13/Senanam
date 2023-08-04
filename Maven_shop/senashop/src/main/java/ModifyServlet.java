import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.rmi.ServerException;
import java.sql.SQLException;
import java.sql.Timestamp;

import java.sql.Connection;

import db.QueryDAO;
import db.model.Members;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ModifyServlet extends HttpServlet {
    static String id;
    private String name;
    private String mobile;
    private String email;
    private String zipcode;
    private String address1;
    private String address2;
    private Timestamp createAt = null;
    QueryDAO queryDAO = new QueryDAO();

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServerException, IOException, ServletException {
        id = request.getParameter("id");
        name = request.getParameter("name");
        mobile = request.getParameter("mobile");
        email = request.getParameter("email");
        zipcode = request.getParameter("zipcode");
        address1 = request.getParameter("address1");
        address2 = request.getParameter("address2");
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<html>");
        out.println("<head>");
        out.println("<meta charset=\"UTF-8\">");
        out.println("<title>회원 정보 수정</title>");
        out.println("<link rel=\"stylesheet\" href=\"assets/css/main.css\" />");
        out.println("</head>");

        out.println("<body>");
        out.println("<h2>회원 정보 수정</h2>");

        out.println("<form action= 'ModifyServlet' method='post'>");
        out.println("아이디: <input type='text' name='id' value='" + id + "' readonly><br>");

        out.println("이름:<input type='text' name='name' value='" + name + "'><br>");

        out.println("전화번호:<input type='text' name='mobile' value='" + mobile + "'><br>");

        out.println("이메일:<input type='text' name='email' value='" + email + "'><br>");

        out.println("우편번호:<input type='text' name='zipcode' value='" + zipcode + "'><br>");

        out.println("기본주소:<input type='text' name='address1' value='" + address1 + "'><br>");

        out.println("상세주소:<input type='text' name='address2' value='" + address2 + "'><br>");

        out.println("<input type='submit' value='업데이트'>");

        out.println("</form>");

        out.println("</body>");

        out.println("</html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String updatedName = request.getParameter("name");
        String updatedMobile = request.getParameter("mobile");
        String updatedEmail = request.getParameter("email");
        String updatedZipCode = request.getParameter("zipcode");
        String updatedAd1 = request.getParameter("address1");

        String termAgree = request.getParameter("TERMCHECK");
        String updatedAd2 = request.getParameter("address2");

        Members user = new Members(id, updatedName, updatedMobile, updatedEmail, updatedZipCode, updatedAd1, updatedAd2,
                0, termAgree, createAt);

        boolean updated = queryDAO.updateUser(user);

        if (updated) {
            response.setContentType("text/html; charset=UTF-8");
            request.setCharacterEncoding("UTF-8");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('수정 완료!!'); location.href='" + "mypage.jsp" + "';</script>");
            out.close();

            // response.sendRedirect("mypage.jsp");
        } else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('오류 발생');</script>");
        }
    }
}
