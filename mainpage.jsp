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
    
    String sessionId = String.valueOf(session.getAttribute("session_id"));
    
    //위에서 받아온 값으로 데이터베이스 통신
    
    //데이터베이스 통신
     //여기서 에러시 톰캣 db connector가 없다 이 3개중에 있다.
    //데이터베이스에서는 필수 이다!! 출입구 여는 느낌
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web","stageus","1234");





    //치고자 싶은 명령어!!
    String sql="SELECT idx , title FROM board;";
    PreparedStatement query = connect.prepareStatement(sql);

    

    ResultSet result = query.executeQuery();
    //가져온 Table 에서 row 1개를 읽어 (jsp 문법이라는게 문제)

%>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        #container{
            width:100%;
            height:100vh;
            display:flex;
            flex-direction:row;
            background-color : #00CCBB;
            
        }
        #left_container{
            width:20%;
            height:100%;
        }
        main{
            background-color:#8A697A;
            flex-grow:1;
        }
        #first_div{
            width:100%;
            height:20%;
            background-color:green;
            font-size:48px;
            background-color : #FFF5AA;
            text-align:center;
        }
        #id_div{
            font-size:23px;
            text-align:center;
        }
        .left_button{
            width:100%;
            height:20%;
            background-color:green;
            font-size:30px;
            background-color : #CCA500;
            text-align:center;
        }
        #String{
            width:80%;
            height:5%;
            background-color : #FF9B00;s

        }
        #make_button{
            width:20%;
            height:10%;
            background-color:#C7E8BD;
        }
    </style>

</head>
<body>
    <%-- <p> 아이디 : <%=idValue%> </p> --%>
    <div id=container>
        <div id=left_container>
            <div>
                <form action="mainpage.jsp">
                    <input type="submit" value="stageus" id=first_div>
                </form>
                <form action="logOut.jsp" id=id_div>
                    <%-- <div name="id_value">아이디 : <%=result.getString(1)%> </div> --%>
                    <span><%= sessionId  %>님 환영합니다! </span>
                    <%-- <div>이메일 : <%=result.getString(2)%> </div> --%>
                    <input type="submit" value="로그아웃" class=input_button>
                </form>
                <form action="myaccount.jsp" >
                    <input type="submit" value="내정보보기" class=left_button>
                </form>
                <form action="myboardList.jsp" >
                    <input type="submit" value="내가쓴글보기" class=left_button>
                </form>
                <form action="myCommentList.jsp">
                    <input type="submit" value="내가쓴댓글보기" class=left_button>
                </form>
                
            </div>
        </div>
        <main>

            <form action="makeBoard.jsp">
                    <input type="submit" value="글 작성하기" id=make_button>
            </form>
            
        
        <%
            while(result.next()){
        %>
            <%-- 여기는 html 영역 (쉽게 말해, jsp 의 반복문의 내용으로 html tag를 넣어줄 수 있다) --%>
            <form action="readBoard.jsp">
                    <input type="hidden" name="idx" value="<%=result.getString(1)%>">
                    <input type="submit" value="<%=result.getString(2)%>" id=String>
            </form>
                
        <%
            }
        %>




        </main>
    </div>




    


</body>
