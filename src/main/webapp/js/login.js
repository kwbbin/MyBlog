window.onload=function(){
            var screenTop=document.documentElement.clientHeight
            var screenLeft=window.screen.width;
            var registerBox=document.getElementsByClassName("registerBox")[0];
            var height=registerBox.offsetHeight;
            var width=registerBox.offsetWidth+53;
            registerBox.style.top=(screenTop-height)/2+30+"px";
            registerBox.style.left=(screenLeft-width)/2+"px";
           
            switchButton();
            verifyOne(right1);
            verifyTwo(right2);
            imgPreview();
            verificationCode();
            
        }
        
		
		
		//切换登录与注册选项卡
        function switchButton(){
            var oTop=document.getElementById("lTop");
            var oBottom=document.getElementById("lBottom");
            var oRight1=document.getElementById("right1");
            var oRight2=document.getElementById("right2");


            oTop.onclick=function(){
                this.classList.add("action");
                oBottom.classList.remove("action");
                oRight1.style.display="block";
                oRight2.style.display="none";
            }

            oBottom.onclick=function(){
                this.classList.add("action");
                oTop.classList.remove("action");
                oRight1.style.display="none";
                oRight2.style.display="block";
            }
        }

        
        //表单一函数
        function verifyOne(formName){
            box=null;
            var view=false;
            var right1=document.getElementById("right1");
            var user=document.forms["myform1"]["userNumber"];
            var password=document.forms["myform1"]["password"];
            var submit=document.forms["myform1"]["submit"];
            
            user.addEventListener("focus", userFocus);
            user.addEventListener("blur",userBlur);
            user.addEventListener("keyup",userKeyup);
            
            password.addEventListener("focus",passwordFocus);
            password.addEventListener("blur",passwordBlur);
            password.addEventListener("keyup",passwordKeyup);

            submit.addEventListener("click",formVerify);

    
            function checkInput(obj,reg,left,top,text){//obj为传入input对象，reg为正则表达式，left,right为生成提示框位置，text为提示框内容
                var value=obj.value;
                var out1=reg.test(value);
                var right1=document.getElementById("right1");
                
                if(box==null){
                    box = document.createElement("div");
                    box.className="warn";
                };
                
                if(value==null || value==""||!out1){
                    box.style.cssText+="left:"+left+"px;top:"+top+"px;";
                    box.innerHTML=text;
                    right1.appendChild(box);
                    obj.style.border="1px solid red";
                    return true;
                }else{
                    var box1=document.getElementsByClassName("warn")[0];
                    if(box1!=undefined){
                        obj.style.border="1px solid rgba(255,255,255,0)";
                        right1.removeChild(box1);
                        box=null;
                    }
                    return false;
                };

                
            }


            //用户名
            function userFunction(){
//            	var submitError2= document.getElementById("submitError2");
                var user=document.forms["myform1"]["userNumber"];
                var reg=/^[a-zA-Z0-9_-]{4,16}$/;
                var left=370;
                var top=80;
                var text="用户名不能为空 , 且只能4到16位（字母，数字，下划线，减号）";
                var out2=checkInput(user,reg,left,top,text);
                return out2;
            }

            function userFocus(){
                clearError();
                userFunction();
            }

            function userBlur(){
                clearError();
                userFunction();
            }

            function userKeyup(){
                clearError();
                userFunction();
            }
            //用户名



            //密码
            function passwordFunction(){
                var user=document.forms["myform1"]["password"];
                var reg=/^[\w._*&$#]{6,12}$/;
                var left=370;
                var top=132;
                var text="密码不能为空 , 且只能6到12位（字母，数字，下划线，.*&$#）";
                var out3=checkInput(user,reg,left,top,text);
                return out3;
            }
            function passwordFocus(){
                clearError();
                passwordFunction();
            }

            function passwordBlur(){
                clearError();
                passwordFunction();
            
            }

            function passwordKeyup(){
                clearError();
                passwordFunction();
            }
            //密码

            //表单验证函数
            function formVerify(ev){
                var event=ev||window.ev;
                var userV=document.forms["myform1"]["userNumber"];
                var passwordV=document.forms["myform1"]["password"];
                var Do=new Array();
                var oInput=new Array();
                oInput[0]=userV;
                oInput[1]=passwordV;

                Do[0]=userFunction();
                Do[1]=passwordFunction();
                userV.index=0;
                passwordV.index=1;

                for(var i=0;i<Do.length;i++){
                    if(Do[i]==true){
                        oInput[i].style.border="1px solid red";
                    }
                };

                if(userFunction()){
                    submitError.innerHTML="请正确填写";
                    stopDefault(event);
                }else if(passwordFunction()){
                    submitError.innerHTML="请正确填写";
                    stopDefault(event);
                };
                
            }

            

            
            //清除表单一的提示框内容
            function clearError(){
                var submitError=document.getElementById("submitError");
                submitError.innerHTML="";
            }    
            
        }






        //第二个表单的验证函数
        function verifyTwo(formName){
        	var isSingleUser=true;
            boxP=null;
            var right2=document.getElementById("right2");
            var user=document.forms["myform2"]["userNumber"];
            var tel=document.forms["myform2"]["telephone"];
            var email=document.forms["myform2"]["email"];
            var nickname=document.forms["myform2"]["name"];
            var password=document.forms["myform2"]["password"];
            var passwordAgain=document.forms["myform2"]["passwordAgain"];
            var verificationCode=document.forms["myform2"]["verificationCode"];
            var submit=document.forms["myform2"]["submit"];

            user.addEventListener("focus", userFocus);
            user.addEventListener("blur",userBlur);
            user.addEventListener("keyup",userKeyup);

            tel.addEventListener("focus", telFocus);
            tel.addEventListener("blur",telBlur);
            tel.addEventListener("keyup",telKeyup);

            email.addEventListener("focus", emailFocus);
            email.addEventListener("blur",emailBlur);
            email.addEventListener("keyup",emailKeyup);

            nickname.addEventListener("focus", nicknameFocus);
            nickname.addEventListener("blur",nicknameBlur);
            nickname.addEventListener("keyup",nicknameKeyup);
            
            password.addEventListener("focus",passwordFocus);
            password.addEventListener("blur",passwordBlur);
            password.addEventListener("keyup",passwordKeyup);

            passwordAgain.addEventListener("focus", passwordAgainFocus);
            passwordAgain.addEventListener("blur",passwordAgainBlur);
            passwordAgain.addEventListener("keyup",passwordAgainKeyup);

            verificationCode.addEventListener("focus", verificationCodeFocus);
            verificationCode.addEventListener("blur",verificationCodeBlur);
            verificationCode.addEventListener("keyup",verificationCodeKeyup);
            verificationCode.addEventListener("keyup",verifyUserAjax);

            submit.addEventListener("click",formVerify);
            submit.addEventListener("click",verificationCodeEquals);
            submit.addEventListener("click",checkSingleUser);
            
            function checkSingleUser(ev){
            	var event=ev||window.ev;
            	 var checkSingleUser= document.getElementById("checkSingleUser");
            	 verifyUserAjax();
            	 if(checkSingleUser.innerHTML!=""){
            		 stopDefault(event);
            		 alert("用户名不存在");
            		 return false;
            	 }
            	 
            }
    
            function checkInput(obj,reg,left,top,text){// obj为传入input对象，reg为正则表达式，left,right为生成提示框位置，text为提示框内容
                var value=obj.value;
                var out1=reg.test(value);
                var right2=document.getElementById("right2");
                
                if(boxP==null){
                    boxP = document.createElement("div");
                    boxP.className="warn1";
                };
                
                if(value==null || value==""||!out1){
                    boxP.style.cssText+="left:"+left+"px;top:"+top+"px;";
                    boxP.innerHTML=text;
                    right2.appendChild(boxP);
                    obj.style.border="1px solid red";
                    return true;
                }else{
                    var box1=document.getElementsByClassName("warn1")[0];
                    if(box1!=undefined){
                        obj.style.border="1px solid rgba(255,255,255,0)";
                        right2.removeChild(box1);
                        boxP=null;
                    }
                    return false;
                };
 
            }

            
//          验证码验证
            function verificationCodeEquals(ev){
            	var event=ev||window.ev;
            	var submitError2=document.getElementById("submitError2");
            	var verificationCode=document.forms["myform2"]["verificationCode"].value;
                var verificationLabel=document.getElementById("verificationLabel").innerHTML;
                
                if(verificationCode!=verificationLabel){
                	if(submitError2.innerHTML==""||submitError2.innerHTML==null){
                		submitError2.innerHTML="验证码错误！！！";
                	}
                    stopDefault(event);
                }
            }
            
          
            //可以为空函数
            function checkInputN(obj,reg,left,top,text){
                var value=obj.value;
                var out1=reg.test(value);
                var right2=document.getElementById("right2");
                
                if(value==null||value==""){
                    return false;
                    
                }else{
                    if(boxP==null){
                        boxP = document.createElement("div");
                        boxP.className="warn1";
                    };
                    
                    if(!out1){
                        boxP.style.cssText+="left:"+left+"px;top:"+top+"px;";
                        boxP.innerHTML=text;
                        right2.appendChild(boxP);
                        obj.style.border="1px solid red";
                        return true;
                    }else{
                        var box1=document.getElementsByClassName("warn1")[0];
                        if(box1!=undefined){
                            obj.style.border="1px solid rgba(255,255,255,0)";
                            right2.removeChild(box1);
                            boxP=null;
                        }
                        return false;
                    };
                }
                
 
            }

           
            //用户名框开始
            function userFunction(){
                var user=document.forms["myform2"]["userNumber"];
                var reg=/^[a-zA-Z0-9_-]{4,16}$/;
                var left=289;
                var top=30;
                var text="用户名不能为空 , 且只能4到16位（字母，数字，下划线，减号）";
                var out2=checkInput(user,reg,left,top,text);
                
                return out2;
            }


            function userFocus(){
                clearError();
                userFunction();
            }

            function userBlur(){
                clearError();
                userFunction();
                verifyUserAjax();
            }

            function userKeyup(){
                clearError();
                userFunction();
                verifyUserAjax();
            }
            //用户名函数结束
           
             //电话框函数开始
             function telFunction(){
                var tel=document.forms["myform2"]["telephone"];
                if(tel.value==null||tel.value==""){
                    removeBoxN(tel);
                }else{
                    var reg=/^[1][3,4,5,7,8][0-9]{9}$/;
                    var left=289;//559
                    var top=75;//30
                    var text="请输入正确手机号";
                    var out2=checkInputN(tel,reg,left,top,text);
                    return out2;
                }
                
            }


            function telFocus(){
                clearError();
                telFunction();
            }

            function telBlur(){
                clearError();
                telFunction();
            }

            function telKeyup(){
                clearError();
                telFunction();
            }
            //电话框函数

             //邮箱框函数
             function emailFunction(){
                var email=document.forms["myform2"]["email"];
                if(email.value==null||email.value==""){
                    removeBoxN(email);
                }else{
                    var email=document.forms["myform2"]["email"];
                    var reg=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
                    var left=559;
                    var top=75;
                    var text="请输入正确邮箱";
                    var out2=checkInput(email,reg,left,top,text);
                    return out2;
                }
            }


            function emailFocus(){
                clearError();
                emailFunction();
            }

            function emailBlur(){
                clearError();
                emailFunction();
            }

            function emailKeyup(){
                clearError();
                emailFunction();
            }
            //邮箱框结束

             //昵称框函数开始
             function nicknameFunction(){
                var nickname=document.forms["myform2"]["name"];
                var reg=/\S/;
                var left=559;
                var top=30;
                var text="昵称不能为空";
                var out2=checkInput(nickname,reg,left,top,text);
                return out2;
            }


            function nicknameFocus(){
                clearError();
                nicknameFunction();
            }

            function nicknameBlur(){
                clearError();
                nicknameFunction();
            }

            function nicknameKeyup(){
                clearError();
                nicknameFunction();
            }
            //昵称框函数结束

            //密码框函数开始
            function passwordFunction(){
                var password=document.forms["myform2"]["password"];
                
                // console.log(password.value);
                var reg=/^[\w._*&$#]{6,12}$/;
                var left=289;
                var top=120;
                var text="密码不能为空 , 且只能6到12位（字母，数字，下划线，或符号 . * & $ #）";
                var out3=checkInput(password,reg,left,top,text);
                return out3;
            }
            function passwordFocus(){
                clearError();
                passwordFunction();
            }

            function passwordBlur(){
                clearError();
                passwordFunction();
            
            }

            function passwordKeyup(){
                clearError();
                passwordFunction();
            }
            //密码框函数结束

             //二次密码函数开始
             function passwordAgainFunction(){
                var passwordAgain=document.forms["myform2"]["passwordAgain"];
                var valueP=document.forms["myform2"]["password"].value;
                var value=passwordAgain.value;
                var right2=document.getElementById("right2");
                
                if(boxP==null){
                    boxP = document.createElement("div");
                    boxP.className="warn1";
                };
                
                if(value!=valueP){
                    boxP.style.cssText+="left:"+559+"px;top:"+120+"px;";
                    boxP.innerHTML="两次密码不一致";
                    right2.appendChild(boxP);
                    passwordAgain.style.border="1px solid red";
                    return true;
                }else{
                    var box1=document.getElementsByClassName("warn1")[0];
                    if(box1!=undefined){
                        passwordAgain.style.border="1px solid rgba(255,255,255,0)";
                        right2.removeChild(box1);
                        boxP=null;
                    }
                    return false;
                };
            }

            function passwordAgainFocus(){
                clearError();
                passwordAgainFunction();
            }

            function passwordAgainBlur(){
                clearError();
                passwordAgainFunction();
            
            }

            function passwordAgainKeyup(){
                clearError();
                passwordAgainFunction();
            }
            //二次密码结束

             //验证码开始
             function verificationCodeFunction(){
                var verificationCode=document.forms["myform2"]["verificationCode"];
                var reg=/^[0-9A-Za-z]{4}$/;
                var left=289;
                var top=210;
                var text="验证码格式错误";
                var out3=checkInput(verificationCode,reg,left,top,text);
                return out3;
            }
            function verificationCodeFocus(){
                clearError();
                verificationCodeFunction();
            }

            function verificationCodeBlur(){
                clearError();
                verificationCodeFunction();
            
            }

            function verificationCodeKeyup(){
                clearError();
                verificationCodeFunction();
            }
            //验证码结束

            //去掉边框
            function removeBoxN(obj){
                var box1=document.getElementsByClassName("warn1")[0];
                if(box1!=undefined){
                    obj.style.border="1px solid rgba(255,255,255,0)";
                    right2.removeChild(box1);
                    boxP=null;
                }
                return false;
            }
            
 

            //表单提交前验证
            function formVerify(ev){
                var event=ev||window.ev;
                var userV=document.forms["myform2"]["userNumber"];
                var tel=document.forms["myform2"]["telephone"];
                var email=document.forms["myform2"]["email"];
                var nickname=document.forms["myform2"]["name"];
                var passwordV=document.forms["myform2"]["password"];
                var passwordAgain=document.forms["myform2"]["passwordAgain"];
                var verificationCode=document.forms["myform2"]["verificationCode"];
                var checkSingleUser=document.getElementById("checkSingleUser");
                var submit=document.forms["myform2"]["submit"];
                var right2=document.getElementById("right2");

                var submitError2=document.getElementById("submitError2");
                var Do=new Array();
                var oInput=new Array();
                oInput[0]=userV;
                oInput[1]=tel;
                oInput[2]=email;
                oInput[3]=nickname;
                oInput[4]=passwordV;
                oInput[5]=passwordAgain;
                oInput[6]=verificationCode;

                Do[0]=userFunction();
                Do[1]=telFunction();
                Do[2]=emailFunction();
                Do[3]=nicknameFunction();
                Do[4]=passwordFunction();
                Do[5]=passwordAgainFunction();
                Do[6]=verificationCodeFunction();

                
                for(var i=0;i<Do.length;i++){
                    if(Do[i]==true){
                        oInput[i].style.border="1px solid red";
                    }
                };
                
                if(userFunction()){
                    submitError2.innerHTML="请正确填写";
                    stopDefault(event);
                }else if(telFunction()){
                    submitError2.innerHTML="请正确填写";
                    stopDefault(event);
                }else if(emailFunction()){
                    submitError2.innerHTML="请正确填写";
                    stopDefault(event);
                }else if(nicknameFunction()){
                    submitError2.innerHTML="请正确填写";
                    stopDefault(event);
                }else if(passwordFunction()){
                    submitError2.innerHTML="请正确填写";
                    stopDefault(event);
                }else if(passwordAgainFunction()){
                    submitError2.innerHTML="请正确填写";
                    stopDefault(event);
                }else if(verificationCodeFunction()){
                    submitError2.innerHTML="请正确填写";
                    stopDefault(event);
                    verifyUserAjax();
                }else if(userFunction()){
                    submitError2.innerHTML="请正确填写";
                    stopDefault(event);
                }else if(checkSingleUser.innerHTML!=""){
                    stopDefault(event);
                };
                
            }

            
            
            
            //错误提示框为空
            function clearError(){
                var submitError2=document.getElementById("submitError2");
                submitError2.innerHTML="";
            }    
            
        }
        

        






        //阻止默认事件
        function stopDefault(e) { 
            if (e && e.preventDefault) {//浏览器兼容
                    e.preventDefault();
                }else{ 
                    window.event.returnValue = false;
                }
            return false;
        }

        function selectFace(){
            var selectFace=document.getElementById("selectFace");
            var selectFaceBox=document.getElementById("selectFaceBox");
            selectFace.onmouseover=function(){
                selectFaceBox.style.display="block";
            }

            selectFace.onmouseout=function(){
                selectFaceBox.style.display="none";
            }
        }

        function imgPreview(){
            var preview=document.getElementById("preview");
            var previewDiv=document.getElementById("previewDiv");
            var face=document.getElementById("face");
            preview.onmouseover=function(){
                previewDiv.style.display="block";
                preview(face);
                function preview(file) {

                    var previewDiv1 = document.getElementById('previewDiv');
                    if (file.files && file.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function(evt) {
                            previewDiv1.innerHTML = '<img src="' + evt.target.result + '" />';
                        }
                        reader.readAsDataURL(file.files[0]);
                    } else {
                        previewDiv1.innerHTML = '<div class="img" style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
                    }
                }
            }

            preview.onmouseout=function(){
                previewDiv.style.display="none";
            }

        }
        
        
        
        //得到xml
        function getXHR() {
        	var xmlHttp;
        	try {
        		xmlHttp = new XMLHttpRequest();
        	} catch (e) {
        		try {
        			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
        		} catch (e) {
        			try {
        				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        			} catch (e) {
        				return false;
        			}

        		}

        	}
        	return xmlHttp;
        }

        function verificationCode() {
        	var xhr = getXHR();

        	xhr.onreadystatechange = function() {
        		if (xhr.readyState == 4) {
        			if (xhr.status == 200) {
        				var verificationLabel=document.getElementById("verificationLabel");
        				verificationLabel.innerHTML=xhr.responseText;
        			}
        		}
        	};

        	
        	xhr.open("post", "verificationCode.do" + "?time="
        			+ new Date().getTime(), true);
        	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        	
        	xhr.send("verificationCode=verificationCode");
        	
        }
        
        
        function verifyUserAjax(){//验证用户名ajax
            var UserNumber=document.forms["myform2"]["userNumber"];
        	var value=UserNumber.value;
        	var xhr = getXHR();

        	xhr.onreadystatechange = function() {
        		if (xhr.readyState == 4) {
        			if (xhr.status == 200) {
        				var checkSingleUser= document.getElementById("checkSingleUser");
        				if(xhr.responseText=="false"){
        					
        					checkSingleUser.innerHTML="用户名已存在";
        				
        				}else{
        					checkSingleUser.innerHTML="";
        				};
        				
        			}
        		}
        	};

        	
        	xhr.open("post", "verifyUserAjax.do" + "?time="
        			+ new Date().getTime(), true);
        	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        	
        	xhr.send("userNumber="+value);
        	
        }
        
        
    

