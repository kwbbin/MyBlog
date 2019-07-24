function AreaHtml(str){
    // 添加head
    AreaHead=$("<div id=\"AreaHead\"></div>");

    // 添加img按钮
    imgButton1=$("<span id=\"imgButton1\" class=\"imgButton\"><img src=\"images/emoji/emoji1/emoji1_1.jpg\"></span>");
    imgButton2=$("<span id=\"imgButton2\" class=\"imgButton\"><img src=\"images/emoji/emoji2/emoji2_1.png\"></span>");
    imgButton3=$("<span id=\"imgButton3\" class=\"imgButton\"><img src=\"images/emoji/emoji3/emoji3_1.gif\"></span>");
    imgButton4=$("<span id=\"imgButton4\" class=\"imgButton\"><img src=\"images/emoji/emoji4/emoji4_1.gif\"></span>");

    // 把按钮添加到AreaHead
    AreaHead.append(imgButton1);
    AreaHead.append(imgButton2);
    AreaHead.append(imgButton3);
    AreaHead.append(imgButton4);

    // 把head添加到容器中
    $("#rich-editor").prepend(AreaHead);

    AreaBody=$("<div id=\"AreaBody\"></div>");
    AreaBody.contenteditable=true;
    AreaBody.attr("contenteditable","true");
    // 添加提示语
    AreaBody.append($("<p id=\"review\" style=\"color:#999999;margin-top:5px\">说点什么吧....</p>"));
    AreaBody.focus(function (e) {
        e.preventDefault();

        $("#review").remove();;
    });
    AreaBody.blur(function(){
        if($("#AreaBody").html()==""||$("#AreaBody").html()==null){
            AreaBody.append($("<p id=\"review\" style=\"color:#999999;margin-top:5px\">说点什么吧....</p>"));
        }
    });

    $("#rich-editor").append(AreaBody);


    AreaHead.prepend("<span class=\"imgInfo\">添加头像</span>");

    AreaHead.append("<span class=\"submit\">提  交</span>");

    imgButton1.bind("click",function(e){
        e.preventDefault();
        e.stopPropagation();
        closeImgTable();
        imgTable1=createGridImg(AreaHead,8,1,".jpg",168,40);
    });
    imgButton2.bind("click",function(e){
        e.preventDefault();
        e.stopPropagation();
        closeImgTable();
        imgTable2=createGridImg(AreaHead,12,2,".png",168,40);
    });
    imgButton3.bind("click",function(e){
        e.preventDefault();
        e.stopPropagation();
        closeImgTable();
        imgTable3=createGridImg(AreaHead,20,3,".gif",372,60);
    });
    imgButton4.bind("click",function(e){
        e.preventDefault();
        e.stopPropagation();
        closeImgTable();
        imgTable4=createGridImg(AreaHead,28,4,".gif",372,60);
    });

    $(document).bind("click",function(e){
        e.preventDefault();
        e.stopPropagation();
        closeImgTable();

    });


    //生成表情选择框,sum为图片的数量，imgI为第几个img,end为表情后缀,width为表格宽度，imgwidth为图片宽度
    function createGridImg(This,sum,imgI,end,width,imgwidth){
        imgTable=$("<div class=\"imgTable\"></div>")
        var s1=window.location+"";
        var s2 = s1.substr(0,s1.lastIndexOf("/"))+"/";
        for(var i=1;i<=sum;i++){
            var str="images/emoji/emoji"+imgI+"/emoji"+imgI+"_"+i+end;
            str=s2+str;
            grid =$("<img style=\"width:"+imgwidth+"px"+";height:"+imgwidth+"px\" class=\"images\" src=\""+str+"\">");
            str1="<img style=\"width:"+imgwidth+"px"+";height:"+imgwidth+"px\" class=\"images\" src=\""+str+"\">";
            grid.attr("str1",str1);
            //alert(str);
            grid.bind("click",function(e){
                var This=this;
                e.preventDefault();
                e.stopPropagation();
                $("#AreaBody").append($($(This).attr("str1")));
                $("#review").remove();
                closeImgTable();
            });

            imgTable.append(grid);
            imgTable.width(width);
        }
        This.append(imgTable);
        return imgTable;
    }



    //关闭表情表格
    function closeImgTable(){
        if(typeof imgTable1!="undefined"){
            imgTable1.css("display","none");
        }
        if(typeof imgTable2!="undefined"){
            imgTable2.css("display","none");
        }
        if(typeof imgTable3!="undefined"){
            imgTable3.css("display","none");
        }
        if(typeof imgTable4!="undefined"){
            imgTable4.css("display","none");
        }
    }



    $("#AreaHead .submit").click(function (e) {
        e.preventDefault();
        var content=$("#AreaBody").html();
        if(content=="<p id=\"review\" style=\"color:#999999;margin-top:5px\">说点什么吧....</p>"){
            alert("请输入内容");
        }

        if($("#articleName").text()==""){
            alert("请先登录");
        }else{
            articleId=$(".articleId").text();
            var s1=window.location+"";
            var s2 = s1.substr(0,s1.lastIndexOf("/"));
            $.post(s2+str,
                {
                    id:articleId,
                    content:content
                },
                function(data,status){
                    // alert("提交成功");
                    window.location.reload();
                });
        };

    });
}

