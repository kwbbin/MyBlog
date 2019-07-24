// message部分获取message信息的ajax
function getMessage() {
    $("#right .message ul .message4").bind("click",function(){
        $.ajax({
            url :  "searchMessage.do",//访问路径
            type : "post",
            success :
                function(messages){
                    $("#messageBox").html("");
                    for(var i=0;i<messages.length;i++){
                        var tr=$("<tr></tr>");
                        var da = new Date(messages[i].responseTime);
                        var time=da.getFullYear() + "-" + (da.getMonth() + 1) + "-" + da.getDate() + " " + da.getHours() + ":" + da.getMinutes() + ":" + da.getSeconds();
                        tr.append("<td>"+messages[i].id+"</td>");
                        tr.append("<td>"+messages[i].content+"</td>");
                        tr.append("<td>"+time+"</td>");

                        tr.append("<td>"+messages[i].userId+"</td>");
                        tr.append("<td>"+messages[i].good+"</td>");
                        tr.append("<td>"+messages[i].answerToMessage+"</td>");
                        tr.append("<td>"+messages[i].answerToUser+"</td>");
                        tr.append("<td class=\"skip-delete\"><a href=\"#\" onclick=\"messageSkipDelete("+messages[i].id+")\">删除</a></td>");
                        tr.append("<td class=\"skip-delete\"><a href=\"#\" onclick=\"messageSkipUpdate("+messages[i].id+")\">修改</a></td>");
                        $("#messageBox").append(tr);
                    }

                }//查询成功处理函数
        });
    });
};


//message板块删除部分的根据id查询的ajax
function message_delete_data() {
    var id=$("#message_delete_id1")[0].value;
    $.ajax({
        url : "getSingleMessage.do?id="+id,//访问路径
        type : "post",
        success :
            function(article){
                var da = new Date(article.responseTime);
                var time=da.getFullYear() + "-" + (da.getMonth() + 1) + "-" + da.getDate() + " " + da.getHours() + ":" + da.getMinutes() + ":" + da.getSeconds();
                $("#message_delete_id")[0].value=article.id;
                $("#message_delete_content")[0].value=article.content;
                $("#message_delete_responseTime")[0].value=time;
                $("#message_delete_userId")[0].value=article.userId;
                $("#message_delete_good")[0].value=article.good;
                $("#message_delete_answerToMessage")[0].value=article.answerToMessage;
                $("#message_delete_answerToUser")[0].value=article.answerToUser;
            }//查询成功处理函数
    });
}

// message部分删除提交按钮
function message_delete_submit() {
    var id=$("#message_delete_id")[0].value;

    $.ajax({
        url:"deleteMessage.do?id="+id,
        type:"get",
        success:function (message) {
            if(message== "success"){
                alert("删除成功!");
            }else if(message=="null"){
                alert("删除失败，该板块不存在");
            }else {
                alert("删除失败");
            }
        }
    });
}


//message板块修改部分的根据id查询的ajax
function message_update_data(){
    var sid=$("#message_update_id1")[0].value;
    $.ajax({
        url : "getSingleMessage.do?id="+sid,//访问路径
        type : "get",
        success :
            function(article){
                var da = new Date(article.responseTime);
                var time=da.getFullYear() + "-" + (da.getMonth() + 1) + "-" + da.getDate() + " " + da.getHours() + ":" + da.getMinutes() + ":" + da.getSeconds();
                $("#message_update_id")[0].value=article.id;
                $("#message_update_content")[0].value=article.content;
                $("#message_update_responseTime")[0].value=time;
                $("#message_update_userId")[0].value=article.userId;
                $("#message_update_good")[0].value=article.good;
                $("#message_update_answerToMessage")[0].value=article.answerToMessage;
                $("#message_update_answerToUser")[0].value=article.answerToUser;
            }//查询成功处理函数
    });
}

// 修改message ajax
function  message_update_submit() {
    var id=$("#message_update_submit")[0].value;
    var content=$("#message_update_content")[0].value;
    var responseTime=$("#message_update_responseTime")[0].value;
    var userId=$("#message_update_userId")[0].value;
    var good=$("#message_update_good")[0].value;
    var answerToMessage=$("#message_update_answerToMessage")[0].value;
    var answerToUser=$("#message_update_answerToUser")[0].value;

//$("#message_update_form")[0]
    var formData=new FormData();
    formData.append("id",id);
    formData.append("content",content);
    formData.append("responseTime",responseTime);
    formData.append("userId",userId);
    formData.append("good",good);
    formData.append("answerToMessage",answerToMessage);
    formData.append("answerToUser",answerToUser);

    $.ajax({
        url: "MessageUpdate.do",
        type: "POST",
        data: $('#update-message-form').serialize(),
        success: function(message) {
            if(message== "success"){
                alert("上传成功!");
            }else if(message=="null"){
                alert("该留言不存在!");
            }else{
                alert("修改失败，请检查用户是否存在");
            }
        },
        error: function(data) {
        }
    });

    // $.ajax({
    //     url:"MessageUpdate.do",
    //     type:"get",
    //     data:formData,
    //     contentType:false,
    //     processData:false,
    //     success:function (message) {
    //
    //     }
    // });
}

