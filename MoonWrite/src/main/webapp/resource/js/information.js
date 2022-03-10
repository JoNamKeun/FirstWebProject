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
        pass.onkeyup = passChk = checkPass;
        frm.onsubmit = function(e){
          if(!checkId())
            e.preventDefault();
          if(!checkPass())
            e.preventDefault();
        }
      }