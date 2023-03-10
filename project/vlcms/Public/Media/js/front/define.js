Do.add('jquery', {
    path: '/static/home/??js/jquery/1.8.2/jquery.min.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('md5', {
    path: '/static/home/??js/plugin/md5.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('flash', {
    path: '/static/home/??js/core/flash.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('select', {
    path: '/static/home/??js/ui/select.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('pager', {
    path: '/static/home/??js/ui/pager.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('editor', {
    path: '/static/home/??js/plugin/upyun-ueditor/ueditor.config.js,js/plugin/upyun-ueditor/ueditor.all.js' + Do.getConfig('js_version'), 
    type:'js',
    requires: ['/static/home/??js/tool/CryptoJS/hmac-sha1.js' + Do.getConfig('js_version'), '/static/home/??js/tool/CryptoJS/aes.js' + Do.getConfig('js_version')]
});
Do.add('tabs', {
    path: '/static/home/??js/ui/tabs.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('photowall', {
    path: '/static/home/??js/plugin/jquery-photowall.js', 
    type:'js'
});
Do.add('imgareaselect', {
    path: '/static/home/??js/plugin/jquery.imgareaselect.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('plupload', {
    path: '/static/home/??js/plugin/plupload/plupload.js,js/plugin/plupload/plupload.flash.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('swfupload', {
    path: '/static/home/??js/plugin/swfupload/swfupload.js,js/plugin/swfupload/swfupload.queue.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('uploader', {
    path: '/static/home/??js/plugin/uploader/uploader.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('scroll', {
    path: '/static/home/??js/plugin/jquery.jscrollpane.js' + Do.getConfig('js_version'), 
    type:'js',
    requires: ['mousewheel']
});
Do.add('mousewheel', {
    path: '/static/home/??js/plugin/jquery.mousewheel.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('areaselector', {
    path: '/static/home/??js/plugin/areaselector.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('dateselector', {
    path: '/static/home/??js/plugin/dateselector.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('datalazyload', {
    path: '/static/home/??js/plugin/datalazyload.js' + Do.getConfig('js_version'), 
    type:'js',
    requires: ['scrollstop']
});
Do.add('scrollstop', {
    path: '/static/home/??js/plugin/jquery.scrollstop.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('jquery-ui', {
    path: '/static/home/??js/jquery-ui/1.10.2/jquery-ui.min.js' + Do.getConfig('js_version'), 
    type:'js',
    requires: ['/static/css/redmond/??jquery-ui-1.10.2.custom.css' + Do.getConfig('css_version')]
});
Do.add('autocomplete', {
    path: '/static/home/??js/plugin/jquery.autocomplete.js' + Do.getConfig('js_version'), 
    type:'js',
    requires: ['jquery-ui']
});
Do.add('tagchange', {
    path: '/static/home/??js/plugin/tag-it.js' + Do.getConfig('js_version'), 
    type:'js',
    requires: ['jquery-ui','autocomplete','/static/css/tag-it/??jquery.tagit.css' + Do.getConfig('css_version')]
});
Do.add('animatecolors', {
    path: '/static/home/??js/plugin/jquery.animate-colors.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('tooltips', {
    path: '/static/home/??js/plugin/jquery.tips.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('jquery.ui.map', {
    path: '/static/home/??js/plugin/jquery.ui.map.full.min.js' + Do.getConfig('js_version'), 
    type:'js',
    requires: ['jquery-ui']
});
Do.add('taffy', {
    path: '/static/home/??js/tool/taffy.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('copy', {
    path: '/static/home/??js/plugin/ZeroClipboard.js' + Do.getConfig('js_version'),
    type:'js'
});
Do.add('waypoints',{
    path: '/static/home/??js/plugin/waypoints.js' + Do.getConfig('js_version'),
    type:'js'
});
Do.add('waypoints-sticky',{
    path: '/static/home/??js/plugin/waypoints-sticky.js' + Do.getConfig('js_version'),
    type:'js',
    requires: ['waypoints']
});
Do.add('datepicker',{
    path: '/static/home/??js/plugin/jquery.datepicker.js' + Do.getConfig('js_version'), 
    type:'js',
    requires: ['jquery-ui'],
    init: function(){
        $.datepicker.regional['zh-CN'] = {
            closeText: '??????',
            prevText: '&#x3c;??????',
            nextText: '??????&#x3e;',
            currentText: '??????',
            monthNames: ['??????','??????','??????','??????','??????','??????',
            '??????','??????','??????','??????','?????????','?????????'],
            monthNamesShort:['1???','2???','3???','4???','5???','6???',
            '7???','8???','9???','10???','11???','12???'],
            dayNames: ['?????????','?????????','?????????','?????????','?????????','?????????','?????????'],
            dayNamesShort: ['??????','??????','??????','??????','??????','??????','??????'],
            dayNamesMin: ['???','???','???','???','???','???','???'],
            weekHeader: '???',
            dateFormat: 'yy-mm-dd',
            yearRange: "1950:2020",     // ???????????????????????????  
            firstDay: 0,
            isRTL: false,
            showOtherMonths: true,
            selectOtherMonths: true,
            changeYear: true,
            changeMonth: true,
            showMonthAfterYear: true, 
            showButtonPanel: true,          // ??????????????????  
            yearSuffix: ''};
        $.datepicker.setDefaults($.datepicker.regional['zh-CN']);
    }
});
Do.add('validator',{
    path:'/static/home/??js/plugin/validator.js' + Do.getConfig('js_version'), 
    type:'js', 
    init: function(){
       $.extend($.Tipmsg,{//??????????????????;
            tit:"",
            w:"????????????????????????",
            r:"",
            c:"?????????????????????",
            s:"??????????????????",
            v:"?????????????????????????????????????????????",
            p:"?????????????????????",
            err:"?????????????????????????????????????????????????????????????????????",
            abort:"Ajax??????????????????"
        });
        $.extend($.Datatype,{
            "date": /(\d{2}|\d{4})(?:\-)?([0]{1}\d{1}|[1]{1}[0-2]{1})(?:\-)?([0-2]{1}\d{1}|[3]{1}[0-1]{1})$/,
            "datetime": /(\d{2}|\d{4})(?:\-)?([0]{1}\d{1}|[1]{1}[0-2]{1})(?:\-)?([0-2]{1}\d{1}|[3]{1}[0-1]{1})(?:\s)?([0-1]{1}\d{1}|[2]{1}[0-3]{1})(?::)?([0-5]{1}\d{1})(?::)?([0-5]{1}\d{1})$/,
            "max": function(num,obj,curform){
                var max = obj.attr('max');
                if(obj.is(":checkbox,:radio")){
                    if(curform.find("input[name='"+ obj.attr('name') + "']:checked").length > max)
                        return "????????????" + max + "???";
                }else{
                    if(num > max)
                        return false;
                }
                return true;
            },
            "min": function(num,obj,curform){
                var min = obj.attr('min');
                if(obj.is(":checkbox,:radio")){
                    if(curform.find("input[name='"+ obj.attr('name') + "']:checked").length < min)
                        return "????????????" + min + "???";
                }else{
                    if(num < min)
                        return false;
                }
                return true;
            },
            "is_empty_json": function(gets,obj,curform,regxp){
                if($.parseJSON(gets) && $.parseJSON(gets).length > 0){
                    return true;
                }else{
                    return obj.attr('errormsg');
                }
            }   
        });
    }
});
Do.add('hsb', {
    path:'/static/home/??js/plugin/hsb.js' + Do.getConfig('js_version'), 
    type:'js',
    requires: ['/static/css/search/??hsb.css' + Do.getConfig('css_version')]
});
Do.add('emoji', {
    path:'/static/home/??js/plugin/emoji.js' + Do.getConfig('js_version'), 
    type:'js',
    requires: ['/static/css/emoji.css']
});
Do.add('rotate', {
    path:'/static/home/??js/plugin/jquery.rotate.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('autoTextarea', {
    path: '/static/home/??js/plugin/jquery.autoTextarea.js' + Do.getConfig('js_version'), 
    type:'js'
});
Do.add('droppable', {
    path: '/static/home/??js/plugin/jquery.ui.droppable.js' + Do.getConfig('js_version'), 
    type:'js',
    requires: ['jquery-ui','draggable']
});
Do.add('sortable', {
    path: '/static/home/??js/plugin/jquery.ui.sortable.js' + Do.getConfig('js_version'), 
    type:'js',
    requires: ['mouse']
});
Do.add('draggable', {
    path: '/static/home/??js/plugin/jquery.ui.draggable.js' + Do.getConfig('js_version'), 
    type:'js',
    requires: ['mouse']
});
Do.add('mouse', {
    path: '/static/home/??js/plugin/jquery.ui.mouse.js' + Do.getConfig('js_version'), 
    type:'js',
    requires: ['jquery-ui']
});
Do.add('full-page', {
    path: '/static/home/??js/plugin/jquery.fullPage.js' + Do.getConfig('js_version'), 
    type:'js',
    requires: ['jquery-ui','/static/css/plugin/??jquery.fullPage.css' + Do.getConfig('css_version')]
});