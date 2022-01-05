///////////////////////// function
 	function sendmsgAjax(ctx, form_data){
		
		var serverURL=ctx+"/msg_addmsgprivate.do?"+ form_data;
        
        console.log(serverURL );
        //
        $.ajax({
            //请求方式
            type : "GET",
            //请求的媒体类型
            contentType: "application/json;charset=UTF-8",
            //请求地址
            url : serverURL,
            //数据，json字符串
            //data : JSON.stringify(list),
            //请求成功
            success : function(result) {
                console.log('-=-=-= sendmsgAjax server back:'+result);
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
	}
	
	/////////////////////////////////// 发送消息
  	function sendmsg(){
	  console.log('sendmsg');
	  var chat=$('#inputbox').val();
	  
	  if (chat == null || chat=='' || chat == undefined)
		  {
		  alert('消息不能为空');
		  return;
		  }
		  
	
	  /////////// 发出消息 server
	  console.log( getTime() );
	  $('#chattime').val( getTime() );
	  
	  var params = $('#msgSendForm').serialize();
	  console.log( '#msgSendForm:' +params );
	  
	  sendmsgAjax( ctx, params );
	  // 发出消息后，延时获取最新的消息列表
	  setTimeout("receiveMsg(ctx, $('#msgtoid').val(),$('#msgtoname').val() )", 200 );
	  
	  // 清空消息框
	  $('#inputbox').val('');
	  //css
	  
	 }
  	
  	
  	