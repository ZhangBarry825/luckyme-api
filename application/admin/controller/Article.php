<?php
/**
 * Created by PhpStorm.
 * User: zhangbin
 * Date: 2018/10/15
 * Time: 14:58
 */

namespace app\admin\controller;

use app\admin\model\ArticleModel;
use app\admin\model\ArticleValidate;
use app\admin\model\DraftModel;
use think\console\command\make\Model;
use think\Controller;

class Article extends Base
{
    protected $article;
    protected $draft;
    protected $articleValidate;

    public function __construct()
    {
        parent::__construct();
        $this->article = new ArticleModel();
        $this->draft = new DraftModel();
        $this->articleValidate = new ArticleValidate();
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
}