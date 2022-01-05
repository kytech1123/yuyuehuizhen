///////////////////////// function
 	function addFriendAjax(ctx, form_data){
		
		var serverURL=ctx+"/msg_addfriend.do?"+ form_data;
        
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
  	function addfriend(params){
  		
	
	  /////////// 发出消息 server
	  console.log( getTime() );
	  console.log( params );
//	  http://localhost:8080/boke/msg/chatmsg.jsp?msgtoid=1&msgtoname=%E6%A2%81%E6%B3%BD%E5%8D%97
	  
	  data=params.substr( params.indexOf('?')+1,params.length );
	  console.log( data );
	  addFriendAjax( ctx, data );
	  
	  
	 }
  	//////////////////////////////////////////////////////////// 
  	// 2021.12.13 接收好友列表
	// 设置消息内容CSS
	function freshCSS(){
	 
			
	}
	
	///////////////////////////////
	function view_friend_item( oneFriend)
	{
		var msgdiv="<div class='friend_list_v_item' >" 
			+"<div class='v_left'>"
			+"<a href='chatmsg.jsp?msgtoid="+ oneFriend[ 'friendid' ]
			+"&msgtoname="+oneFriend[ 'friendname' ]
			+"' ><img class='index_icon' src='"+ctx+"/images/msg/"
			+ find_face(oneFriend[ 'friendid' ] ) +"'></a></div>"
			+"<div class='v_name'>"+ oneFriend[ 'friendname' ]
			+"</div><div class='v_right' >"
			+ ''
			+"</div></div>";
		
		var seprator_div='<div style= "clear:both" ></div>';
			
		$('#div_friendlist').append(msgdiv);
		$('#div_friendlist').append(seprator_div);
	}
	function view_friend_list(arr)
	{
		if(arr == null || arr== '' || arr== undefined)
		{
			console.log('no view_friend list data');
			return;
		}
		arr= $.parseJSON( arr );
		console.log(arr.length );
		
		//初始化 列表VIEW
		$('#div_friendlist').empty();
		//
		for(var i=0,l=arr.length;i<l;i++){
			view_friend_item( arr[i]  );
		}
		// 刷新CSS
		freshCSS();
	}
	
//	msgtoid 消息的接收者
	function receiveFriendList(ctx,msgtoid,msgtoname)
	{
		var serverURL=ctx+"/msg_findfriend.do?msgtoid="+ msgtoid+"&msgtoname="+msgtoname;
        
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
                console.log('receiveMsg back:'+result);
                view_friend_list ( result );
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
	}
  	
  	