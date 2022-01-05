    var imgWidth = $('.slider li img:eq(0)').width();
    var curIndex = 0;
    var imgLen = $(".slider li").length;
    
    console.log("info: "+imgWidth+","+ curIndex+ ","+ imgLen);
    
    $(".wrapper").width(imgWidth);
    $(".slider").width(imgWidth*imgLen);

    var autoChange = setInterval(function () {
        if(curIndex<imgLen-1){
            curIndex++;
        }else {
            curIndex = 0;
        }
        changeTo(curIndex);
    },2000);

    

    $(".left").click(function () {
        curIndex=(curIndex>0)?(--curIndex):(imgLen-1);
        changeTo(curIndex);
    });

    $(".right").click(function () {
        curIndex=(curIndex<imgLen-1)?(++curIndex):0;
        changeTo(curIndex);
    });

    function changeTo(num) {
        var goLeft = num*imgWidth;
        $(".slider").animate({left:'-'+goLeft+'px'},0);
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
