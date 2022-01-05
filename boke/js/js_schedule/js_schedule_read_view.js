/////////////////////// function
var scheduleDict={0:'-',1:'出诊', 2:'免打扰', 3:'已被约' };
// view
function freshCss() {
//		$('#schedule').css({ 'width':'100%'});
		$('#schedule').css({ 'border-collapse' :'collapse',
			'margin-left':'10px',
				'margin-top':'5px'
				});
		$('#schedule tr td').css({ 'border':'1px solid green'});
//		$('#schedule tr td').css({ 
//				'font-size':'17px',
//				'padding-left':'2px'
//				});
//		$('col1,col2,col3').css({ 'width':'100px'});
//		$('time').css({ 'width':'80px'});
		
		$("#schedule tr").find("td:eq(0)").css({ 'width': '60px' });
	}
	function addrow() {
		
	}
	///////////////////////////////////////////////////
	// 设置日期
	function SetDateView()
	{
		 date=new Date();
				 
		 var datestr;
		 $('.daterow').each(function(i, val){
			 	//console.log(i);
			 	datestr = addDate(date,i );
			 	//console.log( datestr );
				$(this).html( datestr.slice(5,10) );
			});
		 
		 var day;
		 day =	date.getDay();
		 $('.dayrow').each(function(i, val){
			 	console.log( getDayInt(day+i));			 	
				$(this).html( getDayInt(day+i) );
			});
	}
	// 给每个格子设置ID
	function SetGridId()
	{
		$('.itema1').each( function(i, val){
				x=i%6;			
				y=parseInt( i/6);
				this.id=y+'_'+x; //第几行，第几列
				//console.log( this.id);
			});
	}
////////////////////////////// read all
	
	var timer;
	var m;
	function readall()
	{
		m=0;
		timer=setInterval("readSchedule(m);check();",	150);
	}
	function check()
	{
		m++;
		if( m>=7) 
		{
			window.clearInterval(timer);
		}
	}
	function readSchedule(index_date_view)
	{
// 		date=getTime();
// 		 date=date.slice(0, 10); //获取日期
		 sendscheduleFindAjax(ctx, 
				 'userid='+$('#ssuserid').val()+'&scheduledate=2021-'+ $('#datecol'+index_date_view ).html(),
				 index_date_view);
	}
	function updatechedule()
	{
		var index_date_view = parseInt( $.MsgBox.param.slice(-1) );	//y_x 第几行 第几列
		 readSchedule(index_date_view );
	}
////////////////////////////// read: view update
//////////////////show view /////////////
function showschedule( data, col){
	var obj = JSON.parse(data); //由JSON字符串转换为JSON对象
	if(obj.length == 0)
	{
		console.log("data empty");
		return;
	}
		
	var str= obj[0].timeconfig; //1000000000
	console.log('--showschedule '+str);
	for(k=0;k< str.length; k++)
	{
		$("#"+k+"_"+col).html( scheduleDict[str[k]]);
	}
	
}
//////////////////////////////// read
function sendscheduleFindAjax(ctx, data, col){
		
		var serverURL=ctx+"/schedule_find.do?"+ data;
        
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
                showschedule( result, col);
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
	}