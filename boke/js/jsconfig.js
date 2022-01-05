var ctx='/boke';

var buginfo=[0,0,1];
function infolog(obj,n)
{
	if( buginfo[n] == 1)
		console.log(obj);
}

//console.log('load..');
//console.log(infolog);
//// alert('123');

function access_check_chatfriend(usertype)
{
	console.log(usertype);
	if(usertype != 'assistant')
	{
		$('#myhelpMenu').hide();
		$('#myhelpDiv').hide();
	}
	else
	{
		$('#myhelpMenu').show();
		$('#myhelpDiv').show();
	}
}

function access_check(usertype, page)
{
	if( page == 'chatfriend.jsp')
	{
		access_check_chatfriend(usertype);
	}
}