<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.BufferedReader"%>
<%@ page import="java.io.InputStreamReader"%>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.HttpURLConnection"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>세나샵 인사말</title>
</head>
<body>

    <% 
    String urlString = request.getParameter("url");
    if (urlString != null && !urlString.isEmpty()) {
        try {
            URL url = new URL(urlString);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            String line;
            
            out.println("<pre>");
            
            while ((line = reader.readLine()) != null) {
                out.println(line);
            }
            
            out.println("</pre>");
            
            reader.close();
            connection.disconnect();
        } catch (Exception e) {
            out.println("<p>An error occurred: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p>Please enter a valid URL</p>");
    }
    %>
</body>
</html>

