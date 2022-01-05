    var imgWidth = $('.slider li img:eq(0)').width();
    var curIndex = 0;
    var imgLen = $(".slider li").length;
    
    var body_w=document.body.clientWidth;
    console.log("info "+body_w);
    console.log("info document "+document.body.clientHeight);
    
    $(".wrapper").width(body_w);
    $(".slider li img").width(body_w);
    $(".slider").width(body_w*imgLen);

    var autoChange = setInterval(function () {
        if(curIndex<imgLen-1){
            curIndex++;
        }else {
            curIndex = 0;
        }
        changeTo(curIndex);
    },2000);

    $(".left").hover(function(){
        clearInterval(autoChange);
    },function () {
        autoChangeAgain();
    })

    $(".left").click(function () {
        curIndex=(curIndex>0)?(--curIndex):(imgLen-1);
        changeTo(curIndex);
    });

    $(".right").hover(function(){
        clearInterval(autoChange);
    },function () {
        autoChangeAgain();
    })

    $(".right").click(function () {
        curIndex=(curIndex<imgLen-1)?(++curIndex):0;
        changeTo(curIndex);
    });

    function changeTo(num) {
    	
        var goLeft = num*body_w;
        
        $(".slider").animate({left:'-'+goLeft+'px'},"slow");
        $(".pagination-wrap").find('li').removeClass('active').eq(num).addClass('active');
    }

    function autoChangeAgain() {
        autoChange = setInterval(function () {
            if(curIndex<imgLen-1){
                curIndex++;
            }else {
                curIndex = 0;
            }
            changeTo(curIndex);
        },2500);
    }

    $(".pagination-wrap").find('li').each(function (item) {
        $(this).hover(function () {
            clearInterval(autoChange);
            changeTo(item);
            curIndex = item;
        },function () {
            autoChangeAgain();
        })
    })
