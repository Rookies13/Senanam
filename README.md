## Getting Started

Welcome to the VS Code Java world. Here is a guideline to help you get started to write Java code in Visual Studio Code.
1. git clone
  >  C:\git Create
  > cmd termianl
     - git clone https://(USERNAME)@github.com/Rookies13/Senanam.git

2. vscode - new window
  > open folder - git -> Senanam 

## Folder Structure

![image](https://github.com/Rookies13/Senanam/assets/140288335/e16fef2b-0d61-46dd-9441-4ffb7e86376f)


## Dependency Management
1. **JDK : ZULU-17**
     https://www.azul.com/downloads/?package=jdk#zulu

   ![image](https://github.com/Rookies13/Senanam/assets/140288335/54af6e77-4ede-4bdd-9044-5c57b663a79d)



3. **Tomcat : tomcat 8.5.91 (32/64-bit Windwows service Installer)**
      https://tomcat.apache.org/download-80.cgi

   ![image](https://github.com/Rookies13/Senanam/assets/140288335/1bb65589-1390-4513-9e8c-da25d92bfbf5)



5. **build system : apache-maven-3.9.3-bin.zip**
     https://maven.apache.org/download.cgi

  ![image](https://github.com/Rookies13/Senanam/assets/140288335/7ccf314f-f6c3-4a53-b635-7e842a5b8dc7)


> JAVA Path

  ![image](https://github.com/Rookies13/Senanam/assets/140288335/3215324c-7e83-412d-ad58-278f1ff146e6)


> If you want to customize the folder structure, open `.vscode/settings.json` and update the related settings there.

  ![image](https://github.com/Rookies13/Senanam/assets/140288335/edbf7cc2-55cf-4d46-9158-ea917790ec7c)

  >"rsp-ui.rsp.java.home": "C:\\Program Files\\Zulu\\zulu-17",

  > "java.jdt.ls.java.home": "C:\\Program Files\\Zulu\\zulu-17", or "java.home": "C:\\Program Files\\Zulu\\zulu-17",

The `JAVA PROJECTS` view allows you to manage your dependencies. More details can be found [here](https://github.com/microsoft/vscode-java-dependency#manage-dependencies).

# Senanam

VSCODE - Tomcat - JSP - JAVA Development environment configuration

Visaul Code configuration

(1) Java Install development extension pack:

Visual Studio Code, click the "Extensions" icon in the left sidebar. Type "Java Extension Pack" in the search bar to find and install the Java Development Extension Pack.

(2) Git Graph installation

Launch Visual Studio Code and click the "Extensions" icon in the left sidebar. Enter "Git Graph" in the search bar to find and install the GitGraph development extension pack.

(3) Oracle Developer Tools for VS Code installation 

Launch Visual Studio Code and click the "Extensions" icon in the left sidebar. Enter "Oracle" in the search bar to find and install the Oracle Developer Tools for VS Code development extension pack.

(4) Java Extension Pack (microsoft) installation:

After launching Visual Studio Code, search for "Java Extension Pack" in the Extensions menu and install it. This extension provides features necessary for Java development.

(5) Community Server Connector installation : 

reference : https://goodteacher.tistory.com/614

(6) maven project manager (microsoft) installation

(7) java project manager (microsoft) installation 


## BUILD & Debugging

> BUILD

![image](https://github.com/Rookies13/Senanam/assets/140288335/de74d766-8800-4b57-8109-f0f1025a7e16)

> Debugging

![image](https://github.com/Rookies13/Senanam/assets/140288335/432f0e5d-8f5d-4f7d-a294-a905627df6eb)



## GitGraph -  PUSH COMMIT DELETE DROP 
1. **main branch checkout**
     > checkout *main* branch

     ![image](https://github.com/Rookies13/Senanam/assets/140288335/e92a92f2-9a3b-4afe-9e4a-5e8cc0aa58ef)



2. **stasging -> comiit**
      >
   ![image](https://github.com/Rookies13/Senanam/assets/140288335/f0e9a530-9cae-422c-b43e-d33c2deffcf8)


(1) Source control - (date, name) - Write down changes and commit them. 

3. **create branch**
    
> create branch

![image](https://github.com/Rookies13/Senanam/assets/140288335/ff5ebebd-78a6-4d41-83e9-362e08c1fbb2)

> push branch 


### DB 
 > info
  **AWS RDS oracle 19C**

## ERD 

![image](https://github.com/Rookies13/Senanam/assets/140288335/0d734bcf-089c-4eef-bda5-d5ab0edd373f)


## DB Configuration

*Branch* : DB
*Commit* : 0d00d4ef6c0288df924796ba179bc6ebd85762d6

*webapp - WEB-INF - META-INF - context.xml *

<Context>
    <Resource name="jdbc/aws" auth="Container" type="javax.sql.DataSource"
        maxTotal="100" maxIdle="30" maxWaitMillis="10000"
        username="ID" password="PW"
        driverClassName="DRIVERNAME"
        url="jdbc:oracle:thin:@AWS Address:PORT" />
</Context>


*webapp - WEB-INF - WEB-INF - web.xml *

<resource-ref>
<description>Oracle Datasource example</description>
<res-ref-name>jdbc/aws</res-ref-name>
<res-type>javax.sql.DataSource</res-type>
<res-auth>Container</res-auth>
</resource-ref>
