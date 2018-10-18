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
use think\console\command\make\Model;
use think\Controller;

class Article extends Base
{
    protected $article;
    protected $articleValidate;

    public function __construct()
    {
        parent::__construct();
        $this->article = new ArticleModel();
        $this->articleValidate = new ArticleValidate();
    }

    public function index(){
        return $this->successReturn('admin/article/index');
    }

    public function createArticle(){
        $rec=$_POST;
        $res=$this->articleValidate->check($rec,'','createArticle');
        if($res){
            $rec['update_time']=$rec['create_time'];
            $result=$this->article->insert($rec);
            if($result){
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
        $res=$this->articleValidate->check($rec,'','deleteArticle');
        if($res){
            $map["id"] = array("in",json_decode($rec['id'],true));
            $result=$this->article->where($map)->delete();
            if($result){
                return $this->successReturn();
            }else if(empty($result)){
                return $this->errorReturn('id不存在');
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
            $map['title|description|content'] = array('like', "%{$rec['key']}%", 'or');
            $result=$this->article->where($map)->page($rec['page_num'],$rec['page_size'])->order('update_time desc')->select();
            if($result){
                return $this->successReturn('success',$result);
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
            if(isset($rec['type'])){
                $result=$this->article->where('type','=',$rec['type'])->page($rec['page_num'],$rec['page_size'])->order('update_time desc')->select();
            }
            if(isset($rec['status'])){
                $result=$this->article->where('status','=',$rec['status'])->page($rec['page_num'],$rec['page_size'])->order('update_time desc')->select();
            }
            if(isset($rec['type']) && isset($rec['status'])){
                $result=$this->article->where('status','=',$rec['status'])->where('type','=',$rec['type'])->page($rec['page_num'],$rec['page_size'])->order('update_time desc')->select();
            }
            if(!isset($rec['type']) && !isset($rec['status'])){
                $result=$this->article->page($rec['page_num'],$rec['page_size'])->order('update_time desc')->select();
            }

            if($result){
                return $this->successReturn('success',$result);
            }else if(empty($result)){
                return $this->successReturn('success',[]);
            }else{
                return $this->errorReturn($this->article->getError());
            }
        }else{
            return $this->errorReturn($this->articleValidate->getError());
        }
    }
}