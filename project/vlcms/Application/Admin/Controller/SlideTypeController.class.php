<?php 

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;


class SlideTypeController extends ThinksdController {
	private $model_name = 'SlideType'; 
	public function _initialize(){
		parent::_initialize();
        $menu = parent::getmenus();
        foreach($menu['main'] as $key => $value){
            $menu['main'][$key]['url'] = 'Admin/'.$value['url'];
            if(strstr($value['url'],MODEL_NAME.CONTROLLER_NAME)){
                $menu['main'][$key]['class'] = 'current';
            }
        }
        $this->assign('__MENU__', $menu);
	}

	/*游戏管理*/
	public function index(){
		parent::lists($this->model_name,$_GET["p"]);

	}
	
	/*添加游戏*/
	public function add(){
		$model = M('Model')->getByName($this->model_name); /*通过Model名称获取Model完整信息*/
		parent::add($model['id'],"index"); /*系统会调用View/Game/AddGame.html来显示*/
	}
	
	/*编辑游戏*/
	public function edit($model=0){
		$id = $model;
		$id || $this->error('请选择要编辑的用户！');
		$model = M('Model')->getByName($this->model_name); /*通过Model名称获取Model完整信息*/
		parent::edit($model['id'],$id,"index");
	}

	public function del($ids=0){
		$model = M('Model')->getByName("Slidetype");
        $model || $this->error('模型不存在！');

        $ids = array_unique((array)I('ids',0));

        if ( empty($ids) ) {
            $this->error('请选择要操作的数据!');
        }
        $Model = M(get_table_name($model['id']));
        $map = array('id' => array('in', $ids) );
        if($Model->where($map)->delete()){
            $this->success('删除成功');
        } else {
            $this->error('删除失败！');
        }
	}

}

?>