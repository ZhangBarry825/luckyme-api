<?php
/**
 * Created by PhpStorm.
 * User: zhangbin
 * Date: 2018/10/15
 * Time: 14:58
 */

namespace app\home\controller;

use app\home\model\ArticleModel;
use app\home\model\ArticleValidate;
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
        return $this->successReturn('home/article/index');
    }

    public function searchArticle(){
        $rec=$_GET;
        $res=$this->articleValidate->check($rec,'','searchArticle');
        if($res){
            $map['title|description|content'] = array('like', "%{$rec['key']}%", 'or');
            $result=$this->article->where($map)->page($rec['page_num'],$rec['page_size'])->field('content',true)->order('update_time desc')->select();
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
                $result=$this->article->where('type','=',$rec['type'])->page($rec['page_num'],$rec['page_size'])->field('content',true)->order('update_time desc')->select();
            }
            if(isset($rec['status'])){
                $result=$this->article->where('status','=',$rec['status'])->page($rec['page_num'],$rec['page_size'])->field('content',true)->order('update_time desc')->select();
            }
            if(isset($rec['type']) && isset($rec['status'])){
                $result=$this->article->where('status','=',$rec['status'])->where('type','=',$rec['type'])->page($rec['page_num'],$rec['page_size'])->field('content',true)->order('update_time desc')->select();
            }
            if(!isset($rec['type']) && !isset($rec['status'])){
                $result=$this->article->page($rec['page_num'],$rec['page_size'])->field('content',true)->order('update_time desc')->select();
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
}