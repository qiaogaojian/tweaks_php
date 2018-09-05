<?php 

namespace Admin\Controller;
use Admin\Model\AuthGroupModel;


class SlideManageController extends ThinksdController {
	private $model_name = 'SlideManage'; 
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
		$slidetype = M("Slidetype");
		$listtype = $slidetype->select();
		$this->assign("list_slidetype",$listtype);
		$model = M('Model')->getByName($this->model_name); /*通过Model名称获取Model完整信息*/
		parent::add($model['id'],"index"); /*系统会调用View/Game/AddGame.html来显示*/
	}
	
	/*编辑游戏*/
	public function edit($model=0){
		$slidetype = M("Slidetype");
		$listtype = $slidetype->select();
		$this->assign("list_slidetype",$listtype);
		
		$id = $model;
		$id || $this->error('请选择要编辑的用户！');
		$model = M('Model')->getByName($this->model_name); /*通过Model名称获取Model完整信息*/
		parent::edit($model['id'],$id,"index");
	}

	/*删除数据*/
	public function del($ids=0){
		$model = M('Model')->getByName("Slidemanage");
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

	//设置幻灯片是否显示
	public function setstatus($model,$stauts){
		$data["status"]=$stauts;
		$game=M("Slidemanage");
		// var_dump($_GET);exit();
		$result = $game->where("ID=".$model)->save($data);
		if($result){
			$this->success('操作成功',U("index"));
		}
		else{
			$this->error("操作失败");
		}
	}

}

?>