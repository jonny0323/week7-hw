<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%

    String sessionId = String.valueOf(session.getAttribute("session_id"));
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
    

    </style>
</head>
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
        <div id=login_div>
            <form action="makeBoardAction.jsp">
                <input type="text" name="title_value" class=input_button  placeholder="TITLE" id=title>
                <br>
                <textarea rows="4" cols="50" name="content_value" class=input_button id=content   placeholder="CONTENT">
                </textarea>
                <br>
                <br>
                <input type="submit" value="글 작성 완료" id=string_button>
            </form>
        </div>
    </div>

</body>
