<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------

namespace Media\Controller;
use User\Api\MemberApi;

/**
 * 文档模型控制器
 * 文档模型列表和详情
 */
class MemberController extends BaseController {

	public function index($value='')
	{
		$gift = array(
			'm_name'=>'Giftbag',
			'prefix'=>'tab_',
			'field' =>array('tab_giftbag.id,giftbag_name,game_id,game_name,desribe,start_time,end_time,icon,tab_giftbag.create_time'),
			'join' =>'tab_game ON tab_giftbag.game_id = tab_game.id',
			'map'=>array('game_status'=>1),
			'limit'=>5,
			'order'=>'create_time',
		);
		$game = array(
			'm_name'=>'Game',
			'prefix'=>'tab_',
			'field' =>true,
			'map'=>array('game_status'=>1),
			'limit'=>5,
			'order'=>'create_time',
		); 
		
		$list_gift = parent::join_data($gift);
		$list_game = parent::list_data($game);
		$this->assign('list_gift',$list_gift);
		$this->assign('list_game',$list_game);
		$this->display();
	}

	/**
	*平台币
	*/
	public function platform(){
		$this->display();
	}

	/**
	*消费记录
	*/
	public function record($p=0){

		$page1 = intval($p);
        $page1 = $page1 ? $page1 : 1; //默认显示第一页数据
		$game1  = M('Agent','tab_');
		$user = session("member_auth");
		$map1 = array('user_account'=>$user['account']);//'wan001'
		$data1  = $game1->where($map1)->order('create_time desc')->select();
		$count1 = $game1->where($map1)->count();
		//分页
        if($count1 > 10){
            $page1 = new \Think\Page($count1, 10);
            $page1->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
            $this->assign('_page1', $page->show());
        }
        $this->assign("count1",$cuont1);
        $this->assign('agent_data', $data1);


		$model = array(
			'm_name'=>'Recharge',
			'prefix'=>'tab_',
			'field' =>true,
			'map'=>array('pay_status'=>1,'user_account'=>$user['account']),//'wan001'
			'order'=>'pay_time',
			'tmeplate_list'=>'record',
		);
		parent::lists($model,$p);
		//$this->display();
	}

	/**
	*我的资料
	*/
	public function mydata(){
		$this->display();
	}

	/**
	*修改密码
	*/
	public function up_pwd(){
		$this->display();
	}

	public function is_login(){
		$mid = parent::is_login();
		if($mid > 0){
			$data = parent::entity($mid);
			$data['status'] = 1;
			return $this->ajaxReturn($data);
		}
		else{
			return $this->ajaxReturn(array('status'=>0,'msg'=>'服务器故障'));
		}
	}

	/**
     * 注销当前用户
     * @return void
     */
    public function logout(){
        session('member_auth', null);
        session('member_auth_sign', null);
        session('[destroy]');
        $this->ajaxReturn(array('reurl'=>'media.php'));
    }

    /* 退出登录 */
    // public function logout(){
    //     if(is_login()){
    //         D('Member')->logout();
    //         session('[destroy]');
    //         $this->success('退出成功！', U('login'));
    //     } else {
    //         $this->redirect('login');
    //     }
    // }

	public function login(){

		if(empty($_POST['account']) || empty($_POST['password'])){
			return $this->ajaxReturn(array('status'=>0,'msg'=>'账号或密码不能为空'));
		}
		$data = array();
		$member = new MemberApi();
		$res = $member->login($_POST['account'],$_POST['password']);
		if($res > 0){
			parent::autoLogin($res);
			return $this->ajaxReturn(array('status'=>1,'msg'=>'成功'));
		}
		else{
			switch ($res) {
				case -1:
					$data = array('status'=>0,'msg'=>'用户不存在或被禁用');
					break;
				case -2:
					$data = array('status'=>0,'msg'=>'密码错误');
					break;
				default:
					$data = array('status'=>0,'msg'=>'未知错误');
					break;
			}
			return $this->ajaxReturn($data);
		}
	}

	public function res_login(){
		parent::autoLogin($_POST['uid']);
		echo $this->ajaxReturn(array("status"=>0,"uid"=>$_POST['uid']));
	}

	public function register(){

		if(empty($_POST['account']) || empty($_POST['password']))
		{
			return $this->ajaxReturn(array('status'=>0,'msg'=>'账号或密码不能为空'));
		} else if(strlen($_POST['account'])>15||strlen($_POST['account'])<6){
			return $this->ajaxReturn(array('status'=>0,'msg'=>'用户名长度在6~15个字符'));
		}else if(!preg_match('/^[a-zA-Z0-9]{6,15}$/', $_POST['account'])){
			return $this->ajaxReturn(array('status'=>0,'msg'=>'用户名包含特殊字符'));
		}

		// if(!check_verify($_POST['verifycode'])){
  //           return $this->ajaxReturn(array('status'=>0,'msg'=>'验证码错误'));
  //       }

		$member = new MemberApi();

		$res = $member->register($_POST['account'],$_POST['password']);
		if($res > 0 ){
			return $this->ajaxReturn(array('status'=>1,'msg'=>'注册成功',"uid"=>$res));
		}
		else{
			$msg = $res == -1 ?"账号已存在":"注册失败";
			return $this->ajaxReturn(array('status'=>0,'msg'=>$msg));
		}
	}

	/**
	* 领取礼包
	*/
	public function getGameGift() {		
		$mid = parent::is_login();;
		if($mid==0){
			echo  json_encode(array('status'=>'0','info'=>'请先登录'));
			exit();
		}
		$list=M('record','tab_gift_');
		$is=$list->where(array('user_id'=>$mid,'gift_id'=>$giftid));
		if($is) {   
			    $map['user_id']=$mid;
			    $map['gift_id']=$_POST['giftid'];
			    $info=$list->where($map)->find();
			    if($info){
				$data=$info['novice'];
				echo  json_encode(array('status'=>'1','info'=>'no','data'=>$data));
		}
		else{			
				$bag=M('giftbag','tab_');				
				$giftid= $_POST['giftid'];
				$ji=$bag->where(array("id"=>$giftid))->field("novice")->find();
				if(empty($ji['novice'])){
					echo json_encode(array('status'=>'1','info'=>'noc'));
				}
				else
				{
					$at=explode(",",$ji['novice']);
					$gameid=$bag->where(array("id"=>$giftid))->field('game_id')->find();
					$add['game_id']=$gameid['game_id'];
			    	$add['game_name']=get_game_name($gameid['game_id']);
			    	$add['gift_id']=$_POST['giftid'];
			    	$add['gift_name']=$_POST['giftname'];
			    	$add['status']=1;
			    	$add['novice']=$at[0];
			    	$add['user_id'] =$mid;
			    	$add['create_time']=strtotime(date('Y-m-d h:i:s',time()));
					$list->add($add);
					$new=$at;
					if(in_array($new[0],$new)){
						$sd=array_search($new[0],$new);
						unset($new[$sd]);
					}
					$act['novice']=implode(",", $new);
					$bag->where("id=".$giftid)->save($act);
					echo  json_encode(array('status'=>'1','info'=>'ok','data'=>$at[0]));
		    	}   
		    } 
		}
	}

	public function verify(){
		$config = array(
			'seKey'     => 'ThinkPHP.CN',   //验证码加密密钥
			'fontSize'  => 16,              // 验证码字体大小(px)
			'imageH'    => 42,               // 验证码图片高度
			'imageW'    => 107,               // 验证码图片宽度
			'length'    => 4,               // 验证码位数
			'fontttf'   => '4.ttf',              // 验证码字体，不设置随机获取
		);
        $verify = new \Think\Verify($config);
        $verify->entry(1);
        var_dump($verify->entry(1));
	}

}
