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
        return 'admin/article/index';
    }
    public function createArticle(){
        $articleModel=new Model('article');
    }
}