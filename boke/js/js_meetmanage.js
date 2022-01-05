/*
 * 
 */
// param : $('#ssusertype').val()
function access_check_helpBtn( usertype )
{
	
	$('.view_assistantname').text(function(i,origText){
		var rowid= this.id;
	});

	//2021.9.25 添加医助 	如果有医助，隐藏链接
	$('.view_assistantname').text(function(i,origText){
		var rowid= this.id;
		//如果当前用户不是医助，不显示 协助TA
		console.log( usertype );
		if (  usertype == 'assistant'  )
		{
			$('#help'+rowid).show();						
		}
		else{
			$('#help'+rowid).hide();						
			
		}
		
		// 已经有医助，不显示“协助TA”按钮
		if( origText !=""&& origText!=null&& origText!=undefined )
		{
			$('#help'+rowid).hide();
		}
	});
}

// 如果当前用户是管理员、医助，显示“会议信息”的设置按钮
//param : $('#ssusertype').val()
function access_check_setMeetBtn( usertype )
{
	if (  usertype == 'admin' ||  usertype == 'assistant')
	{
		$('.btn_before_set').show();						
	}
	else{
		$('.btn_before_set' ).hide();						
		
	}
}
