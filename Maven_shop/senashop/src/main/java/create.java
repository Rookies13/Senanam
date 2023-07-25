import java.io.IOException;
import java.rmi.ServerException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class create extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServerException, IOException, ServletException {
        RequestDispatcher rd = request.getRequestDispatcher("create.jsp");
        rd.forward(request, response);
    }
    /*
     * public static void main(String[] args) {
     * System.out.println("Hello World");
     * }
     */
}
