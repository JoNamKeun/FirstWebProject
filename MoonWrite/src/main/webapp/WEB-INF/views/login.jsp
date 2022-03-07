<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>로그인</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="css/styles.css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
</head>
<style>
    @font-face {
    font-family: 'KyoboHandwriting2020A';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/KyoboHandwriting2020A.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
* {
box-sizing: border-box;
    font-family: 'KyoboHandwriting2020A';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/KyoboHandwriting2020A.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

body {
  margin: 0;
  background-color: #153259; 
}

.login-form {
  position: absolute;
  background-color: #EEEFF1;
  border-radius: 5px;
  margin-left: auto;
  margin-right: auto;
  width: 300px;
  padding: 20px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  margin-top: 15px;
}

.text-field {
  border: none;
  width: 90%;
  border-radius: 5px;
  font-size: 14px;
  padding: 10px;
  margin-bottom: 10px;
  margin-left: auto;
  margin-right: auto;
}

.submit-btn {
  border: none;
  width: 90%;
  background-color: yellow;
  border-radius: 5px;
  font-size: 14px;
  padding: 10px;
  margin-bottom: 30px;
  color: black;
  font-weight: bold;
}

.submit-btn:hover{
  background-color: #9B9B9B;
  color: yellow;
}

.links {
  text-align: center;
  text-decoration : none;
  margin-bottom: 15px; 
  margin-top: -12px;
}

.links a {
  font-size: 12px;
  color: #9B9B9B;
}
h1
{
  color: yellow;
  text-align: center;
  margin-bottom: 50px;
  margin-top: 272px;
  font-weight: bold;
}
h2{
  text-align: center;
  font-weight: bold;
}
</style>
<body>
  <h1>Moon write</h1>
  <div class="login-form">
    <form>
      <h2>Login</h2>
      <input type="text" name="email" class="text-field" placeholder="아이디"><br>
      <input type="password" name="password" class="text-field" placeholder="비밀번호"><br>
      <input type="submit" value="로그인" class="submit-btn">
    </form>

    <div class="links">
      <a href="#">아이디를 잊어버리셨나요?</a><br>
      <a href="#">비밀번호를 잊어버리셨나요?</a>
    </div>
  </div>
</body>
</html>