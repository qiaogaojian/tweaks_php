<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

/**
 * 前台公共库文件
 * 主要定义前台公共函数库
 */

/**
 * 检测验证码
 * @param  integer $id 验证码ID
 * @return boolean     检测结果
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function check_verify($code, $id = 1){
	$verify = new \Think\Verify();
	return $verify->check($code, $id);
}

/**
 * 获取列表总行数
 * @param  string  $category 分类ID
 * @param  integer $status   数据状态
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function get_list_count($category, $status = 1){
    static $count;
    if(!isset($count[$category])){
        $count[$category] = D('Document')->listCount($category, $status);
    }
    return $count[$category];
}

/**
 * 获取段落总数
 * @param  string $id 文档ID
 * @return integer    段落总数
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function get_part_count($id){
    static $count;
    if(!isset($count[$id])){
        $count[$id] = D('Document')->partCount($id);
    }
    return $count[$id];
}

/**
 * 获取导航URL
 * @param  string $url 导航URL
 * @return string      解析或的url
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
function get_nav_url($url){
    switch ($url) {
        case 'http://' === substr($url, 0, 7):
        case '#' === substr($url, 0, 1):
            break;        
        default:
            $url = U($url);
            break;
    }
    return $url;
}


/**
*获取游戏列表
* @return array 二维数组
* @author 王贺
*/
function get_game_list(){
    $game_model = M('Game','tab_');
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
    $game_model = M("Game","tab_");
    $map[$field] = $value;
    $name = $game_model->where($map)->find();
    if(empty($name['game_name'])){return false;}
    return $name['game_name'];
}


function get_game_type_arr(){
$cl = M("Classification","tab_")->where("status=1")->select();
return $cl;
}

function get_game_introduction($g_id,$sum){
    $game = M('Info','tab_game_');
    $str = $game->field('introduction')->find($g_id);
    return msubstr(strip_tags($str['introduction']),0,$sum,'utf-8',false);
}


function get_gift_type($type=null){
    if(empty($type)){
        return false;
    }
    switch ($type) {
        case 1:  return '新手包'; break;
        case 2:  return '媒体包'; break;
        case 3:  return '其他包'; break;
        case 4:  return '公众礼包'; break;
        default: return false; break;
    }
}

/**
*根据不推广员ID返回推官员账号
*@param  string $id 
*@return string 推广员名字，false 未找到
*@author 王贺
*/
function get_promote_name($promote_id=0){
    $game_model = M("promote","tab_");
    $map['id'] = $promote_id;
    $name = $game_model->where($map)->find();
    if(empty($name)){return '自然注册';}
    return $name['account'];
}

function random_string($len = 7) {

    $chars = array(

            "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",

            "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",

            "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G",

            "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",

            "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2",

            "3", "4", "5", "6", "7", "8", "9"

    );

    $charsLen = count($chars) - 1;

    shuffle($chars);    // 将数组打乱

    $output = "";

    for ($i = 0; $i < $len; $i++) {

        $output .= $chars[mt_rand(0, $charsLen)];

    }

    return $output;

}