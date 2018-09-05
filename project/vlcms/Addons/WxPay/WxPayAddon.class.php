<?php
namespace Addons\WxPay;
use Common\Controller\Addon;
ini_set('date.timezone','Asia/Shanghai');
require_once "lib/WxPay.Api.php";
//require_once "Pay/WxPay.NativePay.php";
require_once "Pay/WxPay.JsApiPay.php";
require_once 'log.php';
/**
 * 微信支付插件
 * @author WH
 */

    class WxPayAddon extends Addon{

        public $info = array(
            'name'=>'WxPay',
            'title'=>'微信支付',
            'description'=>'微信支付插件',
            'status'=>1,
            'author'=>'WH',
            'version'=>'0.1'
        );

        public $admin_list = array(
            'model'=>'Example',		//要查的表
			'fields'=>'*',			//要查的字段
			'map'=>'',				//查询条件, 如果需要可以再插件类的构造方法里动态重置这个属性
			'order'=>'id desc',		//排序,
			'list_grid'=>array( 		//这里定义的是除了id序号外的表格里字段显示的表头名和模型一样支持函数和链接
                'cover_id|preview_pic:封面',
                'title:书名',
                'description:描述',
                'link_id|get_link:外链',
                'update_time|time_format:更新时间',
                'id:操作:[EDIT]|编辑,[DELETE]|删除'
            ),
        );

        public function install(){
            return true;
        }

        public function uninstall(){
            return true;
        }

        //实现的wxpaynative钩子方法
        public function wxpaynative($param){
            $post=get_addon_config('WxPay');
            $str = file_get_contents("./Addons/WxPay/lib/WxPay.Config.php");
            $zz  = array();
            $rep = array();
            foreach($post as $key=>$value ){
                // const APPID = 'wx8545770ebd76f2b9';
                $zz[]  = "/const {$key} = '\s*.*?\';/i";
                $rep[] = "const {$key} = '{$value}';";     
            }

            //改写文件中的内容
            $str=preg_replace($zz, $rep, $str);   
            file_put_contents("./Addons/WxPay/lib/WxPay.Config.php", $str);

            $input = new WxPayUnifiedOrder();
            $input->SetBody("平台币");//支付标题
            $input->SetAttach("附加什么玩意？");//附加不知道干啥的
            $input->SetOut_trade_no($param['pay_order_number']);//
            $input->SetTotal_fee($param['amount'] * 100);//支付总金额
            $input->SetTime_start(date("YmdHis"));
            $input->SetTime_expire(date("YmdHis", time() + 600));
            $input->SetGoods_tag("商品选项");
            $input->SetNotify_url("http://paysdk.weixin.qq.com/example/notify.php");
            $input->SetTrade_type("NATIVE");
            $input->SetProduct_id("123456789");
            $result = $this->GetPayUrl($input);
            $url2   = $result["code_url"];
            $this->assign("url2",$url2);

            $html = '<div class="d_body" style="height:px;"><div class="d_content"><div class="text_center"><table class="list" width="100%"><tbody><tr><td class="text_right">订单号</td><td class="text_left">'.$param["pay_order_number"].'</td></tr><tr><td class="text_right">充值金额</td><td class="text_left">本次充值'.$param["amount"].'元，实际付款'.$param["amount"].'元</td></tr></tbody></table><img src="http://paysdk.weixin.qq.com/example/qrcode.php?data='.urlencode($url2).'" height="301" width="301"><img src="/Public/Media/images/wx_pay_tips.png"></div></div></div>';
            define('HTML',$html);
        }

        /**
     * 
     * 生成扫描支付URL,模式一
     * @param BizPayUrlInput $bizUrlInfo
     */
    public function GetPrePayUrl($productId)
    {
        $biz = new WxPayBizPayUrl();
        $biz->SetProduct_id($productId);
        $values = WxpayApi::bizpayurl($biz);
        $url = "weixin://wxpay/bizpayurl?" . $this->ToUrlParams($values);
        return $url;
    }

    /**
     * 
     * 生成直接支付url，支付url有效期为2小时,模式二
     * @param UnifiedOrderInput $input
     */
    public function GetPayUrl($input)
    {
        if($input->GetTrade_type() == "NATIVE")
        {
            $result = WxPayApi::unifiedOrder($input);
            return $result;
        }
    }
    
    /**
     * 
     * 参数数组转换为url参数
     * @param array $urlObj
     */
    private function ToUrlParams($urlObj)
    {
        $buff = "";
        foreach ($urlObj as $k => $v)
        {
            $buff .= $k . "=" . $v . "&";
        }
        
        $buff = trim($buff, "&");
        return $buff;
    }

    }