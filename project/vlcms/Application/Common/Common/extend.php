<?php
/**
 * 后台公共文件扩展
 * 主要定义后台公共函数库
 */



/**
 * 获取对应游戏类型的文字信息
 * @param int $type
 * @return string 状态文字 ，false 未获取到
 * @author 王贺
 */
function get_game_type($type = null){
    if(!isset($type)){
        return false;
    }
    $cl = M("Classification","tab_")->where("status=1 and id=$type")->limit(1)->select();
    return $cl[0]['name'];
}

function get_game_recommend($type){
    if(!isset($type)){
        return false;
    }
    switch ($type){
        case 0  : return    '不推荐'; break;
        case 1  : return    '推荐'; break;
        case 2  : return    '热门'; break;
        case 3  : return    '最新'; break;
        default : return    false;  break;
    }
}


function get_links_list($type=1){
    $map['status'] = 1;
    $map['type'] = $type;
    $model = M('Links','tab_');
    $data = $model->where($map)->select();
    return $data;
}

/**
*检查链接地址是否有效
*/
function varify_url($url){  
    $check = @fopen($url,"r");  
    if($check){  
     $status = true;  
    }else{  
     $status = false;  
    }    
    return $status;  
}  

//这个星期的星期一  
// @$timestamp ，某个星期的某一个时间戳，默认为当前时间  
// @is_return_timestamp ,是否返回时间戳，否则返回时间格式  
function this_monday($timestamp=0,$is_return_timestamp=true){
    static $cache ;  
    $id = $timestamp.$is_return_timestamp;  
    if(!isset($cache[$id])){  
        if(!$timestamp) $timestamp = time();  
        $monday_date = date('Y-m-d', $timestamp-86400*date('w',$timestamp)+(date('w',$timestamp)>0?86400:-/*6*86400*/518400));  
        if($is_return_timestamp){  
            $cache[$id] = strtotime($monday_date);  
        }else{  
            $cache[$id] = $monday_date;  
        }  
    }  
    return $cache[$id];  
  
}  
  
//这个星期的星期天  
// @$timestamp ，某个星期的某一个时间戳，默认为当前时间  
// @is_return_timestamp ,是否返回时间戳，否则返回时间格式  
function this_sunday($timestamp=0,$is_return_timestamp=true){
    static $cache ;  
    $id = $timestamp.$is_return_timestamp;  
    if(!isset($cache[$id])){  
        if(!$timestamp) $timestamp = time();  
        $sunday = this_monday($timestamp) + /*6*86400*/518400;  
        if($is_return_timestamp){  
            $cache[$id] = $sunday;  
        }else{
            $cache[$id] = date('Y-m-d 23:59:59',$sunday);  
        }  
    }  
    return $cache[$id];  
}

/**
*获取时间范围
*@param  $field string 查询字段
*@param  $type  string 时间范围类型
*@return array
*/
function get_period($field,$type){
    $start_time =0;$end_time=0;$map = array();
    switch ($type) {
        case 'yesterday'://昨天的开始结束时间
            $start_time = mktime(0,0,0,date('m'),date('d')-1,date('Y'));
            $end_time   = mktime(0,0,0,date('m'),date('d'),date('Y'))-1;
            break;
        case 'today'://今天的开始结束时间
            $start_time = mktime(0,0,0,date('m'),date('d'),date('Y'));
            $end_time   = mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
            break;
        case 'last_week'://上周的开始结束时间
            $start_time = mktime(0,0,0,date('m'),date('d')-date('w')+1-7,date('Y'));
            $end_time   = mktime(23,59,59,date('m'),date('d')-date('w')+7-7,date('Y'));
            break;
        case 'this_week'://***本周的开始结束时间
            $start_time = this_monday();
            $end_time   = this_sunday();
            break;
        case 'last_moenth'://上月的开始结束时间
            $start_time = mktime(0, 0 , 0,date("m")-1,1,date("Y"));
            $end_time   = mktime(23,59,59,date("m") ,0,date("Y"));
            break;
        case 'this_mneth'://本月的开始结束时间
            $start_time = mktime(0,0,0,date('m'),1,date('Y'));
            $end_time   = mktime(23,59,59,date('m'),date('t'),date('Y'));
            break;
        default:
            $start_time = mktime(0,0,0,date('m'),date('d'),date('Y'));
            $end_time   = mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
            break;
    }

    $map[$field] = array("BETWEEN",array($start_time,$end_time));
    
    return $map;
}