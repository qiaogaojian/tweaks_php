<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Widget;
use Think\Controller;

/**
 * 分类widget
 * 用于动态调用分类信息
 */

class SearchWidget extends Controller{
	
	/* 显示指定游戏列表 */
	public function game_list(){
		$model = D('Game');
		$map['status'] = 1;
		$data = $model->where($map)->select();
		$this->assign('game_list_data',$data);
		$this->display('Search/game_list');
	}

	/* 显示指定推广员列表 */
	public function promote_list(){
		$model = D('Promote');
		$map['status'] = 1;
		$data = $model->where($map)->select();
		$this->assign('promote_list_data',$data);
		$this->display('Search/promote_list');
	}

	/*管理员列表*/
	public function admin_list(){
		$model = D('member');
		$map['status'] = 1;
		$data = $model->where($map)->select();
		$this->assign('admin_list_data',$data);
		$this->display('Search/admin_list');
	}

	public function period($models){

		$model = M('Recharge','tab_');
		$map = $models['map'];
		$yesterday   = $model->where($map)->where(get_period($models['field'],'yesterday'))->sum($models['total']);
		$today       = $model->where($map)->where(get_period($models['field'],'today'))->sum($models['total']);
		$last_week   = $model->where($map)->where(get_period($models['field'],'last_week'))->sum($models['total']);
		$this_week   = $model->where($map)->where(get_period($models['field'],'this_week'))->sum($models['total']);
		$last_moenth = $model->where($map)->where(get_period($models['field'],'last_moenth'))->sum($models['total']);
		$this_mneth  = $model->where($map)->where(get_period($models['field'],'this_mneth'))->sum($models['total']);
		$this->assign("yesterday",$yesterday);
		$this->assign("today",$today);
		$this->assign("last_week",$last_week);
		$this->assign("this_week",$this_week);
		$this->assign("last_moenth",$last_moenth);
		$this->assign("this_mneth",$this_mneth);
		$this->assign("unit",$models['unit']);
		$this->display('Search/period');
	}
	

	public function period_count($models){

		$model = M('Recharge','tab_');
		$map = $models['map'];
		$yesterday   = $model->where($map)->where(get_period($models['field'],'yesterday'))->sum($models['total']);
		$today       = $model->where($map)->where(get_period($models['field'],'today'))->sum($models['total']);
		$last_week   = $model->where($map)->where(get_period($models['field'],'last_week'))->sum($models['total']);
		$this_week   = $model->where($map)->where(get_period($models['field'],'this_week'))->sum($models['total']);
		$last_moenth = $model->where($map)->where(get_period($models['field'],'last_moenth'))->sum($models['total']);
		$this_mneth  = $model->where($map)->where(get_period($models['field'],'this_mneth'))->sum($models['total']);
		$this->assign("yesterday",$yesterday);
		$this->assign("today",$today);
		$this->assign("last_week",$last_week);
		$this->assign("this_week",$this_week);
		$this->assign("last_moenth",$last_moenth);
		$this->assign("this_mneth",$this_mneth);
		$this->assign("unit",$models['unit']);
		$this->display('Search/period');
	}
}
