///////////////////////// function
 	function sendHisAjax(ctx,url){
		
		var serverURL=ctx+"/his.jsp?back="+ url;
        
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
	
///////////////////////// function
 	function findHisAjax(ctx, callback){
		
		var serverURL=ctx+"/his.jsp?act=find";
        
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
//            server back:{"hisFind":"me.jsp"}
//            session_his.js:50 findHisAjax -- json:[object Object]
            success : function(result) {
                result= result.trim();
            	console.log('server back:'+result);
            	obj= JSON.parse(result);
            	console.log('findHisAjax -- json:'+obj);
            	
            	if(obj['hisFind'] == null || obj['hisFind'] == '' || obj['hisFind'] == 'null'
            		|| obj['hisFind'] == undefined )
            		obj['hisFind']= 'index.jsp';
            		
            	if (typeof (callback) == 'function') {
                    callback(obj['hisFind']);
                }
                return obj['hisFind'];
            },
            //请求失败，包含具体的错误信息
            error : function(e){
                console.log(e.status);
                console.log(e.responseText);
            }
        });
	}
	
  	
  	
  	