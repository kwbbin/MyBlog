
function replyOpen(){//关闭评论回复框
	var open=document.getElementsByClassName("articleReply")[0];

	open.onclick=function(){
		var select=document.getElementById("reply");
		replyBox.style.display="block";
	}
}

function replyLabel(){//关闭评论回复框
	var close=document.getElementsByClassName("close")[0];

	close.onclick=function(){
		var select=document.getElementById("editor1");
		select.contentWindow.document.body.innerHTML ="";//清除回复框
		replyBox.style.display="none";
	}
}
