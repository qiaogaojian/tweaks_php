<?php

namespace Admin\Controller;
use User\Api\UserApi as UserApi;

/**
 * 后台首页控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class GameController extends ThinkController {
    //private $table_name="Game";
    const model_name = 'Game';

    /**
    *游戏信息列表
    */
    public function lists(){
        $extend = array(
            'key'=>array('game_appid','game_name'),
            'order'=>'sort asc',
        );
       $cl = D("Classification")->where("status=1")->select();
        $this->assign("cl",$cl);
        parent::lists(self::model_name,$_GET["p"],$extend);
    }

    public function add(){
    	if(IS_POST){
    		$game   =   D(self::model_name);//M('$this->$model_name','tab_');
	        $res = $game->update();  
	        if(!$res){
	            $this->error($game->getError());
	        }else{
	            $this->success($res['id']?'更新成功':'新增成功',U('lists'));
	        }
    	}
    	else{
        $cl = D("Classification")->where("status=1")->select();
        $this->assign("cl",$cl);
    		$this->display();
    	}
    	
    }

    public function edit($id=null){
        if(IS_POST){
            $game   =   D(self::model_name);//M('$this->$model_name','tab_');
            $res = $game->update();  
            if(!$res){
                $this->error($game->getError());
            }else{
                $this->success($res['id']?'更新成功':'新增成功',U('lists'));
            }
        }
        else{
            $id || $this->error('id不能为空');
            $data = D(self::model_name)->detail($id);
            $data || $this->error('数据不存在！');
            $this->assign('data', $data);
            $this->meta_title = '编辑游戏';
            $cl = D("Classification")->where("status=1")->select();
            $this->assign("cl",$cl);
            $this->display();
        }
    }

    public function set_status($model='Game'){
        parent::set_status($model);
    }

    public function del($model = null, $ids=null){
        $model = M('Model')->getByName(self::model_name); /*通过Model名称获取Model完整信息*/
        parent::remove($model["id"],'Info',$ids);
    }

    /**
     * 文档排序
     * @author huajie <banhuajie@163.com>
     */
    public function sort(){
        //获取左边菜单$this->getMenus()
       
        if(IS_GET){
            

            $map['status'] = 1;
            $list = D('Game')->where($map)->field('id,game_name')->order('sort DESC, id DESC')->select();

            $this->assign('list', $list);
            $this->meta_title = '游戏排序';
            $this->display();
        }elseif (IS_POST){
            $ids = I('post.ids');
            $ids = array_reverse(explode(',', $ids));
            foreach ($ids as $key=>$value){
                $res = D('Game')->where(array('id'=>$value))->setField('sort', $key+1);
            }
            if($res !== false){
                $this->success('排序成功！');
            }else{
                $this->error('排序失败！');
            }
        }else{
            $this->error('非法请求！');
        }
    }

}
