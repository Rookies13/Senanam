package db;
<<<<<<< HEAD

=======
>>>>>>> 02bbca1ef47f009cae8c734cc88c561cc0a18489
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.Map;
<<<<<<< HEAD

=======
>>>>>>> 02bbca1ef47f009cae8c734cc88c561cc0a18489
//0729-이순빈-취약한 Statement 쿼리 조회 환경 구성 미사용 중
public class SelectDAO {
    public List<Map<String, Object>> fetchAllData(String table, String id) {
        List<Map<String, Object>> resultData = new ArrayList<>();
        try (Connection conn = DatabaseConnectionPool.getConnection()) {
            String query = "SELECT * FROM " + table + " WHERE id LIKE '%" + id + "%'";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();
            // Process the result set
            while (rs.next()) {
                Map<String, Object> rowData = new HashMap<>();
                // Do something with the data
                for (int i = 1; i <= columnCount; i++) {
                    String columnName = metaData.getColumnName(i);
                    Object columnValue = rs.getObject(i);
                    rowData.put(columnName, columnValue);
                }
                resultData.add(rowData);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultData;
    }
<<<<<<< HEAD

=======
>>>>>>> 02bbca1ef47f009cae8c734cc88c561cc0a18489
    public List<Map<String, Object>> fetchInData(String table, String id, String type) {
        List<Map<String, Object>> resultData = new ArrayList<>();
        try (Connection conn = DatabaseConnectionPool.getConnection()) {
            String query = "SELECT * FROM " + table + " WHERE id LIKE '%" + id + "%'";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();
            // Process the result set
            while (rs.next()) {
                Map<String, Object> rowData = new HashMap<>();
                // Do something with the data
                for (int i = 1; i <= columnCount; i++) {
                    String columnName = metaData.getColumnName(i);
                    Object columnValue = rs.getObject(i);
                    rowData.put(columnName, columnValue);
                }
                resultData.add(rowData);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultData;
    }

<<<<<<< HEAD
=======

>>>>>>> 02bbca1ef47f009cae8c734cc88c561cc0a18489
}
