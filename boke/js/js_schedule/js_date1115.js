
// https://www.cnblogs.com/gmq-sh/p/5194706.html
//日期，在原有日期基础上，增加days天数，默认增加1天
function addDate(date, days) {
//    if (days == undefined || days == '') {
//    	console.log(days+'-- addDate');
//        days = 1;
//    }
    if(days != 0)
    {
    	var date = new Date(date);
    	date.setDate(date.getDate() + days);
    }
    var month = date.getMonth() + 1;
    var day = date.getDate();
    return date.getFullYear() + '-' + getFormatDate(month) + '-' + getFormatDate(day);
}

// 日期月份/天的显示，如果是1位数，则在前面加上'0'
function getFormatDate(arg) {
    if (arg == undefined || arg == '') {
        return '';
    }

    var re = arg + '';
    if (re.length < 2) {
        re = '0' + re;
    }

    return re;
}

// https://www.cnblogs.com/jichi/p/11313085.html
function getDayInt(days)
{
	if(days>6)
	{
		days = days %7;
	}
	switch(days) {
    case 1:
          days = '周一';
          break;
    case 2:
          days = '周二';
          break;
    case 3:
          days = '周三';
          break;
    case 4:
          days = '周四';
          break;
    case 5:
          days = '周五';
          break;
    case 6:
          days = '周六';
          break;
    case 0:
          days = '周日';
          break;
	}

	//var str = year + "年" + month + "月" + day + "日  " + days;
	var str = days;
	return str;
}
function getDay(myDate) {
   var days = myDate.getDay();
   return  getDayInt(days);
}
