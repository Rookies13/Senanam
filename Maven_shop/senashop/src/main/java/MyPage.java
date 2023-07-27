import java.io.IOException;
import java.io.PrintWriter;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyPage extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        // ResourceBundle rb = ResourceBundle.getBundle("LocalStrings",
        // request.getLocale());
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html><html>");
        out.println("<head>");
        out.println("<meta charset=\"UTF-8\" />");

        String title = rb.getString("requestparams.title");
        out.println("<title>" + title + "</title>");
        out.println("</head>");
        out.println("<body bgcolor=\"white\">");

        // img stuff not req'd for source code html showing

        // all links relative

        // XXX
        // making these absolute till we work out the
        // addition of a PathInfo issue

        out.println("<a href=\"../reqparams.html\">");
        out.println("<img src=\"../images/code.gif\" height=24 " +
                "width=24 align=right border=0 alt=\"view code\"></a>");
        out.println("<a href=\"../index.html\">");
        out.println("<img src=\"../images/return.gif\" height=24 " +
                "width=24 align=right border=0 alt=\"return\"></a>");

        out.println("<h3>" + title + "</h3>");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        out.println(rb.getString("requestparams.params-in-req") + "<br>");
        if (firstName != null || lastName != null) {
            out.println(rb.getString("requestparams.firstname"));
            // out.println(" = " + HttpFilter.filter(firstName) + "<br>");
            out.println(" = " + firstName + "<br>");
            out.println(rb.getString("requestparams.lastname"));
            // out.println(" = " + HTMLFilter.filter(lastName));
            out.println(" = " + lastName + "<br>");
        } else {
            out.println(rb.getString("requestparams.no-params"));
        }
        out.println("<P>");
        out.print("<form action=\"");
        out.print("RequestParamExample\" ");
        out.println("method=POST>");
        out.println(rb.getString("requestparams.firstname"));
        out.println("<input type=text size=20 name=firstname>");
        out.println("<br>");
        out.println(rb.getString("requestparams.lastname"));
        out.println("<input type=text size=20 name=lastname>");
        out.println("<br>");
        out.println("<input type=submit>");
        out.println("</form>");

        out.println("</body>");
        out.println("</html>");
    }

    @Override
    public void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException, ServletException {
        doGet(request, response);
    }

}
