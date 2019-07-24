<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>文章详页</title>
    <link rel="stylesheet" href="css/init.css">
    <link rel="stylesheet" href="css/nav.css">
    <link rel="stylesheet" href="css/SingleArticle.css">
    <link rel="stylesheet" href="css/messagebox.css">
    <script src="js/singleArticle.js"></script>
    <script type="text/javascript" language="javascript" src="js/messagebox.js" charset="utf-8"></script>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script>
        $(document).ready(function(){
            // $("#rich-editor").contenteditable=true;
            AreaHtml("/doReply.do");
            //AreaHtml();
        });

    </script>
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
            <li><a href="">首页</a></li>
            <li><a href="">学无止境</a></li>
            <li><a href="">生活笔记</a></li>
            <li><a href="">时光轴</a></li>
            <li><a href="">留言板</a></li>
        </ul>
    </div>
</div>

<div id="content" class="clearfix">
    <div class="left">
        <div class="ArticleContent">
            <h2 class="title">${article.title}</h2><div id="pageid" class="articleId" style="display:none">${article.id}</div>
            <p class="author"><span class="face"><img alt="" src="${article.logo}"></span><span>${article.author}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>分类</span>&nbsp;&nbsp;&nbsp;&nbsp;<span><fmt:formatDate
                    value="${article.postedTime }" pattern="yyyy年MM月dd日"/></span></p>
            ${article.content}
        </div>

        <%--        回复--%>
        <div class="reply">
            <c:forEach items="${reply}" var="re">
                <c:if test="${re.replyTo==''or re.replyTo==null}">
                    <div class="article">
                        <div class="information">
                            <div class="img"><img src="<%=basePath%>${re.logo}" alt=""></div>
                            <p>${re.myuserName}</p>
                            <p><fmt:formatDate value="${re.responseTime}" pattern="yyyy-MM-dd HH:mm:ss"/></p>
                            <span>${re.replyId}楼${loginerror}</span>
                        </div>
                        <div class="article_main"><p>${re.replyContent}</p></div>
                        <div class="article_foot">
                            <div class="articleReply"></div>
                        </div>
                    </div>
                </c:if>

            </c:forEach>
        </div>

        <div id="rich-editor"></div>
    </div>


    <div class="right">
        <div class="register clearfix">

            <div class="Link">
                <c:choose>
                    <c:when test="${user==null}">
                        <div>用户您好！请先登录！</div>
                        <a href="<%= basePath%>jsp/Login.jsp?page=single" onclick="window.open('<%= basePath%>jsp/Login.jsp?page=single&id=${pageid}')">登录</a>
                        <a href="<%= basePath%>jsp/register.jsp?page=single" onclick="window.open('<%= basePath%>jsp/Login.jsp?page=single&id=${pageid}')">注册</a>
                    </c:when>
                    <c:otherwise>
                        <div id="articleName" style="display:none">${user.name}</div>
                        <label style="margin-right:10px;">${user.name}</label>
                        <a href="LoginOut.do"  onclick="window.open('<%= basePath%>LoginOut.do?page=single&id=${pageid}')">注销</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
        <div class="aboutMe">
            <div class="H2">关于我</div>
            <div class="atoutMeContent rigntContent">
                <p>这个人很懒，什么都没留下~</p>
            </div>
        </div>
        <div class="label">
            <div class="H2">标签云</div>
            <div class="labelContent rigntContent">
                <c:forEach items="${ArticleLabelMap}" var="label">
                    <c:if test="${fn:contains(label.key,'impotant')}">
                        <span class="fontWeight">${label.value.title}</span>
                    </c:if>
                    <c:if test="${fn:contains(label.key,'noImpotant')}">
                        <span>${label.value.title}</span>
                    </c:if>
                </c:forEach>

            </div>
        </div>
        <div class="recent">
            <div class="H2">最近更新</div>
            <div class="recentContent rigntContent">
                <c:forEach items="${rentArticle}" var="rent">
                    <div class="Article">
                        <div class="img"><img src="${rent.logo}" alt="${rent.title}"></div>
                        <p class="Content"><a onclick="window.open('SingleArticle.do?id=${rent.id}')"  href="SingleArticle.do?id=${rent.id}">${rent.title}</a></p>
                        <p class="time"><fmt:formatDate value="${rent.postedTime }" pattern="yyyy年MM月dd日"/></p>
                    </div>
                </c:forEach>

            </div>
        </div>
        <div class="hot">
            <div class="H2">热门文章</div>
            <div class="hotContent rigntContent">
                <c:forEach items="${hotArticle}" var="hot">
                    <div class="Article">
                        <div class="img">
                            <img src="${hot.logo}" alt="${hot.title}">
                        </div>
                        <p class="Content">
                            <a onclick="window.open('SingleArticle.do?id=${hot.id}')" href="SingleArticle.do?id=${hot.id}">${hot.title}</a>
                        </p>
                        <p class="time">
                            <fmt:formatDate value="${hot.postedTime}" pattern="yyyy年MM月dd日"/>
                        </p>
                    </div>
                </c:forEach>


            </div>
        </div>
        <div class="friendLink">
            <div class="H2">友情链接</div>
            <div class="limkA rigntContent">
                <ul class="clearfix">
                    <c:forEach items="${friendLink}" var="fr">
                        <li><a href="${fr.friendLink}">${fr.name}</a></li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>

<div id="footer">
    <p>kwbbin</p>
    <p>qq 12348796</p>
</div>
</body>
</html>