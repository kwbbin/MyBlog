<%--
  Created by IntelliJ IDEA.
  User: 柯炜彬
  Date: 2019/4/30
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Document</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/background.css">
    <link rel="srylesheet" href="css/messagebox.css">
    <script  type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <script  type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/background.js"></script>
    <script type="text/javascript" src="js/messagebox.js"></script>

    <script charset="utf-8" src="editor/kindeditor-all.js"></script>
    <script charset="utf-8" src="editor/lang/zh-CN.js"></script>
    <script charset="UTF-8" src="js/background/bmessage.js"></script>
    <script>
        KindEditor.ready(function(K) {
            window.editor = K.create('#editor_id',{
                width:900,
                height:400
            });

            K.create('#textarea_id', {
                uploadJson : 'jsp/upload_json.jsp',//上传
                fileManagerJson : 'jsp/file_manager_json.jsp',//文件管理
                allowFileManager : true
            });


            window.editor = K.create('#editor_id1',{
                width:900,
                height:400
            });

            K.create('#textarea_id1', {
                uploadJson : 'jsp/upload_json.jsp',//上传
                fileManagerJson : 'jsp/file_manager_json.jsp',//文件管理
                allowFileManager : true
            });

            window.editor = K.create('#editor_id2',{
                width:900,
                height:400
            });

            K.create('#textarea_id2', {
                uploadJson : 'jsp/upload_json.jsp',//上传
                fileManagerJson : 'jsp/file_manager_json.jsp',//文件管理
                allowFileManager : true
            });
        });

    </script>
    <script type="text/javascript">
        $(document).ready(function(){
            init();
            AreaHtml("/doReply.do");
        });
    </script>
</head>
<body>
<div id="content-box" class="container">
    <div id="left" class="col-sm-2" >
        <div id="logo">kwbbin</div>
        <div id="manager">
            <ul class="list-group">
                <li onclick="leftList(1)" class="list-group-item article-manerge active">文章管理</li>
                <li onclick="leftList(2)" class="list-group-item timeline">时间轴管理</li>
                <li onclick="leftList(3)" class="list-group-item user">用户管理</li>
                <li onclick="leftList(4)" class="list-group-item frendlink">友情链接管理</li>
                <li onclick="leftList(5);getMessage();" class="list-group-item message">留言版管理</li>
                <li onclick="leftList(7);getSection();" class="list-group-item section">板块管理</li>
            </ul>
        </div>
    </div>
    <div id="right" class="col-sm-10">
        <div id="right-head">sdfsdfsdfsdfsd</div>
        <!-- 文章管理 -->
        <div class="article article-manerge right-active">
            <div class="head">
                <ul class="nav nav-tabs">
                    <li class="articleli1 active" onclick="articleHead(1);"><a href="javascript:void(0);">添加文章</a></li>
                    <li class="articleli2" onclick="articleHead(2);"><a href="javascript:void(0);">修改文章</a></li>
                    <li class="articleli3" onclick="articleHead(3);"><a href="javascript:void(0);">删除文章</a></li>
                    <li class="articleli4" onclick="articleHead(4);"><a href="javascript:void(0);">查询文章</a></li>
                </ul>
            </div>
            <div class="article-content">
                <div class="add-article article-manerge active-manerge">
                    <form role="form"  name="myform_add" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="name">标题</label>
                            <input type="text" class="form-control" name="title" id="name" placeholder="请输入标题">
                        </div>
                        <div class="form-group">
                            <label for="author">作者</label>
                            <input type="text" class="form-control" name="author" id="author" placeholder="请输入作者">
                        </div>
                        <div class="form-group">
                            <label for="inputfile">输入文章logo</label>
                            <input type="file" name="img" id="inputfile">
                        </div>
                        <div class="form-group" style="width:200px;">
                            <label for="name">板块</label>
                            <select class="form-control">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <div class="form-group" style="width:200px;">
                            <label for="name">文章类型</label>
                            <select class="form-control">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>

                        <div id="editor-box">
                            <h2>编辑内容</h2>
                            <textarea id="editor_id" name="content" style="width:700px;height:300px;">
                                    &lt;strong&gt;HTML内容&lt;/strong&gt;
                                </textarea>

                        </div>

                        <button id="submit" type="submit" class="btn btn-default">提交</button>
                    </form>
                </div>
                <div class="update-article article-manerge">
                    <form role="form" class="form-inline" style="padding-top:50px;">
                        <div class="form-group">
                            <label for="articleId">请输入文章id</label>
                            <input type="text" class="form-control" id="articleId" placeholder="请输入标题">
                        </div>
                        <button id="submitS" type="submit" class="btn btn-default">查询</button><br/>
                    </form>
                    <hr/>
                    <form role="form">
                        <div class="form-group">
                            <label for="name">标题</label>
                            <input type="text" class="form-control" id="name" placeholder="请输入标题">
                        </div>
                        <div class="form-group">
                            <label for="name">作者</label>
                            <input type="text" class="form-control" id="name" placeholder="请输入作者">
                        </div>
                        <div class="form-group">
                            <label for="inputfile">输入文章logo</label>
                            <input type="file" id="inputfile">
                        </div>

                        <div class="form-group" style="width:200px;">
                            <label for="name">板块</label>
                            <select class="form-control">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <div class="form-group" style="width:200px;">
                            <label for="name">文章类型</label>
                            <select class="form-control">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>

                        <div id="editor-box1">
                            <h2>编辑内容</h2>
                            <textarea id="editor_id1" name="content" style="width:700px;height:300px;">
                                            &lt;strong&gt;HTML内容&lt;/strong&gt;
                                        </textarea>
                        </div>

                        <button id="submit1" type="submit" class="btn btn-default">提交</button><br/>
                    </form>
                </div>
                <div class="delete-article article-manerge" id="skip-delete-foot">
                    <form role="form" class="form-inline" style="padding-top:50px;">
                        <div class="form-group">
                            <label for="articleId">请输入文章id</label>
                            <input type="text" class="form-control" id="articleId" placeholder="请输入标题">
                        </div>
                        <button id="submitS" type="submit" class="btn btn-default">查询</button><br/>
                    </form>
                    <hr/>
                    <form role="form">
                        <div class="form-group">
                            <label for="name">标题</label>
                            <input type="text" class="form-control" id="name" placeholder="请输入标题">
                        </div>
                        <div class="form-group">
                            <label for="name">作者</label>
                            <input type="text" class="form-control" id="name" placeholder="请输入作者">
                        </div>
                        <div class="form-group">
                            <label for="inputfile">输入文章logo</label>
                            <input type="file" id="inputfile">
                        </div>

                        <!-- <div class="checkbox">
                          <label>
                            <input type="checkbox">请打勾
                          </label>
                        </div> -->
                        <div class="form-group" style="width:200px;">
                            <label for="name">板块</label>
                            <select class="form-control">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>
                        <div class="form-group" style="width:200px;">
                            <label for="name">文章类型</label>
                            <select class="form-control">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </div>

                        <div id="editor-box3">
                            <h2>编辑内容</h2>
                            <textarea id="editor_id2" name="content" style="width:700px;height:300px;">
                                            &lt;strong&gt;HTML内容&lt;/strong&gt;
                                        </textarea>
                        </div>

                        <button id="submit2" type="submit" class="btn btn-default">提交</button><br/>
                    </form>
                </div>
                <div class="seacher-article article-manerge">
                    <table class="table table-bordered">
                        <caption>边框表格布局</caption>
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>发布时间</th>
                            <th>标题</th>
                            <th>点赞</th>
                            <th>内容</th>
                            <th>板块</th>
                            <th>作者</th>
                            <th>logo</th>
                            <th>文章类型</th>
                            <th>阅读量</th>
                            <th> </th>
                            <th> </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Tanmay</td>
                            <td>Bangalore</td>
                            <td>560001</td>
                            <td>Tanmay</td>
                            <td>Bangalore</td>
                            <td>560001</td>
                            <td>Tanmay</td>
                            <td>Bangalore</td>
                            <td>560001</td>
                            <td>560001</td>
                            <td class="skip-delete"><a href="#" onclick="skipDelete(id)">删除</a></td>
                            <td class="skip-delete"><a href="#" onclick="skipUpdate(id)">修改</a></td>
                        </tr>
                        <tr>
                            <td>Sachin</td>
                            <td>Mumbai</td>
                            <td>400003</td>
                            <td>Tanmay</td>
                            <td>Bangalore</td>
                            <td>560001</td>
                            <td>Tanmay</td>
                            <td>Bangalore</td>
                            <td>560001</td>
                            <td>560001</td>
                            <td>删除</td>
                            <td>修改</td>
                        </tr>
                        <tr>
                            <td>Uma</td>
                            <td>Pune</td>
                            <td>411027</td>
                            <td>Tanmay</td>
                            <td>Bangalore</td>
                            <td>560001</td>
                            <td>Tanmay</td>
                            <td>Bangalore</td>
                            <td>560001</td>
                            <td>560001</td>
                            <td>删除</td>
                            <td>修改</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- content水电费水电费是否是地方 -->
            </div>
        </div>

        <div class="article timeline">
            <div class="head">
                <ul class="nav nav-tabs">
                    <li class="timeline1 active" onclick="timelineHead(1);"><a href="javascript:void(0);">添加时间轴</a></li>
                    <li class="timeline2" onclick="timelineHead(2);"><a href="javascript:void(0);">修改时间轴</a></li>
                    <li class="timeline3" onclick="timelineHead(3);"><a href="javascript:void(0);">删除时间轴</a></li>
                    <li class="timeline4" onclick="timelineHead(4);"><a href="javascript:void(0);">查询时间轴</a></li>
                </ul>
            </div>
            <div class="timeline-content">
                <div class="add-timeline timeline-manerge active-manerge">
                    <form role="form">
                        <div class="form-group">
                            <label for="name">标题</label>
                            <input type="text" style="width:300px;" class="form-control" id="name" placeholder="请输入标题">
                        </div>
                        <div class="form-group">
                            <label for="textarea">内容</label>
                            <textarea name="textarea" style="width:600px;"  class="form-control" rows="5"></textarea>
                        </div>

                        <button id="submit2" type="submit" class="btn btn-default">提交</button><br/>
                    </form>
                </div>
                <div class="update-timeline timeline-manerge">
                    <form role="form" class="form-inline" style="padding-top:50px;">
                        <div class="form-group">
                            <label for="articleId">请输入时间轴id</label>
                            <input type="text" class="form-control" id="articleId" placeholder="请输入标题">
                        </div>
                        <button id="submitS" type="submit" class="btn btn-default">查询</button><br/>
                    </form>
                    <hr/>
                    <form role="form">
                        <div class="form-group">
                            <label for="name">标题</label>
                            <input type="text" style="width:300px;" class="form-control" id="name" placeholder="请输入标题">
                        </div>
                        <div class="form-group">
                            <label for="textarea">内容</label>
                            <textarea name="textarea" style="width:600px;"  class="form-control" rows="5"></textarea>
                        </div>

                        <button id="submit2" type="submit" class="btn btn-default">修改</button><br/>
                    </form>
                </div>
                <div class="delete-timeline timeline-manerge" id="skip-delete-foot-timeline">
                    <form role="form" class="form-inline" style="padding-top:50px;">
                        <div class="form-group">
                            <label for="articleId">请输入时间轴id</label>
                            <input type="text" class="form-control" id="articleId" placeholder="请输入标题">
                        </div>
                        <button id="submitS" type="submit" class="btn btn-default">查询</button><br/>
                    </form>
                    <hr/>
                    <form role="form">
                        <div class="form-group">
                            <label for="name">标题</label>
                            <input disabled type="text" style="width:300px;" class="form-control" id="name" placeholder="请输入标题">
                        </div>
                        <div class="form-group">
                            <label for="textarea">内容</label>
                            <textarea disabled name="textarea" style="width:600px;"  class="form-control" rows="5"></textarea>
                        </div>

                        <button id="submit2" type="submit" class="btn btn-default">删除</button><br/>
                    </form>
                </div>
                <div class="seacher-timeline timeline-manerge">
                    <table class="table table-bordered">
                        <caption>边框表格布局</caption>
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>标题</th>
                            <th>时间</th>
                            <th>内容</th>
                            <th> </th>
                            <th> </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Tanmay</td>
                            <td>Bangalore</td>
                            <td>560001</td>
                            <td>Tanmay</td>
                            <td class="skip-delete"><a href="#" onclick="timelineSkipDelete(id)">删除</a></td>
                            <td class="skip-delete"><a href="#" onclick="timelineSkipUpdate(id)">修改</a></td>
                        </tr>
                        <tr>
                            <td>Sachin</td>
                            <td>Mumbai</td>
                            <td>400003</td>
                            <td>Tanmay</td>
                            <td>删除</td>
                            <td>修改</td>
                        </tr>
                        <tr>
                            <td>Uma</td>
                            <td>Pune</td>
                            <td>411027</td>
                            <td>Tanmay</td>
                            <td>删除</td>
                            <td>修改</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- content水电费水电费是否是地方 -->
            </div>
        </div>
        <div class="article user">
            <div class="head">
                <ul class="nav nav-tabs">
                    <li class="user1 active" onclick="userHead(1);"><a href="javascript:void(0);">添加用户</a></li>
                    <li class="user2" onclick="userHead(2);"><a href="javascript:void(0);">修改用户</a></li>
                    <li class="user3" onclick="userHead(3);"><a href="javascript:void(0);">删除用户</a></li>
                    <li class="user4" onclick="userHead(4);"><a href="javascript:void(0);">查询用户</a></li>
                </ul>
            </div>
            <div class="user-content">
                <div class="add-user user-manerge active-manerge">
                    <form role="form">

                        <div class="form-group">
                            <label for="inputfile">头像</label>
                            <input type="file" id="inputfile">
                        </div>
                        <div class="form-group">
                            <label for="username">用户名</label>
                            <input type="text" style="width:300px;" class="form-control" name="username" placeholder="请输入用户名">
                        </div>

                        <div class="form-group">
                            <label for="password">密码</label>
                            <input type="text" style="width:300px;" class="form-control" name="password" placeholder="请输入密码">
                        </div>
                        <div class="form-group">
                            <label for="name">昵称</label>
                            <input type="text" style="width:300px;" class="form-control" id="name" placeholder="请输入昵称">
                        </div>
                        <div class="form-group">
                            <label for="name">邮箱</label>
                            <input type="text" style="width:300px;" class="form-control" name="name" placeholder="请输入邮箱">
                        </div>
                        <div class="form-group">
                            <label for="phone">电话</label>
                            <input type="text" style="width:300px;" class="form-control" name="phone" placeholder="请输入电话">
                        </div>
                        <div>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="sexman" value="男" checked>男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="sexwomen"  value="女">女
                            </label>
                        </div>
                        <div>
                            <br/>
                            <label class="radio-inline">
                                <input type="radio" name="type" id="typeuser" value="user" checked>普通用户
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="type" id="typeadmin"  value="admin">管理员
                            </label>
                        </div>
                        <button id="submit2" type="submit" class="btn btn-default">提交</button><br/>
                    </form>
                </div>
                <div class="update-user user-manerge">
                    <form role="form" class="form-inline" style="padding-top:50px;">
                        <div class="form-group">
                            <label for="articleId">请输入时间轴id</label>
                            <input type="text" class="form-control" id="articleId" placeholder="请输入标题">
                        </div>
                        <button id="submitS" type="submit" class="btn btn-default">查询</button><br/>
                    </form>
                    <hr/>
                    <form role="form">

                        <div class="form-group">
                            <label for="inputfile">头像</label>
                            <input type="file" id="inputfile">
                        </div>
                        <div class="form-group">
                            <label for="username">用户名</label>
                            <input type="text" style="width:300px;" class="form-control" name="username" placeholder="请输入用户名">
                        </div>

                        <div class="form-group">
                            <label for="password">密码</label>
                            <input type="text" style="width:300px;" class="form-control" name="password" placeholder="请输入密码">
                        </div>
                        <div class="form-group">
                            <label for="name">昵称</label>
                            <input type="text" style="width:300px;" class="form-control" id="name" placeholder="请输入昵称">
                        </div>
                        <div class="form-group">
                            <label for="name">邮箱</label>
                            <input type="text" style="width:300px;" class="form-control" name="name" placeholder="请输入邮箱">
                        </div>
                        <div class="form-group">
                            <label for="phone">电话</label>
                            <input type="text" style="width:300px;" class="form-control" name="phone" placeholder="请输入电话">
                        </div>
                        <div>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="sexman" value="男" checked>男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="sex" id="sexwomen"  value="女">女
                            </label>
                        </div>
                        <div>
                            <br/>
                            <label class="radio-inline">
                                <input type="radio" name="type" id="typeuser" value="user" checked>普通用户
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="type" id="typeadmin"  value="admin">管理员
                            </label>
                        </div>
                        <button id="submit2" type="submit" class="btn btn-default">修改</button><br/>
                    </form>
                </div>
                <div class="delete-user user-manerge" id="skip-delete-foot-timeline">
                    <form role="form" class="form-inline" style="padding-top:50px;">
                        <div class="form-group">
                            <label for="articleId">请输入时间轴id</label>
                            <input type="text" class="form-control" id="articleId" placeholder="请输入标题">
                        </div>
                        <button id="submitS" type="submit" class="btn btn-default">查询</button><br/>
                    </form>
                    <hr/>
                    <form role="form">

                        <div class="form-group">
                            <label for="inputfile">头像</label>
                            <input type="file" id="inputfile">
                        </div>
                        <div class="form-group">
                            <label for="username">用户名</label>
                            <input disabled type="text" style="width:300px;" class="form-control" name="username" placeholder="请输入用户名">
                        </div>

                        <div class="form-group">
                            <label for="password">密码</label>
                            <input disabled type="text" style="width:300px;" class="form-control" name="password" placeholder="请输入密码">
                        </div>
                        <div class="form-group">
                            <label for="name">昵称</label>
                            <input disabled type="text" style="width:300px;" class="form-control" id="name" placeholder="请输入昵称">
                        </div>
                        <div class="form-group">
                            <label for="name">邮箱</label>
                            <input disabled type="text" style="width:300px;" class="form-control" name="name" placeholder="请输入邮箱">
                        </div>
                        <div class="form-group">
                            <label for="phone">电话</label>
                            <input disabled type="text" style="width:300px;" class="form-control" name="phone" placeholder="请输入电话">
                        </div>
                        <div>
                            <label class="radio-inline">
                                <input disabled type="radio" name="sex" id="sexman" value="男" checked>男
                            </label>
                            <label class="radio-inline">
                                <input disabled type="radio" name="sex" id="sexwomen"  value="女">女
                            </label>
                        </div>
                        <div>
                            <br/>
                            <label class="radio-inline">
                                <input disabled type="radio" name="type" id="typeuser" value="user" checked>普通用户
                            </label>
                            <label class="radio-inline">
                                <input disabled type="radio" name="type" id="typeadmin"  value="admin">管理员
                            </label>
                        </div>
                        <button id="submit2" type="submit" class="btn btn-default">删除</button><br/>
                    </form>
                </div>
                <div class="seacher-user user-manerge">
                    <table class="table table-bordered">
                        <caption>边框表格布局</caption>
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>用户名</th>
                            <th>昵称</th>
                            <th>密码</th>
                            <th>logo</th>
                            <th>邮箱</th>
                            <th>电话</th>
                            <th>性别</th>
                            <th>类别</th>
                            <th>注册时间</th>
                            <th> </th>
                            <th> </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Tanmay</td>
                            <td>Bangalore</td>
                            <td>560001</td>
                            <td>Tanmay</td>
                            <td>Tanmay</td>
                            <td>Bangalore</td>
                            <td>560001</td>
                            <td>Tanmay</td>
                            <td>560001</td>
                            <td>Tanmay</td>
                            <td class="skip-delete"><a href="#" onclick="userSkipDelete(id)">删除</a></td>
                            <td class="skip-delete"><a href="#" onclick="userSkipUpdate(id)">修改</a></td>
                        </tr>
                        <tr>
                            <td>Sachin</td>
                            <td>Mumbai</td>
                            <td>400003</td>
                            <td>Tanmay</td>
                            <td>560001</td>
                            <td>Tanmay</td>
                            <td>Pune</td>
                            <td>411027</td>
                            <td>Tanmay</td>
                            <td>560001</td>
                            <td>删除</td>
                            <td>修改</td>
                        </tr>
                        <tr>
                            <td>Uma</td>
                            <td>Pune</td>
                            <td>411027</td>
                            <td>Tanmay</td>
                            <td>560001</td>
                            <td>Tanmay</td>
                            <td>Pune</td>
                            <td>411027</td>
                            <td>Tanmay</td>
                            <td>560001</td>
                            <td>删除</td>
                            <td>修改</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- content水电费水电费是否是地方 -->
            </div>
        </div>
        <div class="article frendlink">
            <div class="head">
                <ul class="nav nav-tabs">
                    <li class="frendlink1 active" onclick="frendlinkHead(1);"><a href="javascript:void(0);">添加友情链接</a></li>
                    <li class="frendlink2" onclick="frendlinkHead(2);"><a href="javascript:void(0);">修改友情链接</a></li>
                    <li class="frendlink3" onclick="frendlinkHead(3);"><a href="javascript:void(0);">删除友情链接</a></li>
                    <li class="frendlink4" onclick="frendlinkHead(4);"><a href="javascript:void(0);">查询友情链接</a></li>
                </ul>
            </div>
            <div class="frendlink-content">
                <div class="add-frendlink frendlink-manerge active-manerge">
                    <form role="form">
                        <div class="form-group">
                            <label for="adress">地址</label>
                            <input type="text" style="width:300px;" class="form-control" name="adress" placeholder="请输入用户名">
                        </div>

                        <div class="form-group">
                            <label for="password">标题</label>
                            <input type="text" style="width:300px;" class="form-control" name="password" placeholder="请输入密码">
                        </div>
                        <button id="submit2" type="submit" class="btn btn-default">修改</button><br/>
                    </form>
                </div>
                <div class="update-frendlink frendlink-manerge">
                    <form role="form" class="form-inline" style="padding-top:50px;">
                        <div class="form-group">
                            <label for="articleId">请输入时间轴id</label>
                            <input type="text" class="form-control" id="articleId" placeholder="请输入标题">
                        </div>
                        <button id="submitS" type="submit" class="btn btn-default">查询</button><br/>
                    </form>
                    <hr/>
                    <form role="form">
                        <div class="form-group">
                            <label for="adress">地址</label>
                            <input type="text" style="width:300px;" class="form-control" name="adress" placeholder="请输入用户名">
                        </div>

                        <div class="form-group">
                            <label for="password">标题</label>
                            <input type="text" style="width:300px;" class="form-control" name="password" placeholder="请输入密码">
                        </div>
                        <button id="submit2" type="submit" class="btn btn-default">修改</button><br/>
                    </form>
                </div>
                <div class="delete-frendlink frendlink-manerge" id="skip-delete-foot-timeline">
                    <form role="form" class="form-inline" style="padding-top:50px;">
                        <div class="form-group">
                            <label for="articleId">请输入时间轴id</label>
                            <input type="text" class="form-control" id="articleId" placeholder="请输入标题">
                        </div>
                        <button id="submitS" type="submit" class="btn btn-default">查询</button><br/>
                    </form>
                    <hr/>
                    <form role="form">
                        <div class="form-group">
                            <label for="adress">地址</label>
                            <input disabled type="text" style="width:300px;" class="form-control" name="adress" placeholder="请输入用户名">
                        </div>

                        <div class="form-group">
                            <label for="password">标题</label>
                            <input disabled type="text" style="width:300px;" class="form-control" name="password" placeholder="请输入密码">
                        </div>
                        <button id="submit2" type="submit" class="btn btn-default">删除</button><br/>
                    </form>
                </div>
                <div class="seacher-frendlink frendlink-manerge">
                    <table class="table table-bordered">
                        <caption>边框表格布局</caption>
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>地址</th>
                            <th>标题</th>
                            <th> </th>
                            <th> </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>Tanmay</td>
                            <td>Bangalore</td>
                            <td>560001</td>
                            <td class="skip-delete"><a href="#" onclick="frendlinkSkipDelete(id)">删除</a></td>
                            <td class="skip-delete"><a href="#" onclick="frendlinkSkipUpdate(id)">修改</a></td>
                        </tr>
                        <tr>
                            <td>Sachin</td>
                            <td>Mumbai</td>
                            <td>400003</td>
                            <td>删除</td>
                            <td>修改</td>
                        </tr>
                        <tr>
                            <td>Uma</td>
                            <td>Pune</td>
                            <td>411027</td>
                            <td>删除</td>
                            <td>修改</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- content水电费水电费是否是地方 -->
            </div>
        </div>
        <div class="article message">
            <div class="head">
                <ul class="nav nav-tabs">
                    <li class="message1 active" onclick="messageHead(1);"><a href="javascript:void(0);">添加留言</a></li>
                    <li class="message2" onclick="messageHead(2);"><a href="javascript:void(0);">修改留言</a></li>
                    <li class="message3" onclick="messageHead(3);"><a href="javascript:void(0);">删除留言</a></li>
                    <li class="message4" onclick="messageHead(4);"><a href="javascript:void(0);">查询留言</a></li>
                </ul>
            </div>
            <div class="message-content">
                <div class="add-message message-manerge active-manerge">
                    <form role="form" id="add-message-form">
                        <div class="form-group">
                            <label>id</label>
                            <input type="text" style="width:300px;" id="message_add_id" class="form-control" name="id">
                        </div>

                        <div id="message_add_content">
                            <div id="rich-editor"></div>
                            <input type="text" style="display:none;" id="message_add_content_i" class="form-control" name="content">
                        </div>

                        <div class="form-group">
                            <label>发言时间</label>
                            <input type="text" style="width:300px;" id="message_add_responseTime" class="form-control" name="responseTime">
                        </div>
                        <div class="form-group">
                            <label>发言者Id</label>
                            <input type="text" style="width:300px;" id="message_add_userId" class="form-control" name="userId">
                        </div>
                        <div class="form-group">
                            <label>点赞</label>
                            <input type="text" style="width:300px;" id="message_update_good"  class="form-control" name="good">
                        </div>
                        <div class="form-group">
                            <label>对留言回答</label>
                            <input type="text" style="width:300px;" class="form-control" id="message_add_answerToMessage"  name="answerToMessage">
                        </div>
                        <div class="form-group">
                            <label>对用户回答</label>
                            <input type="text" style="width:300px;" class="form-control" id="message_add_answerToUser" name="answerToUser">
                        </div>
                        <span id="message_add_submit" onclick="message_add_submit();" class="btn btn-default">修改</span><br/>
                    </form>
                </div>
                <div class="update-message message-manerge">
                    <form role="form" class="form-inline" style="padding-top:50px;">
                        <div class="form-group">
                            <label for="articleId">请输入留言id</label>
                            <input type="text" class="form-control" id="message_update_id1"  placeholder="">
                        </div>
                        <span  onclick="message_update_data();" id="" class="btn btn-default">查询</span><br/>
                    </form>
                    <hr/>
                    <form role="form" id="update-message-form">
                        <div class="form-group">
                            <label>id</label>
                            <input type="text" style="width:300px;" id="message_update_id" class="form-control" name="id">
                        </div>

                        <div id="message_update_content">
                            <input type="text" style="display:none;" id="message_update_content_i" class="form-control" name="content">
                        </div>

                        <div class="form-group">
                            <label>发言时间</label>
                            <input type="text" style="width:300px;" id="message_update_responseTime" class="form-control" name="responseTime">
                        </div>
                        <div class="form-group">
                            <label>发言者Id</label>
                            <input type="text" style="width:300px;" id="message_update_userId" class="form-control" name="userId">
                        </div>
                        <div class="form-group">
                            <label>点赞</label>
                            <input type="text" style="width:300px;" id="message_update_good"  class="form-control" name="good">
                        </div>
                        <div class="form-group">
                            <label>对留言回答</label>
                            <input type="text" style="width:300px;" class="form-control" id="message_update_answerToMessage"  name="answerToMessage">
                        </div>
                        <div class="form-group">
                            <label>对用户回答</label>
                            <input type="text" style="width:300px;" class="form-control" id="message_update_answerToUser" name="answerToUser">
                        </div>
                        <span id="message_update_submit" onclick="message_update_submit();" class="btn btn-default">修改</span><br/>
                    </form>
                </div>
                <div class="delete-message message-manerge">
                    <form role="form" class="form-inline" style="padding-top:50px;">
                        <div class="form-group">
                            <label for="articleId">请输入留言id</label>
                            <input type="text" class="form-control" id="message_delete_id1" >
                        </div>
                        <span  onclick="message_delete_data()" class="btn btn-default">查询</span><br/>
                    </form>
                    <hr/>
                    <form role="form">
                        <div class="form-group">
                            <label>id</label>
                            <input disabled type="text" style="width:300px;" id="message_delete_id" class="form-control" name="id">
                        </div>

                        <div id="message_delete_content">

                        </div>

                        <div class="form-group">
                            <label>发言时间</label>
                            <input disabled type="text" style="width:300px;" id="message_delete_responseTime" class="form-control" name="responseTime">
                        </div>
                        <div class="form-group">
                            <label>发言者Id</label>
                            <input disabled type="text" style="width:300px;" id="message_delete_userId" class="form-control" name="userId">
                        </div>
                        <div class="form-group">
                            <label>点赞</label>
                            <input disabled type="text" style="width:300px;" id="message_delete_good"  class="form-control" name="good">
                        </div>
                        <div class="form-group">
                            <label>对留言回答</label>
                            <input disabled type="text" style="width:300px;" class="form-control" id="message_delete_answerToMessage"  name="answerToMessage">
                        </div>
                        <div class="form-group">
                            <label>对用户回答</label>
                            <input disabled type="text" style="width:300px;" class="form-control" id="message_delete_answerToUser" name="answerToUser">
                        </div>
                        <span id="message_delete_submit" onclick="message_delete_submit();" class="btn btn-default">删除</span><br/>
                    </form>

                </div>
                <div class="seacher-message message-manerge">
                    <table class="table table-bordered">
                        <caption>留言信息</caption>
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>内容</th>
                            <th>发布时间</th>
                            <th>用户id</th>
                            <th>点赞</th>
                            <th>对留言回答</th>
                            <th>对用户回答</th>
                            <th> </th>
                            <th> </th>
                        </tr>
                        </thead>
                        <tbody id="messageBox">
                        </tbody>
                    </table>
                </div>
                <!-- content水电费水电费是否是地方 -->
            </div>
        </div>
        <div class="article section">
            <div class="head">
                <ul class="nav nav-tabs">
                    <li class="section1 active" onclick="sectionHead(1);"><a href="javascript:void(0);">添加板块</a></li>
                    <li class="section2" onclick="sectionHead(2);"><a href="javascript:void(0);">修改板块</a></li>
                    <li class="section3" onclick="sectionHead(3);"><a href="javascript:void(0);">删除板块</a></li>
                    <li class="section4" onclick="sectionHead(4);"><a href="javascript:void(0);">查询板块</a></li>
                </ul>
            </div>
            <div class="section-content">
                <div class="add-section section-manerge active-manerge">
                    <form role="form" id="section_add_form">
                        <div class="form-group">
                            <label>板块标题</label>
                            <input type="text" style="width:300px;" id="section_add_title" class="form-control" name="title" placeholder="">
                        </div>
                        <div class="form-group" style="width:200px;">
                            <label for="name">zone</label>
                            <select class="form-control" id="section_option">
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="inputfile">输入文章logo</label>
                            <input type="file" name="img" id="section_add_logo">
                        </div>
                        <span onclick="section_add()" class="btn btn-default">确定</span><br/>
                    </form>
                </div>
                <div class="update-section section-manerge">
                    <form role="form" class="form-inline" style="padding-top:50px;">
                        <div class="form-group">
                            <label for="articleId">请输入板块id</label>
                            <input type="text" id="section_update_id1" class="form-control" name="sid" placeholder="请输入id">
                        </div>
                        <span id="submit-section-update"  onclick="section_update_data();" class="btn btn-default">查询</span><br/>
                    </form>
                    <hr/>
                    <form role="form" id="section_update_form">
                        <div class="form-group">
                            <label>板块id</label>
                            <input disabled type="text" style="width:300px;" name="id"  id="section_update_id" class="form-control" placeholder="">
                        </div>

                        <div class="form-group">
                            <label>板块标题</label>
                            <input type="text" style="width:300px;" id="section_update_title" class="form-control"  placeholder="">
                        </div>
                        <div class="form-group" style="width:200px;">
                            <label for="name">zone</label>
                            <select class="form-control" id="section_option1">
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="inputfile">输入文章logo</label>
                            <input type="file" name="img" id="section_update_logo">
                            <label><input type="checkbox" name="file_change"/>logo不变</label>
                            <div style="width:100px;height:100px;"><img src="" id="update_img" alt="logo"></div>
                        </div>
                        <span onclick="select_update_submit()" class="btn btn-default">确定</span><br/>
                    </form>
                </div>
                <div class="delete-section section-manerge" >
                    <form role="form" class="form-inline" style="padding-top:50px;">
                        <div class="form-group">
                            <label for="articleId">请输入板块id</label>
                            <input type="text" id="section_delete_id1" name="sid" class="form-control" placeholder="请输入id">
                        </div>

                        <span   class="btn btn-default" onclick="section_delete_data()">查询</span><br/>
                    </form>
                    <hr/>
                    <form role="form">
                        <div class="form-group">
                            <label>板块id</label>
                            <input disabled type="text" style="width:300px;" id="section_delete_id" class="form-control" name="id" placeholder="">
                        </div>

                        <div class="form-group">
                            <label>板块标题</label>
                            <input disabled type="text" style="width:300px;" id="section_delete_title" class="form-control" name="title" placeholder="">
                        </div>
                        <div class="form-group">
                            <label >zoneId</label>
                            <input disabled type="text" style="width:300px;" id="section_delete_zoneId" class="form-control" name="zoneId" placeholder="">
                        </div>
                        <div class="form-group">
                            <label>logo</label>
                            <input disabled type="text" style="width:300px;" id="section_delete_logo" class="form-control" name="logo" placeholder="">
                            <div style="width:100px;height:100px;"><img src="" id="delete_img"></div>
                        </div>
                        <span  onclick="select_delete_submit()" class="btn btn-default">删除</span><br/>
                    </form>
                </div>
                <div class="seacher-section section-manerge">
                    <table class="table table-bordered">
                        <caption>板块信息</caption>
                        <thead>
                        <tr>
                            <th>板块id</th>
                            <th>板块名称</th>
                            <th>zoneId</th>
                            <th>logo</th>
                            <th> </th>
                            <th> </th>
                        </tr>
                        </thead>
                        <tbody id="sectionBox">
                        </tbody>
                    </table>
                </div>
                <!-- content水电费水电费是否是地方 -->
            </div>
        </div>
    </div>
</div>
</body>
</html>
