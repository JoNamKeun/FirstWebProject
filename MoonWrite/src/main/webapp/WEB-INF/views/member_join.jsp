<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>회원가입 예제</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <style>
    @font-face {
    font-family: 'KyoboHandwriting2020A';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/KyoboHandwriting2020A.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
        *{
          margin: 0;
          padding: 0;
    font-family: 'KyoboHandwriting2020A';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/KyoboHandwriting2020A.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
        body{
           background-color: #153259;           
        }

        h1{
          text-align: center;
          margin-top: 150px;
          margin-bottom: 8px;
          color: yellow;
          font-weight: bold;
        }
        .container{
          width: 400px;
          padding:20px;
          margin:0 auto;
          border: 1px solid #d1d1d1;
          background-color: #EEEFF1;
          border-radius: 5px;
        }
        #frm > ul{
          list-style-type: none;
        }
        #frm > ul > ul{
          list-style-type: disc;
          margin-top: 5px;
          padding-left: 40px;
          color: #EEEFF1;
        }
        #frm > ul > li{
          margin-top: 15px;
        }
        #mail_chk{
            width: 50%;
        }

        #class{
            width: 35%;
        }
        label{
          font-weight: bold;
          font-size: 35px;
        }
        .border_bottom{
         border: none;
         background-color: white;
         border-radius: 5px;
        }
        
        input {
          border:none;
          outline : none;
          height: 50px;
          width: 70%;
          margin: 5px;
          padding-left: 10px;

        }
        .sub_txt{
          display: inline-block;
          width: 20%;
          text-align: right;
          padding-right: 10px;
          box-sizing: border-box;
          font-weight: bold;
          color: #EEEFF1;
        }
        select{
          border: none;
          background-color: #d4d4d4;
          border-radius: 10px;
          padding: 5px;
          width: 40%;
          font-size: 15px;
          text-align: center;
          margin: 3px;

        }
        #tel{
          padding-left: 10px;
        }
        .btn_send_no{
          width: 230px;
          height: 50px;
          background-color: white;
          border:1px solid #c4c4c4;
          border-radius: 25px;
        }
        .btn_send_no:hover{
          background-color: #c4c4c4;
        }
        .btn_send_no:active{
          background-color: white;
        }
        .btn_next{
          width: 50%;
          height: 50px;
          background-color: yellow;
          color: black;
          border-radius: 10px;
          border:none;
          margin-left: 25%;
          font-weight: bold;

        }
        .btn_check{
          width: 20%;
          height: 50px;
          background-color: #d4d4d4;
          border-radius: 10px;
          border: none;
          margin: 5px;
        }
        .btn_next:hover{ /*해당 클래스 값에 마우스를 올렸을 때*/
          background-color: #9B9B9B;
          color: yellow;
        }
        .btn_check:hover{
          background-color: yellow;
        }
        .true{
          font-weight: bold;
          color:blue;
        }
        .false{
          font-weight: bold;
          color:red;
        }
        li{
          display: flex;
          flex-direction: row;
        }
        select{
          border: none;
          background-color:#d4d4d4;
          border-radius: 10px;
          padding: 5px;
          width: 20%;
          font-size: 15px;
          text-align: center;
        }
        h2{
         display: block;
         font-size: 2em;
         font-weight: bold;
         text-align: center;
        }
        .border_bottom{
         border: none;
         border-radius: 5px;
        }
        .email_tag{
          padding-top: 10px;
          display: flex;
          justify-content: center;
          align-items: center;
        }
      
    </style>
    <script>
      function checkPass(){
        let pass = document.querySelector("#pass");
        let passChk = document.querySelector("#pass_chk");
        let passCheck = document.querySelector(".pass_check");
        let result = false;
        if(pass.value.length < 8 || pass.value.length > 32){
          passCheck.innerHTML = "암호는 글자수가 8~32글자 사이로 사용하세요";
        }else if(!isNaN(pass.value)){
          passCheck.innerHTML = "암호는 숫자로만 구성할수 없습니다.";
        }else if(pass.value.indexOf(" ") != -1){
          passCheck.innerHTML = "암호에는 띄워쓰기를 할수 없습니다.";
        }else if(pass.value != passChk.value){
          passCheck.innerHTML = "입력하신 암호가 동일하지 않습니다.";
        }else{
          passCheck.innerHTML = "암호가 올바르게 입력되었습니다.";
          result = true;
        }
        if(result){
          passCheck.classList.remove("false");
          if(!passCheck.classList.contains("true"))
            passCheck.classList.add("true");
        }else{
          passCheck.classList.remove("true");
          if(!passCheck.classList.contains("false"))
            passCheck.classList.add("false");
        }
        return result;
      }

      window.onload = function(){
        let pass = document.querySelector("#pass");
        let passChk = document.querySelector("#pass_chk");
        let frm = document.querySelector("#frm");
        pass.onkeyup = checkPass;
        passChk.onkeyup = checkPass;
        frm.onsubmit = function(e){
          if(!checkId())
            e.preventDefault();
          if(!checkPass())
            e.preventDefault();
        }
      }
    </script>
</head>

<body>
    <h1>Moon write</h1>
    <div class="container">
        <form action="" id="frm">
          <h2>Join</h2>
            <ul>
                <li >
                    <input class="border_bottom"  type="text" name="id" id="id"  placeholder="아이디를 입력하세요">
                    <button class="btn_check">중복확인</button>
                </li>
                <li>
                  <input class="border_bottom" type="text" name="id" id="id" placeholder="닉네임을 입력하세요">
                  <button class="btn_check">중복확인</button>
              </li>
                <li >
                    <input class="border_bottom" type="password" name="pass" id="pass" placeholder="비밀번호(8~32자리)">
                </li>
                <li>
                    <input class="border_bottom" type="password" id="pass_chk" placeholder="비밀번호 재입력">
                </li>
                <li class="pass_check"></li>
                <li>
                  <input class="border_bottom" type="email" id="mail_chk" placeholder="이메일을 입력하세요">
                  <label class="email_tag">@</label>
                  <select id = "class">
                      <option value="naver">naver.com</option>
                      <option value="nate">nate.com</option>
                      <option value="hanmail">hanmail.net</option>
                      <option value="gmail">gmail.com</option>
                      <option value="">직접입력</option>
                  </select>
              </li>

                <li>
                    <button class="btn_next">회원가입</button>
                </li>

            </ul>
        </form>

    </div>
</body>

</html>