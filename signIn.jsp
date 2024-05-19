<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>

    #container{
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
        background-color : #b9e0fd;

    }
    .input_button{
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
        <div id=login_div>
            

            <form action="signupAction.jsp" onsubmit="handleSubmit(event)">
                <input type="text" name="id_value" class=input_button placeholder="아이디(6자리이상)">
                <br>
                <input type="text" name="pw_value" class=input_button placeholder="비밀번호(6자리이상)">
                <br>
                <input type="text" name="email_value" class=input_button placeholder="이메일주소">
                <br>
                <input type="text" name="name_value" class=input_button placeholder="이름(1자리이상)">
                <br>
                <input type="text" name="birth_value" class=input_button placeholder="생년월일 8자리" oninput="autoHyphen1(this)" maxlength="10" autofocus>
                <br>
                <input type="text" name="tell_value" class=input_button placeholder="휴대전화번호"  oninput="autoHyphen2(this)" maxlength="13" autofocus>
                <br>
                <br>
                <input type="submit" value="회원가입" class=input_button>
        </div>
    </div>
    <script>

        const autoHyphen1 = (target) => {
        target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/^(\d{0,4})(\d{0,2})(\d{0,2})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
        }

        const autoHyphen2 = (target) => {
        target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
        }


        const validateDateOfBirth = (dateOfBirth) => {
        // 생년월일 형식을 정규식으로 검사합니다 (YYYY-MM-DD 형식)
        const regex = /^\d{4}-\d{2}-\d{2}$/;
        if (!regex.test(dateOfBirth)) {
            return false; // 올바르지 않은 형식이면 false 반환
        }

        // 생년월일의 유효성을 추가로 검사할 수 있습니다.
        // 예를 들어, 실제 존재하는 날짜인지, 특정 범위 내의 날짜인지 등을 확인할 수 있습니다.

        return true; // 올바른 형식이면 true 반환
        }

        const handleSubmit = (event) => {
            // 폼이 제출될 때 실행되는 함수
            const dateOfBirthInput = document.querySelector('input[name="birth"]');
            const dateOfBirth = dateOfBirthInput.value;

            if (!validateDateOfBirth(dateOfBirth)) {
                alert("잘못된 생년월일 입력입니다.");
                event.preventDefault(); // 폼 제출을 취소합니다.
            }
        }
          
    </script>

</body>
