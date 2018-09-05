<?php

namespace Admin\Controller;
use User\Api\UserApi as UserApi;

class ClassificationController extends ThinkController {

    const model_name = 'Classification';

    /**
    *游戏信息列表
    */
    public function lists(){
        $extend = array('order'=>'sort desc');
        parent::lists(self::model_name,$_GET["p"],$extend);
    }

    public function add(){
    	if(IS_POST){
    		$game   =   D(self::model_name);
	        $res = $game->update();  
	        if(!$res){
	            $this->error($game->getError());
	        }else{
	            $this->success($res['id']?'更新成功':'新增成功',U('lists'));
	        }
    	}
    	else{
            $time=time();
             $this->assign("time",$time);
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
            $this->assign('data1', $datainfo);
            $this->meta_title = '编辑分类';
            $this->display();
        }
    }

    public function set_status($model='Classification'){
        parent::set_status($model);
    }

    public function del($model = null, $ids=null){
        $model = M('Model')->getByName(self::model_name); /*通过Model名称获取Model完整信息*/
        parent::remove($model["id"],'Info',$ids);
    }

}
