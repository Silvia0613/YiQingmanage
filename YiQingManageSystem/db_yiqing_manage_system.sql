good_apply/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_yiqing_manage_system

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2022-03-01 14:44:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `c3p0testtable`
-- ----------------------------
DROP TABLE IF EXISTS `c3p0testtable`;
CREATE TABLE `c3p0testtable` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c3p0testtable
-- ----------------------------

-- ----------------------------
-- Table structure for `clue`
-- ----------------------------
DROP TABLE IF EXISTS `clue`;
CREATE TABLE `clue` (
  `id` char(8) NOT NULL DEFAULT '' COMMENT '线索id',
  `user_id` char(8) NOT NULL DEFAULT '' COMMENT '提供线索的用户',
  `content` varchar(512) NOT NULL DEFAULT '' COMMENT '线索内容描述',
  `create_time` datetime NOT NULL COMMENT '线索上报时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clue
-- ----------------------------
INSERT INTO `clue` VALUES ('27zGmRCn', '2VU2xXhD', 'asdasd', '2022-02-19 12:35:00');
INSERT INTO `clue` VALUES ('efVsnyy7', '2VU2xXhD', 'xxd', '2022-02-27 18:55:34');
INSERT INTO `clue` VALUES ('EMCSwOLU', '2VU2xXhD', '的水电费水电费', '2022-02-28 19:21:26');
INSERT INTO `clue` VALUES ('K93fgvAI', '2VU2xXhD', '啊啊', '2022-02-28 13:37:31');
INSERT INTO `clue` VALUES ('nmDoP903', '2VU2xXhD', 'jjj', '2022-02-27 20:09:35');
INSERT INTO `clue` VALUES ('SFCsVrG3', 'dQUjVwno', '啊啊', '2022-02-28 16:21:48');
INSERT INTO `clue` VALUES ('Wp9ErX5a', 'dQUjVwno', '撒大声地', '2022-02-28 20:26:21');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` char(8) NOT NULL DEFAULT '' COMMENT '评论id',
  `news_id` char(8) NOT NULL DEFAULT '' COMMENT '评论对应的新闻id',
  `user_id` char(8) NOT NULL DEFAULT '' COMMENT '评论对应的用户id',
  `content` varchar(256) NOT NULL DEFAULT '' COMMENT '评论内容',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('bHJE7bwg', 'a1FpV3uU', 'dQUjVwno', '寄了', '2022-03-01 09:36:53');
INSERT INTO `comment` VALUES ('cexXBIjB', 'bB8QC7TK', 'dQUjVwno', '杨杨吖 QQ：823208782', '2022-03-01 09:38:05');
INSERT INTO `comment` VALUES ('SxLte2I7', 'bB8QC7TK', 'dQUjVwno', '打疫苗 very good', '2022-03-01 09:37:08');
INSERT INTO `comment` VALUES ('vSngPX25', 'cjDBX6eG', 'dQUjVwno', '杨杨吖自制的项目，最大希望这项目被别倒卖', '2022-03-01 09:37:47');
INSERT INTO `comment` VALUES ('YuPngqz8', 'S3kOuwus', 'dQUjVwno', '啊啊啊', '2022-02-28 21:36:35');

-- ----------------------------
-- Table structure for `daily_report`
-- ----------------------------
DROP TABLE IF EXISTS `daily_report`;
CREATE TABLE `daily_report` (
  `id` char(8) NOT NULL DEFAULT '' COMMENT '打卡id',
  `location` varchar(128) NOT NULL DEFAULT '' COMMENT '打卡位置',
  `create_time` datetime NOT NULL COMMENT '打卡时间',
  `user_id` char(8) NOT NULL DEFAULT '' COMMENT '打卡用户',
  `note` varchar(512) NOT NULL DEFAULT '' COMMENT '备注',
  `health_status` int(2) NOT NULL DEFAULT '1' COMMENT '健康状态：1：健康；2：有发烧、咳嗽等症状；3：其他症状',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of daily_report
-- ----------------------------
INSERT INTO `daily_report` VALUES ('dWgbkSzu', '福建省福州市鼓楼区崎上路51', '2022-02-27 20:25:00', '2VU2xXhD', '', '1');
INSERT INTO `daily_report` VALUES ('fxAGyqgL', '福建省福州市鼓楼区北环西路152号', '2022-02-28 19:21:39', '2VU2xXhD', '大电视', '1');
INSERT INTO `daily_report` VALUES ('LE4rzClw', '234', '2022-02-22 15:41:42', '2VU2xXhD', '32', '3');
INSERT INTO `daily_report` VALUES ('swSl3rRC', '福建省福州市鼓楼区北环西路152号', '2022-02-28 21:33:41', 'dQUjVwno', '大幅度', '2');

-- ----------------------------
-- Table structure for `good_apply`
-- ----------------------------
DROP TABLE IF EXISTS `good_apply`;
CREATE TABLE `good_apply` (
  `id` char(8) NOT NULL DEFAULT '' COMMENT '物资id',
  `name` varchar(512) NOT NULL DEFAULT '' COMMENT '物质内容',
  `address` varchar(128) NOT NULL DEFAULT '' COMMENT '配送地址',
  `create_time` datetime NOT NULL COMMENT '申请时间',
  `state` int(2) NOT NULL DEFAULT '1' COMMENT '状态：1：待审核；2：审核通过；3：审核不通过',
  `reply` varchar(128) NOT NULL DEFAULT '' COMMENT '审核回复',
  `user_id` char(8) NOT NULL DEFAULT '' COMMENT '物资申请所属用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_apply
-- ----------------------------
INSERT INTO `good_apply` VALUES ('N8vmqFE7', '订单', '啊啊', '2022-02-28 13:37:43', '1', '', '2VU2xXhD');
INSERT INTO `good_apply` VALUES ('tMQXZdy8', '324', '345345', '2022-02-20 21:01:16', '1', '', '2VU2xXhD');
INSERT INTO `good_apply` VALUES ('XFtIglfI', '打发顺丰', '阿萨德水电费', '2022-02-28 19:21:46', '2', 'dsssff', '2VU2xXhD');

-- ----------------------------
-- Table structure for `maps`
-- ----------------------------
DROP TABLE IF EXISTS `maps`;
CREATE TABLE `maps` (
  `id` char(8) NOT NULL DEFAULT '' COMMENT '地图记录id',
  `location` varchar(128) NOT NULL DEFAULT '' COMMENT '疫情发生位置',
  `lng` decimal(16,12) NOT NULL DEFAULT '0.000000000000' COMMENT '经度',
  `lat` decimal(16,12) NOT NULL DEFAULT '0.000000000000' COMMENT '纬度',
  `create_time` datetime NOT NULL COMMENT '登记时间',
  `count` int(4) NOT NULL DEFAULT '1' COMMENT '确诊人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of maps
-- ----------------------------
INSERT INTO `maps` VALUES ('FKzgP4ay', '福建师范大学', '119.315858279993', '26.041657027918', '2022-02-25 12:56:42', '5');
INSERT INTO `maps` VALUES ('x0i4xjth', '福州花海公园', '119.360439924811', '26.046287531447', '2022-02-25 11:03:09', '1');
INSERT INTO `maps` VALUES ('zsRE7Hxn', '福州市三坊七巷', '119.302660734767', '26.092969411416', '2022-02-25 10:18:45', '2');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` char(8) NOT NULL DEFAULT '' COMMENT '新闻id',
  `content` longtext COMMENT '新闻内容',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '新闻标题',
  `user_id` char(8) NOT NULL DEFAULT '' COMMENT '新闻发布者',
  `view_num` int(4) NOT NULL DEFAULT '0' COMMENT '新闻浏览量',
  `comment_num` int(4) NOT NULL DEFAULT '0' COMMENT '新闻评论量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('a1FpV3uU', '<p><span style=\"font-family: &quot;Hiragino Sans GB&quot;, &quot;Microsoft Yahei&quot;, &quot;\\\\5FAE软雅黑&quot;, SimSun, &quot;\\\\5B8B体&quot;, Arial; font-size: 18px; letter-spacing: 1px; background-color: rgb(255, 255, 255);\">中新网3月1日电 据国家卫健委网站消息，2月28日0—24时，31个省(自治区、直辖市)和新疆生产建设兵团报告新增确诊病例200例。其中境外输入病例125例(广东44例，上海40例，北京12例，广西8例，重庆4例，云南4例，福建3例，山东3例，江苏2例，四川2例，天津1例，安徽1例，湖北1例)，含10例由无症状感染者转为确诊病例(广东4例，北京2例，广西2例，山东1例，四川1例)；本土病例75例(广东31例，其中深圳市23例、东莞市7例、中山市1例；内蒙古14例，其中呼和浩特市13例、包头市1例；天津6例，其中滨海新区4例、东丽区2例；广西6例，均在防城港市；云南6例，其中德宏傣族景颇族自治州5例、临沧市1例；黑龙江4例，其中牡丹江市3例、鸡西市1例；江苏3例，均在苏州市；湖北2例，均在武汉市；山西1例，在晋中市；海南1例，在三亚市；四川1例，在成都市)，含3例由无症状感染者转为确诊病例(天津2例，黑龙江1例)。无新增死亡病例。新增疑似病例9例，其中境外输入病例8例(均在上海)，本土病例1例(在内蒙古)。</span></p><p><img src=\"http://localhost:8080/YiQingManageSystem/resources/upload/image/20220301/1646098292330029138.jpg\" title=\"1646098292330029138.jpg\" alt=\"user_img.jpg\"/><img src=\"http://img.baidu.com/hi/jx2/j_0042.gif\"/></p>', '2022-03-01 09:32:41', '31省份新增确诊病例200例 其中本土病例75例', '2VU2xXhD', '6', '1');
INSERT INTO `news` VALUES ('bB8QC7TK', '<p style=\"margin-top: 1.5em; margin-bottom: 1.5em; border: 0px; font-size: 18px; line-height: 2; word-break: break-all; font-family: 微软雅黑, SimSun, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify; padding: 0px 0px 1.5em !important;\">26日，国务院联防联控机制召开新闻发布会，介绍疫情防控和疫苗接种工作有关情况。</p><p style=\"border: 0px; font-size: 18px; word-break: break-all; font-family: 微软雅黑, SimSun, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: center; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px 0px 1.5em !important; line-height: 2.2 !important;\"><img src=\"http://localhost:8080/YiQingManageSystem/resources/upload/image/20220301/1646098386504022162.jpg\"/></p><p style=\"margin-top: 1.5em; margin-bottom: 1.5em; border: 0px; font-size: 18px; line-height: 2; word-break: break-all; font-family: 微软雅黑, SimSun, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify; padding: 0px 0px 1.5em !important;\">近一周15个省份报告新增本土确诊病例</p><p style=\"margin-top: 1.5em; margin-bottom: 1.5em; border: 0px; font-size: 18px; line-height: 2; word-break: break-all; font-family: 微软雅黑, SimSun, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify; padding: 0px 0px 1.5em !important;\">国家卫健委新闻发言人米锋表示，近一周，15个省份报告了新增本土确诊病例。要快速响应，抓住聚集性疫情处置早期关键“窗口期”，坚决果断采取各项防控措施，尽快实现“社会面清零”；要狠抓重点人群、重点场所、重点环节防控举措落实，切实把疫情扩散风险降到最低。</p><p style=\"margin-top: 1.5em; margin-bottom: 1.5em; border: 0px; font-size: 18px; line-height: 2; word-break: break-all; font-family: 微软雅黑, SimSun, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify; padding: 0px 0px 1.5em !important;\">本轮疫情呈德尔塔和奥密克戎变异株叠加流行特点</p><p style=\"margin-top: 1.5em; margin-bottom: 1.5em; border: 0px; font-size: 18px; line-height: 2; word-break: break-all; font-family: 微软雅黑, SimSun, Arial, Helvetica, sans-serif; white-space: normal; background-color: rgb(255, 255, 255); text-align: justify; padding: 0px 0px 1.5em !important;\">国家卫健委疾控局副局长吴良有表示，近期，国内疫情呈现点多、面广、频发，德尔塔和奥密克戎变异株叠加流行的特点。</p><p><br/></p>', '2022-03-01 09:33:20', '本轮疫情有何特点？疫苗“混打”就是序贯免疫？权威答案来了', '2VU2xXhD', '6', '2');
INSERT INTO `news` VALUES ('cjDBX6eG', '<p style=\"margin-top: 10px; margin-bottom: 30px; padding: 0px; font-family: 微软雅黑, 宋体; white-space: normal; text-indent: 2em;\">据广东省卫健委网站消息，2月27日0-24时，广东省新增本土确诊病例40例，深圳报告30例，东莞报告10例。新增本土无症状感染者25例，广州报告1例，深圳报告6例，东莞报告18例。</p><p style=\"margin-top: 10px; margin-bottom: 30px; padding: 0px; font-family: 微软雅黑, 宋体; white-space: normal; text-indent: 2em;\">全省新增境外输入确诊病例53例(其中10例为无症状感染者转确诊)，广州报告2例，分别来自<a href=\"http://news.hexun.com/2013/newzealand1/index.html\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(72, 90, 144);\">新西兰</a>和<a href=\"http://news.hexun.com/kuwait/index.html\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(72, 90, 144);\">科威特</a>；佛山报告2例，分别来自<a href=\"http://news.hexun.com/korea/index.html\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(72, 90, 144);\">韩国</a>和<a href=\"http://news.hexun.com/2013/malaysia/index.html\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(72, 90, 144);\">马来西亚</a>；深圳报告31例，珠海报告6例，惠州报告2例，汕尾报告1例，东莞报告7例，中山报告1例，江门报告1例，均来自中国香港。新增境外输入无症状感染者28例，广州报告1例，来自刚果(金)；深圳报告16例，14例来中国香港，其余2例分别来自<a href=\"http://news.hexun.com/2013/japan/index.html\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(72, 90, 144);\">日本</a>和韩国；东莞报告1例，来自<a href=\"http://news.hexun.com/philippines/index.html\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration-line: none; color: rgb(72, 90, 144);\">菲律宾</a>；珠海报告2例，汕尾报告3例，中山报告4例，江门报告1例，均来自中国香港。新增出院9例，目前在院723例。</p><p><img src=\"http://localhost:8080/YiQingManageSystem/resources/upload/image/20220301/1646098234278046772.jpg\" title=\"1646098234278046772.jpg\" alt=\"QQ头像.jpg\"/>寄了寄了<img src=\"http://img.baidu.com/hi/jx2/j_0041.gif\"/></p>', '2022-03-01 09:30:43', '广东疫情最新消息今天：深圳新增36例病例', '2VU2xXhD', '3', '1');
INSERT INTO `news` VALUES ('jJHBz1SW', '<p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 13px; box-sizing: border-box; font-family: simsun; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-weight: 700;\">天津北方网讯：</span>昨日从市疫情防控指挥部获悉,目前疫情形势严峻复杂,为科学精准、严防疫情反弹,市疫情防控指挥部再次更新近期区域排查管控范围,涉及的相关人员应主动向社区、工作单位等报备。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 13px; box-sizing: border-box; font-family: simsun; white-space: normal; background-color: rgb(255, 255, 255);\">　　此次调整新增具有2022年2月13日(含)以来途经内蒙古自治区包头市青山区旅居史的来津及返津人员,需持48小时内核酸阴性证明或出示包含核酸检测阴性信息的健康码“绿码”,主动向社区、工作单位等报备,抵津前14日内具有旅居史,实施抵津后14天居家隔离(同户同室)。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 13px; box-sizing: border-box; font-family: simsun; white-space: normal; background-color: rgb(255, 255, 255);\">　　广大市民应密切关注疫情防控信息,做好个人防护,戴口罩、勤洗手、常通风、不聚集,保持安全社交距离,配合做好公共场所测温、验码,做到疫情防控意识和健康行为不放松。符合接种条件的,应积极主动到辖区接种点接种新冠病毒疫苗,降低自身感染和发病风险,共同筑牢人群免疫屏障。注意保持环境卫生,不乱丢废弃口罩。（津云新闻编辑刘颖）</p><p><br/></p>', '2022-03-01 09:18:20', '天津更新区域疫情排查管控范围', '2VU2xXhD', '0', '0');
INSERT INTO `news` VALUES ('S3kOuwus', '<p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \"><span style=\"\">2月21日，</span><span style=\"\">深圳新增3例病例</span><span style=\"\">，其中1例为已集中隔离的“0215”疫情以来病例的密接人员，2例为主动核酸检测中发现。</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">01</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">新增3例病例</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\"><span style=\"\">其中2例在主动核酸检测中发现</span></span><span style=\"\"></span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">病例1</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">男，19岁，龙岗区坂田街道某公司工作人员，居住在龙岗区坂田街道马安堂社区侨联东3巷，为“0215”疫情以来病例的密接者，诊断为新冠肺炎确诊病例</span><span style=\"\">（轻型）</span><span style=\"\">。</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">病例2</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">女，26岁，居住在罗湖区桂园街道鹿苑小区，在主动核酸检测中发现，诊断为新冠肺炎确诊病例</span><span style=\"\">（轻型）</span><span style=\"\">。</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">病例3</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">男，26岁，福田区沙头街道某公司工作人员，居住在福田区沙头街道锦洲花园，在主动核酸检测中发现，诊断为新冠肺炎确诊病例</span><span style=\"\">（轻型）</span><span style=\"\">。</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　上述新增病例均已转送至市第三人民医院应急院区隔离治疗，情况稳定。</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">02</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">新增病例轨迹涉及</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\"><span style=\"\">罗湖、福田、南山、龙岗</span></span><span style=\"\"></span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　经初步流调，3例病例近日主要活动轨迹为：</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　公交——</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">M559路（新洲村牌坊站、联合广场站）</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">337路（联合广场站、新洲村牌坊站）</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　地铁——</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">9号线（鹿丹村站、深圳湾公园站）</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　龙岗区坂田街道——</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">互联E时代大厦</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">美宜多生活精选超市（侨联东景田专卖店）</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">浙江越乡小笼包</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　罗湖区南湖街道——</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">和平社区健康服务中心</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　罗湖区桂园街道——</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">钱大妈（中海名苑店）</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　南山区沙河街道——</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">深圳欢乐海岸</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　福田区沙头街道——</p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\">湖北大厦</span></p><p style=\"margin-top: 0px; margin-bottom: 18px; padding: 0px; font-size: 18px; font-family: \">　　<span style=\"\"><span style=\"\">生鲜故事（新洲我）</span></span></p><p><br/></p>', '2022-02-22 11:37:15', '最新资讯', '2VU2xXhD', '65', '1');
INSERT INTO `news` VALUES ('UIjauz9G', '<p><span class=\"f-bold\" style=\"padding: 0px; margin: 0px; box-sizing: border-box; font-weight: bold;\">内容提要：</span>2月28日0—24时，31个省（自治区、直辖市）和新疆生产建设兵团报告新增确诊病例200例。其中境外输入病例125例（广东44例，上海40例，北京12例，广西8例，重庆4例，云南4例，福建3例，山东3例，江苏2例，四川2例，天津1例，安徽1例，湖北1例），含10例由无症状感染者转为确诊病例（广东4例，北京2例，广西2例，山东1例，四川1例）；本土病例75例（广东31例，其中深圳市23例、东莞市7例、中山市1例；内蒙古14例，其中呼和浩特市13例、包头市1例；天津6例，其中滨海新区4例、东丽区2例；广西6例，均在防城港市；云南6例，其中德宏傣族景颇族自治州5例、临沧市1例；黑龙江4例，其中牡丹江市3例、鸡西市1例；江苏3例，均在苏州市；湖北2例，均在武汉市；山西1例，在晋中市；海南1例，在三亚市；四川1例，在成都市），含3例由无症状感染者转为确诊病例（天津2例，黑龙江1例）。无新增死亡病例。新增疑似病例9例，其中境外输入病例8例（均在上海），本土病例1例（在内蒙古）。</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px 0px 13px; box-sizing: border-box; text-indent: 2em;\">2月28日0—24时，31个省（自治区、直辖市）和新疆生产建设兵团报告新增确诊病例200例。其中境外输入病例125例（广东44例，上海40例，北京12例，广西8例，重庆4例，云南4例，福建3例，山东3例，江苏2例，四川2例，天津1例，安徽1例，湖北1例），含10例由无症状感染者转为确诊病例（广东4例，北京2例，广西2例，山东1例，四川1例）；本土病例75例（广东31例，其中深圳市23例、东莞市7例、中山市1例；内蒙古14例，其中呼和浩特市13例、包头市1例；天津6例，其中滨海新区4例、东丽区2例；广西6例，均在防城港市；云南6例，其中德宏傣族景颇族自治州5例、临沧市1例；黑龙江4例，其中牡丹江市3例、鸡西市1例；江苏3例，均在苏州市；湖北2例，均在武汉市；山西1例，在晋中市；海南1例，在三亚市；四川1例，在成都市），含3例由无症状感染者转为确诊病例（天津2例，黑龙江1例）。无新增死亡病例。新增疑似病例9例，其中境外输入病例8例（均在上海），本土病例1例（在内蒙古）。</p><p><img src=\"http://img.baidu.com/hi/jx2/j_0007.gif\"/></p>', '2022-03-01 09:28:08', '国家卫健委：2月28日31个省份新增75例本土病例', '2VU2xXhD', '0', '0');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` char(8) NOT NULL DEFAULT '' COMMENT '角色id',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(128) NOT NULL DEFAULT '' COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('mY69h4is', '管理员', '管理员有全部权限！');
INSERT INTO `role` VALUES ('tWalUpvk', '普通用户', '普通用户有部分权限！');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` char(8) NOT NULL DEFAULT '' COMMENT '用户id',
  `username` varchar(8) NOT NULL DEFAULT '' COMMENT '用户名称',
  `password` varchar(16) NOT NULL DEFAULT '' COMMENT '用户密码',
  `role_id` char(8) NOT NULL DEFAULT '' COMMENT '用户所属角色id',
  `phone` varchar(16) NOT NULL DEFAULT '' COMMENT '用户手机号码',
  `identify_card` varchar(32) NOT NULL DEFAULT '' COMMENT '身份证号',
  `sex` int(2) NOT NULL DEFAULT '3' COMMENT '用户性别：1：男；2：女；3：未知',
  `head_pic` varchar(512) NOT NULL DEFAULT '../resources/upload/common/no_image.jpg' COMMENT '用户头像',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2VU2xXhD', '杨杨吖', '123456', 'mY69h4is', '13774559485', '2224', '3', '../resources/upload/20220215/1644912452440.jpg', '2022-03-01 10:39:52');
INSERT INTO `user` VALUES ('dQUjVwno', '啊啊', '123456', 'tWalUpvk', '13774559485', '1234234', '2', '../resources/upload/20220228/1646033262101.jpg', '2022-03-01 09:36:48');
