//////////////// 2021.10.12 一次会诊群聊的聊天对象列表
	var ctx_tmp=ctx;
	function viewitemRole(doctor_name, role, assistant_name, 
			doctor_id, assistant_id ,meetid)
	{
		var msgtarget="chatmsg.jsp?appointmentId=" +meetid;
		var strdiv="<div class='onerole'>";
		
		var doctor="<div>" 
			+"<a href='"+msgtarget+"&msgtoid="+ doctor_id+"&msgtoname="+ doctor_name +"'>"
			+"<img class='index_icon' src='"+ ctx_tmp+"/images/msg/user_doctor.png'></a><br>"
				+doctor_name
				+"</div>";
				
		var help=  assistant_name == ''? 
				"<a href='"+msgtarget+"&msgtoid="+ assistant_id +"&msgtoname="+ "syshelp" +"'>"
				+"<img class='index_icon' src='"+ ctx_tmp+"/images/msg/helpwait.png'></a><br>"+'暂无医助'
				:
					"<a href='"+msgtarget+"&msgtoid="+ assistant_id +"&msgtoname="+  assistant_name +"'>"
					+"<img class='index_icon' src='"+ ctx_tmp+"/images/msg/user_help.png'></a><br>"+assistant_name;
		
		help = "<div>"+help+"</div>";
				
		strdiv += doctor +help+ "</div>";
		
		if( role == '汇报人')
			$('#friend_start').append( strdiv);
		else
			$('#friend_receive').append( strdiv );
		
		///////////////////////////////
		$('#friend_start div').css({'float' : 'left'});
		$('#friend_start').css({'clear' : 'both'});
		$('#friend_receive div').css({'float' : 'left'});
		$('#friend_receive').css({'float' : 'none'});
		$('#friend_receive').css({'clear' : 'both'});
		$('.index_icon').css({
			'width' : '50px',
			'height' : '50px',
			});
		$('.onerole').css({
			'margin' : '10px',
			});
		
	}
	function viewresult(arr)
	{
		var str_start='';
		var str_receive='';
		var help;
		console.log(arr.length );

		if(arr == null || arr== '' || arr== undefined)
		{
			console.log('no data');
			return;
		}
		arr= $.parseJSON( arr );
		console.log(arr.length );
		for(var i=0,l=arr.length;i<l;i++){
			
			console.log(arr[i]['userName'] );
			// 不参加的专家不显示
			if(  arr[i]['remarks'] == '已拒绝' )
				continue;
			
			viewitemRole( arr[i]['userName'], arr[i]['userRole'],
						arr[i]['assistantName'] ,
						arr[i]['userId'], arr[i]['assistantId'],
						$('#appointmentId').val() );
				
		} // end for
	}

	function getFriend(ctx, meetid)
	{
		var serverURL=ctx+"/msg_friendlist.do?appointmentId="+meetid;
		ctx_tmp =ctx;
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
                console.log('success'+result);
                viewresult(result);
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
	}
	
	