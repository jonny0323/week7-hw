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
    String sessionId = String.valueOf(session.getAttribute("session_id"));
    

    //위에서 받아온 값으로 데이터베이스 통신
    
    //데이터베이스 통신
     //여기서 에러시 톰캣 db connector가 없다 이 3개중에 있다.
    //데이터베이스에서는 필수 이다!! 출입구 여는 느낌
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web","stageus","1234");




    //치고자 싶은 명령어!!
    String sql="SELECT id,email,name,birth,tell FROM account WHERE id = ?;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,String.valueOf(session.getAttribute("session_id")));
    


    //db로 부터 값 받기 (SELECT 일때 사용)
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
            height:3%;
            background-color : #FF9B00;

        }
        .input1_button{
            background-color : #FF6F42;
            width:20%;
            height:5%;

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
                <%
                    if(result.next()){
                %>
                    <div>아이디 : <%=result.getString(1)%> </div>
                    <br>
                    <div>이메일 : <%=result.getString(2)%> </div>
                    <br>
                    <div>이름 : <%=result.getString(3)%> </div>
                    <br>
                    <div>생년월일 : <%=result.getString(4)%> </div>
                    <br>
                    <div>전화번호 : <%=result.getString(5)%> </div>
                <%
                    }
                %>
                <div>

                    <form action="update.jsp">
                        <input type="submit" value="개인정보 수정하기" class=input1_button>
                    </form>
                    <form action="delete.jsp">
                        <input type="submit" value="회원 탈퇴하기" class=input1_button>
                    </form>
                </div>
            
                

        </main>
    </div> 
    
    
</body>
<%-- 

                  --%>

<%-- 
                 --%>