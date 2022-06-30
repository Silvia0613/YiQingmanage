/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80029
Source Host           : localhost:3306
Source Database       : db_yiqing_manage_system

Target Server Type    : MYSQL
Target Server Version : 80029
File Encoding         : 65001

Date: 2022-06-29 10:25:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c3p0testtable
-- ----------------------------
DROP TABLE IF EXISTS `c3p0testtable`;
CREATE TABLE `c3p0testtable` (
  `a` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of c3p0testtable
-- ----------------------------

-- ----------------------------
-- Table structure for clue
-- ----------------------------
DROP TABLE IF EXISTS `clue`;
CREATE TABLE `clue` (
  `id` char(8) NOT NULL,
  `user_id` char(8) NOT NULL,
  `content` varchar(512) NOT NULL,
  `create_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of clue
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` char(8) NOT NULL DEFAULT '' COMMENT '评论id',
  `news_id` char(8) NOT NULL DEFAULT '' COMMENT '评论对应的新闻id',
  `user_id` char(8) NOT NULL DEFAULT '' COMMENT '评论对应的用户id',
  `content` varchar(256) NOT NULL DEFAULT '' COMMENT '评论内容',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('0SqEBNy6', 'K18LMPrs', 'tCsBRtTg', '上海加油！', '2022-06-13 11:31:43');
INSERT INTO `comment` VALUES ('1gjWrCNP', 'O83geLYu', 'mIOsnywx', '学到了，刚好等下要去拿快递。', '2022-06-13 11:34:46');
INSERT INTO `comment` VALUES ('20quSC09', 'j63iKxyp', 'tCsBRtTg', '不聚集不出门，在公共场合戴好口罩，北京加油！', '2022-06-13 11:31:27');
INSERT INTO `comment` VALUES ('4STeaCFP', 'K18LMPrs', 'dQUjVwno', '上海加油吧！', '2022-06-13 11:40:39');
INSERT INTO `comment` VALUES ('7jP8kT2d', '0oPxsni7', 'dQUjVwno', '好想出去旅游55555', '2022-06-13 11:40:52');
INSERT INTO `comment` VALUES ('8qTwNfNl', 'O83geLYu', 'ybxnraeu', '我为什么没早点看到这个555上周拿快递还做了核酸。', '2022-06-13 11:42:16');
INSERT INTO `comment` VALUES ('c00b7iAr', 'gAvi0jg7', 'dQUjVwno', '重庆快快清零！', '2022-06-13 11:41:35');
INSERT INTO `comment` VALUES ('CCaWiuaX', 'j63iKxyp', 'mIOsnywx', '北京还是管控的很严的，哎，快快好起来吧。', '2022-06-13 11:35:14');
INSERT INTO `comment` VALUES ('Cv9pbkOe', '0oPxsni7', 'lB7HqFpA', '什么时候才能出去玩啊.....', '2022-06-13 11:38:55');
INSERT INTO `comment` VALUES ('CVi6XgVa', 'gAvi0jg7', 'ybxnraeu', '想出去玩，重庆快快清零哇。', '2022-06-13 11:44:34');
INSERT INTO `comment` VALUES ('D76V33WV', 'tYBvR3BX', 'tCsBRtTg', '看来接种疫苗真的很重要，我要抓紧时间接种第三针加强针了。', '2022-06-13 11:32:44');
INSERT INTO `comment` VALUES ('EdmaFepf', 'j63iKxyp', 'ybxnraeu', '北京感觉挺严格的，应该很快会好吧！', '2022-06-13 11:42:48');
INSERT INTO `comment` VALUES ('expxPIIr', 'O83geLYu', 'tCsBRtTg', '大家一定要记得收快递要做好防护啊！', '2022-06-13 11:30:20');
INSERT INTO `comment` VALUES ('GnC6LNTq', 'gAvi0jg7', 'mIOsnywx', '重庆加油噶！', '2022-06-13 11:36:37');
INSERT INTO `comment` VALUES ('HN4lUKuF', 'j63iKxyp', 'dQUjVwno', '北京加油哇！', '2022-06-13 11:40:25');
INSERT INTO `comment` VALUES ('i3y4WAp1', 'tYBvR3BX', 'dQUjVwno', '原来打疫苗有这么多讲究呀！', '2022-06-13 11:41:19');
INSERT INTO `comment` VALUES ('ivKoLjYk', 'O83geLYu', 'mIOsnywx', '学到了', '2022-06-14 03:50:11');
INSERT INTO `comment` VALUES ('Ka52Pfyd', 'tYBvR3BX', 'lB7HqFpA', '哥们早已打完三针疫苗。', '2022-06-13 11:39:10');
INSERT INTO `comment` VALUES ('MItdPU5O', 'O83geLYu', 'dQUjVwno', '今天我好像没有快递到欸....', '2022-06-13 11:40:13');
INSERT INTO `comment` VALUES ('O6AlNR9X', 'K18LMPrs', 'ybxnraeu', '上海早点重视一下多好呀。', '2022-06-13 11:43:09');
INSERT INTO `comment` VALUES ('pt5ybMdo', 'gAvi0jg7', 'tCsBRtTg', '重庆一直都做得很好的', '2022-06-13 11:33:02');
INSERT INTO `comment` VALUES ('q1GWxD34', 'K18LMPrs', 'mIOsnywx', '上海情况也好转了啊，挺好的。', '2022-06-13 11:35:36');
INSERT INTO `comment` VALUES ('qoxP55EH', '0oPxsni7', 'ybxnraeu', '疫情真的好烦人呜呜呜呜呜', '2022-06-13 11:43:28');
INSERT INTO `comment` VALUES ('ro3LNHrn', 'gAvi0jg7', 'lB7HqFpA', '离北碚区好像挺远的。', '2022-06-13 11:39:36');
INSERT INTO `comment` VALUES ('uDBUXA9f', '0oPxsni7', 'tCsBRtTg', '疫情形势虽有好转但仍旧严峻，我们不可松懈！', '2022-06-13 11:32:14');
INSERT INTO `comment` VALUES ('vmhxwxmG', '0oPxsni7', 'mIOsnywx', '哎，疫情什么时候才到头啊....', '2022-06-13 11:35:58');
INSERT INTO `comment` VALUES ('vnYZe1hu', 'tYBvR3BX', 'ybxnraeu', '晕针的我都把三针打完了，看到这个的快去打！', '2022-06-13 11:43:56');
INSERT INTO `comment` VALUES ('y9rflULu', 'j63iKxyp', 'lB7HqFpA', '北京做的挺好的呀。', '2022-06-13 11:38:25');
INSERT INTO `comment` VALUES ('YNTsaVaW', 'K18LMPrs', 'lB7HqFpA', '上海终于好多了。', '2022-06-13 11:38:40');
INSERT INTO `comment` VALUES ('yYpUzsaA', 'tYBvR3BX', 'mIOsnywx', '早早打完三针疫苗的我。', '2022-06-13 11:36:16');
INSERT INTO `comment` VALUES ('zeE8DG6X', 'O83geLYu', 'lB7HqFpA', '刚拿了快递，我得赶紧喷喷酒精。', '2022-06-13 11:38:09');

-- ----------------------------
-- Table structure for daily_report
-- ----------------------------
DROP TABLE IF EXISTS `daily_report`;
CREATE TABLE `daily_report` (
  `id` char(8) NOT NULL DEFAULT '' COMMENT '打卡id',
  `location` varchar(128) NOT NULL DEFAULT '' COMMENT '打卡位置',
  `create_time` datetime NOT NULL COMMENT '打卡时间',
  `user_id` char(8) NOT NULL DEFAULT '' COMMENT '打卡用户',
  `note` varchar(512) NOT NULL DEFAULT '' COMMENT '备注',
  `health_status` int NOT NULL DEFAULT '1' COMMENT '健康状态：1：健康；2：有发烧、咳嗽等症状；3：其他症状',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of daily_report
-- ----------------------------
INSERT INTO `daily_report` VALUES ('HigNT6Py', '重庆市重庆市北碚区融汇南路', '2022-06-13 03:33:30', 'ybxnraeu', '', '1');
INSERT INTO `daily_report` VALUES ('ir1Azxzm', '重庆市重庆市北碚区融汇南路', '2022-06-13 08:03:29', 'mIOsnywx', '', '1');
INSERT INTO `daily_report` VALUES ('PezjTQBJ', '重庆市重庆市北碚区', '2022-06-13 08:06:07', 'lB7HqFpA', '', '1');
INSERT INTO `daily_report` VALUES ('QOSMkWgY', '重庆市重庆市北碚区融汇南路', '2022-06-13 11:33:24', 'tCsBRtTg', '', '1');
INSERT INTO `daily_report` VALUES ('sKOoOXgP', '重庆市重庆市北碚区', '2022-06-15 11:48:44', 'mIOsnywx', '', '1');

-- ----------------------------
-- Table structure for good_apply
-- ----------------------------
DROP TABLE IF EXISTS `good_apply`;
CREATE TABLE `good_apply` (
  `id` char(8) NOT NULL DEFAULT '' COMMENT '物资id',
  `name` varchar(512) NOT NULL DEFAULT '' COMMENT '物质内容',
  `address` varchar(128) NOT NULL DEFAULT '' COMMENT '配送地址',
  `create_time` datetime NOT NULL COMMENT '申请时间',
  `state` int NOT NULL DEFAULT '1' COMMENT '状态：1：待审核；2：审核通过；3：审核不通过',
  `reply` varchar(128) NOT NULL DEFAULT '' COMMENT '审核回复',
  `user_id` char(8) NOT NULL DEFAULT '' COMMENT '物资申请所属用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of good_apply
-- ----------------------------
INSERT INTO `good_apply` VALUES ('5UVD5cel', '一箱酸奶', '重庆市北碚区天生路2号西南大学橘园二舍', '2022-06-13 07:52:05', '2', '已送达', 'ybxnraeu');
INSERT INTO `good_apply` VALUES ('AgyVSyA6', '两包感冒药', '重庆市北碚区天生路2号西南大学橘园一舍', '2022-06-13 08:00:22', '3', '感冒药需要凭核酸证明获取哦', 'mIOsnywx');
INSERT INTO `good_apply` VALUES ('DgkJJFIE', '一箱老酸奶', '重庆市北碚区天生路2号西南大学橘园一舍', '2022-06-13 08:06:43', '3', '不好意思，这里没有哦~', 'lB7HqFpA');
INSERT INTO `good_apply` VALUES ('grn50DD7', '一箱苹果', '重庆市北碚区天生路2号西南大学橘园一舍', '2022-06-13 08:05:37', '2', '已送达', 'lB7HqFpA');
INSERT INTO `good_apply` VALUES ('hC7Ezjpg', '两包口罩', '西南大学橘园一舍', '2022-06-13 11:34:08', '1', '', 'tCsBRtTg');
INSERT INTO `good_apply` VALUES ('hwXpVhe7', '一箱矿泉水', '西南大学橘园一舍', '2022-06-13 11:33:48', '1', '', 'tCsBRtTg');
INSERT INTO `good_apply` VALUES ('KZRXTTOb', '一箱矿泉水', '重庆市北碚区天生路2号西南大学橘园二舍', '2022-06-13 07:51:26', '2', '已送达', 'ybxnraeu');
INSERT INTO `good_apply` VALUES ('lB0YBzM5', '11', '11', '2022-06-28 13:46:46', '1', '', 'dQUjVwno');
INSERT INTO `good_apply` VALUES ('N8vmqFE7', '口罩', '橘园二舍', '2022-06-03 13:37:43', '2', '已送达', 'dQUjVwno');
INSERT INTO `good_apply` VALUES ('PFxCEdZB', '西瓜', '西南大学橘园一舍', '2022-06-15 11:53:57', '1', '', 'mIOsnywx');
INSERT INTO `good_apply` VALUES ('tDwWqrzH', '一箱纸巾', '重庆市北碚区天生路2号西南大学橘园一舍', '2022-06-13 08:00:49', '2', '已送达', 'mIOsnywx');
INSERT INTO `good_apply` VALUES ('tMQXZdy8', '蔬菜', '橘园二舍', '2022-06-10 21:01:16', '3', '今天的蔬菜已经供应完了，下次早点申请哦~', 'dQUjVwno');
INSERT INTO `good_apply` VALUES ('UPbUeawS', '两瓶酒精', '重庆市北碚区天生路2号西南大学橘园二舍', '2022-06-13 07:52:44', '2', '已送达', 'ybxnraeu');
INSERT INTO `good_apply` VALUES ('XFtIglfI', '水果', '橘园二舍', '2022-06-12 19:21:46', '2', '已送达', 'dQUjVwno');
INSERT INTO `good_apply` VALUES ('zpK1mVGJ', '橘子', '西南大学橘园二舍', '2022-06-14 03:50:41', '1', '', 'mIOsnywx');

-- ----------------------------
-- Table structure for maps
-- ----------------------------
DROP TABLE IF EXISTS `maps`;
CREATE TABLE `maps` (
  `id` char(8) NOT NULL DEFAULT '' COMMENT '地图记录id',
  `location` varchar(128) NOT NULL DEFAULT '' COMMENT '疫情发生位置',
  `lng` decimal(16,12) NOT NULL DEFAULT '0.000000000000' COMMENT '经度',
  `lat` decimal(16,12) NOT NULL DEFAULT '0.000000000000' COMMENT '纬度',
  `create_time` datetime NOT NULL COMMENT '登记时间',
  `count` int NOT NULL DEFAULT '1' COMMENT '确诊人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of maps
-- ----------------------------
INSERT INTO `maps` VALUES ('iBe1GmuS', '重庆市北碚区融汇南路', '106.426359350527', '29.820936845216', '2022-06-13 07:43:01', '2');
INSERT INTO `maps` VALUES ('poV5AQVv', '重庆市北碚区天生路', '106.429964879351', '29.822196625509', '2022-06-13 11:50:16', '1');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` char(8) NOT NULL DEFAULT '' COMMENT '新闻id',
  `content` longtext COMMENT '新闻内容',
  `create_time` datetime NOT NULL COMMENT '发布时间',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '新闻标题',
  `user_id` char(8) NOT NULL DEFAULT '' COMMENT '新闻发布者',
  `view_num` int NOT NULL DEFAULT '0' COMMENT '新闻浏览量',
  `comment_num` int NOT NULL DEFAULT '0' COMMENT '新闻评论量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('0oPxsni7', '<h1 style=\"margin: 0px; padding: 0px; font-size: 16px; overflow-y: auto; max-width: 100%;\"><span style=\"font-size: 20px;\">截至6月12日24时新型冠状病毒肺炎疫情最新情况</span></h1><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><br/></p><p style=\"margin-bottom: 1em; overflow-y: auto; max-width: 100%; line-height: 24px; text-indent: 2em; text-align: justify; margin-top: 0px !important; padding: 0px !important;\"><span style=\"font-size: 18px;\">6月12日0—24时，31个省（自治区、直辖市）和新疆生产建设兵团报告新增确诊病例89例。其中境外输入病例20例（陕西5例，浙江3例，福建3例，广东3例，天津2例，上海2例，黑龙江1例，四川1例），含4例由无症状感染者转为确诊病例（浙江3例，天津1例）；本土病例69例（北京29例，内蒙古27例，上海11例，重庆2例），含2例由无症状感染者转为确诊病例（北京1例，上海1例）。无新增死亡病例。无新增疑似病例。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><br/></p><p style=\"margin-bottom: 1em; overflow-y: auto; max-width: 100%; line-height: 24px; text-indent: 2em; text-align: justify; margin-top: 0px !important; padding: 0px !important;\"><span style=\"font-size: 18px;\">当日新增治愈出院病例66例，其中境外输入病例17例，本土病例49例（上海28例，北京15例，河南2例，辽宁1例，吉林1例，湖北1例，四川1例），解除医学观察的密切接触者7363人，重症病例较前一日减少2例。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><br/></p><p style=\"margin-bottom: 1em; overflow-y: auto; max-width: 100%; line-height: 24px; text-indent: 2em; text-align: justify; margin-top: 0px !important; padding: 0px !important;\"><span style=\"font-size: 18px;\">境外输入现有确诊病例196例（无重症病例），无现有疑似病例。累计确诊病例18895例，累计治愈出院病例18699例，无死亡病例。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><br/></p><p style=\"margin-bottom: 1em; overflow-y: auto; max-width: 100%; line-height: 24px; text-indent: 2em; text-align: justify; margin-top: 0px !important; padding: 0px !important;\"><span style=\"font-size: 18px;\">截至6月12日24时，据31个省（自治区、直辖市）和新疆生产建设兵团报告，现有确诊病例886例（其中重症病例19例），累计治愈出院病例218770例，累计死亡病例5226例，累计报告确诊病例224882例，无现有疑似病例。累计追踪到密切接触者4172550人，尚在医学观察的密切接触者114850人。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><br/></p><p style=\"margin-bottom: 1em; overflow-y: auto; max-width: 100%; line-height: 24px; text-indent: 2em; text-align: justify; margin-top: 0px !important; padding: 0px !important;\"><span style=\"font-size: 18px;\">31个省（自治区、直辖市）和新疆生产建设兵团报告新增无症状感染者131例，其中境外输入57例，本土74例（上海26例，北京22例，内蒙古13例，吉林4例，云南3例，广西2例，辽宁1例，浙江1例，重庆1例，四川1例）。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><br/></p><p style=\"margin-bottom: 1em; overflow-y: auto; max-width: 100%; line-height: 24px; text-indent: 2em; text-align: justify; margin-top: 0px !important; padding: 0px !important;\"><span style=\"font-size: 18px;\">当日解除医学观察的无症状感染者286例，其中境外输入57例，本土229例（上海174例，吉林10例，浙江9例，辽宁8例，四川8例，河南7例，河北5例，江西3例，北京2例，天津2例，云南1例）；当日转为确诊病例6例（境外输入4例）；尚在医学观察的无症状感染者2396例*（境外输入467例）。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><br/></p><p style=\"margin-bottom: 1em; overflow-y: auto; max-width: 100%; line-height: 24px; text-indent: 2em; text-align: justify; margin-top: 0px !important; padding: 0px !important;\"><span style=\"font-size: 18px;\">累计收到港澳台地区通报确诊病例3225874例。其中，香港特别行政区333528例（出院62861例，死亡9390例），澳门特别行政区83例（出院83例），台湾地区2892263例（出院13742例，死亡4171例）。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><br/></p><p style=\"margin-bottom: 1em; overflow-y: auto; max-width: 100%; line-height: 24px; text-indent: 2em; text-align: justify; margin-top: 0px !important; padding: 0px !important;\"><span style=\"font-size: 18px;\">备注：*内蒙古核增1例。</span></p><p><br/></p>', '2022-06-13 11:20:47', '国家卫健委：全国昨日新增本土确诊病例69例、无症状感染者74例', 'jSisTmOZ', '10', '5');
INSERT INTO `news` VALUES ('gAvi0jg7', '<p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">本文转自【重庆卫健委】；</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\"><br/></span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">6月12日0—24时，重庆市新增本土确诊病例2例（九龙坡区），新增本土无症状感染者1例（九龙坡区），均在隔离管控人员中发现。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\"><br/></span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">截至6月12日24时，重庆市现有本土确诊病例2例（九龙坡区），现有本土无症状感染者2例（九龙坡区）。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\"><br/></span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">6月12日0—24时，重庆市无新</span><span style=\"font-size: 18px;\">增境外输入确诊病例和无症状感染者。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"font-size: 18px;\"><br/></span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">截至6月12日24时，重庆市现有境外输入确诊病例4例（德国），现有境外输入无症状感染者1例（新加坡）。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\"><br/></span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"font-weight: 700; max-width: 100%; font-size: 20px;\">重庆市6月12日新增本土确诊病例和无症状感染者基本情况如下：</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"font-weight: 700; max-width: 100%; font-size: 20px;\"><br/></span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">九龙坡区确诊病例1，系九龙坡区无症状感染者1的密切接触者。6月6日起进入入境人员隔离点工作以来，一直处于闭环管理状态。6月12日，其核酸检测结果呈阳性，根据实验室检查结果、影像学特征和临床症状，经专家组会诊，诊断为新冠肺炎确诊病例（轻型）。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\"><br/></span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">九龙坡区确诊病例2，系九龙坡区无症状感染者1的密切接触者。6月4日起进入入境人员隔离点工作以来，一直处于闭环管理状态。6月12日，其核酸检测结果呈阳性，根据实验室检查结果、影像学特征和临床症状，经专家组会诊，诊断为新冠肺炎确诊病例（轻型）。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\"><br/></span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">九龙坡区无症状感染者2，系九龙坡区无症状感染者1的密切接触者。6月4日起进入入境人员隔离点工作以来，一直处于闭环管理状态。6月12日，其核酸检测结果呈阳性，根据实验室检查结果、影像学特征和临床症状，经专家组会诊，判定为无症状感染者。</span></p><p><br/></p>', '2022-06-13 11:14:43', '重庆昨日新增本土确诊病例2例，新增本土无症状感染者1例', 'jSisTmOZ', '10', '5');
INSERT INTO `news` VALUES ('j63iKxyp', '<p><img src=\"http://localhost:8080/YiQingManageSystem/resources/upload/image/20220613/1655119406622029510.jpeg\" title=\"1655119406622029510.jpeg\" alt=\"0ff41bd5ad6eddc4c797bad1b22ecdf7536633a3.jpeg\"/></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">6月13日，北京召开新冠肺炎疫情防控工作第364场新闻发布会。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\"><br/></span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">人民网北京6月13日电 (董兆瑞)在6月13日召开的北京市新冠肺炎疫情防控工作第364场新闻发布会上，北京市疾病预防控制中心副主任刘晓峰通报，6月12日0时至24时，北京新增本土新冠肺炎病毒感染者50例，朝阳区26例，西城区8例，通州区6例，东城区5例，门头沟区2例，丰台区、房山区、怀柔区各1例；普通型1例、轻型27例、无症状感染者22例；隔离观察人员49例，社会面筛查人员1例。另有1例无症状感染者转确诊病例已通报。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\"><br/></span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">6月13日0时至15时，北京新增本土新冠肺炎病毒感染者45例(感染者2153至2197)，朝阳区19例，东城区7例，西城区5例，海淀区、昌平区各3例，丰台区、大兴区、门头沟区各2例，通州区、经开区各1例；普通型1例、轻型30例、无症状感染者14例；隔离观察人员44例，社会面筛查人员1例。均已转至定点医院隔离治疗，相关风险点位及人员已管控落位。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\"><br/></span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">现将6月12日发布会后相关感染者情况通报如下：</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\"><br/></span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">感染者2152：通过社会面核酸筛查发现，花香盛世国际体育(锦裕写字楼店)员工，为感染者2083(天堂超市酒吧到访人员)的同事。6月12日报告核酸检测结果为阳性，当日诊断为确诊病例，临床分型为轻型。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\"><br/></span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">感染者2159：通过社会面核酸筛查发现。6月8日晚前往感染者2048(天堂超市酒吧到访人员)就餐的老路烤串(石佛营路丰苑大厦店)用餐。6月12日报告核酸检测结果为阳性，6月13日诊断为确诊病例，临床分型为轻型。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\"><br/></span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">4月22日至6月13日15时，北京市累计报告2059例新冠肺炎病毒感染者，涉及15个区和经开区，其中，朝阳区528例，丰台区431例，房山区417例，海淀区302例，通州区97例，西城区66例，昌平区48例，东城区47例，顺义区46例，大兴区26例，石景山区24例，门头沟区14例，经开区5例，怀柔区、密云区各3例，延庆区2例。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\"><br/></span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">6月9日0时至13日15时，涉天堂超市酒吧聚集性疫情累计报告228例感染者，其中，天堂超市酒吧(工体西路6号)到访人员180例，酒吧工作人员4例，到访人员的续发关联人员44例。228例感染者涉及14个区和经开区。</span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\"><br/></span></p><p style=\"overflow-y: auto; max-width: 100%; line-height: 24px; margin-top: 0px !important; margin-bottom: 0px !important; padding: 0px !important;\"><span style=\"max-width: 100%; font-size: 18px;\">刘晓峰表示，涉天堂超市酒吧聚集性疫情处于发展阶段，已涉及14个区和经开区的100个街乡，续发病例涉及多个公共场所，呈现点多面广的特点，疫情仍存在传播扩散风险。当前，疫情防控正处在关键时刻，要加强跨区协同，深挖细排所有风险点位和风险人员，尤其要加强重点区域、重点行业、重点人群风险排查。要严格划定封(管)控区范围，密切接触者做到应判尽判、应转尽转、应隔尽隔，第一时间管控落位，坚决阻断疫情传播。要严格落实小区(村)、单位和公共场所测温扫码、查验核酸检测阴性证明等防控措施，市民朋友要自觉履行防控责任，进入单位、楼宇、社区(村)及“七小”门店、商超市场等各类公共场所时，主动配合扫码、测温、查验核酸证明，不得以“亮码”代替“扫码”，同行人员严禁“一人扫码、多人进入”，确保“逢进必扫、逢扫必验、不漏一人”。</span></p><p><span class=\"bjh-p\" style=\"max-width: 100%;\"><br/></span></p><p><br/></p>', '2022-06-13 11:24:18', '6月13日0－15时北京新增45例本土新冠肺炎病毒感染者 社会面筛查1例', 'jSisTmOZ', '13', '5');
INSERT INTO `news` VALUES ('K18LMPrs', '<p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; color: rgb(51, 51, 51); letter-spacing: 1px; font-family: &quot;microsoft yahei&quot;; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: arial, helvetica, sans-serif; font-size: 18px;\">中新网</span><span style=\"font-family: arial, helvetica, sans-serif; font-size: 18px;\">上海6月13日电 (记者 陈静)在13日举行的上海市新冠肺炎疫情防控工作新闻发布会上，上海市疫情防控领导小组监督指导组副组长、市应急管理局副局长沈伟忠表示，上海组建了16个督查组，“一区一组”下沉到16个区蹲点，从12日开始，对服务行业相关场所开展专项督查。与此同时，上海市文旅系统也组建了4个督查组，对文旅行业开展专项疫情防控督查。</span></p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; color: rgb(51, 51, 51); letter-spacing: 1px; font-family: &quot;microsoft yahei&quot;; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: arial, helvetica, sans-serif; font-size: 18px;\">当日，沈伟忠披露了上海开展服务行业落实疫情防控措施专项督查的有关情况。沈伟忠介绍，从第一天的督查显示，有的场所管理不严格、环境消杀不够规范；部分场所未执行限流措施，排队等候人群未严格保持安全距离；对入场顾客未严格执行扫场所码、测体温等措施，有些场所码存在“贴而不扫”的现象。有的场所对员工监测管理不到位、有的未进行每日核酸检测、有的未对相关从业人员实行健康监测、有的未如实记录体温检测结果等。有的场所个人防护意识松懈，部分从业人员和顾客未规范佩戴口罩，在公共场所内未按要求配备防护用品。</span></p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; color: rgb(51, 51, 51); letter-spacing: 1px; font-family: &quot;microsoft yahei&quot;; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: arial, helvetica, sans-serif; font-size: 18px;\">沈伟忠指出，这次督查主要聚焦超市卖场、餐饮理发、批发市场、宾馆酒店等服务行业及重点场所，围绕入口管理、员工管理、场所消毒、个人防护、进口冷链食品和夜市等场所防控措施落实情况。通过督查，督促各区和有关企业引以为戒，坚决堵塞服务行业防控漏洞，严防疫情反弹。</span></p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; color: rgb(51, 51, 51); letter-spacing: 1px; font-family: &quot;microsoft yahei&quot;; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: arial, helvetica, sans-serif; font-size: 18px;\">沈伟忠表示，督查组发现后，要求相关场所即知即改、立行立改，相关区和单位正在抓紧整改。下一步，上海市疫情防控领导小组监督指导组将按照市委、市政府要求，始终绷紧疫情防控这根弦，继续加大督查力度。相关部门将督促服务行业严格落实防控措施，要求超市商场、服务门店等，不折不扣把好扫码关、限流关、消杀关；对防疫措施执行不到位的，严肃督促整改并通报警示、依法处置；持续完善疫情防控长效机制，针对发现的问题，要求区防控部门、行业监管部门和场所经营主体举一反三，完善机制。</span></p><p style=\"margin-top: 15px; margin-bottom: 15px; padding: 0px; color: rgb(51, 51, 51); letter-spacing: 1px; font-family: &quot;microsoft yahei&quot;; font-size: 20px; white-space: normal; background-color: rgb(255, 255, 255);\"><span style=\"font-family: arial, helvetica, sans-serif; font-size: 18px;\">当日，上海市卫健委副主任赵丹丹披露，13日，上海新增社会面1例本土无症状感染者。该阳性感染者已转运至定点医疗机构隔离医学观察。据悉，该名无症状感染者为29岁男性，居住在宝山区。其居住地——宝山区顾村镇陆翔路678弄被列为中风险地区。至6月13日16时，上海共排查到该阳性感染者在沪密切接触者64人，均已落实隔离管控，核酸检测结果均为阴性。(完)</span></p><p><br/></p>', '2022-06-13 11:22:35', '（上海战疫录）上海对服务业、文旅业开展专项疫情防控督查', 'jSisTmOZ', '10', '5');
INSERT INTO `news` VALUES ('O83geLYu', '<p><img src=\"http://localhost:8080/YiQingManageSystem/resources/upload/image/20220613/1655119512589055527.jpeg\" title=\"1655119512589055527.jpeg\" alt=\"dbb44aed2e738bd4b84a8f3b33c2ebdc277ff920.jpeg\"/></p><p style=\"margin-top: 20px; margin-bottom: 0px; padding: 0px; font-family: 微软雅黑; color: rgb(32, 32, 32); line-height: 29.05px; white-space: normal; text-align: justify;\"><span style=\"font-size: 18px;\">你的包裹到了吗？”随着复工复产的有序推进，物流快递的恢复。</span></p><p style=\"margin-top: 20px; margin-bottom: 0px; padding: 0px; font-family: 微软雅黑; color: rgb(32, 32, 32); line-height: 29.05px; white-space: normal; text-align: justify;\"><span style=\"font-size: 18px;\">大家又开始愉快地在网上“买买买”，但是疫情防控依然不放松，奥密克戎病毒传播力强、隐匿性强。</span></p><p style=\"margin-top: 20px; margin-bottom: 0px; padding: 0px; font-family: 微软雅黑; color: rgb(32, 32, 32); line-height: 29.05px; white-space: normal; text-align: justify;\"><span style=\"font-size: 18px;\"><strong style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51);\">快递、邮件和外卖也有被病毒污染的可能性，</strong><strong style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51);\">接触这些外来物件时</strong><strong style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51);\">都要及时做好消杀哦。</strong></span></p><p style=\"margin-top: 20px; margin-bottom: 0px; padding: 0px; font-family: 微软雅黑; color: rgb(32, 32, 32); line-height: 29.05px; white-space: normal; text-align: justify;\"><span style=\"font-size: 18px;\"><strong style=\"margin: 0px; padding: 0px; color: rgb(51, 51, 51);\"><img src=\"http://localhost:8080/YiQingManageSystem/resources/upload/image/20220613/1655119604238038744.jpg\" title=\"1655119604238038744.jpg\" alt=\"840.jpg\"/></strong></span></p><p><br/></p>', '2022-06-13 11:26:50', '疫情期间，如何收快递更安全？', 'jSisTmOZ', '21', '6');
INSERT INTO `news` VALUES ('tYBvR3BX', '<p><img src=\"http://localhost:8080/YiQingManageSystem/resources/upload/image/20220613/1655118959694072560.jpg\" title=\"1655118959694072560.jpg\" alt=\"376.jpg\"/></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\">为什么接种新冠疫苗是阻断疫情传播的重要手段？加强针与基础免疫针有何区别？过敏能够接种新冠疫苗吗？</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\"><br/></span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\">6月6日晚18:00至18:30，“公共卫生大家谈”系列讲座第六期，特邀上海市疾病预防控制中心副主任——孙晓冬主任医师，带我们一道深入了解新冠病毒疫苗。</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\"><br/></span></p><p><strong><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 20px;\">接种疫苗 筑起群体免疫屏障</span></strong></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\">接种新冠病毒疫苗，可以让绝大部分人群获得免疫力，并且，当接种覆盖面达到一定程度后，可在人群中逐步形成群体免疫屏障。疫苗接种，不仅是对自身健康、对周围因为禁忌证等原因未能接种疫苗的人的保护，也是阻断新冠病毒流行的关键。</span></p><p><img src=\"http://localhost:8080/YiQingManageSystem/resources/upload/image/20220613/1655119012373085715.jpg\" title=\"1655119012373085715.jpg\" alt=\"378.jpg\"/></p><p><img src=\"http://localhost:8080/YiQingManageSystem/resources/upload/image/20220613/1655119020688063906.jpg\" title=\"1655119020688063906.jpg\" alt=\"379.jpg\"/></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\">图片来源：上海市疾病预防控制中心</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\"><br/></span></p><p><strong><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 20px;\">老年朋友 接种疫苗很重要</span></strong></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\">根据上海最新的监测数据显示：接种新冠病毒基础免疫针后，对于预防重症的保护效力超过60%，而加强免疫针之后的保护效力可超过90%。新冠病毒的易感因素包括：老龄、慢性基础性疾病，及未接种疫苗者等。因此，对于有基础性疾病的老年人来说，尽早接种新冠疫苗可以极大程度降低发生重症和危重症的风险。</span></p><p><img src=\"http://localhost:8080/YiQingManageSystem/resources/upload/image/20220613/1655119064147042860.jpg\" title=\"1655119064147042860.jpg\" alt=\"382.jpg\"/><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\">图片来源：上海市疾病预防控制中心</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\"><br/></span></p><p><strong><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 20px;\">加强针与基础免疫针有何区别</span></strong></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\">新冠病毒基础免疫针有3种类型：腺病毒载体疫苗（1剂）、灭活疫苗（2剂）和重组蛋白疫苗（3剂）。加强针是在基础免疫针的基础上，再接种的后续针次。在基础疫苗针后接种加强针，可以再次激发免疫反应，使抗体水平达到高峰。加强免疫有两种形式：同源加强和序贯加强。同源加强是同一种工艺的疫苗加强不同的剂次，如：灭活疫苗，居民打了两剂基础免疫剂，那第三针就是加强免疫针。至于序贯加强，就是通过不同生产工艺疫苗的不同的组合来发挥，同样可起到加强免疫的作用。</span></p><p><img src=\"http://localhost:8080/YiQingManageSystem/resources/upload/image/20220613/1655119106026061178.jpg\" title=\"1655119106026061178.jpg\" alt=\"384.jpg\"/></p><p><strong><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 20px;\">本期专家三问三答</span></strong></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\">问：新冠疫苗说明书上写了禁忌证，是不是有这些禁忌证的都不能打？</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\">答：有新冠疫苗接种禁忌证的市民不建议打，包括：①明确对疫苗的主要成分过敏；②既往发生过疫苗严重过敏反应者；③患有未控制的癲痫和其他严重神经系统疾病者；④正在发热者，或患急性疾病，或慢性疾病的急性发作期，或未控制的严重慢性病患者；⑤妊娠期妇女。</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\">*慢性病患者在疾病稳定期都可以接种疫苗，居民也可在接种前询问自己的主治医生，或带着病历本去接种点请现场的医务人员进行评估。</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\"><br/></span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\">问：有过敏史，经常会出现皮疹和湿疹的人，不适合接种新冠疫苗吗？</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\">答：有过敏史的人群，请先明确过敏源。对疫苗成分严重过敏，或以往接种疫苗有严重过敏反应者，不适合接种疫苗。但湿疹和皮疹等过敏情况对于接种疫苗来说不是禁忌证，是可以接种的。若不确定自己究竟对什么过敏，可在接种前咨询医生。</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\"><br/></span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\">问：想去打加强针，可第二针接种超过6个月了是不是效果会变差？</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: -apple-system-font, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei&quot;, sans-serif; text-align: justify; font-size: 18px;\">答：一般不会。只要是满6个月以上在一定的时间范围内去接种新冠疫苗加强针即可。不过建议在规定时间范围内，尽早接种。</span></p><p><br/></p>', '2022-06-13 11:19:22', '接种疫苗很重要，这些事项要注意', 'jSisTmOZ', '10', '5');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` char(8) NOT NULL DEFAULT '' COMMENT '角色id',
  `name` varchar(16) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(128) NOT NULL DEFAULT '' COMMENT '角色描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('mY69h4is', '管理员', '管理员有全部权限！');
INSERT INTO `role` VALUES ('tWalUpvk', '普通用户', '普通用户有部分权限！');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` char(8) NOT NULL DEFAULT '' COMMENT '用户id',
  `username` varchar(8) NOT NULL DEFAULT '' COMMENT '用户名称',
  `password` varchar(16) NOT NULL DEFAULT '' COMMENT '用户密码',
  `role_id` char(8) NOT NULL DEFAULT '' COMMENT '用户所属角色id',
  `phone` varchar(16) NOT NULL DEFAULT '' COMMENT '用户手机号码',
  `identify_card` varchar(32) NOT NULL DEFAULT '' COMMENT '身份证号',
  `sex` int NOT NULL DEFAULT '3' COMMENT '用户性别：1：男；2：女；3：未知',
  `head_pic` varchar(512) NOT NULL DEFAULT '../resources/upload/common/no_image.jpg' COMMENT '用户头像',
  `login_time` datetime NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('dQUjVwno', '李田', '123456', 'tWalUpvk', '19936091299', '410105200109280046', '2', '../resources/upload/20220228/20220613100416.jpg', '2022-06-28 13:46:39');
INSERT INTO `user` VALUES ('jSisTmOZ', '李婧姝', '123456', 'mY69h4is', '19936091699', '410105200109280054', '2', '../resources/upload/20220215/20220613100049.jpg', '2022-06-28 12:54:05');
INSERT INTO `user` VALUES ('lB7HqFpA', '许鑫蓁', '123456', 'tWalUpvk', '19936092288', '410105200107048873', '1', '../resources/upload/20220613/1655107492552.jpg', '2022-06-13 11:37:39');
INSERT INTO `user` VALUES ('mIOsnywx', '徐必成', '123456', 'tWalUpvk', '19936091499', '410105200107037763', '1', '../resources/upload/20220613/1655107183937.jpg', '2022-06-15 11:48:28');
INSERT INTO `user` VALUES ('tCsBRtTg', '李涛', '123456', 'tWalUpvk', '19927766868', '410105200108257763', '1', '../resources/upload/20220613/1655119850956.jpg', '2022-06-13 11:29:53');
INSERT INTO `user` VALUES ('ybxnraeu', '陈凌霄', '123456', 'tWalUpvk', '19936091899', '410105200107658893', '2', '../resources/upload/20220613/1655090714898.jpg', '2022-06-28 14:11:37');
