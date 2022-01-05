	// 设置消息内容CSS
	function freshCSS_private(){
		
		console.log('---- freshCSS_private');
		
		$('.msg_list_p2').css({
			  "float":"left",
			  "font-size":"18px",
			  "padding":"5px",
			  "border":"2px solid green", 
			  "border-radius" :"5px" 		  
			  });
		  
		  $('.msg_list_p2').each(function(){
			  var t=$(this).css('width');
			  var w= parseInt( t.replace(/px/, '')); 
			  console.log(  t+',' + w);
			  if( w >240)
				  $(this).css('width', '240px');
		  });
		  
		  // 设置当前用户的绿色消息CSS
		  $('.p1_name').text(function(n,origintext){
				console.log(n+","+ origintext);
				
				if( origintext == $('#msgfromname').val() )
				{
					$(this).prev().removeClass("p1");
					$(this).prev().addClass("p1_me");
					$(this).next().removeClass("msg_list_p2");
					$(this).next().addClass("content_me");
					$(this).removeClass("p1_name");
					$(this).addClass("p1_name_me");
				}
			});
			
			//////////////////
			var _width = document.documentElement.clientWidth;  //屏幕宽
			var w= _width - $('.index_icon').width()-30;
			console.log(' //////'+ $('.index_icon').width()+'///// fresh '+w);
			$('.p1_name_me').css({"width": w+"px" });//用宽度占位
			$('.p1_name_me').css({"text-align": "right" });
			$('.p1_name_me').css({"float": "right" });
			$('.p1_me').css({"float": "right" });
			$('.content_me').css({"float": "right" });
			
	}
	
	///////////////////////////////
	function view_msgItem( fromid, fromname,content, chattime)
	{
		var msgdiv="<div class='msg_list_item' >" 
			+"<div class='p1'><img class='index_icon' src='"+ctx+"/images/msg/"
			+ find_face(fromid) +"'></div>"
			+"<div class='p1_name'>"+ fromname
			+"</div><div class='msg_list_p2' >"
			+ content
			+"</div></div>";
	  $('#msg_list').append(msgdiv);
	}
	function view_msglist(arr)
	{
		if(arr == null || arr== '' || arr== undefined)
		{
			console.log('no view_msglist data');
			return;
		}
		arr= $.parseJSON( arr );
		console.log(arr.length );
		
		//初始化消息列表VIEW
		$('#msg_list').empty();
		//
		for(var i=0,l=arr.length;i<l;i++){
			view_msgItem( arr[i]['msgfromid'], arr[i]['msgfromname'],
					arr[i]['content'] ,arr[i]['chattime'] );
		}
		
		// 刷新CSS
		freshCSS_private();
	}
	function receiveMsg(ctx,msgtoid,msgtoname)
	{
		var serverURL=ctx+"/msg_findmsgprivate.do?msgtoid="+ msgtoid+"&msgtoname="+msgtoname;
        
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
                view_msglist ( result );
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
	}
	
// 	$(function(){
// 		
// 		//启动定时刷新
// 		 setInterval(function(){ 
// 			receiveMsg(ctx, $('#msgtoid').val(),$('#msgtoname').val()  );
// 			}, 6000);
// 	});