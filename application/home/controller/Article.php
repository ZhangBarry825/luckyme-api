<?php
/**
 * Created by PhpStorm.
 * User: zhangbin
 * Date: 2018/10/15
 * Time: 14:58
 */

namespace app\home\controller;

use app\home\model\ArticleModel;
use app\home\model\ArticleTypeModel;
use app\home\model\ArticleTypeValidate;
use app\home\model\ArticleValidate;
use think\console\command\make\Model;
use think\Controller;

class Article extends Base
{
    protected $article;
    protected $articleValidate;

    protected $artType;
    protected $artTypeValidate;

    public function __construct()
    {
        parent::__construct();
        $this->article = new ArticleModel();
        $this->articleValidate = new ArticleValidate();

        $this->artType = new ArticleTypeModel();
        $this->artTypeValidate = new ArticleTypeValidate();
    }

    public function index(){
        return $this->successReturn('home/article/index');
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
                $result1= $this->article->where('id','=',$rec['id'])->setInc('looked',1);
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

    public function nextArticle(){
        $rec=$_GET;
        $res=$this->articleValidate->check($rec,'','nextArticle');

        if($res){
            $result= $this->article->where("id>".$rec['id'])->order('id asc')->limit('1')->find();
            if($result){
                return $this->successReturn('success',$result);
            }elseif (empty($result)){
                $result= $this->article->order('id asc')->limit('1')->find();
                return $this->successReturn('success',$result);
            }else{
                return $this->errorReturn($this->article->getError());
            }
        }else{
            return $this->errorReturn($this->articleValidate->getError());
        }
    }

    public function preArticle(){
        $rec=$_GET;
        $res=$this->articleValidate->check($rec,'','nextArticle');

        if($res){
            $result= $this->article->where("id<".$rec['id'])->order('id desc')->limit('1')->find();
            if($result){
                return $this->successReturn('success',$result);
            }elseif (empty($result)){
                $result= $this->article->order('id desc')->limit('1')->find();
                return $this->successReturn('success',$result);
            }else{
                return $this->errorReturn($this->article->getError());
            }
        }else{
            return $this->errorReturn($this->articleValidate->getError());
        }
    }

    public function likeArticle(){
        $rec=$_GET;
        $res=$this->articleValidate->check($rec,'','detailArticle');
        if($res){
            $result= $this->article->where('id','=',$rec['id'])->setInc('liked');
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

    public function unlikeArticle(){
        $rec=$_GET;
        $res=$this->articleValidate->check($rec,'','detailArticle');
        if($res){
            $result= $this->article->where('id','=',$rec['id'])->setDec('liked');
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

    public function listType(){
        $rec=$_GET;
        $res=$this->artTypeValidate->check($rec,'','listType');
        if($res){
            $result=$this->artType->order('update_time desc')->select();
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