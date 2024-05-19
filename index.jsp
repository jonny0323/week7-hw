<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>

    #container{
        background-color : #b9e0fd;
        margin : 100px 400px 0 400px;
        
    }
    #logo{
        width: 100%;
        height:120px;
        font-size : 50px;
        text-align: center;
        font-weight:600;
    }
    #login_div{
        text-align:center;
    }
   .input_button{
        width:50%;
        height:8%;
        font-size:36px;
    }
    .find_button{
        width:20%;
        height:5%;
        font-size:20px;
    }



    </style>
</head>
<body>

    <div id=container>
        <div id=logo>
            Stageus homepage
        </div>
        <div id=login_div>
            <form action="loginAction.jsp">
                <input type="text" name="id_value" class=input_button  placeholder="아이디">
                <br>
                <input type="text" name="pw_value" class=input_button placeholder="비밀번호">
                <br>
                <br>
                <input type="submit" value="로그인" class=input_button>
            </form>
            <form action="signIn.jsp">
                <input type="submit" value="회원가입" class=find_button>
            </form>
            <form action="findId.jsp">
                <input type="submit" value="아이디 찾기" class=find_button>
            </form>
            <form action="findPw.jsp">
                <input type="submit" value="비밀번호 찾기" class=find_button> 
            </form>
        </div>
    </div>

</body>
