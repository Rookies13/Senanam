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
import db.model.Cart;

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
        // List<Map<String, Object>> infoData = queryDAO.fetchAllData(table1, pkey);
        // List<Members> member = queryDAO.selectUser(pkey);

        // 게시글 조회
        List<Board> boardList_free = queryDAO.selectBoardByUser(pkey, "A");
        List<Board> boardList_qna = queryDAO.selectBoardByUser(pkey, "B");
        List<Board> boardList_sec = queryDAO.selectBoardByUser(pkey, "C");
        List<Board> boardList_star = queryDAO.selectBoardByUser(pkey, "D");
        int tupleCount_free = boardList_free.size();
        int tupleCount_qna = boardList_qna.size();
        int tupleCount_sec = boardList_sec.size();
        int tupleCount_star = boardList_star.size();

        // 주문 조회
        List<Cart> orders_c = queryDAO.selectCartByUser(pkey);
        List<Orders> orders_o = queryDAO.selectOrderByUser(pkey);
        int tupleCount_c = orders_c.size();
        int tupleCount_o = orders_o.size();

        // 리소스 해제
        orders_c.clear();
        orders_o.clear();
        boardList_free.clear();
        boardList_qna.clear();
        boardList_sec.clear();
        boardList_star.clear();

        // Call the DAO method to fetch the data
        String table = "MEMBER";
        String column = "id";
        // List<Map<String, Object>> infoData = queryDAO.fetchAllData(table, pkey);
        List<Map<String, Object>> infoData = selectDAO.fetchAllData(table, column);
        Map<String, Object> firstRow = infoData.get(0);

        List<Board> boardList = queryDAO.selectBoardByUser(pkey, "h");
        queryDAO.selectBoardByUser("test", "h");
        boardList.get(0);
        List<Board> boardList_h = queryDAO.selectBoardByUser(pkey, "h");
        // queryDAO.selectUser("test");
        // final Member user = queryDAO.selectUser(column);
        // Members user = queryDAO.selectUser(column);
        // queryDAO.selectUser(column);
        // List<Orders> orders_c = queryDAO.selectOrderByUser(pkey, "Cart");
        orders_c.size();
        orders_c.clear();
        List<Members> member = queryDAO.selectUser(column);
        for (Members m : member) {
            m.getUserLv();
            member.clear();
        }
        // Members membea = (Members) request.getAttribute("member");
        // List<Members> mea = (List<Members>) request.getAttribute("member");

        int tupleCount_h = boardList_h.size();
        System.out.println(tupleCount_h);
        /*
         * public static void main(String[] args) {
         * System.out.println("Hello World");
         * }
         */
    }
}
