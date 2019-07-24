function addGood(obj,id){
    $.ajax({
        url :  "indexAddGood.do",//访问路径
        type : "post",
        data:'id='+id,
        success :
            function(isGood,This){
                if(isGood=="hasGood"){
                    alert("您已经点赞")
                }else if(isGood=="noLogin"){
                    alert("请您先登陆")
                }else{
                    $(obj).css("background"," url(images/good1.gif) no-repeat 0 3px");
                    $(obj).text(parseInt($(obj).text())+1);
                }

            }//查询成功处理函数
    });
}

