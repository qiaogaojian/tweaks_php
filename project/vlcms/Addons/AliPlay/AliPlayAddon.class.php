<?php

namespace Addons\AliPlay;
use Common\Controller\Addon;

/**
 * 支付宝插件
 * @author Marvin(柳英伟)
 * QQ:448332799
 */

    class AliPlayAddon extends Addon{

        public $info = array(
            'name'=>'AliPlay',
            'title'=>'支付宝',
            'description'=>'支付宝插件,后台配置支持变量。',
            'status'=>1,
            'author'=>'Marvin(柳英伟)',
            'version'=>'2.0'
        );
        public function install(){
			//添加钩子
			$Hooks = M("Hooks");
			$AliPlay = array(array(
				'name' => 'indexAliPlay',
				'description' => '支付宝钩子',
				'type' => 1,
				'update_time' => NOW_TIME,
				'addons' => 'indexAliPlay'
			));
			$Hooks->addAll($AliPlay,array(),true);
			if ( $Hooks->getDbError() ) {
				session('addons_install_error',$Hooks->getError());
				return false;
			}
            return true;
        }

        public function uninstall(){
			$Hooks = M("Hooks");
			$map['name']  = array('in','indexAliPlay');
			$res = $Hooks->where($map)->delete();
			if($res == false){
				session('addons_install_error',$Hooks->getError());
				return false;
			}
            return true;
        }
		
        //实现的indexAliPlay钩子方法
        public function indexAliPlay($param){
			$config = $this->getConfig();
			//检查插件是否开启
			if($config['codelogin']){
				$post=get_addon_config('AliPlay');
				if($config['PARTNER'])
				{
					//判断用户选择的接口类型，决定配置文件的写入路径
					$pay_type='jishi';
					//读取文件中的内容
					$str = file_get_contents("./Addons/AliPlay/Play/".$pay_type."/lib/aliplay.php");
					$zz  = array();
					$rep = array();
					foreach($post as $key=>$value ){
						$zz[]="/define\(\"{$key}\",\s*.*?\);/i";
						$rep[]="define(\"{$key}\", \"{$value}\");";		
					}

					//改写文件中的内容
					$str=preg_replace($zz, $rep, $str);		
					file_put_contents("./Addons/AliPlay/Play/".$pay_type."/lib/aliplay.php", $str);
					$this->assign('pay_type', $pay_type);
					$this->assign('config', $config);
					$this->post($param);
					//echo __ADDONROOT__."/Play/{$pay_type}/alipayapi.php";
					//U('/Addons/AliPlay/Play/jishi/alipayapi.php');
					///Addons/AliPlay/Play/jishi/alipayapi.php
					//$this->display('AliPlay');	
					//header("Location: /Addons/AliPlay/Play/jishi/alipayapi.php");
				}
			}
				
        }

        /**
		*post提交数据
        */
        protected function post($param){
        	$ch = curl_init();
			$data = array(
				'out_trade_no' => $param['pay_order_number'], 
				'notify_url' => 'http://'.$_SERVER['HTTP_HOST'].'/server.php/CallBack/alipay_callback',
				'return_url'=>'',
				'subject'=>'游戏充值',
				'price'=>$param['amount'],
				'body'=>'',
				'show_url'=>'',

			);
			curl_setopt($ch, CURLOPT_URL, 'http://'.$_SERVER['HTTP_HOST'].'/Addons/AliPlay/Play/jishi/alipayapi.php');
			curl_setopt($ch, CURLOPT_POST, 1);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
			curl_exec($ch);
        }
    }