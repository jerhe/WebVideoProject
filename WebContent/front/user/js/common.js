function $(objStr){return document.getElementById(objStr);}  
window.onload = function(){  
    //分析cookie值，显示上次的登陆信息  
    var userNameValue = getCookieValue("username2");  
    $("username2").value = userNameValue;  
    var passwordValue = getCookieValue("password2");  
    $("password2").value = passwordValue;      
    //写入点击事件  
    $("submit").onclick = function()  
    {  
        var userNameValue = $("username2").value;  
        var passwordValue = $("password2").value;  
        //服务器验证（模拟）      
        var isAdmin = userNameValue == "admin" && passwordValue =="admin";  
        var isUser = userNameValue == "user" && passwordValue =="user";  
        var isMatched = isAdmin || isUser;  
        if(isMatched){  
            if( $("saveCookie").checked){    
                setCookie("username2",$("username2").value,7,"/");  
                setCookie("password2",$("password2").value,7,"/");  
            }      
            alert("Successful landing, welcome," + userNameValue + "!");  
            self.location.replace("welcome.html");  
        }  
        else alert("用户名或密码错误");      
    }  
} 