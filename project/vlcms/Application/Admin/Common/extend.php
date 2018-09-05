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
// function get_game_type($type = null){
//     if(!isset($type)){
//         return false;
//     }
//     switch ($type){
//         case 1  : return    '网络游戏'; break;
//         case 2  : return    '体育竞速'; break;
//         case 3  : return    '角色扮演'; break;
//         case 4  : return    '飞行射击'; break;
//         case 5  : return    '策略经营'; break;
//         case 6  : return    '卡片棋牌'; break;
//         case 7  : return    '动作冒险'; break;
//         case 8  : return    '单机游戏'; break;
//         case 9  : return    '棋牌天地'; break;
//         case 10 : return    '休闲益智'; break;
//         default : return    false;  break;
//     }
// }

/**
 * 获取对应游戏类型的状态信息
 * @param int $group 状态分组
 * @param int $type  状态文字
 * @return string 状态文字 ，false 未获取到
 * @author 王贺
 */
function get_info_status($type=null,$group=0){
    if(!isset($type)){
        return false;
    }
    $arr=array(
        0 =>array(0=>'关闭'   ,1=>'开启'),
        1 =>array(0=>'不推荐' ,1=>'推荐',2=>'热门',3=>'最新'),//游戏设置状态
        2 =>array(0=>'否'     ,1=>'是'),
        3 =>array(0=>'未审核' ,1=>'正常',2=>'拉黑'),//推广员状态
        4 =>array(0=>'锁定'   ,1=>'正常'),//用户状态
        5 =>array(0=>'未审核' ,1=>'通过'   ,2=>'驳回'),//游戏审核状态
        6 =>array(0=>'未修复' ,1=>'已修复')//纠错状态
    );
    return $arr[$group][$type];
}

/**
 * 获取对应游戏分组的文字信息
 * @param int $category
 * @return string 状态文字 ，false 未获取到
 * @author 王贺
 */
function get_game_category($category = null){
    if(!isset($category)){
        return false;
    }
    switch ($category){
        case 1  : return    '手游'; break;
        case 2  : return    'H5'; break;
        case 3  : return    '页游'; break;
        default : return    false;  break;
    }
}
function get_pay_way($id=null)
{
    if(!isset($id)){
        return false;
    }
    switch ($id) {
        case 0:
          return "支付宝";
            break;
        case 1:
          return "微信";
            break;
            case 2:
          return "平台币";
            break;
        default:
            return "所有类型";
            break;
    }
}

function get_register_way($type=null){
    if(!isset($type)){
        return false;
    }
    switch ($type){
        case 0  : return    'web'; break;
        case 1  : return    'sdk'; break;
        case 2  : return    'app'; break;
        default : return    false;  break;
    }
}

function get_links_type($type=null){
    if(!isset($type)){
        return false;
    }
    switch ($type){
        case 1  : return    '推广官网'; break;
        case 2  : return    '媒体官网'; break;
        case 3  : return    '手机官网'; break;
        default : return    false;  break;
    }
}

function get_zstate($type=null){
    if(!isset($type)){
        return false;
    }
    switch ($type){
        case 0  : return    '隐藏'; break;
        case 1  : return    '显示'; break;
        default : return    false;  break;
    }
}
function get_xstate($type=null){
    if(!isset($type)){
        return false;
    }
    switch ($type){
        case 0  : return    '否'; break;
        case 1  : return    '是'; break;
        default : return    false;  break;
    }
}

/**
*获取游戏列表
* @return array 二维数组
* @author 王贺
*/
function get_game_list(){
    $game_model = D('Game');
    $map['game_status'] = 1;
    $list_data = $game_model->where($map)->order('sort asc')->select();
    return $list_data;
}

/**
*根据不同字段返回游戏名称
*@param  string $field 字段
*@param  string $value 搜索条件
*@return string 游戏名字，false 未找到
*@author 王贺
*/
function get_game_name($value='',$field='id'){
	$game_model = D("Game");
	$map[$field] = $value;
	$name = $game_model->where($map)->find();
	if(empty($name['game_name'])){return false;}
	return $name['game_name'];
}
/**
*获取用户组名称
*@param $uid 用户id
*@return array
*@author 赵超 2016-02-17
*/
function get_auth_group_name($uid){
    $model = D("auth_group_access");
    $res = $model->join("sys_auth_group on sys_auth_group.id = sys_auth_group_access.group_id")
    ->field("title")
    ->where("uid=".$uid)
    ->find();
    return $res["title"];
}

/**
*根据id字段返回游戏区服名称
*@param  int $area_id 字段
*@return string 游戏名字，false 未找到
*@author 王贺
*/
function get_area_name($area_id= null){
    if(empty($area_id)){return false;}
    $area_model = D('Area');
    $map['id'] = $area_id;
    $name = $area_model->where($map)->find();
    if(empty($name['area_name'])){return false;}
    return $name['area_name'];
}

/**
*根据游戏ID获取区服列表
* @return array 二维数组
* @author 王贺
*/
function get_area_list($game_id=null){
    if(empty($game_id)){return false;}
    $area_model = D('Area');
    $map['game_id'] = $game_id;
    $list = $area_model->where($map)->select();
    if(empty($list)){return false;}
    return $list;
}

function get_user_list(){
    $user = D('User');
    $data = $user->where(array('lock_status'=>1))->select();
    return $data;
}

/**
* 生成唯一的APPID
*/
function generate_game_appid(){
    $guid = '';  
    $data = "";  
    $data .= $_SERVER ['REQUEST_TIME'];     
    $data .= $_SERVER ['HTTP_USER_AGENT']; 
    $data .= $_SERVER ['SERVER_ADDR'];       
    $data .= $_SERVER ['SERVER_PORT'];      
    $data .= $_SERVER ['REMOTE_ADDR'];     
    $data .= $_SERVER ['REMOTE_PORT'];     
    $hash = strtoupper ( hash ( 'MD4', $guid . md5 ( $data ) ) ); //ABCDEFZHIJKLMNOPQISTWARY
    $guid .= substr ( $hash, 0, 9 ) . substr ( $hash, 17, 8 ) ; 
    return $guid;
}
/**
*根据不推广员ID返回推官员账号
*@param  string $id 
*@return string 推广员名字，false 未找到
*@author 王贺
*/
function get_promote_name($promote_id=0){
	$game_model = D("promote");
	$map['id'] = $promote_id;
	$name = $game_model->where($map)->find();
	if(empty($name)){return '自然注册';}
	return $name['account'];
}

/**
*推广员列表
*@param  string $id 
*@return string 推广员名字，false 未找到
*@author 王贺
*/
function get_promote_list(){
    $game_model = D("promote");
    $map['status'] = 1;
    $name = $game_model->where($map)->select();
    if(empty($name)){return false;}
    return $name;
}

/**
*一级推广员列表
*@param  string $id 
*@return string 推广员名字，false 未找到
*@author 王贺
*/
function get_promote_parent_list(){
    $game_model = D("promote");
    $map['parent_id'] = 0;
    $map['status'] = 1;
    $name = $game_model->where($map)->select();
    if(empty($name)){return false;}
    return $name;
}
//根据推广员姓名获取上级推广员姓名
function get_parent_promote($name){
$list=D("promote");
    $map['account']=$name;
$pid=$list->where($map)->find();
 if($pid['parent_id']!=0){
$mapp['id']=$pid['parent_id'];
$fname=$list->where($mapp)->find();
if($fname&&$fname!=0){
return $fname['account'];    
}else{
return "";    
}
}else{
    return "";    
}
}
//根据推广员id获取上级推广员姓名
function get_parent_promoteto($id)
{
    $list=D("promote");
    $map['id']=$id;    
    $pid=$list->where($map)->find();
    if($pid['parent_id']!=0){
    $mapp['id']=$pid['parent_id'];
    $pname=$list->where($mapp)->find();
   if($pname){
    return $pname['account'];    
    }
    else{
        return "";
    }
    }else{
     return "";   
    }
}
/**
*获取用户账号
*/
function get_user_account($uid=null){
    if(empty($uid)){return false;}
    $user = D('User');
    $map['id'] = $uid;
    $data = $user->where($map)->find();
    if(empty($data['account'])){return false;}
    return $data['account'];
}

/*
*获取管理员昵称
*/
function get_admin_nickname($uid = null){
    if(empty($uid)){return false;}
    $user = D('member');
    $map['uid'] = $uid;
    $data = $user->where($map)->find();
    if(empty($data['nickname'])){return false;}
    return $data['nickname'];
}

/**
*获取管理员列表
*/
function get_admin_list(){
    $admin = D('member');
    $map['status'] = 1;
    $data = $admin->where($map)->select();
    return $data;
}

/**
*将时间戳装成年月日(不同格式)
*@param  int    $time 要转换的时间戳 
*@param  string $date 类型 
*@return string 
*@author 王贺
*/
function set_show_time($time = null,$type='date'){
    $date = "";
    switch ($type) {
        case 'date':
            $date = date('Y-m-d H:i:s',$time);
            break;
        case 'time':
            $date = date('Y-m-d H:i:s',$time);
            break;
        default:
            $date = date('Y-m-d H:i:s',$time);
            break;
    }
    return $date;
}


/**
 * 获取配置的类型
 * @param string $type 配置类型
 * @return string
 */
function get_config_websiteid($type=0){
    $list = C('CONFIG_WEB_GROUP');
    $res = empty($list[$type])?"后台系统":$list[$type];
    return $res;
}


/**
*获取自建模板
*/
function templatelist(){
 $model = M("Template");
    $list = $model->select();
    return $list;   
}