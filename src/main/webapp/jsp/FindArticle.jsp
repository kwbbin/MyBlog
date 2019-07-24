<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>查找文章</title>
    <link rel="stylesheet" href="css/init.css">
    <link rel="stylesheet" href="css/nav.css">
    <link rel="stylesheet" href="css/FindArticleByTitle.css">
</head>
<body>
<div id="head" class="clearfix">
	<div class="logo">KWBBIN</div>
	<div class="seachInput">
		<form action="${pageContext.request.contextPath}/findArticle.do" class="search-form">
			<input type="text" placeholder="搜索" name="condition">
			<input type="submit" value="">
		</form>
	</div>
	<div class="navUl">
		<ul class="nav-box clearfix">
			<li><a href="index.do">首页</a></li>
			<li><a href="study.do">学无止境</a></li>
			<li><a href="life.do">生活笔记</a></li>
			<li><a href="timeline.do">时光轴</a></li>
			<li><a href="Message.do?pageNow=1">留言板</a></li>
		</ul>
	</div>
</div>
    <div id="articleBox">
        <c:forEach items="${requestScope.ArticleL}" var="al">
				<div class="article">
					<div class="articleContent">
						<div class="articleImg">
							<img src="${requestScope.al.logo}" alt="${al.title}"/>
						</div>
						<div class="articleMain">
							<h2 class="title">${al.title}</h2>
							<div class="articleMainContent">${al.content}</div>
						</div>
					</div>
					<div class="articleFooter clearfix">
						<span class="time"><fmt:formatDate value="${al.postedTime }" pattern="yyyy年MM月dd日" /></span> <span class="viewed">36次阅读</span>
						<span class="say"><a href="">0条评论</a></span> <span class="good"><a
							href="">${al.good}</a></span>
					</div>
				</div>
			</c:forEach>

			<div class="pagination">
				<c:choose>
				<c:when test="${1==PageNum.PageNow}">
					<span class="disabled" >首页</span>
					<span class="disabled" >上一页</span>
				</c:when>
				<c:otherwise>
					<a href="findArticle.do?PageBegin=1&condition=${condition}">首页</a>
					<a href="findArticle.do?PageBefore=1&condition=${condition}">上一页</a>
				</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="1" end="${PageNum.PageTotal}" step="1">
					<c:choose>
						<c:when test="${i==PageNum.PageNow}">
							<a href="findArticle.do?PageNow=${i}&condition=${condition}" class="current">${i}</a>
						</c:when>
						<c:otherwise>
							<a href="findArticle.do?PageNow=${i}&condition=${condition}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
				<c:when test="${PageNum.PageTotal==PageNum.PageNow}">
					<span class="disabled" >下一页</span>
					<span class="disabled" >尾页</span>
				</c:when>
				<c:otherwise>
					<a href="findArticle.do?PageLast=1&condition=${condition}">下一页</a>
					<a href="findArticle.do?PageEnd=1&condition=${condition}">尾页</a>
				</c:otherwise>
				</c:choose>
			</div>
    </div>
</body>
</html>