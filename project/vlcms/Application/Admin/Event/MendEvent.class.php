<?php
namespace Admin\Event;
use Think\Controller;
/**
 * 后台事件控制器
 * @author 王贺 
 */
class MendEvent extends Controller {

    public function add_mend()
    {

        $model = D('Mend');
        $data = $model->create();
        $user = $this->update_user($data['user_id'],$data['prmoote_id_to']);
        $rech = $this->update_recharge($_POST['account'],$data['prmoote_id_to']);
        if($user || $rech){
            $res = $model->add();
            if($res){
                $this->success('补链成功',U('lists'));
            }
            else{
                $this->error('补链失败');
            }
        }else{
            $this->error('补链失败');
        }
       
    }

    public function update_user($u_id,$promote_id_to)
    {
       $model = D('Play');
       $map['user_id'] = $u_id;
       $data['promote_id'] = $promote_id_to;
       $res = $model->where($map)->save($data);
       return $res;
    }

    public function update_recharge($account=null,$promote_id_to=null)
    {
        $model = D('Recharge');
        $map['user_account'] = $account;
        $data['promote_id'] = $promote_id_to;
        $res = $model->where($map)->save($data);
        return $model->getlastsql();
    }
}