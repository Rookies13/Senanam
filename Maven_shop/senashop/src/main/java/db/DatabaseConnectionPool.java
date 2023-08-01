package db;
<<<<<<< HEAD

=======
>>>>>>> 02bbca1ef47f009cae8c734cc88c561cc0a18489
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
<<<<<<< HEAD

=======
>>>>>>> 02bbca1ef47f009cae8c734cc88c561cc0a18489
//0727-이순빈 AWS DB Connection 호출용 CLASS
public class DatabaseConnectionPool {
    private static DataSource dataSource;

    static {
        try {
            // Get the context and the data source from JNDI
            Context initCtx = new InitialContext();
            Context envCtx = (Context) initCtx.lookup("java:comp/env");
            dataSource = (DataSource) envCtx.lookup("jdbc/aws");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
}
