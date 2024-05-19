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
    String idxValue=request.getParameter("idx");
    //위에서 받아온 값으로 데이터베이스 통신
    
    //데이터베이스 통신
     //여기서 에러시 톰캣 db connector가 없다 이 3개중에 있다.
    //데이터베이스에서는 필수 이다!! 출입구 여는 느낌
    Class.forName("org.mariadb.jdbc.Driver");
    Connection connect = DriverManager.getConnection("jdbc:mariadb://localhost:3306/web","stageus","1234");



    String sessionId = String.valueOf(session.getAttribute("session_id"));

    //치고자 싶은 명령어!!
    String sql="SELECT id, title,content,idx FROM board WHERE idx= ? ;";
    PreparedStatement query = connect.prepareStatement(sql);
    query.setString(1,idxValue);

    

    //db로 전송하기 (UPDATE INSERT DELETE) 때 사용한다
    




    //db로 부터 값 받기 (SELECT 일때 사용)
    ResultSet result = query.executeQuery();
    result.next(); //가져온 Table 에서 row 1개를 읽어 (jsp 문법이라는게 문제)


%>
<body>
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
        <div id=space>

        </div>
        <main>
            <div id=space>

        </div>
    <div id=container>
        <div id=logo>
            
        </div>

    <div >
        <div id=read_title>
            TITLE : <%=result.getString(2)%>
        </div>
        <div id=read_content>
            content : <%=result.getString(3)%>
        </div>
        

        <div>
            <form action="makeCommentAction.jsp">
                <input type="hidden" name="boardid_value" value="<%=result.getString(1)%>">
                <input type="hidden" name="boardidx_value" value="<%=result.getString(4)%>">
                <input type="text" name="comment_value" class=input_button  placeholder="comment" id=comment_input>
                <br>
                <input type="submit" value="댓글 작성 완료" id=update_button> 
            </form>
        </div>

    


<%


    String sql1="SELECT id, comment,idx FROM comment WHERE board_idx=? ;";

    PreparedStatement query1 = connect.prepareStatement(sql1);
    query1.setString(1,idxValue);
    ResultSet result1 = query1.executeQuery();
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
            background-color:#00CCBB;
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
        #space{
            width:10%;
            height:10%;
            
        }
        #title{
            width:150%;
            height:10%;
        }
        #content{
            width:150%;
            height:50%;
        }
        #string_button{
            width:30%;
            height:10%;
        }
        #read_title{
            
            
        
            font-size:40px;
        }
        #read_content{
            font-size:25px;
        }
        #comment_input{
            width:800px;
            height:10%;
        }
        #update_button{
            width:15%;
            height:5%;
        }
    </style>
</head>
<body>
    <%-- <p> 아이디 : <%=idValue%> </p> --%>
     <div>
    <%  while(result1.next()){ 

    %>
        <div id>
            Id : <%=result1.getString(1)%>
        </div>
        <div>
            comment : <%=result1.getString(2)%>
        </div>
        <script>
            console.log("<%=result1.getString(1)%>");
        </script>
    <% 
        if(sessionId.equals(result1.getString(1))){ %>
    <form action="updateComment.jsp">
        <input type="hidden" name="commentidx_value" value="<%=result1.getString(3)%>" >
        <input type="submit" value="댓글 수정하기" id=update_button>
    </form>
    <% 
        }}
    %>
        
    <% 
    if (sessionId.equals(result.getString(1))) { %>

    <form action="updateBoard.jsp">
        <input type="hidden" name="boardidx_value" value="<%=result.getString(4)%>">
        <input type="submit" value="글 수정하기" id=update_button>
    </form>

    <% } 
    %>
        </div>
    </div>
</main>


    
</body>
