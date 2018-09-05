<?php

namespace Admin\Controller;
use User\Api\MemberApi as MemberApi;

/**
 * 后台首页控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class MemberController extends ThinkController {
    
    public function user_info($p=0){
        $map = array();
        if(isset($_REQUEST['account'])){
            $map['account'] = array('like','%'.$_REQUEST['account'].'%');
            unset($_REQUEST['account']);
        }
        if(isset($_REQUEST['game_id'])){
            $map['tab_game.id'] = $_REQUEST['game_id'];
            unset($_REQUEST['game_id']);
        }
        if(isset($_REQUEST['register_way'])){
            $map['register_way'] = $_REQUEST['register_way'];
            unset($_REQUEST['register_way']);
        }
        if(isset($_REQUEST['time-start']) && isset($_REQUEST['time-end'])){
            $map['login_time'] =array('BETWEEN',array(strtotime($_REQUEST['time-start']),strtotime($_REQUEST['time-end'])));
            unset($_REQUEST['time-start']);unset($_REQUEST['time-end']);
        }
        if(isset($_REQUEST['time-start-r']) && isset($_REQUEST['time-end-r'])){
            $map['register_time'] = array('BETWEEN',array(strtotime($_REQUEST['time-start-r']),strtotime($_REQUEST['time-end-r'])));
            unset($_REQUEST['time-start-r']);unset($_REQUEST['time-end-r']);
        }
        $model = array(
        	'm_name'=>'User',
            'fields'=>array('tab_user.id as id','tab_user.account','game_name','lock_status','login_time','login_ip','promote_id'),
            'map' =>$map,
        	'order'=>' tab_user.register_time desc',
        	'title' => '用户信息',
        	'template_list' => 'user_info',
        );
        $user = A('User','Event');
        $user->user_joinz($model,$p);
    }

    public function edit($id=null){
    	if(IS_POST){
            $member = new MemberApi();
            $data = $_REQUEST;
    		if(empty($data['password'])){unset($data['password']);}
            $res = $member->updateInfo($data);
            if($res !== false){
                $this->success('修改成功',U('user_info'));
            }
            else{
                $this->error('修改失败');
            }
    		
    	}
    	else{
    		$user = A('User','Event');
    		$user->user_entity($id);
    		$this->display();
    	}
    	
    }

}
