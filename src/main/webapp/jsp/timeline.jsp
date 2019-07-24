<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>时光轴</title>
    <link rel="stylesheet" href="css/init.css">
    <link rel="stylesheet" href="css/nav.css">
    <link rel="stylesheet" href="css/timeline.css">
    <script src="js/timeline.js"></script>
    <style>

        #head .seachInput input[type=submit]{
            left:190px;
            cursor: pointer;
        }
    </style>
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
<section class="timeline">
    <ul>
        <c:forEach items="${timeline}" var="al">
            <li class="in-view">
                <div>
                    <time><fmt:formatDate value="${al.time}" pattern="yyyy-MM-dd" /></time>
                    <div class="discovery">
                        <h1>${al.title}</h1>
                        <p>
                            ${al.content}
                        </p>
                    </div>
                </div>
            </li>
        </c:forEach>
        <li class="in-view">
            <div>
                <time>1687-03-08</time>
                <div class="discovery">
                    <h1>Discovery</h1>
                    <p>
                        是的水电费水电费水电费所发生的
                    </p>
                </div>
            </div>
        </li>
        <li class="in-view">
            <div>
                <time>1687-03-08</time>
                <div class="discovery">
                    <h1>Discovery</h1>
                    <p>
                        是的水电费水电费水电费所发生的
                    </p>
                </div>
            </div>
        </li><li class="in-view">
        <div>
            <time>1687-03-08</time>
            <div class="discovery">
                <h1>Discovery</h1>
                <p>
                    是的水电费水电费水电费所发生的
                </p>
            </div>
        </div>
    </li><li class="in-view">
        <div>
            <time>1687-03-08</time>
            <div class="discovery">
                <h1>Discovery</h1>
                <p>
                    是的水电费水电费水电费所发生的
                </p>
            </div>
        </div>
    </li><li class="in-view">
        <div>
            <time>1687-03-08</time>
            <div class="discovery">
                <h1>Discovery</h1>
                <p>
                    是的水电费水电费水电费所发生的
                </p>
            </div>
        </div>
    </li><li class="in-view">
        <div>
            <time>1687-03-08</time>
            <div class="discovery">
                <h1>Discovery</h1>
                <p>
                    是的水电费水电费水电费所发生的
                </p>
            </div>
        </div>
    </li><li class="in-view">
        <div>
            <time>1687-03-08</time>
            <div class="discovery">
                <h1>Discovery</h1>
                <p>
                    是的水电费水电费水电费所发生的
                </p>
            </div>
        </div>
    </li>

    </ul>
</section>
<script>
    var items = document.querySelectorAll(".timeline li");

    function isElementInViewport(el) {
        var rect = el.getBoundingClientRect();
        return (
            rect.top >= 0 &&
            rect.left >= 0 &&
            rect.bottom <=
            (window.innerHeight || document.documentElement.clientHeight) &&
            rect.right <=
            (window.innerWidth || document.documentElement.clientWidth)
        );
    }

    function callbackFunc() {
        for (var i = 0; i < items.length; i++) {
            if (isElementInViewport(items[i])) {
                if (!items[i].classList.contains("in-view")) {
                    items[i].classList.add("in-view");
                }
            } else if (items[i].classList.contains("in-view")) {
                items[i].classList.remove("in-view");
            }
        }
    }

    window.addEventListener("load", callbackFunc);
    window.addEventListener("scroll", callbackFunc);
</script>
</body>
</html>
