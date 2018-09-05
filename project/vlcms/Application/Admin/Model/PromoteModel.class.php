<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: huajie <banhuajie@163.com>
// +----------------------------------------------------------------------

namespace Admin\Model;
use Think\Model;

/**
 * 文档基础模型
 */
class PromoteModel extends Model{

    

    /* 自动验证规则 */
    protected $_validate = array(
        array('account', '1,16', '昵称长度为1-16个字符', self::EXISTS_VALIDATE, 'length'),
        array('account','','昵称被占用',0,'unique',1),
        /* 验证密码 */
        array('password', '6,30', "密码长度不合法", self::VALUE_VALIDATE, 'length'), //密码长度不合法
        /* 验证邮箱 */
        //array('email', 'email', -5, self::EXISTS_VALIDATE), //邮箱格式不正确
        //array('email', '1,32', -6, self::EXISTS_VALIDATE, 'length'), //邮箱长度不合法
        //array('email', 'checkDenyEmail', -7, self::EXISTS_VALIDATE, 'callback'), //邮箱禁止注册
        //array('email', '', -8, self::EXISTS_VALIDATE, 'unique'), //邮箱被占用
        /* 验证手机号码 */
        //array('mobile_phone', '//', -9, self::EXISTS_VALIDATE), //手机格式不正确 TODO:
        //array('mobile_phone', 'checkDenyMobile', -10, self::EXISTS_VALIDATE, 'callback'), //手机禁止注册
        //array('mobile_phone', '', -11, self::EXISTS_VALIDATE, 'unique'), //手机号被占用
    );

    /* 自动完成规则 */
    protected $_auto = array(
        array('password', 'think_ucenter_md5', self::MODEL_BOTH, 'function', UC_AUTH_KEY),
        array('create_time', 'getCreateTime', self::MODEL_BOTH,'callback'),
        array('balance_coin', 0, self::MODEL_BOTH),
        array('promote_type', 1, self::MODEL_BOTH),
        //array('status', 0, self::MODEL_BOTH),
    );

    //protected $this->$tablePrefix = 'tab_'; 
    /**
     * 构造函数
     * @param string $name 模型名称
     * @param string $tablePrefix 表前缀
     * @param mixed $connection 数据库连接信息
     */
    public function __construct($name = '', $tablePrefix = '', $connection = '') {
        /* 设置默认的表前缀 */
        $this->tablePrefix ='tab_';
        /* 执行构造方法 */
        parent::__construct($name, $tablePrefix, $connection);
    }

    public function login($account,$password){
        $map['account'] = $account;
        /* 获取用户数据 */
        $user = $this->where($map)->find();
        if(is_array($user) && $user['status'] == 1){
            /* 验证用户密码 */
            if(think_ucenter_md5($password, UC_AUTH_KEY) === $user['password']){
                //$this->updateLogin($user['id']); //更新用户登录信息
                return $user; //登录成功，返回用户ID
            } else {
                return -2; //密码错误
            }
        } else {
            return -1; //用户不存在或被禁用
        }
    }

    //检查账号是否存在
    public function checkAccount($account){
        $c_acc = $this->where(array('account'=>$account))->find();
        if(empty($c_acc)){return ture;}else{ return false;}
    }

    /**
    *新增子推广员
    */
    public function increase(){
        $data = $this->create();
        if($data){
            return $this->add($data);
        }
        return $this->getError();
    }

    /**
    *编辑子推广员
    */
    public function edit($type){
        $data = $this->create();
        if($type == 0){
            unset($data['password']);
        }
        unset($data['create_time']);
        return $this->save($data);
    }

    public function register($account,$password,$real_name,$email,$mobile_phone){
        $data = array(
            'account'       => $account,
            'password'      => $password,
            'nickname'      => $account,
            'real_name'     => $real_name,
            'email'         => $email,
            'mobile_phone'   => $mobile_phone,
        );
        /* 添加用户 */
        if($this->create($data)){
            $uid = $this->add();
            return $uid ? $uid : 0; //0-未知错误，大于0-注册成功
        } else {
            return $this->getError(); //错误详情见自动验证注释
        }
    }

    public function admin_updateInfo($data){
        $new_data = $this->create($data);
        if(empty($data['password'])){unset($new_data['password']);}
        $return = $this->save($new_data);
        return $return;
    }

    public function updateInfo($uid,$type,$password){
        $data = $this->create();
        unset($data['create_time']);
        if($type !=2){unset($data['password']);}

        //更新前检查用户密码
        if($type==2 && !$this->verifyUser($uid, $password)){
            $this->error = '验证出错：密码不正确！';
            return false;
        }

        if($data){
            return $this->where(array('id'=>$uid))->save($data);
        }
        return false;
    }

    
    /**
     * 验证用户密码
     * @param int $uid 用户id
     * @param string $password_in 密码
     * @return true 验证成功，false 验证失败
     * @author huajie <banhuajie@163.com>
     */
    protected function verifyUser($uid, $password_in){
        $password = $this->getFieldById($uid, 'password');
        if(think_ucenter_md5($password_in, UC_AUTH_KEY) === $password){
            return true;
        }
        return false;
    }

    /**
     * 创建时间不写则取当前时间
     * @return int 时间戳
     * @author huajie <banhuajie@163.com>
     */
    protected function getCreateTime(){
        $create_time    =   I('post.create_time');
        return $create_time?strtotime($create_time):NOW_TIME;
    }


    /**
     * 检测用户名是不是被禁止注册
     * @param  string $username 用户名
     * @return boolean          ture - 未禁用，false - 禁止注册
     */
    protected function checkDenyMember($username){
        return true; //TODO: 暂不限制，下一个版本完善
    }

    /**
     * 检测邮箱是不是被禁止注册
     * @param  string $email 邮箱
     * @return boolean       ture - 未禁用，false - 禁止注册
     */
    protected function checkDenyEmail($email){
        return true; //TODO: 暂不限制，下一个版本完善
    }

    /**
     * 检测手机是不是被禁止注册
     * @param  string $mobile 手机
     * @return boolean        ture - 未禁用，false - 禁止注册
     */
    protected function checkDenyMobile($mobile){
        return true; //TODO: 暂不限制，下一个版本完善
    }
}