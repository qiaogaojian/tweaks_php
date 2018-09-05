<?php

namespace Admin\Controller;
use User\Api\UserApi as UserApi;

/**
 * 推广查询控制器
 * @author 王贺
 */
class QueryController extends ThinkController {

    public function user_edit($id=null){
         $model = array(
            'm_name' => 'User',
            'title'  => '用户信息',
            'template_edit' =>'user_edit',
            'jump_url' => 'Query/register'
        );
        $data = array();
        if(IS_POST){
            $data["id"]             = $_POST['id'];
            $data["password"]       = $_POST['password'];
            $data["lock_status"]    = $_POST['lock_status'];
            $data["anti_addiction"] = $_POST['anti_addiction'];    
        }
        $pwd = trim($_POST['password']);
        if(empty($pwd)){unset($data['password']);}

        $user = A('User','Event');
        $user->extend_edit($model,$id,$data);
    }


     /**
    *充值查询
    */
    public function game_spend($p=0){
        $map = array();
        $fields = array('pay_status','pay_way');

        if(isset($_REQUEST['time-start']) && isset($_REQUEST['time-end'])){
                $map['pay_time']  = array('BETWEEN',array(strtotime($_REQUEST['time-start']),strtotime($_REQUEST['time-end'])));
                unset($_REQUEST['time-start']);unset($_REQUEST['time-end']);
        }
        if(isset($_REQUEST['pay_order_number'])){
                $map['pay_order_number'] = array('like','%'.$_REQUEST['pay_order_number'].'%');
                unset($_REQUEST['pay_order_number']);
        }
        if(isset($_REQUEST['pay_status'])){
            $map['tab_recharge.pay_status'] = $_REQUEST['pay_status'];
            unset($_REQUEST['pay_status']);
        }
        if($_REQUEST['promote'] == 1){
            $map['promote_id'] = 0;
        }
        foreach ($_REQUEST as $name => $value) {
            
            
            if(in_array($name,$fields)){
                $map[$name] =   $value;
            }
        }
        $model = array(
            'm_name' => 'Recharge',
            'map' => $map,
            'order'  => 'id desc',
            'title'  => '游戏充值查询',
            'template_list' =>'game_spend',
        );
        $user = A('Recharge','Event');
        $user->user_join($model,$p);
    }
}
