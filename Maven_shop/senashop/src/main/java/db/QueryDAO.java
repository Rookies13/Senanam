package db;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import db.model.Board;
import db.model.Members;
import db.model.Orders;
//0730-이순빈-쿼리 실행 환경 구성
public class QueryDAO {
    private static final String INSERT_USERS_SQL = "INSERT INTO MEMBER (ID, PASSWD, NAME, MOBILE, EMAIL, ZIPCODE, ADDRESS1, ADDRESS2, USER_LEVEL, TERMS_AGREE, CREATED_AT) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_USER_BY_ID = "SELECT * FROM MEMBER WHERE id = ?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM MEMBER";
    private static final String SELECT_ALL_BOARD = "SELECT * FROM BOARD";
    private static final String SELECT_ORDER_BY_USER = "SELECT * FROM ORDERS where id = ? AND cart_or_order_history = ?";
    private static final String SELECT_BOARD_BY_ID_AND_TYPE = "SELECT * FROM board WHERE id = ? AND type = ?";
    private static final String SELECT_SPEC_USERS = "SELECT * FROM USER where id = ?;";
    //private static final String DELETE_USERS_SQL = "DELETE FROM users WHERE id=?";
    //private static final String UPDATE_USERS_SQL = "UPDATE users SET name=?, email=?, country=? WHERE id=?";
    public QueryDAO() {}
    //가입 쿼리
    public void insertUser(Members user) throws SQLException {
        try (Connection connection = DatabaseConnectionPool.getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {

        }
    }

    //조회 쿼리

    public List<Members> selectUser(String id) {
        List<Members> member = new ArrayList<>();
        

        try (Connection connection = DatabaseConnectionPool.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);) {
                    preparedStatement.setString(1, id);
                    System.out.println(preparedStatement);

                    ResultSet rs = preparedStatement.executeQuery();

                    while (rs.next()) {
                        String name = rs.getString("NAME");
                        
                        String email = rs.getString("EMAIL");
                        String mobile = rs.getString("MOBILE");
                        String address1 = rs.getString("ADDRESS1");
                        String address2 = rs.getString("ADDRESS2");
                        String zipcode = rs.getString("ZIPCODE");
                        String userLevel = rs.getString("USER_LEVEL");
                        String termAgree = rs.getString("TERMS_AGREE");
                        Timestamp createDate = rs.getTimestamp("CREATED_AT");
                        member.add(new Members(id, name, mobile, email, zipcode, address1, address2, userLevel,termAgree, createDate));
                        
                        //user.add(new Members(id, name, email,mobile, address1, address2, zipcode, userLevel));
                        // String name = rs.getString("name");
                        
                        //user = new Members(id, name, email, mobile, address1, address2, zipcode, userLevel);                                                                                                                                                                  
                    }
                } catch (SQLException e) {
                    printSQLException(e);
                }
        return member;
    }

    

    public List<Orders> selectOrderByUser(String id, String type) {
        List<Orders> orders = new ArrayList<>();

        try (Connection connection = DatabaseConnectionPool.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ORDER_BY_USER);) {
                    preparedStatement.setString(1, id);
                    preparedStatement.setString(2, type);
                    System.out.println(preparedStatement);

                    ResultSet rs = preparedStatement.executeQuery();

                    while (rs.next()) {
                        int orderNum = rs.getInt("ORDER_NUMBER");
                        //String ID = rs.getString("ID");
                        int totP = rs.getInt("TOTAL_PRICE");
                        String cOrO = rs.getString("CART_OR_ORDER_HISTORY");
                        String address = rs.getString("ADDRESS");
                        String zipC = rs.getString("ZIPCODE");
                        //orders.add(new Orders(id, pw, cont, rep, rep_y)
                        //db.model.Orders.Orders(String id, int totalPrice, String cartOrOrder, String address, String zipcode)
                        orders.add(new Orders(orderNum,id,totP,cOrO,address,zipC));
                        //orders.add(new Orders(ID, totP, cOrO, address, zipC));
                        //board.add(new Board(boardNum, sunb, cont, rep, rep_y, type, id, time, cnt, pw));                                                                                                                     
                    }
                } catch (SQLException e) {
                    printSQLException(e);
                }
        return orders;
    }

        public List<Board> selectBoardByUser(String id, String type) {
        List<Board> board = new ArrayList<>();

        try (Connection connection = DatabaseConnectionPool.getConnection();
                PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BOARD_BY_ID_AND_TYPE);) {
                    preparedStatement.setString(1, id);
                    preparedStatement.setString(2, type);
                    System.out.println(preparedStatement);

                    ResultSet rs = preparedStatement.executeQuery();

                    while (rs.next()) {
                        int boardNum = rs.getInt("BOARD_NUMBER");
                        String sunb = rs.getString("SUBJECT");
                        String cont = rs.getString("CONTENT");
                        String rep = rs.getString("REPLY");
                        String rep_y = rs.getString("REPLY_OK");
                        //String t = rs.getString("TYPE");
                        //String i = rs.getString("ID");
                        Date time = rs.getDate("TIME");
                        int cnt = rs.getInt("COUNT");
                        int pw = rs.getInt("PW");
                        // String name = rs.getString("name");
                        board.add(new Board(boardNum, sunb, cont, rep, rep_y, type, id, time, cnt, pw));
                                                                                                                                                             
                    }
                } catch (SQLException e) {
                    printSQLException(e);
                }
        return board;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause : " + t);
                    t = t.getCause();
                }
            }
        }
    }

}
