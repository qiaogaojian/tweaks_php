<?php

namespace Admin\Controller;
use User\Api\UserApi as UserApi;

/**
 * 后台首页控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class ApplyController extends ThinkController {
    //private $table_name="Game";
    const model_name = 'Apply';

    public function lists(){
        parent::lists(self::model_name,$_GET["p"]);
    }

    public function edit($id=null){
        $id || $this->error('请选择要编辑的用户！');
        $model = M('Model')->getByName(self::model_name); /*通过Model名称获取Model完整信息*/
        parent::edit($model['id'],$id);
    }

    public function set_status($model='Apply'){
        parent::set_status($model);
    }

    public function del($model = null, $ids=null){
        $model = M('Model')->getByName(self::model_name); /*通过Model名称获取Model完整信息*/
        parent::remove($model["id"],'Info',$ids);
    }


    public function package($ids=null)
    {
        try{
            $ids || $this->error("打包数据不存在");
            $data = D('Apply')->find($ids);
            //验证数据正确性
            if(empty($data) || $data["status"] != 1){$this->error("未审核或数据错误"); exit();}
            $file = $this->game_source($data["game_id"],1);
            //验证原包是否存在
            if(empty($file) || !file_exists($_SERVER['DOCUMENT_ROOT'].$file['file_url'])){$this->error("游戏原包不存在"); exit();}

            $promote_id = $data["promote_id"];
            $appid      = D('Game')->field('game_appid')->find($data['game_id']); //get_game_appid($data["game_id"]);
            $files      = $_SERVER['DOCUMENT_ROOT'].$file['file_url'];
            $zip = new \ZipArchive;
            $res = $zip->open($files, \ZipArchive::CREATE);//
            if ($res === TRUE) {
                $zip->addFromString('META-INF/mch.properties', json_encode(array('CHANNELID'=>$promote_id,'APPID'=>$appid['game_appid'])));
                $zip->close();
                $source  = $file;
                $newname = "game_package" .$data["game_id"]."-".$promote_id.".apk";
                $to = $_SERVER['DOCUMENT_ROOT']."/Uploads/GamePack/".$newname;
                copy($files,$to);
                $promote = array('game_id'=>$data['game_id'],'promote_id'=>$promote_id);
                $jieguo = $this->updateinfo($ids,$to,$promote);
                if($jieguo){
                    $this->success("成功",U('lists'));
                }
                else{
                    $this->error("操作失败");
                }
            } else {
                throw new \Exception('分包失败.');
            }
        }
        catch(\Exception $e){
            $this->error($e->getMessage());
        }
    }

    public function updateinfo($id,$pack_url,$promote)
    {
        $model = D('Apply');
        $data['id'] = $id;
        $data['pack_url'] = $pack_url;
        $data['dow_url']  = '/index.php?s=/Down/down_file/game_id/'.$promote['game_id'].'/promote_id/'.$promote['promote_id'];
        $data['dispose_id'] = UID;
        $data['dispose_time'] = NOW_TIME;
        $res = $model->save($data);
        return $res;
    }

    public function game_source($game_id,$type)
    {
        $model = D('Source');
        $map['game_id'] = $game_id;
        $map['type'] = $type;
        $data = $model->where($map)->find();
        return $data;
    }

}
