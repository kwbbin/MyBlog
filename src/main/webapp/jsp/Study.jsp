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
    <title>关于学习</title>
    <link rel="stylesheet" href="css/init.css">
    <link rel="stylesheet" href="css/nav.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/study.css">
    <script src="js/study.js"></script>
    <script src="js/jquery-3.3.1.min.js"></script>
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

<div id="content" class="clearfix">
    <div class="left">
        <c:forEach items="${ArticleL}" var="al">
            <div class="article">
                <div class="articleContent" onclick="window.open('SingleArticle.do?id=${al.id}')">
                    <div class="articleImg">
                        <img src="${al.logo}" alt="${al.title}"/>
                    </div>
                    <div class="articleMain">
                        <h2 class="title">${al.title}</h2>
                        <div class="articleMainContent">${al.content}</div>
                    </div>
                </div>
                <div class="articleFooter clearfix">
                    <span class="time"><fmt:formatDate value="${al.postedTime }" pattern="yyyy年MM月dd日" /></span><span class="viewed">${al.reading}次阅读</span>
                    <span class="say"><a href="SingleArticle.do?id=${al.id}">${al.replySum}条评论</a></span> <span class="good" onclick="addGood(this,${al.id})">${al.good}</span>
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
                    <a href="study.do?PageBegin=1">首页</a>
                    <a href="study.do?PageBefore=1">上一页</a>
                </c:otherwise>
            </c:choose>
            <c:forEach var="i" begin="1" end="${PageNum.PageTotal}" step="1">
                <c:choose>
                    <c:when test="${i==PageNum.PageNow}">
                        <a href="study.do?PageNow=${i}" class="current">${i}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="study.do?PageNow=${i}">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${PageNum.PageTotal==PageNum.PageNow}">
                    <span class="disabled" >下一页</span>
                    <span class="disabled" >尾页</span>
                </c:when>
                <c:otherwise>
                    <a href="study.do?PageLast=1">下一页</a>
                    <a href="study.do?PageEnd=1">尾页</a>
                </c:otherwise>
            </c:choose>
        </div>


    </div>


    <div class="right">
        <div class="register clearfix">

            <div class="Link">
                <!--                         <a href="jsp/Login.jsp">登录</a> -->
                <!--                         <a href="jsp/register.jsp">注册</a> -->

                <c:choose>
                    <c:when test="${user==null}">
                        <div>用户您好！请先登录！</div>
                        <a href="jsp/Login.jsp?page=study">登录</a>
                        <a href="jsp/register.jsp?page=study">注册</a>
                    </c:when>
                    <c:otherwise>
                        <label style="margin-right:10px;">${user.name}</label>
                        <a href="LoginOut.do">注销</a>
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
                        <p class="Content"><a href="SingleArticle.do?id=${rent.id}">${rent.title}</a></p>
                        <p class="time"><fmt:formatDate value="${rent.postedTime }" pattern="yyyy年MM月dd日" /></p>
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
                            <a href="SingleArticle.do?id=${hot.id}">${hot.title}</a>
                        </p>
                        <p class="time">
                            <fmt:formatDate value="${hot.postedTime}" pattern="yyyy年MM月dd日" />
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
                        <li><a href="http://${fr.friendLink}">${fr.name}</a></li>
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