import java.io.File;
import java.io.IOException;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/s3upload_admin")
public class s3upload_admin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 숫자를 받아서 처리
        String filename = request.getParameter("filename");
        if (filename != null) {
            ServletContext context = getServletContext();

            // index.jsp 파일의 상대 경로를 설정합니다.
            String relativePath = "/upload/" + filename; // 여기를 사용하려는 파일의 상대 경로로 변경하세요.

            // 실제 파일의 경로를 가져옵니다.
            String realPath = context.getRealPath(relativePath);

            // 실제 파일을 나타내는 File 객체를 생성합니다.
            File file = new File(realPath);

            AwsS3 awsS3 = AwsS3.getInstance();
            awsS3.upload(file, filename);

        }
        response.sendRedirect("admin.jsp");

        // 그 외의 작업을 처리하거나 다른 페이지로 리디렉션하고 싶다면 여기에 추가할 수 있습니다.
        // ...
    }
}
