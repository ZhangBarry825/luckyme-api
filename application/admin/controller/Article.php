<?php
/**
 * Created by PhpStorm.
 * User: zhangbin
 * Date: 2018/10/15
 * Time: 14:58
 */

namespace app\admin\controller;

use app\admin\model\ArticleModel;
use app\admin\model\ArticleTypeModel;
use app\admin\model\ArticleTypeValidate;
use app\admin\model\ArticleValidate;
use app\admin\model\DraftModel;
use think\console\command\make\Model;
use think\Controller;

class Article extends Base
{
    protected $article;
    protected $draft;
    protected $articleValidate;

    protected $artType;
    protected $artTypeValidate;


    public function __construct()
    {
        parent::__construct();
        $this->article = new ArticleModel();
        $this->draft = new DraftModel();
        $this->articleValidate = new ArticleValidate();

        $this->artType = new ArticleTypeModel();
        $this->artTypeValidate = new ArticleTypeValidate();
    }

    public function index(){
        return $this->successReturn('admin/article/index');
    }

    public function createArticle(){
        $rec=$_POST;
        if(isset($_POST['title'])){
            $rec = $_POST;
        }else{
            $request_data = file_get_contents ('php://input');
            $rec = json_decode ($request_data,true);
        }
        $res=$this->articleValidate->check($rec,'','createArticle');
        if(isset($rec['id'])){
            $draft_id=$rec['id'];
            $rec['id']='';
        }
        if($res){
            $rec['update_time']=$rec['create_time'];
            $result=$this->article->insert($rec);
            if($result){
                if(isset($draft_id)){
                    $result1=$this->draft->where('id','=',$draft_id)->delete();
                }
                return $this->successReturn();
            }else{
                return $this->errorReturn($this->article->getError());
            }
        }else{
            return $this->errorReturn($this->articleValidate->getError());
        }
    }

    public function updateArticle(){
        $rec=$_POST;
        if(isset($_POST['id'])){
            $rec = $_POST;
        }else{
            $request_data = file_get_contents ('php://input');
            $rec = json_decode ($request_data,true);
        }
        $res=$this->articleValidate->check($rec,'','updateArticle');
        if($res){
            $result=$this->article->where('id','=',$rec['id'])->update($rec);
            if($result){
                return $this->successReturn();
            }else if(empty($result)){
                return $this->successReturn();
            }else{
                return $this->errorReturn($this->article->getError());
            }
        }else{
            return $this->errorReturn($this->articleValidate->getError());
        }
    }

    public function deleteArticle(){
        $rec=$_POST;
        if(isset($_POST['id'])){
            $rec = $_POST;
        }else{
            $request_data = file_get_contents ('php://input');
            $rec = json_decode ($request_data,true);
        }
        $res=$this->articleValidate->check($rec,'','deleteArticle');
        if($res){
            $map["id"] = array("in",json_decode($rec['id'],true));
            $result=$this->article->where($map)->delete();
            if($result){
                return $this->successReturn();
            }else if(empty($result)){
                return $this->errorReturn('id不存在','',503);
            }else{
                return $this->errorReturn($this->article->getError());
            }
        }else{
            return $this->errorReturn($this->articleValidate->getError());
        }
    }

    public function searchArticle(){
        $rec=$_GET;
        $res=$this->articleValidate->check($rec,'','searchArticle');
        if($res){
            $map['title|description'] = array('like', "%{$rec['key']}%", 'or');
            if(isset($rec['type'])){
                $result=$this->article->where($map)->where('type','=',$rec['type'])->page($rec['page_num'],$rec['page_size'])->field('content',true)->order('update_time desc')->select();
            }else{
                $result=$this->article->where($map)->page($rec['page_num'],$rec['page_size'])->field('content',true)->order('update_time desc')->select();
            }
            $count=count($this->article->where($map)->select());
            if($result){
                $r=[
                    'total'=>$count,
                    'articles'=>$result
                ];
                return $this->successReturn('success',$r);
            }else if(empty($result)){
                return $this->successReturn('success',[]);
            } else{
                return $this->errorReturn($this->article->getError());
            }
        }else{
            return $this->errorReturn($this->articleValidate->getError());
        }
    }

    public function listArticle(){
        $rec=$_GET;
        $res=$this->articleValidate->check($rec,'','listArticle');
        if($res){
            $count='';
            if(isset($rec['type'])){
                $result=$this->article->where('type','=',$rec['type'])->page($rec['page_num'],$rec['page_size'])->field('content',true)->order('update_time desc')->select();
                $count=count($this->article->where('type','=',$rec['type'])->select());
            }
            if(isset($rec['status'])){
                $result=$this->article->where('status','=',$rec['status'])->page($rec['page_num'],$rec['page_size'])->field('content',true)->order('update_time desc')->select();
                $count=count($this->article->where('status','=',$rec['status'])->select());
            }
            if(isset($rec['type']) && isset($rec['status'])){
                $result=$this->article->where('status','=',$rec['status'])->where('type','=',$rec['type'])->page($rec['page_num'],$rec['page_size'])->field('content',true)->order('update_time desc')->select();
                $count=count($this->article->where('status','=',$rec['status'])->where('type','=',$rec['type'])->select());
            }
            if(!isset($rec['type']) && !isset($rec['status'])){
                $result=$this->article->page($rec['page_num'],$rec['page_size'])->field('content',true)->order('update_time desc')->select();
                $count=count($this->article->select());
            }

            if($result){
                $r=[
                    'total'=>$count,
                    'articles'=>$result
                ];
                return $this->successReturn('success',$r);
            }else if(empty($result)){
                return $this->successReturn('success',[]);
            }else{
                return $this->errorReturn($this->article->getError());
            }
        }else{
            return $this->errorReturn($this->articleValidate->getError());
        }
    }

    public function detailArticle(){
        $rec=$_GET;
        $res=$this->articleValidate->check($rec,'','detailArticle');
        if($res){
            $result=$this->article->where('id','=',$rec['id'])->find();
            if($result){
                return $this->successReturn('success',$result);
            }elseif (empty($result)){
                return $this->successReturn('id is not found',[]);
            }else{
                return $this->errorReturn($this->article->getError());
            }
        }else{
            return $this->errorReturn($this->articleValidate->getError());
        }
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