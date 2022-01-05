/*
  $.MsgBox.param = this.id;  	//哪个格子被点击
		 $.MsgBox.ret_val='err_ret';
		 r= $.MsgBox.ConfirmBtn3("设置时间段", "1.出诊;2.免打扰。点击右上角关闭", '1-出诊','2-免打扰','3-清除', test );
		
 */
(function () {
	
	// 弹出框

    $.MsgBox = {
    	
    	ret_val: '',
    	param : '',
    	
        Alert: function (title, msg) {
            GenerateHtml("alert", title, msg);
            btnOk();  //alert只是弹出消息，因此没必要用到回调函数callback
            btnNo();
        },
        Confirm: function (title, msg, callback) {
            GenerateHtml("confirm", title, msg);
            btnOk(callback );
            btnNo(callback );
            return $.MsgBox.ret_val;
        },
        
        ConfirmBtn: function (title, msg, btn1,btn2,callback) {
        	console.log('///////////////ConfirmBtn-1');
        	GenerateHtmltitle("confirm", title, msg, btn1,btn2);
            btnOk(callback);
            btnNo(callback);
            console.log('///////////////ConfirmBtn-2');
            return $.MsgBox.ret_val;            
        },
        
        ConfirmBtn3: function (title, msg, btn1,btn2,btn3, callback) {
        	console.log('///////////////ConfirmBtn-1');
        	GenerateHtmltitle3("confirm3btn", title, msg, btn1,btn2,btn3);
            btnOk(callback);
            btnNo(callback);
            btnNo3btn(callback);
            console.log('///////////////ConfirmBtn-2');
            return $.MsgBox.ret_val;            
        }
    };
    
    
    //生成Html
    var GenerateHtmltitle3 = function (type, title,  msg,t1,t2 ,t3) {
        var _html = "";
        _html += '<div id="mb_box"></div><div id="mb_con"><span id="mb_tit">' + title + '</span>';
        _html += '<a id="mb_ico">x</a><div id="mb_msg">' + msg + '</div><div id="mb_btnbox">';
        if (type == "alert") {
            _html += '<input id="mb_btn_ok" type="button" value="确定" />';
        }
        if (type == "confirm3btn") {
            _html += '<input id="mb_btn_ok" type="button" value="'+ t1+'" />';
            _html += '<input id="mb_btn_no" type="button" value="'+ t2 +'" />';
            _html += '<input id="mb_btn_no3btn" type="button" value="'+ t3 +'" />';
        }
        _html += '</div></div>';
        //必须先将_html添加到body，再设置Css样式
        $("body").append(_html); 
        //生成Css
         GenerateCss();
    };
    
    var GenerateHtmltitle = function (type, title,  msg,t1,t2 ) {
        var _html = "";
        _html += '<div id="mb_box"></div><div id="mb_con"><span id="mb_tit">' + title + '</span>';
        _html += '<a id="mb_ico">x</a><div id="mb_msg">' + msg + '</div><div id="mb_btnbox">';
        if (type == "alert") {
            _html += '<input id="mb_btn_ok" type="button" value="确定" />';
        }
        if (type == "confirm") {
            _html += '<input id="mb_btn_ok" type="button" value="'+ t1+'" />';
            _html += '<input id="mb_btn_no" type="button" value="'+ t2 +'" />';
        }
        _html += '</div></div>';
        //必须先将_html添加到body，再设置Css样式
        $("body").append(_html); 
        //生成Css
         GenerateCss();
    };
 
    var GenerateHtml = function (type, title, msg) {
    	GenerateHtmltitle(type, title, msg,'确定', '取消');
    };
    //生成Css
    var GenerateCss = function () {
        $("#mb_box").css({ width: '100%', height: '100%', zIndex: '99999', position: 'fixed',
            filter: 'Alpha(opacity=60)', 
            backgroundColor: 'black', top: '0', left: '0', opacity: '0.6'
        });
        $("#mb_con").css({ zIndex: '999999', width: '400px', position: 'fixed',
            backgroundColor: 'White', borderRadius: '15px'
        });
        $("#mb_tit").css({ display: 'block', fontSize: '20px', color: '#444', padding: '10px 15px',
            backgroundColor: '#DDD', borderRadius: '15px 15px 0 0',
            borderBottom: '3px solid #009BFE', fontWeight: 'bold'
        });
        $("#mb_msg").css({ padding: '20px', lineHeight: '24px',
            borderBottom: '1px dashed #DDD', fontSize: '20px'
        });
        $("#mb_ico").css({ display: 'block', position: 'absolute', right: '10px', top: '9px',
            border: '1px solid Gray', width: '18px', height: '18px', textAlign: 'center',
            lineHeight: '16px', cursor: 'pointer', borderRadius: '12px', fontFamily: '微软雅黑'
        });
        $("#mb_btnbox").css({ margin: '15px 0 10px 0', textAlign: 'center' });
        
        $("#mb_btn_ok,#mb_btn_no,#mb_btn_no3btn").css({ width: '85px', 
        	height: '30px', color: 'white', border: 'none',
        		fontSize: '20px' });
        $("#mb_btn_ok").css({ backgroundColor: '#168bbb' });
        $("#mb_btn_no").css({ backgroundColor: 'gray', marginLeft: '20px' });
        $("#mb_btn_no3btn").css({ backgroundColor: 'gray', marginLeft: '20px' });
        
        
        //右上角关闭按钮hover样式
        $("#mb_ico").hover(function () {
            $(this).css({ backgroundColor: 'Red', color: 'White' });
        }, function () {
            $(this).css({ backgroundColor: '#DDD', color: 'black' });
        });
        
        var _widht = document.documentElement.clientWidth;  //屏幕宽
        var _height = document.documentElement.clientHeight; //屏幕高
        var boxWidth = $("#mb_con").width();
        var boxHeight = $("#mb_con").height();
        
        if(_height> 700)
        	_height=700;	// 避免网页过长
        //让提示框居中
        $("#mb_con").css({ top: (_height - boxHeight) / 2 + "px",
        	left: (_widht - boxWidth) / 2 + "px" });
        
        console.log('///////////////GenerateCss-2');
        
    };
    //确定按钮事件
    var btnOk = function ( callback) {
        $("#mb_btn_ok").click(function () {
            $("#mb_box,#mb_con").remove();
            
            console.log('ret_val:' + $.MsgBox.ret_val);
            $.MsgBox.ret_val='ok';
            
            if (typeof (callback) == 'function') {
                callback();
            }
        });
    };
    
    //取消按钮事件
    var btnNo = function ( callback ) {
        $("#mb_btn_no,#mb_ico").click(function () {
            $("#mb_box,#mb_con").remove();
            
            console.log('ret_val:' + $.MsgBox.ret_val);
            $.MsgBox.ret_val='cancel';
            
            if (typeof (callback) == 'function') {
                callback();
            }
        });
    };
    
    //按钮3事件
    var btnNo3btn = function ( callback ) {
    	$("#mb_btn_no3btn").click(function () {
    		$("#mb_box,#mb_con").remove();
    		
    		console.log('ret_val:' + $.MsgBox.ret_val);
    		$.MsgBox.ret_val='mb_btn_no3btn';
    		
    		if (typeof (callback) == 'function') {
    			callback();
    		}
    	});
    };
})();