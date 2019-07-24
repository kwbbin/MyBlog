<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
	<form action="${pageContext.request.contextPath}/register.do" name="myform2" method="post" enctype="multipart/form-data">
		<input type="text" name="userNumber" placeholder="用户名"><br>
		<input type="text" name="name" placeholder="昵称"><br>
		<input type="file" name="img" placeholder="头像"><br>
		<input type="text" name="telephone" placeholder="手机号"><br>
		<input type="text" name="email" placeholder="邮箱"><br>
		<input type="password" name="password" placeholder="密码"> <br>
		<input type="radio" id="man" checked="checked" value="男" name="sex">
		<input type="radio" id="woman" value="女" name="sex">
		<input type="submit" name="submit" value="注册"><br>
	</form>
</body>
</html>
