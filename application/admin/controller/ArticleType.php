<?php
/**
 * Created by PhpStorm.
 * User: zhangbin
 * Date: 2018/10/18
 * Time: 14:46
 */

namespace app\admin\controller;

use app\admin\model\ArticleModel;
use app\admin\model\ArticleTypeModel;
use app\admin\model\ArticleTypeValidate;

class ArticleType extends Base
{
    protected $article;
    protected $artType;
    protected $artTypeValidate;

    public function __construct()
    {
        parent::__construct();
        $this->article = new ArticleModel();
        $this->artType = new ArticleTypeModel();
        $this->artTypeValidate = new ArticleTypeValidate();
    }

    public function createType(){
        $rec=$_POST;
        if(isset($_POST['cn_name'])){
            $rec = $_POST;
        }else{
            $request_data = file_get_contents ('php://input');
            $rec = json_decode ($request_data,true);
        }
        $res=$this->artTypeValidate->check($rec,'','createType');
        if($res){
            $rec['name']=time();
            $rec['update_time']=time();
            $rec['create_time']=time();
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
        if(isset($_POST['cn_name'])){
            $rec = $_POST;
        }else{
            $request_data = file_get_contents ('php://input');
            $rec = json_decode ($request_data,true);
        }
        $res=$this->artTypeValidate->check($rec,'','updateType');
        if($res){
            $rec['name']=time();
            $rec['update_time']=time();
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
        if(isset($_POST['id'])){
            $rec = $_POST;
        }else{
            $request_data = file_get_contents ('php://input');
            $rec = json_decode ($request_data,true);
        }
        $res=$this->artTypeValidate->check($rec,'','deleteType');
        if($res){
            $map["id"] = array("in",$rec['id']);
            $isData=false;
            for($i=0;$i<count($rec['id']);$i++){
                $r1=$this->artType->where('id','=',$rec['id'][$i])->field('name')->find();
                $r2=$this->article->where('type','=',$r1['name'])->select();
                if($r2){
                    $isData=true;
                }
            }
            if($isData){
                return $this->errorReturn('该分类下有文章','',502);
            }else{
                $result=$this->artType->where($map)->delete();
                if($result){
                    return $this->successReturn();
                }else if(empty($result)){
                    return $this->errorReturn('id不存在','',503);
                }else{
                    return $this->errorReturn($this->artType->getError());
                }
            }
        }else{
            return $this->errorReturn($this->artTypeValidate->getError());
        }
    }

    public function listType(){
        $rec=$_GET;
        $res=$this->artTypeValidate->check($rec,'','listType');
        if($res){
            if($rec['all']){
                $result=$this->artType->order('update_time desc')->select();
            }else{
                $result=$this->artType->page($rec['page_num'],$rec['page_size'])->order('update_time desc')->select();
            }
            $count=count($this->artType->order('update_time desc')->select());
            if($result){
                $r=[
                    'total'=>$count,
                    'types'=>$result
                ];
                return $this->successReturn('success',$r);
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