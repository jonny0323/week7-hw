<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>

    #container{
        margin : 100px 400px 0 400px;
        background-color : #b9e0fd;

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
    #input_button{
        width:50%;
        height:8%;
        font-size:36px;
    }
    #find_button{
        width:20%;
        height:5%;
        font-size:20px;
    }



    </style>
</head>
<body>

    <div id=container>
        <div id=logo>
            비밀번호 찾기
        </div>
        <div id=login_div>
            <form action="getPw.jsp">
                <input type="text" name="id_value" id=input_button placeholder="아이디">
                <br>
                <input type="text" name="tell_value" id=input_button placeholder="전화번호"  oninput="autoHyphen2(this)" maxlength="13" autofocus>
                <br>
                <br>
                <input type="submit" value="비밀번호 찾기" id=input_button>

                
            </form>
            
        </div>
    </div>
<script>

        const autoHyphen2 = (target) => {
        target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
        }
         
    </script>
</body>
