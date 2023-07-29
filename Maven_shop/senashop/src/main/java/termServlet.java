import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/term")
public class termServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check if both checkboxes are checked
        boolean termsAgree = "true".equals(request.getParameter("terms_agree"));
        boolean privacyAgree = "true".equals(request.getParameter("privacy_agree"));
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        if (termsAgree && privacyAgree) {
            HttpSession session = request.getSession();
            session.setAttribute("termCheck", "T");
            // Both checkboxes are checked, proceed to join.jsp
            response.sendRedirect("join.jsp");
        } else {
            // One or both checkboxes are not checked, redirect back to the form
            out.println("<script>");
            out.println("alert('\"동의합니다\"를 누르면 해당 약관에 동의 가능합니다. 모든 약관에 동의해주세요!');");
            out.println("window.location.href='terms.jsp';");
            out.println("</script>");
        }
    }
}