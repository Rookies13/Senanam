## AWS RDS oracle

![image](https://github.com/Rookies13/Senanam/assets/140288335/917bdc0c-dd11-423d-8a65-2e22bf4daaac)



# TEST 접속 정보

![image](https://github.com/Rookies13/Senanam/assets/140288335/44637403-33ea-4d51-a81f-ad6abb6dfe02)


엔드포인트 : 
aws.c8fgbyyrj5ay.ap-northeast-2.rds.amazonaws.com

사용자 : 
admin / 12345678

# 설정
*Branch* : DB
*Commit* : 0d00d4ef6c0288df924796ba179bc6ebd85762d6

> **webapp - WEB-INF - META-INF - context.xml 수정**

<Context>
    <Resource name="jdbc/aws" auth="Container" type="javax.sql.DataSource"
        maxTotal="100" maxIdle="30" maxWaitMillis="10000"
        username="admin" password="12345678"
        driverClassName="oracle.jdbc.OracleDriver"
        url="jdbc:oracle:thin:@aws.ce0twkaphola.ap-northeast-2.rds.amazonaws.com:1521:orcl" />
</Context>

> **webapp - WEB-INF - WEB-INF - web.xml 수정**
  <resource-ref>
    <description>Oracle Datasource example</description>
    <res-ref-name>jdbc/aws</res-ref-name>
    <res-type>javax.sql.DataSource</res-type>
    <res-auth>Container</res-auth>
</resource-ref>

