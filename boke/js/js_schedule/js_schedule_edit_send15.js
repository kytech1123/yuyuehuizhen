/////////////////////// function
 	function sendscheduleEditAjax(ctx, data){
		
		var serverURL=ctx+"/schedule_edit.do?"+ data;
        
        console.log(serverURL );
        //////////////////////////////
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
                console.log('server back:'+result);
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
	}
	
	/////////////////////////////////// 发送消息
  	function sendschedule(ctx, params){
	  console.log('sendmsg schedule edit' );
	 
	  
	  sendscheduleEditAjax( ctx, params );
	  // 发出消息后，延时获取最新的消息列表
	  //setTimeout("receiveMsg(ctx, $('#msgtoid').val(),$('#msgtoname').val() )", 200 );
	  

	  //css
	  
	 }
  	
  	
  	