<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>

<%@ page import="java.sql.DriverManager" %>
<%-- 데이터베이스 탐색 라이브러리 --%>
<%@ page import="java.sql.Connection" %>
<%-- 데이터베이스 연결 라이브러리 --%>
<%@ page import="java.sql.PreparedStatement" %>
<%-- 데이터베이스 SQL 전송 라이브러리 --%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page import="java.util.regex.Matcher" %>

<%
    //jsp 문법을 적는 공간
    request.setCharacterEncoding("utf-8"); //안해주면 전 페이지가 준 한글이 깨진다.
    String pwValue=request.getParameter("pw_value");
    String emailValue=request.getParameter("email_value");
    String nameValue=request.getParameter("name_value");
    String birthValue=request.getParameter("birth_value");
    String tellValue=request.getParameter("tell_value");

    
    String email_pattern = "[^@]+@[^.]+\\..+";
    Pattern regex = Pattern.compile(email_pattern);
    Matcher matcher = regex.matcher(emailValue);

    
        // 오류띄우기
    

    //위에서 받아온 값으로 데이터베이스 통신
    //insert 문이 필요
    


    //데이터베이스 통신
    
    Class.forName("org.mariadb.jdbc.Driver");
    //여기서 에러시 톰캣 db connector가 없다 이 3개중에 있다.
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web","stageus","1234");



// 이게 아이디가 존재하는지 보고 인설트 해야함.... 존재하면 만들 수 없다고 오류 메세지 띄우기!!!

    String sessionId = String.valueOf(session.getAttribute("session_id"));

    String sql="UPDATE account SET pw= ? , email= ? , name= ? , birth= ? , tell= ? WHERE id= ? ;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,pwValue);
    query.setString(2,emailValue);
    query.setString(3,nameValue);
    query.setString(4,birthValue);
    query.setString(5,tellValue);
    query.setString(6,sessionId);


    ResultSet result = query.executeQuery();
    
    
    
     
    if(pwValue.length()<6){
    %>
    <body>
        <script>
            alert("비밀번호가 너무 짧습니다");
            location.href="signIn.jsp"
        </script>
    </body>

    <% 
        return;
    }
    if(pwValue.length()<2){
    %>
    <body>
        <script>
            alert("이름이 너무 짧습니다");
            location.href="signIn.jsp"
        </script>
    </body>

    <% 
        return;
    }
    if(!matcher.find()){
        
    %>
    <body>
        <script>
            alert("이메일 형식이 틀렸습니다");
            location.href="signIn.jsp"
        </script>
    </body>

    <% 
        return;
    }












    if(birthValue.length()!=10){
    %>
    <body>
        <script>
            alert("생년월일 형식이 잘못되었습니다");
            location.href="signIn.jsp"
        </script>
    </body>

    <% 
        return;
    }
    %>
    <%


        
    if(tellValue.length()!=13){
    %>
    <body>
        <script>
            alert("전화번호 형식이 잘못되었습니다");
            location.href="signIn.jsp"
        </script>
    </body>
    <% 
        return;
    }
    %>

    <body>
        <script>
            alert("개인정보수정 완료!");
            location.href="myaccount.jsp"
        </script>
    </body>
    <% 
        
    
        
    



    

%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%-- <p> 아이디 : <%=idValue%> </p> --%>

    








    
</body>
