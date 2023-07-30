import java.io.IOException;
import java.rmi.ServerException;
import java.sql.Connection;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DatabaseConnectionPool;
import db.QueryDAO;
import db.SelectDAO;
import db.model.Board;
import db.model.Members;
import db.model.Orders;
//연습장
public class create extends HttpServlet {
    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServerException, IOException, ServletException {
        RequestDispatcher rd = request.getRequestDispatcher("create.jsp");
        rd.forward(request, response);
        SelectDAO selectDAO = new SelectDAO();
        QueryDAO queryDAO = new QueryDAO();
        selectDAO.fetchAllData(getServletName(), getServletInfo());
        
        String pkey = "t";
        

    // Call the DAO method to fetch the data
    String table = "MEMBER";
    String column = "id";
    //List<Map<String, Object>> infoData = queryDAO.fetchAllData(table, pkey);
    List<Map<String, Object>> infoData = selectDAO.fetchAllData(table, column);
    Map<String, Object> firstRow = infoData.get(0);

List<Board> boardList = queryDAO.selectBoardByUser(pkey, "h");
    queryDAO.selectBoardByUser("test", "h");
    boardList.get(0);
    List<Board> boardList_h = queryDAO.selectBoardByUser(pkey, "h");
    // queryDAO.selectUser("test");
    //final Member user = queryDAO.selectUser(column);
    //Members user = queryDAO.selectUser(column);
    //queryDAO.selectUser(column);
    List<Orders> orders_c = queryDAO.selectOrderByUser(pkey, "Cart");
    orders_c.size();
    List<Members> member = queryDAO.selectUser(column);
    for (Members m : member) {
        m.getUserLv();
    }


    int tupleCount_h = boardList_h.size();
    System.out.println(tupleCount_h);
    /*
     * public static void main(String[] args) {
     * System.out.println("Hello World");
     * }
     */
    }
}
