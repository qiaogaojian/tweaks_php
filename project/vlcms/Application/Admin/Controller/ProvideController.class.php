<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use User\Api\MemberApi as MemberApi;

/**
 * 后台首页控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class ProvideController extends ThinkController {

    /**
     * 平台币发放记录
     */
    public function provide($p=0){
    	$model = array(
    		'm_name'=>'Provide',
    		'fields' =>array(),
    		'map' => array(),
    		'key'=>array(),
    		'title'=>'平台币发放',
    		'template_list'>'provide'
    	);
    	$think = A("Think","Event");
    	$think->lists($model,$p);
    }

    public function add(){
        if(IS_POST){
            $model = D('provide');//get_user_account
            $data['user_id'] = $_REQUEST['user_id'];
            $data['user_account'] =get_user_account($_REQUEST['user_id']);
            $data['amount'] = $_REQUEST['amount'];
            $data['remark'] = $_REQUEST['remark'];
            $data['status'] = 1;
            $data['op_id'] = UID;
            $data['op_account'] = session('user_auth.username');
            $data['create_time'] = NOW_TIME;
            $model->add($data);
            D('User')->where(array('id='.$_REQUEST['user_id']))->setInc('balance',$_REQUEST['amount']);
            $this->success('成功',U('provide'));
        }
        else{
            $this->display();
        }
    }

    public function edit($id=null){
        $model = D('provide');
        $data = $model->find($id);
        $this->assign("data",$data);
        $this->display();
    }


    public function get_ajax_area_list(){
        $area = D('Area');
        $map['game_id'] = I('post.game_id',1);
        $list = $area->where($map)->select();
        $this->ajaxReturn($list);
    }
    /**
     * 平台币余额记录
     */
    public function balance($p=0){
        $model = array(
    		'm_name'=>'user',
    		'fields' =>array('tab_user.id','account','tab_user.balance','login_time','login_ip','promote_id'),
            'field_time' => 'login_time',
            'join' =>array('left join tab_user_play on tab_user.id = tab_user_play.user_id'),
    		'map' => array(),
    		'key'=>array('account'),
    		'title'=>'余额记录',
    		'template_list'>'balance'
    	);
    	$think = A("Think","Event");
    	$think->join_lists($model,$p);
    }

    public function user_edit($id=null)
    {
        if(IS_POST){
            $member = new MemberApi();
            $data = $_REQUEST;
            if(empty($data['password'])){unset($data['password']);}
            $res = $member->updateInfo($data);
            if($res !== false){
                $this->success('修改成功',U('Provide/balance'));
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
