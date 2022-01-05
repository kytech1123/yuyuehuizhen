//////////////////////////////////////////////////
 function viewitemRole_MyStart(id, title, applyTime  )
 {
	 // href='chatmsgTeam.jsp?appointmentId=${param.appointmentId}&chatroom=${param.appointmentId}
	 var msgtarget="chatmsgTeam.jsp?appointmentId=" +id;
		var strdiv=$('#mystartDivTemp').html();
		
		var textinfo= '编号 '+  id.slice(-10) +'<br>'+
		'主题 '+title+ '<br>时间 ' + transTime(applyTime);
		
		strdiv = strdiv.replace("dd3", textinfo );
		strdiv = strdiv.replace("dd1", id );
		strdiv = strdiv.replace("dd2", id );
		
		$('#mystartDiv').append(strdiv);
		
 }
 function viewresult_MyStart(arr)
 {
	 console.log('viewresult_MyStart' );
	 console.log(arr.length );

		if(arr == null || arr== '' || arr== undefined)
		{
			console.log('no data');
			return;
		}
		arr= $.parseJSON( arr );
		console.log(arr.length );
		
		// CSS初始化
		
		//
		for(var i=0,l=arr.length;i<l;i++){
			
			console.log(arr[i]['id'] );
			
			viewitemRole_MyStart( arr[i]['id'], arr[i]['title'],
						arr[i]['applyTime']  );
				
		} // end for
		
		$('#mystartDiv').append("<br><br><br>");
		//CSS
		$('.p1').css({ "float":"left" });
		$('.p1').css({ "margin":"5px" });
		$('.p2').css({ "margin":"5px" });
		$('.p2').css({ "float":"left" });
		$('.datalist_item').css({ "clear":"both" });
		$('.datalist_item').css({ "padding":"5px" });
		$('.datalist_item').css({ "border-top":"2px dashed green" });
		
 }
 
 function getMyStart(ctx )
	{
		var serverURL=ctx+"/meet_findalljson.do";
     
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
             console.log('getMyStart' );
             //console.log('success'+result);
             
             viewresult_MyStart(result);
         },
         //请求失败，包含具体的错误信息
         error : function(e){
             console.log(e.status);
             console.log(e.responseText);
         }
     });
	}