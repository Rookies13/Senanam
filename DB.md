## AWS RDS oracle

![image](https://github.com/Rookies13/Senanam/assets/140288335/e81ab00a-c24e-4b75-a037-f2e921266de5)

# 설정
*Branch* : DB
*Commit* : 0d00d4ef6c0288df924796ba179bc6ebd85762d6

> **webapp - WEB-INF - META-INF - context.xml 수정**
* context.xml
<Context>
    <Resource name="jdbc/aws" auth="Container" type="javax.sql.DataSource"
        maxTotal="100" maxIdle="30" maxWaitMillis="10000"
        username="아이디" password="패스워드"
        driverClassName="oracle.jdbc.OracleDriver"
        url="'엔드포인트':orcl" />
</Context>

> **webapp - WEB-INF - WEB-INF - web.xml 수정**
* web.xml
  <resource-ref>
    <description>Oracle Datasource example</description>
    <res-ref-name>jdbc/aws</res-ref-name>
    <res-type>javax.sql.DataSource</res-type>
    <res-auth>Container</res-auth>
</resource-ref>

