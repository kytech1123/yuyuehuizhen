  var arr = [{
        id: 0,
        name: "techang",
        title: "特长",
        data: [{
            value: "001",
            displayVaule: "神经内科"
        }, {
            value: "002",
            displayVaule: "心内科"
        }, {
            value: "003",
            displayVaule: "肾内科"
        }, {
            value: "004",
            displayVaule: "呼吸科"
        }, {
            value: "005",
            displayVaule: "精神科"
        }, {
            value: "006",
            displayVaule: "消化科"
        },
        {
            value: "007",
            displayVaule: "血液科"
        },
        {
            value: "008",
            displayVaule: "内分泌科"
        }

        ]
    }, {
        id: 1,
        name: "aichi",
        title: "爱吃",
        data: [{
            value: "001",
            displayVaule: "红烧肉"
        }, {
            value: "002",
            displayVaule: "腌笃鲜"
        }]
    }, {
        id: 2,
        name: "jingdian",
        title: "景点",
        data: [{
            value: "001",
            displayVaule: "故宫"
        }, {
            value: "002",
            displayVaule: "长城"
        }, {
            value: "003",
            displayVaule: "景山公园"
        }]
    }]
    var current = 0;
    var checkboxWrap = [];
    var zhi = []; //选中弹框的值
    function setPage() {
        var tempPd = [];
        for (var i = 0; i < arr.length; i++) {
            var _title = arr[i].title;
            var _data = arr[i].data;
            var _name = arr[i].name;
            var liHTML = [];
            zhi[i] = zhi[i] || [];
            for (var j = 0; j < zhi[i].length; j++) {
                liHTML.push('<li class="li-item">' + zhi[i][j] + '</li>')
            }
            tempPd.push('<div class="div-item">' +
                '<span class="label">' + _title + ':</span>' +
                '<ul class="zhi-ul">' + liHTML.join("") +
                '<li class="last"><a href="javascript:;" class="choose" onclick="choose(this,' + i + ')">' + (zhi[i].length > 0 ? '重新选择' : '选择') + '</a></li>' +
                '</ul>' +
                '</div>')
			
        }
        $('.wrapper').html(tempPd.join(""));
        
        console.log(' setPage '+zhi[0]);
        console.log(' setPage '+ $('.wrapper').html() );

//      officeId 文本框组件 
		$('#officeId').val( zhi[0].join(","));
    }
    //setPage();
    /**
     * [sureBtn 点击弹框的确定事件]
     * @return {[type]} [description]
     */
    function sureBtn() {
        zhi[current] = [];
        var $checked = $('.checkboxwrapper input[type=radio]:checked');
        var chsLength = $checked.length;
        
        console.log(' sureBtn '+chsLength );
        for (var i = 0; i < chsLength; i++) {
            zhi[current].push($checked.eq(i).next().text()  );
        }
        $('.layouts').hide();
        
        console.log(' sureBtn '+zhi[0]);
        setPage();
    }
    //点击取消事件
    $('body').on('click', '.a-btn-02', function() {
        $('.layouts').hide();
    })

    /**
     * [choose 点击选择弹出弹框]
     * @param  {[type]} obj   [点击的 选择元素]
     * @param  {[type]} index [‘选择’在页面类别序列]
     * @return {[type]}       [description]
     */
    function choose(obj, index) {
        current = index;
        checkboxWrap = [];
        $('.layouts').show();
        var layoutTitle = $(obj).parents('.div-item').find('.label').text();
		
		console.log('--'+layoutTitle );
        $('.title').text(layoutTitle.substring(0, layoutTitle.length - 1))
        setDialog(index);
    }

    /**
     * [setDialog 弹框里面的checkbox和页面上的数据匹配  并给checked状态]
     * @param {[type]} index [页面类别序列]
     */
    function setDialog(index) {
        zhi[index] = zhi[index] || [];
        var checkboxWrap = [],
            data = arr[index],
            _title = data.title,
            _data = data.data,
            _name = data.name;
        for (var j = 0; j < _data.length; j++) {
            var flag = zhi[index].indexOf(_data[j].displayVaule) > -1; //精华
            checkboxWrap.push('<input class="majoritem" type="radio" ' + (flag ? "checked" : null) + ' name="' + _name + '" value="' + _data[j].value + '"/><span>' + _data[j].displayVaule + '</span>')
        }
        $('.checkboxwrapper').html(checkboxWrap.join(""));
        
        /////////////////
        $('.checkboxwrapper').css({'width': '300px'});
        $('.majoritem').css({'width': '60px'});
    }