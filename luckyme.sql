/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.33.10
 Source Server Type    : MySQL
 Source Server Version : 50637
 Source Host           : 192.168.33.10:3306
 Source Schema         : luckyme

 Target Server Type    : MySQL
 Target Server Version : 50637
 File Encoding         : 65001

 Date: 16/12/2018 11:34:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章状态',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章封面',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章描述',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `type` int(11) NULL DEFAULT NULL COMMENT '文章分类',
  `create_time` int(20) NULL DEFAULT NULL COMMENT '文章创建时间',
  `update_time` int(20) NULL DEFAULT NULL COMMENT '文章更新时间',
  `looked` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '浏览次数',
  `is_draft` int(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否为草稿',
  `liked` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '喜欢人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (7, '终有弱水替沧海，再把相思寄巫山', 'normal', 'static/uploads/20181215/6a8ec6e61c11c9484d2a88f8de82775e.jpg', '孤独伴随着夜晚沮丧的泪水。 换一个思维过这开心的生活。', '<p>孤独伴随着夜晚沮丧的泪水。 换一个思维过这开心的生活。</p>', 1543666734, 1544857939, 1544857939, 53, 0, 0);
INSERT INTO `article` VALUES (8, '我们都曾畏惧告别', 'normal', 'static/uploads/20181215/92d068e6d033a5bc2e255daec8ee06fc.jpg', '我和他总是在学校的食堂里相遇。每次遇见他，我总是拉着自己的饭友跑到一个偏僻的角落里就餐。', '<p>我和他总是在学校的食堂里相遇。每次遇见他，我总是拉着自己的饭友跑到一个偏僻的角落里就餐。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />我不想让他看到我吃饭时的样子。可他还是看到了，而且还看得特别认真。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />余生，我们一起吃饭<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />放月假后，我和小伙伴在校门前的小餐馆门外吃米线。米线刚上来，我一歪头，便看到了他。他穿着一身黑色的运动服，在公交站牌处等车。我赶紧埋下头，噘着小嘴用力地吹着筷子夹起来的米线。可事总与愿违，我感觉这是我这辈子吃过的最烫的米线了。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />我平时吃饭要比常人慢些，这次我的小伙伴等得有点儿小着急。我拿纸巾擦了擦鼻尖上的汗珠，小心地对小伙伴说我吃完了。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />公交站牌离小餐馆不远，我眼睛的余光似乎时刻能感受到他的注视。好尴尬啊！世界这么大，我想捕捉他的身影时，总是找不到他的脸。可我不想被他撞见时，偏偏又找不到理由逃脱。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />转眼间，相识已十年。真的好奇怪，我俩竟然都不记得第一次一起吃饭具体吃了什么。但他说他依稀记得他第一次见我吃饭时的情景，他说那是他第一次见吃碗米线能吃那么久的人。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />他从老家跑到市区陪我过生日。我偷偷从家里溜出来，问他中午打算吃什么，他说不知道。我们边走边看，随意进了一家冷清的餐馆，点了一个红烧鱼块，一个香菇炒油菜。结果，红烧鱼块很难吃，香菇炒油菜也好不到哪里去。事后，我给小伙伴吐槽。小伙伴说我好傻，两个人去吃小火锅岂不是更好些？<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />我和他没吃过什么有特色的小火锅。反倒有一次特别狼狈，外面下着大雨，火锅店里下着小雨。店家用脸盆接着雨水，滴答滴答地，在我的眼前。他时不时地扭头看看脸盆里的水，嘴里还念叨着：这雨一会儿就停。那个时候，我特别希望他不要坐我对面，坐我身边多好。这样，他既看不到我吃饭时的样子，还能和我一起赏雨。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />我吃饭比较挑。我不挑味道，一道素菜，甚至不放油，不放盐，清水煮一下，我都能咽下去。但是我受不了菜太咸，或者菜没择干净，比如青菜泛黄的部分，土豆发芽的部分，白菜开花的部分。要是喝个小米粥，我会把颜色发黑的小米粒挨个挑在我的碗沿边上。我自己也着实觉得这个毛病不好，碗沿边上一般被我挑出四五个黑米粒来，我便自觉地拿卫生纸抹掉这些黑米粒。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />可能年岁不够老，可能没去过比较高级的餐厅，目前为止，我脑海里没有一家可以让自己成为常客的餐厅。第一次去一家餐厅，觉得这道菜不错，等下次兴致勃勃为这道菜而来时，发觉已不是上次来时的那个味道。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />我不吃西餐，确切地说，是我不吃牛排。和他吃了一次牛排后，我痛苦了一周。我这个每隔2个小时就要进食一次的人的肠胃竟然消化不了那个东西。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />他带着我去那家好多人给他推荐过的烤肉店。我问他吃过没。他说没有，一直想等着和我一起尝试下。我对烤肉没有特别的喜爱，第一次去那家烤肉店，需要排队。我才没有耐心等别人吃完了腾地方。我拉着他就走，他说你看别人都在排队等着，要不咱也等会儿吧？<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />改天你闲了，自己来吃吧。我又不是非要吃烤肉，我只是饿了，想吃饭。我淡淡地回他。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />他一脸不开心：我自己哪里这么馋，这么喜欢吃烤肉了？只是想和你一起尝试啊。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />我不松口，他说那明天咱俩早点儿来，今天去吃炒鸡吧。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />结果第二天下雨了。但我不想再扫他的兴致。担心排队问题，我俩反而来早了，又在等店家开门。或许真是别致的烤肉店吧，在雨里撑伞等着的人，不只我们两个。店家开门后，还一直在收拾杂活，等了好久好久，才开吃。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />这家烤肉店的餐具是老式的茶缸，满墙都贴着旧报纸。等我吃上第一口烤肉后，他小心地问我味道如何。我笑着反问他：你说呢？他偷偷地笑了：也就那样呗。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />我安慰他：吃什么不重要，好不好吃也不重要，重要的是和谁一起吃。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />饭后，我们撑着伞在湖边走了好久。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />也不知道他是怎么忍受我这个人的。似乎每次吃饭，我总能找出毛病来。不是环境不好，就是餐具不干净，不是饭菜不行，就是服务差劲。可能我俩更适合在家里自己做饭吃吧。可自从他在我家做了一次豆角炒肉片后，再不敢进我家厨房了。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />其实我感觉炒得还可以，只是酱油放多了，菜相难看而已。但他感觉我爸妈会嫌弃，反倒直接不动手做菜了。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />和他在一起，吃得最多的算是火锅吧，只是底料和做法不同，鱼，虾，羊肉，或烤或闷或煮。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />一个哥哥说爱情可以折现。我有些纳闷。哥哥解释道：和自己爱的人在一起，吃碗凉皮都幸福，你根本不会考虑这顿饭能花对方多少钱。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />好像也挺对啊。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />只愿余生，我都能和他一起吃饭。且穷，且快乐。</p>', 1543630495, 1544858173, 1544858173, 43, 0, 0);
INSERT INTO `article` VALUES (9, '我用十天，喜欢上一位未曾蒙面的姑娘', 'normal', 'static/uploads/20181215/46052d8d62a01165067508fb4ed57d78.jpg', '只愿余生，都能与她一起吃饭。', '<p>我和他总是在学校的食堂里相遇。每次遇见他，我总是拉着自己的饭友跑到一个偏僻的角落里就餐。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />我不想让他看到我吃饭时的样子。可他还是看到了，而且还看得特别认真。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />余生，我们一起吃饭<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />放月假后，我和小伙伴在校门前的小餐馆门外吃米线。米线刚上来，我一歪头，便看到了他。他穿着一身黑色的运动服，在公交站牌处等车。我赶紧埋下头，噘着小嘴用力地吹着筷子夹起来的米线。可事总与愿违，我感觉这是我这辈子吃过的最烫的米线了。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />我平时吃饭要比常人慢些，这次我的小伙伴等得有点儿小着急。我拿纸巾擦了擦鼻尖上的汗珠，小心地对小伙伴说我吃完了。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />公交站牌离小餐馆不远，我眼睛的余光似乎时刻能感受到他的注视。好尴尬啊！世界这么大，我想捕捉他的身影时，总是找不到他的脸。可我不想被他撞见时，偏偏又找不到理由逃脱。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />转眼间，相识已十年。真的好奇怪，我俩竟然都不记得第一次一起吃饭具体吃了什么。但他说他依稀记得他第一次见我吃饭时的情景，他说那是他第一次见吃碗米线能吃那么久的人。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />他从老家跑到市区陪我过生日。我偷偷从家里溜出来，问他中午打算吃什么，他说不知道。我们边走边看，随意进了一家冷清的餐馆，点了一个红烧鱼块，一个香菇炒油菜。结果，红烧鱼块很难吃，香菇炒油菜也好不到哪里去。事后，我给小伙伴吐槽。小伙伴说我好傻，两个人去吃小火锅岂不是更好些？<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />我和他没吃过什么有特色的小火锅。反倒有一次特别狼狈，外面下着大雨，火锅店里下着小雨。店家用脸盆接着雨水，滴答滴答地，在我的眼前。他时不时地扭头看看脸盆里的水，嘴里还念叨着：这雨一会儿就停。那个时候，我特别希望他不要坐我对面，坐我身边多好。这样，他既看不到我吃饭时的样子，还能和我一起赏雨。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />我吃饭比较挑。我不挑味道，一道素菜，甚至不放油，不放盐，清水煮一下，我都能咽下去。但是我受不了菜太咸，或者菜没择干净，比如青菜泛黄的部分，土豆发芽的部分，白菜开花的部分。要是喝个小米粥，我会把颜色发黑的小米粒挨个挑在我的碗沿边上。我自己也着实觉得这个毛病不好，碗沿边上一般被我挑出四五个黑米粒来，我便自觉地拿卫生纸抹掉这些黑米粒。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />可能年岁不够老，可能没去过比较高级的餐厅，目前为止，我脑海里没有一家可以让自己成为常客的餐厅。第一次去一家餐厅，觉得这道菜不错，等下次兴致勃勃为这道菜而来时，发觉已不是上次来时的那个味道。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />我不吃西餐，确切地说，是我不吃牛排。和他吃了一次牛排后，我痛苦了一周。我这个每隔2个小时就要进食一次的人的肠胃竟然消化不了那个东西。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />他带着我去那家好多人给他推荐过的烤肉店。我问他吃过没。他说没有，一直想等着和我一起尝试下。我对烤肉没有特别的喜爱，第一次去那家烤肉店，需要排队。我才没有耐心等别人吃完了腾地方。我拉着他就走，他说你看别人都在排队等着，要不咱也等会儿吧？<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />改天你闲了，自己来吃吧。我又不是非要吃烤肉，我只是饿了，想吃饭。我淡淡地回他。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />他一脸不开心：我自己哪里这么馋，这么喜欢吃烤肉了？只是想和你一起尝试啊。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />我不松口，他说那明天咱俩早点儿来，今天去吃炒鸡吧。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />结果第二天下雨了。但我不想再扫他的兴致。担心排队问题，我俩反而来早了，又在等店家开门。或许真是别致的烤肉店吧，在雨里撑伞等着的人，不只我们两个。店家开门后，还一直在收拾杂活，等了好久好久，才开吃。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />这家烤肉店的餐具是老式的茶缸，满墙都贴着旧报纸。等我吃上第一口烤肉后，他小心地问我味道如何。我笑着反问他：你说呢？他偷偷地笑了：也就那样呗。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />我安慰他：吃什么不重要，好不好吃也不重要，重要的是和谁一起吃。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />饭后，我们撑着伞在湖边走了好久。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />也不知道他是怎么忍受我这个人的。似乎每次吃饭，我总能找出毛病来。不是环境不好，就是餐具不干净，不是饭菜不行，就是服务差劲。可能我俩更适合在家里自己做饭吃吧。可自从他在我家做了一次豆角炒肉片后，再不敢进我家厨房了。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />其实我感觉炒得还可以，只是酱油放多了，菜相难看而已。但他感觉我爸妈会嫌弃，反倒直接不动手做菜了。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />和他在一起，吃得最多的算是火锅吧，只是底料和做法不同，鱼，虾，羊肉，或烤或闷或煮。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />一个哥哥说爱情可以折现。我有些纳闷。哥哥解释道：和自己爱的人在一起，吃碗凉皮都幸福，你根本不会考虑这顿饭能花对方多少钱。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />好像也挺对啊。<br data-v-2a5bcdc4=\"\" /><br data-v-2a5bcdc4=\"\" />只愿余生，我都能和他一起吃饭。且穷，且快乐。</p>', 1543666734, 1544876238, 1544876238, 52, 0, 0);

-- ----------------------------
-- Table structure for article_type
-- ----------------------------
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '分类标识',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `en_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文分类名',
  `cn_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文分类名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article_type
-- ----------------------------
INSERT INTO `article_type` VALUES (15, 1543630495, 1543630495, 1543630495, 'XLLC', '心路历程');
INSERT INTO `article_type` VALUES (17, 1543666734, 1543666734, 1543666734, 'QGSJ', '情感世界');

-- ----------------------------
-- Table structure for draft
-- ----------------------------
DROP TABLE IF EXISTS `draft`;
CREATE TABLE `draft`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章状态',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章封面',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章描述',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '文章内容',
  `type` int(11) NULL DEFAULT NULL COMMENT '文章分类',
  `create_time` int(20) NULL DEFAULT NULL COMMENT '文章创建时间',
  `update_time` int(20) NULL DEFAULT NULL COMMENT '文章更新时间',
  `looked` int(11) UNSIGNED ZEROFILL NOT NULL DEFAULT 00000000000 COMMENT '浏览次数',
  `is_draft` int(1) UNSIGNED NULL DEFAULT 1 COMMENT '是否为草稿',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of draft
-- ----------------------------
INSERT INTO `draft` VALUES (23, '123666786', 'normal', '', '123', '<p>123</p>', 1543630495, 1544839511, 1544839511, 00000000000, 1);
INSERT INTO `draft` VALUES (24, '1236667867', 'normal', '', '123', '<p>123</p>', 1543630495, 1544839511, 1544839511, 00000000000, 1);
INSERT INTO `draft` VALUES (25, '1236667867', 'normal', '', '123', '<p>123</p>', 1543630495, 1544839511, 1544839511, 00000000000, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `create_time` int(11) NULL DEFAULT NULL,
  `roles` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份类型',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '大番薯', 1540396800, 'admin', '/api/static/uploads/20181215/5d9155155b9bab40748108133dfa02f7.jpg', '90后程序员', '火星球', '530027054@qq.com');

SET FOREIGN_KEY_CHECKS = 1;
