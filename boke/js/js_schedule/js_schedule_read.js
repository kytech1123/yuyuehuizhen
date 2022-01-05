/////////////////////// function
var scheduleDict={0:'-',1:'出诊', 2:'免打扰'};
// view
function freshCss() {
//		$('#schedule').css({ 'width':'100%'});
//		$('#schedule').css({ 'border-collapse' :'collapse',
//			'margin':'3px'});
//		$('#schedule tr td').css({ 'border':'1px solid green'});
//		$('#schedule tr td').css({ 
//				'font-size':'17px',
//				'padding-left':'2px'
//				});
//		
////		$('col1,col2,col3').css({ 'width':'100px'});
////		$('time').css({ 'width':'80px'});
//		
//		$("#schedule tr").find("td:eq(0)").css({ 'width': '80px' });
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
// read
function showschedule( data){
	var obj = JSON.parse(data); //由JSON字符串转换为JSON对象
	if(obj.length == 0)
	{
		console.log("data empty");
		return;
	}
		
	var col=0;
	var str= obj[col].timeconfig; //1000000000
	
	for(k=0;k< str.length; k++)
	{
		$("#"+k+"_"+col).html( scheduleDict[str[k]]);
	}
	
}
		function sendscheduleFindAjax(ctx, data){
		
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
                showschedule( result);
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
	}