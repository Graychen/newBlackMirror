/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : black

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-04-13 21:21:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_action_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_action_log`;
CREATE TABLE `admin_action_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` char(15) NOT NULL DEFAULT '0' COMMENT '执行行为者ip',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '操作URL',
  PRIMARY KEY (`id`),
  KEY `action_ip_ix` (`action_ip`) USING BTREE,
  KEY `user_id_ix` (`user_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行为日志表';

-- ----------------------------
-- Table structure for admin_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `admin_auth_group`;
CREATE TABLE `admin_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户组id,自增主键',
  `module` varchar(20) NOT NULL DEFAULT '' COMMENT '用户组所属模块',
  `type` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '组类型',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `description` varchar(80) NOT NULL DEFAULT '' COMMENT '描述信息',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '用户组状态：为1正常，为0禁用,-1为删除',
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组定义表';

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `group_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(60) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `valid` char(10) NOT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(10) unsigned NOT NULL DEFAULT '0',
  `last_ip` char(15) NOT NULL DEFAULT '0',
  `login_num` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

-- ----------------------------
-- Table structure for adv
-- ----------------------------
DROP TABLE IF EXISTS `adv`;
CREATE TABLE `adv` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `position_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `link` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `loading` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `hist` int(11) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='广告管理';

-- ----------------------------
-- Table structure for adv_position
-- ----------------------------
DROP TABLE IF EXISTS `adv_position`;
CREATE TABLE `adv_position` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `width` int(10) unsigned NOT NULL DEFAULT '0',
  `height` int(10) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `template` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='广告位管理';

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `endtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='公告发布';

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `top` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Table structure for article_category
-- ----------------------------
DROP TABLE IF EXISTS `article_category`;
CREATE TABLE `article_category` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- ----------------------------
-- Table structure for attribute
-- ----------------------------
DROP TABLE IF EXISTS `attribute`;
CREATE TABLE `attribute` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `model_id` mediumint(8) unsigned DEFAULT '0' COMMENT '模型ID',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `value` text COMMENT '属性值(逗号分隔)',
  `spec_ids` text,
  `search` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否支持搜索0不支持1支持',
  `type` tinyint(1) unsigned DEFAULT '1' COMMENT '输入控件的类型,1:单选,2:复选,3:下拉',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `status` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='属性表';

-- ----------------------------
-- Table structure for brand
-- ----------------------------
DROP TABLE IF EXISTS `brand`;
CREATE TABLE `brand` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `logo` varchar(80) NOT NULL DEFAULT '',
  `descript` text NOT NULL,
  `url` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `pushstatus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isrecommend` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='品牌列表';

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `products_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `clientip` char(15) NOT NULL DEFAULT '',
  `key` char(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='购物车';

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `reply` text NOT NULL,
  `reply_time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` char(15) NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品评论表';

-- ----------------------------
-- Table structure for consult
-- ----------------------------
DROP TABLE IF EXISTS `consult`;
CREATE TABLE `consult` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned DEFAULT '0',
  `question` text NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `reply` text NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `reply_time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip_address` char(15) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品咨询表';

-- ----------------------------
-- Table structure for coupons
-- ----------------------------
DROP TABLE IF EXISTS `coupons`;
CREATE TABLE `coupons` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `integral` int(10) unsigned NOT NULL DEFAULT '0',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `limit` smallint(6) unsigned NOT NULL DEFAULT '0',
  `descript` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代金券管理';

-- ----------------------------
-- Table structure for coupons_list
-- ----------------------------
DROP TABLE IF EXISTS `coupons_list`;
CREATE TABLE `coupons_list` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `cid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `sn` varchar(10) NOT NULL DEFAULT '',
  `password` varchar(10) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `value` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned DEFAULT '0',
  `user_name` varchar(60) DEFAULT '',
  `use_time` int(10) unsigned DEFAULT '0',
  `use_order` varchar(20) DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代金券明细列表';

-- ----------------------------
-- Table structure for delivery
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `enname` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `descript` text NOT NULL,
  `type` varchar(200) NOT NULL DEFAULT '',
  `weight` varchar(20) NOT NULL DEFAULT '',
  `insure` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `weightprice` varchar(20) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `pays` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='配送方式表';

-- ----------------------------
-- Table structure for delivery_region
-- ----------------------------
DROP TABLE IF EXISTS `delivery_region`;
CREATE TABLE `delivery_region` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_id` int(8) unsigned NOT NULL DEFAULT '0',
  `weightprice` varchar(20) NOT NULL DEFAULT '',
  `region_id` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='配送地区设置';

-- ----------------------------
-- Table structure for focus
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pic` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页幻灯片';

-- ----------------------------
-- Table structure for friend_link
-- ----------------------------
DROP TABLE IF EXISTS `friend_link`;
CREATE TABLE `friend_link` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `descript` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Table structure for gifts
-- ----------------------------
DROP TABLE IF EXISTS `gifts`;
CREATE TABLE `gifts` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `sn` varchar(60) NOT NULL DEFAULT '',
  `barcode` varchar(30) NOT NULL DEFAULT '',
  `cat_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `keyword` varchar(255) NOT NULL DEFAULT '',
  `brief` varchar(255) NOT NULL DEFAULT '',
  `market_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `cost_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `descript` text NOT NULL,
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `warn_number` tinyint(3) NOT NULL DEFAULT '2',
  `weight` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `hist` int(11) unsigned NOT NULL DEFAULT '0',
  `list_img` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sn` (`sn`,`barcode`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='赠品管理';

-- ----------------------------
-- Table structure for gifts_category
-- ----------------------------
DROP TABLE IF EXISTS `gifts_category`;
CREATE TABLE `gifts_category` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `descript` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='赠品分类表';

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goods_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for goods_attribute
-- ----------------------------
DROP TABLE IF EXISTS `goods_attribute`;
CREATE TABLE `goods_attribute` (
  `goods_id` int(10) NOT NULL DEFAULT '0',
  `attribute_id` int(10) NOT NULL,
  `attribute_value` varchar(255) NOT NULL,
  `type` smallint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort` int(8) NOT NULL DEFAULT '100',
  KEY `goods_id` (`goods_id`,`attribute_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品属性表';

-- ----------------------------
-- Table structure for goods_category
-- ----------------------------
DROP TABLE IF EXISTS `goods_category`;
CREATE TABLE `goods_category` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `parent_id` mediumint(8) NOT NULL DEFAULT '0',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `descript` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `show_in_nav` tinyint(1) NOT NULL DEFAULT '0',
  `grade` text NOT NULL COMMENT '价格分级',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `sort` int(8) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
-- Table structure for goods_detail
-- ----------------------------
DROP TABLE IF EXISTS `goods_detail`;
CREATE TABLE `goods_detail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `category_id` int(10) unsigned NOT NULL COMMENT '类目id',
  `category_children_id` int(10) unsigned NOT NULL COMMENT '子类目id',
  `supplier_id` int(10) unsigned NOT NULL COMMENT '供应商id',
  `goods_spec` text NOT NULL COMMENT '商品内容',
  `price_min` double NOT NULL COMMENT '最低价格',
  `price_max` double NOT NULL COMMENT '最高价格',
  `goods_val` text NOT NULL COMMENT '商品值',
  `spec` text NOT NULL COMMENT '规格html',
  `spec_val` char(255) NOT NULL COMMENT 'spec的值',
  `goods_name` char(255) NOT NULL COMMENT '商品名称',
  `img_list` text NOT NULL COMMENT '展示图',
  `img_html` text NOT NULL COMMENT 'img_html代码',
  `postage` text NOT NULL COMMENT '物流信息',
  `postage_html` text NOT NULL COMMENT '物流html',
  `goods_details` text NOT NULL COMMENT '商品详情',
  `sales` int(10) unsigned NOT NULL COMMENT '销量',
  `sort` smallint(5) unsigned NOT NULL COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '状态',
  `create_time` int(10) unsigned NOT NULL COMMENT '创建时间',
  `min_order` double NOT NULL COMMENT '最小订单量',
  `recommend_status` tinyint(4) NOT NULL COMMENT '是否是应用领域推荐产品',
  `today_status` tinyint(4) NOT NULL COMMENT '是否是今日推荐产品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='商品信息';

-- ----------------------------
-- Table structure for goods_message
-- ----------------------------
DROP TABLE IF EXISTS `goods_message`;
CREATE TABLE `goods_message` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '产品ID',
  `goods_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_name` varchar(120) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号码',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `notify_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '通知时间',
  `clientip` char(15) NOT NULL DEFAULT '' COMMENT '操作IP',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '通知状态（-1：已忽略；0：未通知；1：已通知；）',
  PRIMARY KEY (`id`),
  KEY `goods_id` (`goods_id`) USING BTREE,
  KEY `goods_id, product_id` (`goods_id`,`product_id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品通知表';

-- ----------------------------
-- Table structure for goods_products
-- ----------------------------
DROP TABLE IF EXISTS `goods_products`;
CREATE TABLE `goods_products` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `goods_id` mediumint(8) NOT NULL DEFAULT '0',
  `products_sn` varchar(60) NOT NULL DEFAULT '',
  `products_barcode` varchar(60) NOT NULL DEFAULT '',
  `spec_array` text NOT NULL,
  `shop_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `market_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `cost_price` decimal(10,2) NOT NULL,
  `min_shop_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `max_shop_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_number` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='产品表';

-- ----------------------------
-- Table structure for goods_promotion
-- ----------------------------
DROP TABLE IF EXISTS `goods_promotion`;
CREATE TABLE `goods_promotion` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `start_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `award_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `award_value` varchar(255) NOT NULL DEFAULT '',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `group` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品促销表';

-- ----------------------------
-- Table structure for help
-- ----------------------------
DROP TABLE IF EXISTS `help`;
CREATE TABLE `help` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `fpid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `identifier` varchar(20) NOT NULL DEFAULT '',
  `keyword` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '',
  `message` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`),
  KEY `displayplay` (`status`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='帮助中心';

-- ----------------------------
-- Table structure for id_group_node
-- ----------------------------
DROP TABLE IF EXISTS `id_group_node`;
CREATE TABLE `id_group_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `module` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for id_user_group
-- ----------------------------
DROP TABLE IF EXISTS `id_user_group`;
CREATE TABLE `id_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '模型ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '模型名称',
  `cat_ids` text COMMENT '分类ID逗号分隔',
  `sort` tinyint(1) DEFAULT '100',
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模型表';

-- ----------------------------
-- Table structure for msg_template
-- ----------------------------
DROP TABLE IF EXISTS `msg_template`;
CREATE TABLE `msg_template` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='消息模板表';

-- ----------------------------
-- Table structure for navigation
-- ----------------------------
DROP TABLE IF EXISTS `navigation`;
CREATE TABLE `navigation` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '导航名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `enable` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（默认为1）',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `title` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='站点导航设置';

-- ----------------------------
-- Table structure for node
-- ----------------------------
DROP TABLE IF EXISTS `node`;
CREATE TABLE `node` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单ID',
  `name` char(40) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `g` char(20) NOT NULL DEFAULT '' COMMENT '所属控制器',
  `m` char(20) NOT NULL DEFAULT '' COMMENT '所属模块',
  `a` char(20) NOT NULL DEFAULT '' COMMENT '所属操作',
  `data` char(100) NOT NULL DEFAULT '' COMMENT '附加操作',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `url` char(255) NOT NULL DEFAULT '',
  `pluginid` smallint(6) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `listorder` (`sort`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE,
  KEY `module` (`m`,`g`,`a`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='菜单&权限节点表';

-- ----------------------------
-- Table structure for notify
-- ----------------------------
DROP TABLE IF EXISTS `notify`;
CREATE TABLE `notify` (
  `code` varchar(50) NOT NULL DEFAULT '',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '启用状态',
  `config` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='通知系统配置信息';

-- ----------------------------
-- Table structure for notify_template
-- ----------------------------
DROP TABLE IF EXISTS `notify_template`;
CREATE TABLE `notify_template` (
  `id` varchar(100) NOT NULL DEFAULT '' COMMENT '嵌入点名称',
  `driver` text NOT NULL,
  `template` text NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '模版注释',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='通知模版设置';

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `user_id` mediumint(10) unsigned NOT NULL DEFAULT '0',
  `pay_code` varchar(100) NOT NULL COMMENT '支付方式(0:在线支付;1:货到付款)',
  `delivery_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '配送方式ID',
  `delivery_txt` varchar(100) NOT NULL DEFAULT '' COMMENT '配送方式名称',
  `delivery_sn` varchar(100) NOT NULL DEFAULT '' COMMENT '快递单号',
  `source` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `trade_no` varchar(100) NOT NULL,
  `order_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `delivery_status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(20) NOT NULL DEFAULT '',
  `accept_name` varchar(20) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `zipcode` varchar(6) NOT NULL DEFAULT '',
  `telphone` varchar(20) NOT NULL DEFAULT '',
  `province` int(10) unsigned NOT NULL DEFAULT '0',
  `city` int(10) unsigned NOT NULL DEFAULT '0',
  `area` int(10) unsigned NOT NULL DEFAULT '0',
  `address` varchar(250) NOT NULL DEFAULT '',
  `payable_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `real_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '实付订单金额',
  `payable_freight` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `taxes` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `insured` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `coupons_id` mediumint(8) NOT NULL DEFAULT '0',
  `coupons` decimal(15,2) NOT NULL DEFAULT '0.00',
  `integral` decimal(15,2) NOT NULL DEFAULT '0.00',
  `pay_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单支付时间',
  `confirm_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单确认时间',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发货时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下单时间',
  `completion_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '订单完成时间',
  `postscript` varchar(255) NOT NULL DEFAULT '',
  `invoice_title` varchar(100) NOT NULL DEFAULT '',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `promotion_id` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '订单促销ID',
  `promotion_msg` varchar(255) NOT NULL DEFAULT '' COMMENT '订单促销描述',
  `give_point` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '订单赠送积分',
  `give_coupons_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '赠送的优惠券',
  `is_comment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `balance_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额付款金额',
  `country_code_tel` varchar(64) NOT NULL,
  `area_code_tel` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单管理表';

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `order_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(255) NOT NULL,
  `barcode` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `attribute` varchar(255) NOT NULL DEFAULT '',
  `shop_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `integral` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '使用积分情况',
  `shop_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `goods_number` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spec_array` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `cat_ids` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分类',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '品牌ID',
  `promotion_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `give_point` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '赠送积分',
  `give_coupons_id` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '赠送优惠券',
  `supplier_id` int(10) unsigned NOT NULL COMMENT '供应商id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单商品明细表';

-- ----------------------------
-- Table structure for order_log
-- ----------------------------
DROP TABLE IF EXISTS `order_log`;
CREATE TABLE `order_log` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `user_name` varchar(60) NOT NULL DEFAULT '',
  `msg` text NOT NULL,
  `action` varchar(50) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `clientip` char(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单日志记录表';

-- ----------------------------
-- Table structure for order_parcel
-- ----------------------------
DROP TABLE IF EXISTS `order_parcel`;
CREATE TABLE `order_parcel` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(20) NOT NULL COMMENT '订单号',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态（-1：无法配货；0：待配货；1：配货中；2：已配货；）',
  `dateline` int(10) unsigned NOT NULL,
  `accept_name` varchar(20) NOT NULL,
  `province` int(10) NOT NULL,
  `city` int(10) NOT NULL,
  `area` int(10) NOT NULL,
  `mobile` varchar(60) NOT NULL,
  `delivery_txt` varchar(100) NOT NULL,
  `goods_list` text NOT NULL,
  `address` varchar(250) NOT NULL,
  `total_number` smallint(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='发货单管理';

-- ----------------------------
-- Table structure for order_parcel_log
-- ----------------------------
DROP TABLE IF EXISTS `order_parcel_log`;
CREATE TABLE `order_parcel_log` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(20) NOT NULL,
  `user_id` mediumint(8) NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `msg` text NOT NULL,
  `action` varchar(50) NOT NULL,
  `dateline` int(10) NOT NULL,
  `clientip` char(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

-- ----------------------------
-- Table structure for order_promotion
-- ----------------------------
DROP TABLE IF EXISTS `order_promotion`;
CREATE TABLE `order_promotion` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `award_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `award_value` varchar(255) NOT NULL DEFAULT '',
  `money` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `group` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单促销表';

-- ----------------------------
-- Table structure for order_track
-- ----------------------------
DROP TABLE IF EXISTS `order_track`;
CREATE TABLE `order_track` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(20) NOT NULL DEFAULT '',
  `track_msg` text NOT NULL,
  `isstyem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dateline` int(10) unsigned NOT NULL,
  `clientip` char(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `order_sn` (`order_sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='订单跟踪';

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for pay
-- ----------------------------
DROP TABLE IF EXISTS `pay`;
CREATE TABLE `pay` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '递增ID',
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '支付接口',
  `trade_sn` varchar(50) NOT NULL DEFAULT '' COMMENT '唯一订单号',
  `subject` varchar(250) NOT NULL DEFAULT '' COMMENT '商品名称',
  `total_fee` float(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '交易总额（单位：分）',
  `buyer_email` varchar(100) NOT NULL DEFAULT '' COMMENT '买家支付宝账号',
  `method` varchar(50) NOT NULL DEFAULT '' COMMENT '支付方式',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '支付状态（0：未支付；1：已支付）',
  `trade_no` char(64) NOT NULL DEFAULT '' COMMENT '支付宝交易号',
  `notify_id` varchar(200) NOT NULL DEFAULT '' COMMENT '通知校验ID',
  `notify_time` int(1) unsigned NOT NULL DEFAULT '0' COMMENT '通知时间',
  `dateline` int(10) unsigned DEFAULT '0' COMMENT '订单时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='在线充值记录';

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `pay_code` varchar(50) NOT NULL DEFAULT '',
  `pay_ico` varchar(100) NOT NULL DEFAULT '',
  `pay_name` varchar(120) NOT NULL DEFAULT '',
  `pay_fee` varchar(5) NOT NULL DEFAULT '',
  `pay_desc` text NOT NULL,
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '启用状态',
  `config` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `isonline` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否在线支付',
  `applies` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='支付方式配置信息';

-- ----------------------------
-- Table structure for plugin
-- ----------------------------
DROP TABLE IF EXISTS `plugin`;
CREATE TABLE `plugin` (
  `pluginid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `available` tinyint(1) NOT NULL DEFAULT '0',
  `adminid` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL DEFAULT '',
  `identifier` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `datatables` varchar(255) NOT NULL DEFAULT '',
  `directory` varchar(100) NOT NULL DEFAULT '',
  `copyright` varchar(100) NOT NULL DEFAULT '',
  `modules` text NOT NULL,
  `version` varchar(20) NOT NULL DEFAULT '',
  `author` varchar(250) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`pluginid`),
  UNIQUE KEY `identifier` (`identifier`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Table structure for pluginvar
-- ----------------------------
DROP TABLE IF EXISTS `pluginvar`;
CREATE TABLE `pluginvar` (
  `pluginvarid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pluginid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `variable` varchar(40) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT 'text',
  `value` text NOT NULL,
  `extra` text NOT NULL,
  PRIMARY KEY (`pluginvarid`),
  KEY `pluginid` (`pluginid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件变量表';

-- ----------------------------
-- Table structure for points_promotion
-- ----------------------------
DROP TABLE IF EXISTS `points_promotion`;
CREATE TABLE `points_promotion` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `descript` varchar(255) NOT NULL DEFAULT '',
  `gifts_id` text NOT NULL,
  `start_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `points` int(10) unsigned NOT NULL DEFAULT '0',
  `award_value` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='积分促销';

-- ----------------------------
-- Table structure for postage
-- ----------------------------
DROP TABLE IF EXISTS `postage`;
CREATE TABLE `postage` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '首件',
  `type_id` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL COMMENT '0:美国 1:其它',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `first` varchar(11) DEFAULT NULL COMMENT '首件价格',
  `other` varchar(11) DEFAULT NULL COMMENT '其它价格',
  `status` int(11) DEFAULT '0' COMMENT '0禁用1启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for postage_type
-- ----------------------------
DROP TABLE IF EXISTS `postage_type`;
CREATE TABLE `postage_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `name` varchar(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for print_tpl_delivery
-- ----------------------------
DROP TABLE IF EXISTS `print_tpl_delivery`;
CREATE TABLE `print_tpl_delivery` (
  `delivery_id` smallint(3) unsigned NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `content` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`delivery_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='快递单打印模板';

-- ----------------------------
-- Table structure for print_tpl_parcel
-- ----------------------------
DROP TABLE IF EXISTS `print_tpl_parcel`;
CREATE TABLE `print_tpl_parcel` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `parcel_name` varchar(50) NOT NULL,
  `status` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='发货单打印模板';

-- ----------------------------
-- Table structure for regiment
-- ----------------------------
DROP TABLE IF EXISTS `regiment`;
CREATE TABLE `regiment` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `descript` varchar(255) NOT NULL DEFAULT '',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `sum_count` int(11) unsigned NOT NULL DEFAULT '0',
  `least_count` int(11) unsigned NOT NULL DEFAULT '0',
  `regiment_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='团购营销';

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `area_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上一级的id值',
  `area_name` varchar(50) NOT NULL DEFAULT '' COMMENT '地区名称',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`area_id`)
) ENGINE=MyISAM AUTO_INCREMENT=910016 DEFAULT CHARSET=utf8 COMMENT='地区信息';

-- ----------------------------
-- Table structure for reg_promotion
-- ----------------------------
DROP TABLE IF EXISTS `reg_promotion`;
CREATE TABLE `reg_promotion` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `coupons_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pay_points` int(10) unsigned NOT NULL DEFAULT '0',
  `start_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='注册营销';

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(11) DEFAULT NULL,
  `keyowds` varchar(30) DEFAULT NULL COMMENT '关键词',
  `description` varchar(50) DEFAULT NULL COMMENT '描述',
  `shop_name` varchar(30) DEFAULT NULL COMMENT '商城名称',
  `company_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `filing_info` varchar(50) DEFAULT NULL COMMENT '备案信息',
  `count` varchar(100) DEFAULT NULL COMMENT '网站第三方统计代码',
  `logo` varchar(100) DEFAULT NULL COMMENT 'logo地址'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sms
-- ----------------------------
DROP TABLE IF EXISTS `sms`;
CREATE TABLE `sms` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `stype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='站内信';

-- ----------------------------
-- Table structure for spec
-- ----------------------------
DROP TABLE IF EXISTS `spec`;
CREATE TABLE `spec` (
  `id` smallint(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '格式类型',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='规格列表';

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `shopkeeper` varchar(16) NOT NULL COMMENT '供应商店主',
  `sex` tinyint(1) NOT NULL,
  `shop_name` varchar(128) NOT NULL COMMENT '供应商店名',
  `tel` varchar(20) NOT NULL,
  `province` int(5) unsigned NOT NULL DEFAULT '0',
  `city` int(5) unsigned NOT NULL DEFAULT '0',
  `district` int(5) unsigned NOT NULL DEFAULT '0',
  `address` varchar(120) NOT NULL DEFAULT '',
  `email` varchar(32) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for supplier_analyze
-- ----------------------------
DROP TABLE IF EXISTS `supplier_analyze`;
CREATE TABLE `supplier_analyze` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `supplier_id` mediumint(8) NOT NULL,
  `main_products` varchar(128) NOT NULL COMMENT '主营产品',
  `yield` varchar(16) DEFAULT NULL COMMENT '成品率',
  `completion_date` varchar(64) DEFAULT NULL COMMENT '交货期',
  `production_value` varchar(16) DEFAULT NULL COMMENT '年生产值',
  `saleroom` varchar(32) DEFAULT NULL COMMENT '年销售额',
  `general_comment` tinyint(1) NOT NULL COMMENT '总评',
  `notes` varchar(128) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `update_time` time(6) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for timed_promotion
-- ----------------------------
DROP TABLE IF EXISTS `timed_promotion`;
CREATE TABLE `timed_promotion` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `descript` varchar(255) NOT NULL DEFAULT '',
  `goods_config` text NOT NULL,
  `start_time` int(10) unsigned NOT NULL DEFAULT '0',
  `end_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品促销';

-- ----------------------------
-- Table structure for tt_goods
-- ----------------------------
DROP TABLE IF EXISTS `tt_goods`;
CREATE TABLE `tt_goods` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL DEFAULT '',
  `brand_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `cat_ids` varchar(255) NOT NULL DEFAULT '',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_romanian_ci NOT NULL,
  `brief` varchar(255) NOT NULL,
  `give_integral` int(11) NOT NULL DEFAULT '-1',
  `descript` text NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `warn_number` tinyint(3) NOT NULL DEFAULT '2',
  `weight` decimal(10,2) NOT NULL DEFAULT '0.00',
  `hits` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `favorite` int(11) NOT NULL DEFAULT '0',
  `spec_array` text NOT NULL,
  `list_img` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `status_ext` varchar(100) NOT NULL DEFAULT '',
  `model` int(8) NOT NULL,
  `sales_number` int(10) NOT NULL DEFAULT '0' COMMENT '销量',
  `sort` int(8) NOT NULL DEFAULT '100',
  `min_shop_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `max_shop_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shop_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `prom_id` mediumint(8) NOT NULL DEFAULT '0',
  `prom_type` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='商品列表';

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) NOT NULL,
  `last_name` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL DEFAULT '',
  `password` varchar(32) NOT NULL DEFAULT '',
  `valid` char(10) NOT NULL DEFAULT '',
  `group_id` smallint(6) unsigned NOT NULL DEFAULT '0',
  `reg_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(10) unsigned NOT NULL DEFAULT '0',
  `last_session` varchar(200) NOT NULL DEFAULT '',
  `repwd_key` varchar(200) NOT NULL DEFAULT '',
  `pay_points` int(10) unsigned NOT NULL DEFAULT '0',
  `exp` int(10) unsigned NOT NULL DEFAULT '0',
  `user_money` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `true_name` varchar(50) NOT NULL DEFAULT '',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL DEFAULT '',
  `answer` varchar(255) NOT NULL DEFAULT '',
  `ico` varchar(255) NOT NULL DEFAULT '',
  `mobile_phone` varchar(20) NOT NULL DEFAULT '',
  `birthday` int(10) unsigned NOT NULL DEFAULT '0',
  `address_id` int(10) unsigned NOT NULL DEFAULT '0',
  `qq` varchar(20) NOT NULL DEFAULT '',
  `msn` varchar(60) NOT NULL DEFAULT '',
  `office_phone` varchar(20) NOT NULL DEFAULT '',
  `home_phone` varchar(20) NOT NULL DEFAULT '',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `norder_keys` text NOT NULL,
  `freeze_money` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`,`mobile_phone`,`last_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员列表';

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `address_name` varchar(50) NOT NULL DEFAULT '',
  `province` varchar(128) NOT NULL DEFAULT '0',
  `city` varchar(128) NOT NULL DEFAULT '0',
  `district` varchar(128) NOT NULL DEFAULT '0',
  `address` varchar(128) NOT NULL DEFAULT '',
  `zipcode` varchar(60) NOT NULL DEFAULT '',
  `tel` varchar(60) NOT NULL DEFAULT '',
  `mobile` varchar(60) NOT NULL DEFAULT '',
  `best_time` varchar(120) NOT NULL DEFAULT '',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `country` varchar(128) NOT NULL,
  `country_code_tel` varchar(64) NOT NULL,
  `area_code_tel` varchar(64) NOT NULL,
  `number_tel` varchar(64) NOT NULL,
  `country_code_fax` varchar(64) DEFAULT NULL,
  `area_code_fax` varchar(64) DEFAULT NULL,
  `number_fax` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='会员收货人信息表';

-- ----------------------------
-- Table structure for user_collect
-- ----------------------------
DROP TABLE IF EXISTS `user_collect`;
CREATE TABLE `user_collect` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员收藏纪录';

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '',
  `min_points` int(10) unsigned NOT NULL DEFAULT '0',
  `max_points` int(10) unsigned NOT NULL DEFAULT '0',
  `discount` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='会员等级组';

-- ----------------------------
-- Table structure for user_moneylog
-- ----------------------------
DROP TABLE IF EXISTS `user_moneylog`;
CREATE TABLE `user_moneylog` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `money` decimal(15,2) NOT NULL DEFAULT '0.00' COMMENT '变动金额',
  `msg` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='财务变动记录表';

-- ----------------------------
-- Table structure for user_oauth
-- ----------------------------
DROP TABLE IF EXISTS `user_oauth`;
CREATE TABLE `user_oauth` (
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `openid` varchar(100) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方绑定表';

-- ----------------------------
-- Table structure for user_pointslog
-- ----------------------------
DROP TABLE IF EXISTS `user_pointslog`;
CREATE TABLE `user_pointslog` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pay_points` int(11) unsigned NOT NULL DEFAULT '0',
  `descript` text NOT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员积分日志表';

-- ----------------------------
-- Table structure for zone
-- ----------------------------
DROP TABLE IF EXISTS `zone`;
CREATE TABLE `zone` (
  `id` smallint(2) NOT NULL AUTO_INCREMENT COMMENT '区域列表',
  `name` varchar(60) NOT NULL DEFAULT '',
  `provinces` text NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(8) unsigned NOT NULL DEFAULT '100',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='区域表';
