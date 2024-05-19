<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%-- 데이터베이스 탐색 라이브러리 --%>
<%@ page import="java.sql.Connection" %>
<%-- 데이터베이스 연결 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>
<%-- 데이터베이스 SQL 전송 라이브러리 --%>


<%-- 값 받아올때는 이것도 필요함!!! --%>
<%@ page import="java.sql.ResultSet" %>
<%-- 데이터베이스 값 받아오기 라이브러리 --%>



<%
    //jsp 문법을 적는 공간

    // 전 페이지에서의 값을 받아오는 것 과정(이 과정은 Delete , Update , INSERT 과정때 필요하다.)
    request.setCharacterEncoding("utf-8"); //안해주면 전 페이지가 준 한글이 깨진다.
    String titleValue=request.getParameter("title_value");
    String contentValue=request.getParameter("content_value");
    String boardidxValue=request.getParameter("boardidx_value");

    //위에서 받아온 값으로 데이터베이스 통신
    
    //데이터베이스 통신
     //여기서 에러시 톰캣 db connector가 없다 이 3개중에 있다.
    //데이터베이스에서는 필수 이다!! 출입구 여는 느낌
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web","stageus","1234");

    String sessionId = String.valueOf(session.getAttribute("session_id"));



    //치고자 싶은 명령어!!
    String sql="UPDATE board SET title=? , content=? WHERE IDX=?";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,titleValue);
    query.setString(2,contentValue);
    query.setString(3,boardidxValue);

    if(titleValue.length()<1){
        %>
    <body>
        <script>
            alert("제목을 1글자이상 입력해주세요")
            location.href="mainpage.jsp"

        </script>

    </body>

        <%
    return; 
    } 
    
    if(contentValue.length()<1){
        %>
    <body>
        <script>
            alert("내용을 1글자이상 입력해주세요")
            location.href="mainpage.jsp"

        </script>

    </body>

        <%
    return; 
    }

    //db로 전송하기 (UPDATE INSERT DELETE) 때 사용한다
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
        alert("수정 되었습니다");
        location.href="mainpage.jsp"
    

    </script>
</body>
