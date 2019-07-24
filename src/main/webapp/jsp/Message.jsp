<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">

      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>留言版</title>
      <link rel="stylesheet" href="css/init.css">
      <link rel="stylesheet" href="css/nav.css">
      <link rel="stylesheet" href="css/message.css">
      <link rel="stylesheet" type="text/css" href="./css/button.css">
      <link rel="stylesheet" href="css/messagebox.css">

      <script src="js/messagebox.js"></script>
      <script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
      <script type="text/javascript" src="./js/button.js"></script>
      <script type="text/javascript" src="./js/message.js"></script>
      <style>
          .buttonBox{
              position: absolute;
              bottom: -20px;
              left: 300px;
          }
          #head{
              background: url("images/message_bg2.png");
            }
          #head .seachInput input[type=submit]{
              left:190px;
              cursor: pointer;
          }
      </style>
      <script>
          $(document).ready(function(){
              AreaHtml("/doMessage.do");
          });

      </script>
  </head>
  <body  style="">

  <div class="articleId" id="articleName"  style="display: none;">${user.id}</div>
  <div id="pageNum" style="display: none;"></div>
  <div id="box">
      <div id="head" class="clearfix">
          <div class="logo">KWBBIN</div>
          <div class="seachInput">
              <form id="form" action="${pageContext.request.contextPath}/findArticle.do" class="search-form">
                  <input type="text" placeholder="搜索" name="condition">
                  <input type="submit" value="" onclick="document.getElementById('form').submit()">
              </form>
          </div>
          <div class="navUl">
              <ul class="nav-box clearfix">
                  <li><a onclick="window.open('index.do')" href="index.do">首页</a></li>
                  <li><a onclick="window.open('study.do')" href="study.do">学无止境</a></li>
                  <li><a onclick="window.open('life.do')" href="life.do">生活笔记</a></li>
                  <li><a onclick="window.open('timeline.do')" href="timeline.do">时光轴</a></li>
                  <li><a onclick="window.open('Message.do?pageNow=1')" href="Message.do?pageNow=1">留言板</a></li>
              </ul>
          </div>
      </div>
      <div id="viewBoard">

          <c:forEach items="${messages}" var="ms">
              <div class="message">
                  <div class="title">${ms.userName}</div>
                  <div class="content">${ms.content}</div>
              </div>
          </c:forEach>

          <div class="pen"><span onclick="createArea();" class="penLink"></span></div>

          <div id="editorBox">
              <span class="close">×</span>
              <div id="rich-editor"></div>
          </div>

          <div class="buttonBox">
              <div class="zxf_pagediv"></div>
          </div>

      </div>
      <div id="footer">
          <a href="">kwbbin blog</a>
      </div>
  </div>
  <script type="text/javascript">
      //翻页
      $.ajax({
          url :  "GetMessageSum.do",//访问路径
          type : "post",
          datatype:String,
          success :
              function(messages){
                  $("#pageNum").text(messages);
                  $(".zxf_pagediv").createPage({
                      pageNum: messages,
                      current: 1,
                      backfun: function(e) {
                          //console.log(e);//回调
                      }
                  });
              }//查询成功处理函数
      });

  </script>
  </body>
</html>