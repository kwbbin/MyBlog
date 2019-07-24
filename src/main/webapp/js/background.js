

//文章管理
function articleHead(num){

    $("#right .article-content .add-article").removeClass("active-manerge");
    $("#right ul .articleli1").removeClass("active");
    $("#right .article-content .update-article").removeClass("active-manerge");
    $("#right ul .articleli2").removeClass("active");
    $("#right .article-content .delete-article").removeClass("active-manerge");
    $("#right ul .articleli3").removeClass("active");
    $("#right .article-content .seacher-article").removeClass("active-manerge");
    $("#right ul .articleli4").removeClass("active");
    if(num==1){
        $("#right .article-content .add-article").addClass("active-manerge");
        $("#right ul .articleli1").addClass("active");
    }else if(num==2){
        $("#right .article-content .update-article").addClass("active-manerge");
        $("#right ul .articleli2").addClass("active");
    }else if(num==3){
        $("#right .article-content .delete-article").addClass("active-manerge");
        $("#right ul .articleli3").addClass("active");
    }else if(num==4){
        $("#right .article-content .seacher-article").addClass("active-manerge");
        $("#right ul .articleli4").addClass("active");
    }


}

// 左边导航栏
function leftList(num){
    $("#left ul .article-manerge").removeClass("active");
    $("#left ul .timeline").removeClass("active");
    $("#left ul .user").removeClass("active");
    $("#left ul .frendlink").removeClass("active");
    $("#left ul .message").removeClass("active");
    $("#left ul .studylife").removeClass("active");
    $("#left ul .section").removeClass("active");
    $("#right .article-manerge").removeClass("right-active");
    $("#right .timeline").removeClass("right-active");
    $("#right .user").removeClass("right-active");
    $("#right .frendlink").removeClass("right-active");
    $("#right .message").removeClass("right-active");
    $("#right .lifestudy").removeClass("right-active");
    $("#right .section").removeClass("right-active");
    if(num==1){
        $("#right .article-manerge").addClass("right-active");
        $("#left ul .article-manerge").addClass("active");
    }else if(num==2){
        $("#right .timeline").addClass("right-active");
        $("#left ul .timeline").addClass("active");
    }else if(num==3){
        $("#right .user").addClass("right-active");
        $("#left ul .user").addClass("active");
    }else if(num==4){
        $("#right .frendlink").addClass("right-active");
        $("#left ul .frendlink").addClass("active");
    }else if(num==5){
        $("#right .message").addClass("right-active");
        $("#left ul .message").addClass("active");
    }else if(num==6){
        $("#right .lifestudy").addClass("right-active");
        $("#left ul .studylife").addClass("active");
    }else if(num==7){
        $("#right .section").addClass("right-active");
        $("#left ul .section").addClass("active");
    }

}

function skipDelete(id) {
    $("#right ul .articleli4").removeClass("active");
    $("#right ul .articleli3").addClass("active");
    $("#right .article-content .seacher-article").removeClass("active-manerge");
    $("#right .article-content .delete-article").addClass("active-manerge");
}

function skipUpdate(id) {
    $("#right ul .articleli4").removeClass("active");
    $("#right ul .articleli2").addClass("active");
    $("#right .article-content .seacher-article").removeClass("active-manerge");
    $("#right .article-content .update-article").addClass("active-manerge");
}



//  时间轴
function timelineHead(num){
    $("#right .timeline-content .add-timeline").removeClass("active-manerge");
    $("#right .timeline ul .timeline1").removeClass("active");
    $("#right .timeline-content .update-timeline").removeClass("active-manerge");
    $("#right .timeline ul .timeline2").removeClass("active");
    $("#right .timeline-content .delete-timeline").removeClass("active-manerge");
    $("#right .timeline ul .timeline3").removeClass("active");
    $("#right .timeline-content .seacher-timeline").removeClass("active-manerge");
    $("#right .timeline ul .timeline4").removeClass("active");
    if(num==1){
        $("#right .timeline-content .add-timeline").addClass("active-manerge");
        $("#right .timeline ul .timeline1").addClass("active");
    }else if(num==2){
        $("#right .timeline-content .update-timeline").addClass("active-manerge");
        $("#right .timeline ul .timeline2").addClass("active");
    }else if(num==3){
        $("#right .timeline-content .delete-timeline").addClass("active-manerge");
        $("#right .timeline ul .timeline3").addClass("active");
    }else if(num==4){
        $("#right .timeline-content .seacher-timeline").addClass("active-manerge");
        $("#right .timeline ul .timeline4").addClass("active");
    }
}

function timelineSkipDelete(id) {
    $("#right .timeline ul .timeline4").removeClass("active");
    $("#right .timeline ul .timeline3").addClass("active");
    $("#right .timeline-content .seacher-timeline").removeClass("active-manerge");
    $("#right .timeline-content .delete-timeline").addClass("active-manerge");
}

function timelineSkipUpdate(id) {
    $("#right .timeline ul .timeline4").removeClass("active");
    $("#right .timeline ul .timeline2").addClass("active");
    $("#right .timeline-content .seacher-timeline").removeClass("active-manerge");
    $("#right .timeline-content .update-timeline").addClass("active-manerge");
}



//  用户管理
function userHead(num){
    $("#right .user-content .add-user").removeClass("active-manerge");
    $("#right .user ul .user1").removeClass("active");
    $("#right .user-content .update-user").removeClass("active-manerge");
    $("#right .user ul .user2").removeClass("active");
    $("#right .user-content .delete-user").removeClass("active-manerge");
    $("#right .user ul .user3").removeClass("active");
    $("#right .user-content .seacher-user").removeClass("active-manerge");
    $("#right .user ul .user4").removeClass("active");
    if(num==1){
        $("#right .user-content .add-user").addClass("active-manerge");
        $("#right .user ul .user1").addClass("active");
    }else if(num==2){
        $("#right .user-content .update-user").addClass("active-manerge");
        $("#right .user ul .user2").addClass("active");
    }else if(num==3){
        $("#right .user-content .delete-user").addClass("active-manerge");
        $("#right .user ul .user3").addClass("active");
    }else if(num==4){
        $("#right .user-content .seacher-user").addClass("active-manerge");
        $("#right .user ul .user4").addClass("active");
    }
}

function userSkipDelete(id) {
    $("#right .user ul .user4").removeClass("active");
    $("#right .user ul .user3").addClass("active");
    $("#right .user-content .seacher-user").removeClass("active-manerge");
    $("#right .user-content .delete-user").addClass("active-manerge");
}

function userSkipUpdate(id) {
    $("#right .user ul .user4").removeClass("active");
    $("#right .user ul .user2").addClass("active");
    $("#right .user-content .seacher-user").removeClass("active-manerge");
    $("#right .user-content .update-user").addClass("active-manerge");
}

//  友情链接
function frendlinkHead(num){
    $("#right .frendlink-content .add-frendlink").removeClass("active-manerge");
    $("#right .frendlink ul .frendlink1").removeClass("active");
    $("#right .frendlink-content .update-frendlink").removeClass("active-manerge");
    $("#right .frendlink ul .frendlink2").removeClass("active");
    $("#right .frendlink-content .delete-frendlink").removeClass("active-manerge");
    $("#right .frendlink ul .frendlink3").removeClass("active");
    $("#right .frendlink-content .seacher-frendlink").removeClass("active-manerge");
    $("#right .frendlink ul .frendlink4").removeClass("active");
    if(num==1){
        $("#right .frendlink-content .add-frendlink").addClass("active-manerge");
        $("#right .frendlink ul .frendlink1").addClass("active");
    }else if(num==2){
        $("#right .frendlink-content .update-frendlink").addClass("active-manerge");
        $("#right .frendlink ul .frendlink2").addClass("active");
    }else if(num==3){
        $("#right .frendlink-content .delete-frendlink").addClass("active-manerge");
        $("#right .frendlink ul .frendlink3").addClass("active");
    }else if(num==4){
        $("#right .frendlink-content .seacher-frendlink").addClass("active-manerge");
        $("#right .frendlink ul .frendlink4").addClass("active");
    }
}

function frendlinkSkipDelete(id) {
    $("#right .frendlink ul .frendlink4").removeClass("active");
    $("#right .frendlink ul .frendlink3").addClass("active");
    $("#right .frendlink-content .seacher-frendlink").removeClass("active-manerge");
    $("#right .frendlink-content .delete-frendlink").addClass("active-manerge");
}

function frendlinkSkipUpdate(id) {
    $("#right .frendlink ul .frendlink4").removeClass("active");
    $("#right .frendlink ul .frendlink2").addClass("active");
    $("#right .frendlink-content .seacher-frendlink").removeClass("active-manerge");
    $("#right .frendlink-content .update-frendlink").addClass("active-manerge");
}

//  留言
function messageHead(num){
    $("#right .message-content .add-message").removeClass("active-manerge");
    $("#right .message ul .message1").removeClass("active");
    $("#right .message-content .update-message").removeClass("active-manerge");
    $("#right .message ul .message2").removeClass("active");
    $("#right .message-content .delete-message").removeClass("active-manerge");
    $("#right .message ul .message3").removeClass("active");
    $("#right .message-content .seacher-message").removeClass("active-manerge");
    $("#right .message ul .message4").removeClass("active");
    if(num==1){
        $("#right .message-content .add-message").addClass("active-manerge");
        $("#right .message ul .message1").addClass("active");
    }else if(num==2){
        $("#right .message-content .update-message").addClass("active-manerge");
        $("#right .message ul .message2").addClass("active");
    }else if(num==3){
        $("#right .message-content .delete-message").addClass("active-manerge");
        $("#right .message ul .message3").addClass("active");
    }else if(num==4){
        $("#right .message-content .seacher-message").addClass("active-manerge");
        $("#right .message ul .message4").addClass("active");
    }
}


function messageSkipDelete(id) {
    if(typeof id!="undefined"){
        $.ajax({
            url :  "getSingleMessage.do?id="+id,//访问路径
            type : "post",
            success :
                function(article){
                    var da = new Date(article.responseTime);
                    var time=da.getFullYear() + "-" + (da.getMonth() + 1) + "-" + da.getDate() + " " + da.getHours() + ":" + da.getMinutes() + ":" + da.getSeconds();
                    $("#message_delete_id")[0].value=article.id;
                    $("#message_delete_id1")[0].value=article.id;
                    $("#message_delete_content")[0].value=article.content;
                    $("#message_delete_responseTime")[0].value=time;
                    $("#message_delete_userId")[0].value=article.userId;
                    $("#message_delete_good")[0].value=article.good;
                    $("#message_delete_answerToMessage")[0].value=article.answerToMessage;
                    $("#message_delete_answerToUser")[0].value=article.answerToUser;
                }//查询成功处理函数
        });
    }
    $("#right .message ul .message4").removeClass("active");
    $("#right .message ul .message3").addClass("active");
    $("#right .message-content .seacher-message").removeClass("active-manerge");
    $("#right .message-content .delete-message").addClass("active-manerge");
}

function messageSkipUpdate(id) {
    if(typeof id!="undefined"){
        $.ajax({
            url :  "getSingleMessage.do?id="+id,//访问路径
            type : "post",
            success :
                function(article){
                    var da = new Date(article.responseTime);
                    var time=da.getFullYear() + "-" + (da.getMonth() + 1) + "-" + da.getDate() + " " + da.getHours() + ":" + da.getMinutes() + ":" + da.getSeconds();
                    $("#message_update_id")[0].value=article.id;
                    $("#message_update_id1")[0].value=article.id;
                    $("#message_update_content_i")[0].value=article.content;
                    $("#message_update_responseTime")[0].value=time;
                    $("#message_update_userId")[0].value=article.userId;
                    $("#message_update_good")[0].value=article.good;
                    $("#message_update_answerToMessage")[0].value=article.answerToMessage;
                    $("#message_update_answerToUser")[0].value=article.answerToUser;
                }//查询成功处理函数
        });
    }
    $("#right .message ul .message4").removeClass("active");
    $("#right .message ul .message2").addClass("active");
    $("#right .message-content .seacher-message").removeClass("active-manerge");
    $("#right .message-content .update-message").addClass("active-manerge");
}

//  板块
function sectionHead(num){
    $("#right .section-content .add-section").removeClass("active-manerge");
    $("#right .section ul .section1").removeClass("active");
    $("#right .section-content .update-section").removeClass("active-manerge");
    $("#right .section ul .section2").removeClass("active");
    $("#right .section-content .delete-section").removeClass("active-manerge");
    $("#right .section ul .section3").removeClass("active");
    $("#right .section-content .seacher-section").removeClass("active-manerge");
    $("#right .section ul .section4").removeClass("active");
    if(num==1){
        $("#right .section-content .add-section").addClass("active-manerge");
        $("#right .section ul .section1").addClass("active");
    }else if(num==2){
        $("#right .section-content .update-section").addClass("active-manerge");
        $("#right .section ul .section2").addClass("active");
    }else if(num==3){
        $("#right .section-content .delete-section").addClass("active-manerge");
        $("#right .section ul .section3").addClass("active");
    }else if(num==4){
        $("#right .section-content .seacher-section").addClass("active-manerge");
        $("#right .section ul .section4").addClass("active");
    }
}


function sectionSkipDelete(sid) {
    if(typeof sid!="undefined"){
        $.ajax({
            url :  "getSingleSection.do?sid="+sid,//访问路径
            type : "post",
            success :
                function(section){
                    $("#section_delete_id")[0].value=section.id;
                    $("#section_delete_id1")[0].value=section.id;
                    $("#section_delete_title")[0].value=section.title;
                    $("#section_delete_zoneId")[0].value=section.zoneId;
                    $("#section_delete_logo")[0].value=section.logo;
                }//查询成功处理函数
        });
    }
    $("#right .section ul .section4").removeClass("active");
    $("#right .section ul .section3").addClass("active");
    $("#right .section-content .seacher-section").removeClass("active-manerge");
    $("#right .section-content .delete-section").addClass("active-manerge");
}

function sectionSkipUpdate(sid) {
    if(typeof sid!="undefined"){
        $.ajax({
            url :  "getSingleSection.do?sid="+sid,//访问路径
            type : "post",
            success :
                function(section){
                    $("#section_update_id")[0].value=section.id;
                    $("#section_update_id1")[0].value=section.id;
                    $("#section_update_title")[0].value=section.title;
                    $("#section_update_zoneId")[0].value=section.zoneId;
                    $("#section_update_logo")[0].value=section.logo;
                }//查询成功处理函数
        });
    }
    $("#right .section ul .section4").removeClass("active");
    $("#right .section ul .section2").addClass("active");
    $("#right .section-content .seacher-section").removeClass("active-manerge");
    $("#right .section-content .update-section").addClass("active-manerge");
}

// --------------------- 以上为样式js --------------------------------


//  ajax

//section板块修改部分的根据id查询的ajax
function section_update_data(){
    var sid=$("#section_update_id1")[0].value;
    $.ajax({
        url : "getSingleSection.do?sid="+sid,//访问路径
        type : "post",
        success :
            function(article){
                $("#section_update_id")[0].value=article.id;
                $("#section_update_title")[0].value=article.title;
                // $("#section_update_zoneId")[0].value=article.zoneId;
                var len=$("#section_option1 option").length;
                for(var i=0;i<len;i++){
                    if($("#section_option1 option")[i].getAttribute("str")==article.zoneId){
                        var option=$("#section_option1 option")[i];
                        option.selected="selected";
                    }
                }
                $("#update_img")[0].src=article.logo.replace("\\","/");
            }//查询成功处理函数
    });
}

// 修改section ajax
function  select_update_submit() {
    var id=$("#section_update_id")[0].value;
    var title=$("#section_update_title")[0].value;
    var selectId=$("#section_option1")[0].selectedIndex;
    var zoneId=$("#section_option1")[0][selectId].getAttribute("str");


    var formData=new FormData($("#section_update_form")[0]);
    formData.append("id",id);
    formData.append("img",$("#section_update_logo")[0]);
    formData.append("title",title);
    formData.append("zoneId",zoneId);

    $.ajax({
        url:"SectionUpdate.do",
        type:"post",
        data:formData,
        contentType:false,
        processData:false,
        success:function (message) {
            if(message== "success"){
                alert("上传成功!");
            }else if(message=="null"){
                alert("该板块不存在!");
            }else{
                alert("上传失败!请仔细检查您的图片类型和大小");
            }
        }
    });
}

//section板块删除部分的根据id查询的ajax
function section_delete_data() {
    var sid=$("#section_delete_id1")[0].value;
    $.ajax({
        url : "getSingleSection.do?sid="+sid,//访问路径
        type : "post",
        success :
            function(article){
                $("#section_delete_id")[0].value=article.id;
                $("#section_delete_title")[0].value=article.title;
                $("#section_delete_zoneId")[0].value=article.zoneId;
                var len=$("#section_option1 option").length;
                // for(var i=0;i<len;i++){
                //     if($("#section_option1 option")[i].getAttribute("str")==article.zoneId){
                //         var option=$("#section_option1 option")[i];
                //         option.selected="selected";
                //     }
                // }
                $("#section_delete_logo")[0].value=article.logo;

                $("#delete_img")[0].src=article.logo.replace("\\","/");
            }//查询成功处理函数
    });
}

function select_delete_submit() {
    var id=$("#section_delete_id")[0].value;

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

// 给select标签添加数据
function section_add_getData() {
    $.ajax({
        url : "getSectionZone.do",//访问路径
        type : "post",
        success :
            function(zones){
                $("#section_option").html("");
                $("#section_option1").html("");
               for(var i=0;i<zones.length;i++){
                   var option=$("<option str='"+zones[i].id+"'>"+zones[i].title+"</option>");
                   $("#section_option").append(option);
               }
                for(var i=0;i<zones.length;i++){
                    var option=$("<option str='"+zones[i].id+"'>"+zones[i].title+"</option>");
                    $("#section_option1").append(option);
                }
            }//查询成功处理函数
    });
}

// section添加
function section_add() {
    // var title=$("#section_add_title")[0].value;
    var selectId=$("#section_option")[0].selectedIndex;
    var zoneId=$("#section_option")[0][selectId].getAttribute("str");
    var logo=$("#section_add_logo")[0].value;

    var formData=new FormData($("#section_add_form")[0]);
    formData.append("img",$("#section_add_logo")[0]);
    // formData.append("title",title);
    formData.append("zoneId",zoneId);
    formData.append("logo",logo);

    $.ajax({
        url:"addSection.do",
        type:"post",
        data:formData,
        contentType:false,
        processData:false,
        success:function (message) {
            if(message== "success"){
                alert("上传成功!");
            }else if(message=="has"){
                alert("已存在!");
            }else{
                alert("上传失败!请仔细检查您的图片类型和大小");
            }
        }
    });
    
}




  function getArticle() {
    $("#right ul .articleli4").bind("click",function(){
        $.ajax({
            url :  "background/getAllArticle.do",//访问路径
            type : "post",
            success :
                function(article){
                    alert(article);
                }//查询成功处理函数
        });
    });
};


// timeline Ajax
function getTimeLine() {
    $("#right .timeline ul .timeline4").bind("click",function(){
        alert();
    });
};

// user Ajax
function getUser() {
    $("#right .user ul .user4").bind("click",function(){
        alert();
    });
};

// friendlink Ajax
function getFrendLink() {
    $("#right .frendlink ul .frendlink4").bind("click",function(){
        alert();
    });
};



// life Ajax
function getLife() {
    $("#right .lifestudy ul .lifestudy2").bind("click",function(){
        alert("life");
    });
};

// study Ajax
function getStudy() {
    $("#right .lifestudy ul .lifestudy4").bind("click",function(){
        alert("study");
    });
};


// section部分获取section信息的ajax
function getSection() {
    $("#right .section ul .section4").bind("click",function(){
        $.ajax({
            url :  "searchSection.do",//访问路径
            type : "post",
            success :
                function(sections){
                    $("#sectionBox").html("");
                        for(var i=0;i<sections.length;i++){
                            var tr=$("<tr></tr>");
                            tr.append("<td>"+sections[i].id+"</td>");
                            tr.append("<td>"+sections[i].title+"</td>");
                            tr.append("<td>"+sections[i].zoneId+"</td>");
                            tr.append("<td>"+sections[i].logo+"</td>");
                            tr.append("<td class=\"skip-delete\"><a href=\"#\" onclick=\"sectionSkipDelete("+sections[i].id+")\">删除</a></td>");
                            tr.append("<td class=\"skip-delete\"><a href=\"#\" onclick=\"sectionSkipUpdate("+sections[i].id+")\">修改</a></td>");
                            $("#sectionBox").append(tr);
                        }

                }//查询成功处理函数
        });
    });
};

function init(){
    getArticle();
    getTimeLine();
    getUser();
    getFrendLink();
    getLife();
    getStudy();
    section_add_getData();
}