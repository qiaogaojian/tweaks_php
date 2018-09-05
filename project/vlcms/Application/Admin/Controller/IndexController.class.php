<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Admin\Controller;
use User\Api\UserApi as UserApi;

/**
 * 后台首页控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class IndexController extends AdminController {

    /**
     * 后台首页
     * @author 麦当苗儿 <zuojiazi@vip.qq.com>
     */
    public function index(){
        $this->meta_title = '管理首页';
        $this->user();//用户信息
        $this->game();//游戏信息
        $this->rechareg();//充值流水
        $this->promote();//推广员
        $this->stat();//统计
        $this->display();
    }

    /**
	*用户信息
    */
    protected function user(){
    	$user = D('user');
    	$user_count  = $user->count();
        $map = $this->between_time(array('field'=>'register_time','type'=>0));
    	$user_reg   = $user->where($map)->count();
    	$user_login = $user->where($this->between_time(array('field'=>'login_time','type'=>0)))->count();
    	$spend = D('Recharge')->where($this->between_time(array('field'=>'pay_time','type'=>0)))->count();
    	$this->assign("spend",$spend);
    	$this->assign("user_login",$user_login);
    	$this->assign("user_reg",$user_reg);
    	$this->assign("user_count",$user_count);
    }

    protected function game(){
    	$game = D('Game');
    	$game_count = $game->count();
    	$new_game = $game->where($this->between_time(array('field'=>'pay_time','type'=>2)))->count();
    	$this->assign('game_count',$game_count);
    	$this->assign('new_game',$new_game);
    }

    protected function rechareg(){
    	$rec = M("Recharge","tab_");
    	$sum_rec = $rec->where(array('pay_status'=>1))->sum('pay_amount');
    	$map['pay_status'] = 1;
    	$map['pay_time'] = $this->between_time(array('field'=>'pay_time','type'=>0));
    	$today = $rec->where($map)->sum('pay_amount');
    	$map['pay_time'] = $this->between_time(array('field'=>'pay_time','type'=>1));
    	$yesterday = $rec->where($map)->sum('pay_amount');
    	$arr['pay_status'] = 1; $arr['promote_id'] != 1;
    	$promote_sum = $rec->where($arr)->sum('pay_amount');
    	$this->assign('sum_rec',$sum_rec);
    	$this->assign('today',$today);
    	$this->assign('yesterday',$yesterday);
    	$this->assign('promote_sum',$promote_sum);

    }

    protected function promote(){
    	$promote = D('Promote');
    	$promote_count = $promote->count();
    	$new_promote = $promote->where($this->between_time(array('field'=>'create_time','type'=>0)))->count();
    	$this->assign('promote_count',$promote_count);
    	$this->assign('new_promote',$new_promote);
    }

    public function stat(){
    	$stat = A('Statistics','Event');
        $stat->recharge_statistics();
        $stat->recharge_statistics_year();
    }

    protected function between_time($data){
        $start =0;$end=0;$map = array();
    	switch ($data['type']) {
    		case 0://获取今日凌晨到结束时间
    			$start=mktime(0,0,0,date('m'),date('d'),date('Y'));
				$end=mktime(0,0,0,date('m'),date('d')+1,date('Y'))-1;
    			break;
    		
    		case 1://获取昨日凌晨到结束时间
    			$start=mktime(0,0,0,date('m'),date('d')-1,date('Y'));
				$end=mktime(0,0,0,date('m'),date('d'),date('Y'))-1;
    			break;
    		case 2://获取上周起始时间戳和结束时间戳
    			$start=mktime(0,0,0,date('m'),date('d')-date('w')+1-7,date('Y'));
				$end=mktime(23,59,59,date('m'),date('d')-date('w')+7-7,date('Y'));
			    break;

    	}
    	$map[$data['field']] = array("BETWEEN",array($start,$end));
    	return $map;
    }

}
