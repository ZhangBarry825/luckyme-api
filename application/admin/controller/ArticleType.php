<?php
/**
 * Created by PhpStorm.
 * User: zhangbin
 * Date: 2018/10/18
 * Time: 14:46
 */

namespace app\admin\controller;

use app\admin\model\ArticleTypeModel;
use app\admin\model\ArticleTypeValidate;

class ArticleType extends Base
{
    protected $artType;
    protected $artTypeValidate;
    public function __construct()
    {
        parent::__construct();
        $this->artType = new ArticleTypeModel();
        $this->artTypeValidate = new ArticleTypeValidate();
    }

    public function createType(){
        $rec=$_POST;
        $res=$this->artTypeValidate->check($rec,'','createType');
        if($res){
            $rec['update_time']=$rec['create_time'];
            $result=$this->artType->insert($rec);
            if($result){
                return $this->successReturn();
            }else{
                return $this->errorReturn($this->artType->getError());
            }
        }else{
            return $this->errorReturn($this->artTypeValidate->getError());
        }
    }

    public function updateType(){
        $rec=$_POST;
        $res=$this->artTypeValidate->check($rec,'','updateType');
        if($res){
            $result=$this->artType->where('id','=',$rec['id'])->update($rec);
            if($result){
                return $this->successReturn();
            }else if(empty($result)){
                return $this->successReturn();
            }else
            {
                return $this->errorReturn($this->artType->getError());
            }
        }else{
            return $this->errorReturn($this->artTypeValidate->getError());
        }
    }

    public function deleteType(){
        $rec=$_POST;
        $res=$this->artTypeValidate->check($rec,'','deleteType');
        if($res){
            $map["id"] = array("in",json_decode($rec['id'],true));
            $result=$this->artType->where($map)->delete();
            if($result){
                return $this->successReturn();
            }else if(empty($result)){
                return $this->errorReturn('id不存在');
            }else{
                return $this->errorReturn($this->artType->getError());
            }
        }else{
            return $this->errorReturn($this->artTypeValidate->getError());
        }
    }

    public function listType(){
        $rec=$_GET;
        $res=$this->artTypeValidate->check($rec,'','listType');
        if($res){
            $result=$this->artType->order('update_time desc')->select();
            if($result){
                return $this->successReturn('success',$result);
            }else if(empty($result)){
                return $this->successReturn('success',[]);
            }else{
                return $this->errorReturn($this->artType->getError());
            }
        }else{
            return $this->errorReturn($this->artTypeValidate->getError());
        }
    }

}