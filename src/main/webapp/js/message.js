function createArea(){
    $("#editorBox").css("display","block");

    var screem=document.body.offsetWidth ;
    var editorWidth=$("#editorBox").width();

    $("#editorBox").css("left",(screem-editorWidth)/2);


    var screemHeight=document.body.offsetHeight ;
    var editorHeight=$("#editorBox").height();

    $("#editorBox").css("top",(screemHeight-editorHeight)/2);
    $("#editorBox .close").click(function (e) {
        e.preventDefault();
        $("#editorBox").css("display","none");
    });



    $("#rich-editor").css("position","absolute");
    $("#rich-editor").css("width","700px");
    $("#rich-editor").css("left",($("#editorBox").width()-$("#rich-editor").width())/2+"px");
    $("#rich-editor").css("top",($("#editorBox").height()-$("#rich-editor").height())/2+"px");
    $("#rich-editor").css("background","rgba(255,255,255,0.8)");
    // $("#rich-editor").css("position","absolute");
}