# senashop
구조 tomcat + jsp + java + oracle 
![image](https://github.com/Rookies13/Senanam/assets/140288335/2a7b5ca5-b523-4eed-9cae-950686ee14f3)
![image](https://github.com/Rookies13/Senanam/assets/140288335/c65cf4c5-1eb6-47a5-bc30-e667be9dfbb8)



사전 환경 구축
1. JDK 설치 및 환경 설정
   https://www.oracle.com/java/technologies/downloads/#jdk20-windows
2. 톰캣
   https://tomcat.apache.org/download-10.cgi
tomcat-users.xml
##마지막 줄 추가
   <role rolename="manager-gui"/>
  <role rolename="admin"/>
  <user username="admin" password="admin" roles="admin,manager-gui"/>
  
3. maven
   https://maven.apache.org/download.cgi
   https://hianna.tistory.com/764
   https://sogno-ing.tistory.com/166
   https://www.youtube.com/watch?v=74I687FsITo
   https://www.youtube.com/watch?v=RiPot1ne8rI
   https://www.youtube.com/watch?v=A939OhSK6Kg
   
개발환경구축
1. Visaul Code 환경
(1) Java 개발 확장팩 설치:

Visual Studio Code를 실행하고, 왼쪽 사이드바에서 "Extensions" 아이콘을 클릭합니다.
검색 창에 "Java Extension Pack"을 입력하여 Java 개발 확장팩을 찾고 설치합니다.

(2) Git Graph 설치
Visual Studio Code를 실행하고, 왼쪽 사이드바에서 "Extensions" 아이콘을 클릭합니다.
검색 창에 "Git Graph"을 입력하여 GitGraph 개발 확장팩을 찾고 설치합니다.

(3) Oracle Developer Tools for VS Code 설치
Visual Studio Code를 실행하고, 왼쪽 사이드바에서 "Extensions" 아이콘을 클릭합니다.
검색 창에 "Oracle"을 입력하여 Oracle Developer Tools for VS Code 개발 확장팩을 찾고 설치합니다.

https://dschloe.github.io/sql/vscode_oracle/

cmd - lsnrctl status 확인 후 진행.

(4) Java Extension Pack 설치:

Visual Studio Code를 실행한 후, 확장 기능(Extensions) 메뉴에서 "Java Extension Pack"을 검색하여 설치합니다. 이 확장 기능은 Java 개발에 필요한 기능들을 제공합니다.

https://sangchul.kr/entry/vscode-Language-Support-for-JavaTM-by-Red-Hat-%ED%99%95%EC%9E%A5%ED%8C%A9-%EC%97%90%EB%9F%AC

(5) Community Server Connector

https://goodteacher.tistory.com/614

(6) maven project manager
(microsoft)
(7) java project manager
(microsoft)

2. Git 설정
(1) Git가입
(2) Rookies13 Oraganization 가입
      git remote set-url origin https://Rookies13@github.com/Rookies13/Senanam.git

3. oracle 21c

   설치 시 도움 될만한 사이트들
   https://jack-of-all-trades.tistory.com/456
   https://raccoonjy.tistory.com/21
   https://m.blog.naver.com/oldpig1/221649757783
   https://ajdahrdl.tistory.com/2
   https://nirsa.tistory.com/5

4.JDBC

JDBC 드라이버 추가:

먼저, Oracle JDBC 드라이버를 다운로드하여 프로젝트에 추가합니다. (https://www.oracle.com/database/technologies/appdev/jdbc-downloads.html)
다운로드한 ojdbc.jar 파일을 Tomcat의 lib 폴더에 추가합니다. 일반적으로 Tomcat의 설치 경로는 Tomcat_Home/lib입니다. 여기에 ojdbc.jar 파일을 복사합니다.

웹 애플리케이션 파일 구조 변경:

기존의 파일 구조가 Tomcat_Home/webapps/testApp 폴더에 위치한 것으로 가정합니다. 이제 웹 애플리케이션을 ROOT 컨텍스트로 옮기고, testApp 폴더 안의 파일들을 ROOT 컨텍스트 아래로 이동시키겠습니다.

파일 이동:
Tomcat_Home/webapps/testApp 폴더 안의 모든 파일과 폴더를 Tomcat_Home/webapps/ROOT 폴더로 이동시킵니다.
웹 애플리케이션 설정:
Tomcat_Home/conf/Catalina/localhost 폴더에 ROOT.xml 파일을 생성하고 아래와 같이 설정합니다:
xml
Copy code
<Context docBase="C:/your/project/path/ROOT" />
위 설정에서 C:/your/project/path/ROOT 부분은 프로젝트의 ROOT 컨텍스트 경로를 설정하는 것입니다. 해당 경로를 프로젝트의 실제 경로로 바꿔주세요.

JDBC 드라이버 설정:
JSP 파일에서 JDBC 드라이버를 로드하기 위해 JSP 페이지 상단에 다음과 같이 추가합니다:
jsp
Copy code
<%@ page import="java.sql.*" %>
JDBC 연결 설정:
JSP 페이지에서 Oracle 데이터베이스와 연동하는 부분을 앞서 설명한 방법으로 수정합니다. url, username, password를 올바르게 설정하여 데이터베이스와 연결하도록 합니다.
이제 Tomcat을 재시작하면 웹 애플리케이션이 ROOT 컨텍스트로 구동됩니다. 이렇게 변경한 구조에서는 http://localhost:8080 또는 http://your_server_ip:8080을 통해 웹 애플리케이션에 접속할 수 있습니다. 웹 애플리케이션은 ROOT 컨텍스트에서 구동되기 때문에 / 경로로 직접 접근이 가능해집니다.

















웹 브라우저 미리보기:
1. Live Server
Visual Studio Code에는 Live Server와 같은 확장팩을 설치하여 웹 브라우저에서 실시간으로 웹 페이지를 미리 볼 수 있습니다.
먼저 Visual Studio Code의 "Extensions" 아이콘을 클릭하여 "Live Server"를 검색하고 설치합니다.
웹 페이지 파일(HTML, CSS, JavaScript 등)을 Visual Studio Code에서 열고, 마우스 오른쪽 버튼으로 클릭한 후 "Open with Live Server"를 선택합니다.

2. local
C:\Program Files\Apache Software Foundation\Tomcat 10.1\webapps\testApp

