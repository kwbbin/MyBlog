<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <title>登录/注册</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=basePath%>css/login.css">
	<script src="<%=basePath%>js/login.js"></script>
</head>
<body>
    <div class="bodyBox">
        <div class="registerBox">
            <div class="left">
                <div id="lTop" class="lTop action"><span>登<br>陆</span></div>
                <div id="lBottom" class="lBottom"><span>注<br>册</span></div>
            </div>
            <div id="right1" class="right1">
                <div class="form">
                    <form action="${pageContext.request.contextPath}/Login.do" name="myform1">
                        <input type="text" name="page" style="display: none" value="<%= request.getParameter("page")%>">
                        <input type="text" name="pageid" style="display: none" value="<%= request.getParameter("id")%>">
                        <input type="text" name="userNumber" placeholder="用户名"><br>
                        <input type="password" name="password" placeholder="密码"><br>
                        <input type="submit" name="submit" value="登&nbsp;&nbsp;录">
                        <label id="submitError"></label>
                    </form>
                    <span>第三方登录</span>
                </div>
            </div>
            <div id="right2" class="right2">
                <div class="form">
                    <form action="${pageContext.request.contextPath}/register.do" name="myform2" method="post" enctype="multipart/form-data" >
                        <input type="text" name="page" style="display: none" value="<%= request.getParameter("page")%>">
                        <input type="text" name="pageid" style="display: none" value="<%= request.getParameter("id")%>">
                        <input type="text" name="userNumber" placeholder="用户名">
                        <input type="text" name="name" placeholder="昵称">
                        <input type="text" name="telephone" placeholder="手机号"><span class="canNull">非必填</span>
                        <input type="text" name="email" placeholder="邮箱"><span class="canNull">非必填</span>
                        <input type="password" name="password" placeholder="密码">
                        <input type="password" name="passwordAgain" placeholder="再次输入密码">
                        <div class="Radio"><input type="radio" id="man" checked="checked" value="男" name="sex"><label for="man">&nbsp;男&nbsp;&nbsp;&nbsp;</label><input type="radio" id="woman" value="女" name="sex"><label for="woman">&nbsp;女&nbsp;</label></div>
                        <div class="Face"><label for="face"><span>+</span>&nbsp;点击上传本地头像</label><input type="file" id="face" name="img" accept="image/png, image/jpeg, image/gif, image/jpg"></div><span id="preview">图片预览</span>
                        <div id="previewDiv"></div>
                        <div class="verificationCode"><input type="text" name="verificationCode" placeholder="验证码"><label class="label" id="verificationLabel">1123</label><span id="shuaxin" onclick="verificationCode()"></span></div>
                        <input type="submit" name="submit" value="注册">
                        
                        <label id="submitError2"></label>
                        <label id="checkSingleUser" style="color:red;margin-left:14px;font-size:13px;"></label>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>