<?php
/**
 * Created by PhpStorm.
 * User: zhangbin
 * Date: 2018/10/15
 * Time: 14:58
 */

namespace app\admin\controller;

use app\admin\model\DraftModel;
use app\admin\model\DraftValidate;
use think\console\command\make\Model;
use think\Controller;

class Draft extends Base
{
    protected $article;
    protected $articleValidate;

    public function __construct()
    {
        parent::__construct();
        $this->article = new DraftModel();
        $this->articleValidate = new DraftValidate();
    }

    public function index()
    {
        return $this->successReturn('admin/draft/index');
    }

    public function createDraft()
    {
        $rec = $_POST;
        if (isset($_POST['title'])) {
            $rec = $_POST;
        } else {
            $request_data = file_get_contents('php://input');
            $rec = json_decode($request_data, true);
        }
        $res = $this->articleValidate->check($rec, '', 'createArticle');
        if (isset($rec['id'])) {
            $if_draft=$this->updateDraft($rec);
            if($if_draft){
                return $this->successReturn();
            }else{
                return $this->errorReturn();
            }

        }
        if ($res) {
            $rec['update_time'] = $rec['create_time'];
            $result = $this->article->insert($rec);
            if ($result) {
                return $this->successReturn();
            } else {
                return $this->errorReturn($this->article->getError());
            }
        } else {
            return $this->errorReturn($this->articleValidate->getError());
        }
    }

    public function updateDraft($rec)
    {
        $result = $this->article->where('id', '=', $rec['id'])->update($rec);
        if ($result) {
            return true;
        } else if (empty($result)) {
            return true;
        } else {
            return false;
        }
    }

    public function deleteDraft()
    {
        $rec = $_POST;
        if (isset($_POST['id'])) {
            $rec = $_POST;
        } else {
            $request_data = file_get_contents('php://input');
            $rec = json_decode($request_data, true);
        }
        $res = $this->articleValidate->check($rec, '', 'deleteArticle');
        if ($res) {
            $map["id"] = array("in", json_decode($rec['id'], true));
            $result = $this->article->where($map)->delete();
            if ($result) {
                return $this->successReturn();
            } else if (empty($result)) {
                return $this->errorReturn('id is not found');
            } else {
                return $this->errorReturn($this->article->getError());
            }
        } else {
            return $this->errorReturn($this->articleValidate->getError());
        }
    }

    public function searchDraft()
    {
        $rec = $_GET;
        $res = $this->articleValidate->check($rec, '', 'searchArticle');
        if ($res) {
            $map['title|description'] = array('like', "%{$rec['key']}%", 'or');
            if (isset($rec['type'])) {
                $result = $this->article->where($map)->where('type', '=', $rec['type'])->page($rec['page_num'], $rec['page_size'])->field('content', true)->order('update_time desc')->select();
            } else {
                $result = $this->article->where($map)->page($rec['page_num'], $rec['page_size'])->field('content', true)->order('update_time desc')->select();
            }
            $count = count($this->article->where($map)->select());
            if ($result) {
                $r = [
                    'total' => $count,
                    'articles' => $result
                ];
                return $this->successReturn('success', $r);
            } else if (empty($result)) {
                return $this->successReturn('success', []);
            } else {
                return $this->errorReturn($this->article->getError());
            }
        } else {
            return $this->errorReturn($this->articleValidate->getError());
        }
    }

    public function listDraft()
    {
        $rec = $_GET;
        $res = $this->articleValidate->check($rec, '', 'listArticle');
        if ($res) {
            $count = '';
            if (isset($rec['type'])) {
                $result = $this->article->where('type', '=', $rec['type'])->where('is_draft', '=', 1)->page($rec['page_num'], $rec['page_size'])->field('content', true)->order('update_time desc')->select();
                $count = count($this->article->where('type', '=', $rec['type'])->where('is_draft', '=', 1)->select());
            }
            if (isset($rec['status'])) {
                $result = $this->article->where('status', '=', $rec['status'])->where('is_draft', '=', 1)->page($rec['page_num'], $rec['page_size'])->field('content', true)->order('update_time desc')->select();
                $count = count($this->article->where('status', '=', $rec['status'])->where('is_draft', '=', 1)->select());
            }
            if (isset($rec['type']) && isset($rec['status'])) {
                $result = $this->article->where('status', '=', $rec['status'])->where('is_draft', '=', 1)->where('type', '=', $rec['type'])->page($rec['page_num'], $rec['page_size'])->field('content', true)->order('update_time desc')->select();
                $count = count($this->article->where('status', '=', $rec['status'])->where('is_draft', '=', 1)->where('type', '=', $rec['type'])->select());
            }
            if (!isset($rec['type']) && !isset($rec['status'])) {
                $result = $this->article->page($rec['page_num'], $rec['page_size'])->where('is_draft', '=', 1)->field('content', true)->order('update_time desc')->select();
                $count = count($this->article->where('is_draft', '=', 1)->select());
            }

            if ($result) {
                $r = [
                    'total' => $count,
                    'articles' => $result
                ];
                return $this->successReturn('success', $r);
            } else if (empty($result)) {
                return $this->successReturn('success', []);
            } else {
                return $this->errorReturn($this->article->getError());
            }
        } else {
            return $this->errorReturn($this->articleValidate->getError());
        }
    }

    public function detailDraft()
    {
        $rec = $_GET;
        $res = $this->articleValidate->check($rec, '', 'detailArticle');
        if ($res) {
            $result = $this->article->where('id', '=', $rec['id'])->find();
            if ($result) {
                return $this->successReturn('success', $result);
            } elseif (empty($result)) {
                return $this->successReturn('id is not found', []);
            } else {
                return $this->errorReturn($this->article->getError());
            }
        } else {
            return $this->errorReturn($this->articleValidate->getError());
        }
    }
}