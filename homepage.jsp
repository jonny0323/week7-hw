<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%-- 데이터베이스 탐색 라이브러리 --%>
<%@ page import="java.sql.Connection" %>
<%-- 데이터베이스 연결 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>
<%-- 데이터베이스 SQL 전송 라이브러리 --%>

<%
    //jsp 문법을 적는 공간
    request.setCharacterEncoding("utf-8"); //안해주면 전 페이지가 준 한글이 깨진다.
    String idValue=request.getParameter("id_value");
    String pwValue=request.getParameter("pw_value");

    //위에서 받아온 값으로 데이터베이스 통신
    //insert 문이 필요
    


    //데이터베이스 통신
    
    Class.forName("org.mariadb.jdbc.Driver");
    //여기서 에러시 톰캣 db connector가 없다 이 3개중에 있다.
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web","stageus","1234");

    String sql="INSERT INTO account(id, pw) VALUES(?,?);";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,idValue);
    query.setString(2,pwValue);


    //db로 전송하기

    query.executeUpdate();

%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%-- <p> 아이디 : <%=idValue%> </p> --%>

    <script>
         console.log("<%=idValue%>");
    </script>
</body>
