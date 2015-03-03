/*
Navicat MySQL Data Transfer

Source Server         : localhost-mysql
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : zfb_dev

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-03-03 16:10:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accept_merchant
-- ----------------------------
DROP TABLE IF EXISTS `accept_merchant`;
CREATE TABLE `accept_merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '单位代码',
  `address` varchar(200) DEFAULT NULL COMMENT '单位地址',
  `name` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `contacts` varchar(20) DEFAULT NULL COMMENT '单位联系人',
  `tel` varchar(50) DEFAULT NULL COMMENT '联系电话',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '单位银行账户',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '单位银行名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(20) DEFAULT NULL COMMENT '状态(VALID-有效， INVALID-无效）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='收货单位信息表';

-- ----------------------------
-- Records of accept_merchant
-- ----------------------------
INSERT INTO `accept_merchant` VALUES ('1', '001', '成都', '苏宁电器', '草泥马', '15633221236', '49846491879881', '招商银行', '荆轲刺青王', '2015-02-02 23:15:29', 'VALID');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '技术部', null);
INSERT INTO `department` VALUES ('2', '研发部', null);
INSERT INTO `department` VALUES ('3', '财务部', null);

-- ----------------------------
-- Table structure for input_info
-- ----------------------------
DROP TABLE IF EXISTS `input_info`;
CREATE TABLE `input_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '入库单号',
  `project_name` varchar(50) DEFAULT NULL COMMENT '项目工程名',
  `purchase_type_id` varchar(50) DEFAULT NULL COMMENT '采购类别编码',
  `purchase_type_name` varchar(20) DEFAULT NULL COMMENT '采购类别名称',
  `contract_num` varchar(50) DEFAULT NULL COMMENT '合同编号',
  `merchant_id` varchar(50) DEFAULT NULL COMMENT '供应商编码',
  `merchant_name` varchar(50) DEFAULT NULL COMMENT '供应商编码名称',
  `warehouse` varchar(50) DEFAULT NULL COMMENT '入库仓库',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(20) DEFAULT NULL COMMENT '状态(VALID-有效， INVALID-无效）',
  `material_id` varchar(50) DEFAULT NULL COMMENT '材料编码',
  `material_name` varchar(50) DEFAULT NULL COMMENT '材料名称',
  `count` decimal(15,2) DEFAULT NULL COMMENT '入库数量',
  `money` decimal(15,2) DEFAULT NULL COMMENT '总金额',
  `transport_person` varchar(20) DEFAULT NULL COMMENT '运输人',
  `car_num` varchar(20) DEFAULT NULL COMMENT '运输车号',
  `weigh_person` varchar(20) DEFAULT NULL COMMENT '过磅人',
  `send_person` varchar(20) DEFAULT NULL COMMENT '发货人',
  `accept_person` varchar(20) DEFAULT NULL COMMENT '收货人',
  `input_time` datetime DEFAULT NULL COMMENT '入库日期',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `send_person_id` varchar(50) DEFAULT NULL COMMENT '发货人编码',
  `accept_person_id` varchar(50) DEFAULT NULL COMMENT '收货人编码',
  `standard_id` varchar(50) DEFAULT NULL COMMENT '材料规格编码',
  `standard_name` varchar(50) DEFAULT NULL COMMENT '材料规格名称',
  `price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `unit` varchar(10) DEFAULT NULL COMMENT '单位',
  `accept_merchant_id` varchar(50) DEFAULT NULL COMMENT '收货单位编码',
  `accept_merchant_name` varchar(50) DEFAULT NULL COMMENT '收货单位名称',
  `discount` decimal(10,2) DEFAULT NULL,
  `material_code` varchar(50) DEFAULT NULL COMMENT '材料编号',
  `type` varchar(20) DEFAULT NULL COMMENT '类型（ADD-手动添加  EXCEL-excel导入）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='入库信息表';

-- ----------------------------
-- Records of input_info
-- ----------------------------
INSERT INTO `input_info` VALUES ('29', 'RK20150212001', '001', '001', '煤矿类型1', null, '1', '国美电器1', '001', '2015-02-12 13:12:31', 'VALID', '1', '煤矿', '1.00', '800.00', '1', '001', '1', '金三胖', '金三胖', '2015-02-12 13:12:31', '1213', '1', '1', '001', 'A级', '1000.00', '吨', null, null, '20.00', '001', 'ADD');
INSERT INTO `input_info` VALUES ('30', 'RK20150212002', '2', '001', '煤矿类型1', null, '1', '国美电器1', '1', '2015-02-12 13:16:10', 'VALID', '1', '煤矿', '1.00', '800.00', '1', '1', '1', '金三胖', '金三胖', '2015-02-12 13:16:10', '1', '1', '1', '001', 'A级', '1000.00', '吨', null, null, '20.00', '001', 'ADD');
INSERT INTO `input_info` VALUES ('73', 'RK20150212003', null, null, '原矿', null, null, null, 'A', '2015-02-12 14:07:30', 'VALID', null, '萤石矿', '1000.00', '500000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-01 00:00:00', '', null, null, null, '一级95%-97%', '500.00', '吨', null, null, '10.00', 'CaF2 45', 'EXCEL');
INSERT INTO `input_info` VALUES ('74', 'RK20150212004', null, null, '粉', null, null, null, 'A', '2015-02-12 14:07:30', 'VALID', null, '石粉', '1000.00', '50000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-01 00:00:00', '', null, null, null, '一级92%-95%', '50.00', '吨', null, null, '10.00', 'Cb', 'EXCEL');
INSERT INTO `input_info` VALUES ('75', 'RK20150212005', null, null, '原矿', null, null, null, 'B', '2015-02-12 14:07:30', 'VALID', null, '萤石矿', '2000.00', '1000000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-01 00:00:00', '', null, null, null, '二级90%', '500.00', '吨', null, null, '10.00', 'CaF2 47', 'EXCEL');
INSERT INTO `input_info` VALUES ('76', 'RK20150212006', null, null, '原矿', null, null, null, 'A', '2015-02-12 14:07:30', 'VALID', null, '萤石矿', '2000.00', '1000000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-01 00:00:00', '', null, null, null, '一级95%', '500.00', '吨', null, null, '10.00', 'CaF2 48', 'EXCEL');
INSERT INTO `input_info` VALUES ('77', 'RK20150212007', null, null, '原矿', null, null, null, 'A', '2015-02-12 14:07:30', 'VALID', null, '萤石矿', '1000.00', '500000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AADDD', '2015-01-02 00:00:00', '', null, null, null, '一级95%-97%', '500.00', '吨', null, null, '10.00', 'CaF2 45', 'EXCEL');
INSERT INTO `input_info` VALUES ('78', 'RK20150212008', null, null, '粉', null, null, null, 'A', '2015-02-12 14:07:30', 'VALID', null, '石粉', '1000.00', '50000.00', null, '甘F·5468867', '张健君', 'VVVVVV', '李强', '2015-01-02 00:00:00', '', null, null, null, '一级92%-95%', '50.00', '吨', null, null, '10.00', 'Cb', 'EXCEL');
INSERT INTO `input_info` VALUES ('79', 'RK20150212009', null, null, '原矿', null, null, null, 'B', '2015-02-12 14:07:30', 'VALID', null, '萤石矿', '2000.00', '1000000.00', null, '甘F·5468868', '张健君', 'VVVVVV', '汪铭锐', '2015-01-02 00:00:00', '', null, null, null, '二级90%', '500.00', '吨', null, null, '10.00', 'CaF2 47', 'EXCEL');
INSERT INTO `input_info` VALUES ('80', 'RK20150212010', null, null, '原矿', null, null, null, 'A', '2015-02-12 14:07:30', 'VALID', null, '萤石矿', '2000.00', '1000000.00', null, '甘F·5468869', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-02 00:00:00', '', null, null, null, '一级95%', '500.00', '吨', null, null, '10.00', 'CaF2 48', 'EXCEL');
INSERT INTO `input_info` VALUES ('81', 'CK20150212002', null, null, '原矿', null, null, null, 'A', '2015-02-12 14:09:24', 'VALID', null, '萤石矿', '1000.00', '500000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-01 00:00:00', '', null, null, null, '一级95%-97%', '500.00', '吨', null, null, '10.00', 'CaF2 45', 'EXCEL');
INSERT INTO `input_info` VALUES ('82', 'CK20150212002', null, null, '粉', null, null, null, 'A', '2015-02-12 14:09:24', 'VALID', null, '石粉', '1000.00', '50000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-01 00:00:00', '', null, null, null, '一级92%-95%', '50.00', '吨', null, null, '10.00', 'Cb', 'EXCEL');
INSERT INTO `input_info` VALUES ('83', 'CK20150212002', null, null, '原矿', null, null, null, 'B', '2015-02-12 14:09:25', 'VALID', null, '萤石矿', '2000.00', '1000000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-01 00:00:00', '', null, null, null, '二级90%', '500.00', '吨', null, null, '10.00', 'CaF2 47', 'EXCEL');
INSERT INTO `input_info` VALUES ('84', 'CK20150212002', null, null, '原矿', null, null, null, 'A', '2015-02-12 14:09:25', 'VALID', null, '萤石矿', '2000.00', '1000000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-01 00:00:00', '', null, null, null, '一级95%', '500.00', '吨', null, null, '10.00', 'CaF2 48', 'EXCEL');
INSERT INTO `input_info` VALUES ('85', 'CK20150212002', null, null, '原矿', null, null, null, 'A', '2015-02-12 14:09:25', 'VALID', null, '萤石矿', '1000.00', '500000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AADDD', '2015-01-02 00:00:00', '', null, null, null, '一级95%-97%', '500.00', '吨', null, null, '10.00', 'CaF2 45', 'EXCEL');
INSERT INTO `input_info` VALUES ('86', 'CK20150212002', null, null, '粉', null, null, null, 'A', '2015-02-12 14:09:25', 'VALID', null, '石粉', '1000.00', '50000.00', null, '甘F·5468867', '张健君', 'VVVVVV', '李强', '2015-01-02 00:00:00', '', null, null, null, '一级92%-95%', '50.00', '吨', null, null, '10.00', 'Cb', 'EXCEL');
INSERT INTO `input_info` VALUES ('87', 'CK20150212002', null, null, '原矿', null, null, null, 'B', '2015-02-12 14:09:25', 'VALID', null, '萤石矿', '2000.00', '1000000.00', null, '甘F·5468868', '张健君', 'VVVVVV', '汪铭锐', '2015-01-02 00:00:00', '', null, null, null, '二级90%', '500.00', '吨', null, null, '10.00', 'CaF2 47', 'EXCEL');
INSERT INTO `input_info` VALUES ('88', 'CK20150212002', null, null, '原矿', null, null, null, 'A', '2015-02-12 14:09:25', 'VALID', null, '萤石矿', '2000.00', '1000000.00', null, '甘F·5468869', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-02 00:00:00', '', null, null, null, '一级95%', '500.00', '吨', null, null, '10.00', 'CaF2 48', 'EXCEL');

-- ----------------------------
-- Table structure for loan
-- ----------------------------
DROP TABLE IF EXISTS `loan`;
CREATE TABLE `loan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '借款单号',
  `loan_person` varchar(20) DEFAULT NULL COMMENT '借款人',
  `loan_time` datetime DEFAULT NULL COMMENT '借款时间',
  `money_lower` decimal(15,2) DEFAULT NULL COMMENT '借款金额小写',
  `money_capital` varchar(50) DEFAULT NULL COMMENT '借款金额大写',
  `reason` varchar(2000) DEFAULT NULL COMMENT '借款用途及理由',
  `loan_dept_id` varchar(50) DEFAULT NULL COMMENT '借款部门编码',
  `loan_dept_name` varchar(50) DEFAULT NULL COMMENT '借款部门名称',
  `use_dept_id` varchar(50) DEFAULT NULL COMMENT '使用部门编码',
  `use_dept_name` varchar(50) DEFAULT NULL COMMENT '使用部门名称',
  `loan_type` varchar(20) DEFAULT NULL COMMENT '借款类别',
  `check_num` varchar(50) DEFAULT NULL COMMENT '支票编号',
  `repay_method` varchar(50) DEFAULT NULL COMMENT '还款方式',
  `approve` varchar(20) DEFAULT NULL COMMENT '批准人',
  `verify` varchar(20) DEFAULT NULL COMMENT '财务准核人',
  `finance_verify` varchar(20) DEFAULT NULL COMMENT '财务审核人',
  `dept_verify` varchar(20) DEFAULT NULL COMMENT '部门审核人',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `annex` varchar(2000) DEFAULT NULL COMMENT '附件',
  `create_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `annex_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='借款信息表';

-- ----------------------------
-- Records of loan
-- ----------------------------
INSERT INTO `loan` VALUES ('1', '0001', '金三票', '2015-02-05 23:46:03', '100.00', '壹佰', '任性', '1', '设备部', '1', '设备部', 'TRANS', null, '就不还钱', '里斯', '王五', '王尼玛', '草泥马', '你没', null, '2015-02-05 23:48:10', 'VALID', null);
INSERT INTO `loan` VALUES ('3', null, '4444', '2015-02-06 11:22:28', '0.00', null, null, null, '', null, '', 'TRANS', null, null, null, null, null, null, null, null, '2015-02-06 11:23:45', 'INVALID', null);
INSERT INTO `loan` VALUES ('4', null, '3', '2015-02-06 11:24:12', '3.00', '3', '', '1', '技术部', '1', '技术部', 'TRANS', '', '', '', '', '', '', '', null, '2015-02-06 11:24:12', 'INVALID', null);
INSERT INTO `loan` VALUES ('5', null, '3', '2015-02-13 00:00:00', '3333333333.00', '3', '3', '1', '技术部', '1', '技术部', 'CHECK', '', '3', '3', '3', '33', '3', '3', 'QQ截图20150204180047.png', '2015-02-06 11:27:00', 'VALID', '/upload/20150209\\\\QQ截图20150204180047.png');
INSERT INTO `loan` VALUES ('6', '1423214642654', null, '2015-02-09 15:58:13', '11.00', '11', '11', null, '', null, '', 'TRANS', '1111111', null, '11', '11', '11', '11', '11', '套帐表设计手册.doc', '2015-02-06 17:24:02', 'VALID', '/upload/20150209\\\\套帐表设计手册.doc');
INSERT INTO `loan` VALUES ('7', '1423217491007', '1', '2015-02-06 18:11:31', '1.00', '11', '1', '1', '技术部', '1', '技术部', 'TRANS', '', '1', '1', '1', '1', '1', '1', null, '2015-02-06 18:11:31', 'VALID', null);
INSERT INTO `loan` VALUES ('8', '1423219078776', '34eesrfw', '2015-02-06 18:37:58', '1.00', '1', '1', '1', '技术部', '1', '技术部', 'TRANS', '', '', '', '', '', '', '1', '套帐.xls', '2015-02-06 18:37:58', 'VALID', '/upload/20150206\\\\套帐.xls');
INSERT INTO `loan` VALUES ('9', '1423448351022', '', '2015-02-09 10:19:11', '11.00', '', '', '1', '技术部', '1', '技术部', 'TRANS', '', '', '', '', '', '', '', '', '2015-02-09 10:19:11', 'VALID', '');
INSERT INTO `loan` VALUES ('10', '1423461921680', null, '2015-02-09 14:05:21', '0.00', null, null, null, '', null, '', null, null, null, null, null, null, null, null, null, '2015-02-09 14:05:21', 'VALID', null);
INSERT INTO `loan` VALUES ('11', '1423462248055', null, '2015-02-09 14:10:37', '0.00', null, null, null, '', null, '', null, null, null, null, null, null, null, null, null, '2015-02-09 14:10:53', 'VALID', null);
INSERT INTO `loan` VALUES ('12', '1423462350682', '', '2015-02-09 14:12:30', '123.00', '', '', '1', '技术部', '1', '技术部', 'CASH', '', '', '', '', '', '', '', '', '2015-02-09 14:12:30', 'VALID', '');
INSERT INTO `loan` VALUES ('13', '1423462559946', '', '2015-02-09 14:15:59', '43.00', '', '', '1', '技术部', '1', '技术部', 'CASH', '', '', '', '', '', '', '', '套帐表设计手册.doc', '2015-02-09 14:15:59', 'VALID', '/upload/20150209\\\\套帐表设计手册.doc');
INSERT INTO `loan` VALUES ('14', '1423462681952', '', '2015-02-09 14:18:01', '0.00', '', '', '1', '技术部', '1', '技术部', 'CASH', '', '', '', '', '', '', '', '删除确认弹出框.txt', '2015-02-09 14:18:01', 'VALID', '/upload/20150209\\\\删除确认弹出框.txt');
INSERT INTO `loan` VALUES ('15', '1423466125368', '', '2015-02-09 15:15:25', '0.00', '', '', '1', '技术部', '1', '技术部', 'TRANS', '', '', '', '', '', '', '', '系统集成实施方案V1.3.docx', '2015-02-09 15:15:25', 'VALID', '/upload/20150209\\\\系统集成实施方案V1.3.docx');
INSERT INTO `loan` VALUES ('16', '1423467665871', '', '2015-02-09 15:41:05', '0.00', '', '', '1', '技术部', '1', '技术部', 'TRANS', '', '', '', '', '', '', '', null, '2015-02-09 15:41:05', 'VALID', null);
INSERT INTO `loan` VALUES ('17', '1423622539433', '1', '2015-02-12 00:00:00', '2.00', '12', '2222', '1', '技术部', '1', '技术部', 'TRANS', '', '2', '22', '2', '2', '2', '22222', null, '2015-02-11 10:42:19', 'VALID', null);

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '材料代码',
  `num` varchar(50) DEFAULT NULL COMMENT '材料编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `standard_id` varchar(50) DEFAULT NULL COMMENT '材料规格编码',
  `standard_name` varchar(50) DEFAULT NULL COMMENT '材料规格名称',
  `unit` varchar(50) DEFAULT NULL COMMENT '材料单位',
  `price` decimal(15,2) DEFAULT NULL COMMENT '价格',
  `count` decimal(15,2) DEFAULT NULL COMMENT '材料数量',
  `discount` decimal(15,2) DEFAULT NULL COMMENT '材料折扣',
  `type_id` varchar(50) DEFAULT NULL COMMENT '材料类别编码',
  `type_name` varchar(50) DEFAULT NULL COMMENT '材料类别名称',
  `create_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='材料信息表';

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES ('1', '001', 'aaa', '煤矿', '001', 'A级', '吨', '1000.00', '100.00', '20.00', '001', '煤矿类型1', '2015-02-02 22:02:44', 'VALID');
INSERT INTO `material` VALUES ('2', '002', 'bbb', '金矿', '001', 'B级', '克', '50000.00', '100.00', '20.00', '001', '类型2', '2015-02-02 22:53:14', 'VALID');

-- ----------------------------
-- Table structure for material_settle
-- ----------------------------
DROP TABLE IF EXISTS `material_settle`;
CREATE TABLE `material_settle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) DEFAULT NULL COMMENT '工厂id',
  `merchant_name` varchar(50) DEFAULT NULL COMMENT '工厂名称',
  `settle_date` datetime DEFAULT NULL COMMENT '结算日期',
  `project_name` varchar(50) DEFAULT NULL COMMENT '工程名称',
  `sale_total_money` decimal(10,2) DEFAULT NULL COMMENT '卖出总价款',
  `pre_pay_money` decimal(10,2) DEFAULT NULL COMMENT '已预付款',
  `loan` decimal(10,2) DEFAULT NULL COMMENT '借款总金额',
  `process_total_money` decimal(10,2) DEFAULT NULL COMMENT '加工费总额',
  `trans_total_money` decimal(10,2) DEFAULT NULL COMMENT '运费总额',
  `pay_money` decimal(10,2) DEFAULT NULL COMMENT '本次实付款',
  `sale_merchant` varchar(50) DEFAULT NULL COMMENT '矿石销售方',
  `provide_merchant` varchar(50) DEFAULT NULL COMMENT '矿石供应方',
  `leader_sign` varchar(50) DEFAULT NULL COMMENT '加工成领导签字',
  `provide_sign` varchar(50) DEFAULT NULL COMMENT '供货方签字',
  `company_leader_sign` varchar(50) DEFAULT NULL COMMENT '公司领导签字',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '银行名称',
  `mine_sign` varchar(50) DEFAULT NULL COMMENT '矿方签字',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '银行账号',
  `leader_check` varchar(50) DEFAULT NULL COMMENT '领导审批',
  `accounting_check` varchar(50) DEFAULT NULL COMMENT '会计复核',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='材料结算单';

-- ----------------------------
-- Records of material_settle
-- ----------------------------
INSERT INTO `material_settle` VALUES ('1', '1', '1', '2015-03-03 14:35:41', '1', '1.00', '1.00', '1.00', '1.00', '1.00', '1.00', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for material_standard
-- ----------------------------
DROP TABLE IF EXISTS `material_standard`;
CREATE TABLE `material_standard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(20) DEFAULT NULL COMMENT '类别名称',
  `material_id` varchar(50) DEFAULT NULL COMMENT '材料编码',
  `create_time` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='采购类别';

-- ----------------------------
-- Records of material_standard
-- ----------------------------
INSERT INTO `material_standard` VALUES ('1', null, '材料类型1', null, null, null);
INSERT INTO `material_standard` VALUES ('2', null, '材料类型2', null, null, null);

-- ----------------------------
-- Table structure for merchant
-- ----------------------------
DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '供货单位代码',
  `address` varchar(200) DEFAULT NULL COMMENT '供货单位地址',
  `name` varchar(50) DEFAULT NULL COMMENT '供货单位名称',
  `contacts` varchar(20) DEFAULT NULL COMMENT '供货单位联系人',
  `tel` varchar(50) DEFAULT NULL COMMENT '供货人联系电话',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '供货单位银行账户',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '供货单位银行名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(20) DEFAULT NULL COMMENT '状态(VALID-有效， INVALID-无效）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='供货单位信息表';

-- ----------------------------
-- Records of merchant
-- ----------------------------
INSERT INTO `merchant` VALUES ('1', '001', '成都1', '国美电器1', '张三1', '13088889999', '2222222233333336', '花旗英航1', '没什么可说的1', '2015-02-02 21:59:24', 'VALID');
INSERT INTO `merchant` VALUES ('2', '002', '成都2', '国美电器2', '张三2', '13088889999', '2222222233333336', '花旗英航2', '没什么可说的2', '2015-02-02 22:00:54', 'VALID');

-- ----------------------------
-- Table structure for output_info
-- ----------------------------
DROP TABLE IF EXISTS `output_info`;
CREATE TABLE `output_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '出库单号',
  `project_name` varchar(50) DEFAULT NULL COMMENT '项目工程名',
  `purchase_type_id` varchar(50) DEFAULT NULL COMMENT '采购类别编码',
  `purchase_type_name` varchar(20) DEFAULT NULL COMMENT '供应商名称',
  `contract_num` varchar(50) DEFAULT NULL COMMENT '合同编号',
  `merchant_id` varchar(50) DEFAULT NULL COMMENT '供应商编码',
  `merchant_name` varchar(50) DEFAULT NULL COMMENT '供应商编码名称',
  `warehouse` varchar(50) DEFAULT NULL COMMENT '出库仓库',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(20) DEFAULT NULL COMMENT '状态(VALID-有效， INVALID-无效）',
  `material_id` varchar(50) DEFAULT NULL COMMENT '材料编码',
  `material_name` varchar(50) DEFAULT NULL COMMENT '材料名称',
  `count` decimal(15,2) DEFAULT NULL COMMENT '出库数量',
  `money` decimal(15,2) DEFAULT NULL COMMENT '总金额',
  `transport_person` varchar(20) DEFAULT NULL COMMENT '运输人',
  `car_num` varchar(20) DEFAULT NULL COMMENT '运输车号',
  `weigh_person` varchar(20) DEFAULT NULL COMMENT '过磅人',
  `send_person` varchar(20) DEFAULT NULL COMMENT '发货人',
  `accept_person` varchar(20) DEFAULT NULL COMMENT '收货人',
  `output_time` datetime DEFAULT NULL COMMENT '出库日期',
  `is_clear` tinyint(4) DEFAULT '0' COMMENT '是否结清（0-未结清，1-已结清）',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `send_person_id` varchar(50) DEFAULT NULL COMMENT '发货人编码',
  `accept_person_id` varchar(50) DEFAULT NULL COMMENT '收货人编码',
  `standard_id` varchar(50) DEFAULT NULL,
  `standard_name` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `accept_merchant_id` varchar(50) DEFAULT NULL,
  `accept_merchant_name` varchar(50) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `material_code` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL COMMENT '类型（ADD-手动添加  EXCEL-excel导入）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='出库信息表';

-- ----------------------------
-- Records of output_info
-- ----------------------------
INSERT INTO `output_info` VALUES ('6', 'CK20150212001', '1', '001', '煤矿类型1', null, '1', '国美电器1', '1', '2015-02-12 13:31:19', 'VALID', '1', '煤矿', '1.00', '800.00', '1', '1', '1', '金三胖', '金三胖', '2015-02-12 13:31:19', '0', '1', '1', '1', '001', 'A级', '1000.00', '吨', null, null, '20.00', '001', 'ADD');
INSERT INTO `output_info` VALUES ('7', 'CK20150212002', null, null, '原矿', null, null, null, 'A', '2015-02-12 14:21:42', 'VALID', null, '萤石矿', '1000.00', '500000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-01 00:00:00', '0', '', null, null, null, '一级95%-97%', '500.00', '吨', null, null, '10.00', 'CaF2 45', 'EXCEL');
INSERT INTO `output_info` VALUES ('8', 'CK20150212003', null, null, '粉', null, null, null, 'A', '2015-02-12 14:21:42', 'VALID', null, '石粉', '1000.00', '50000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-01 00:00:00', '0', '', null, null, null, '一级92%-95%', '50.00', '吨', null, null, '10.00', 'Cb', 'EXCEL');
INSERT INTO `output_info` VALUES ('9', 'CK20150212004', null, null, '原矿', null, null, null, 'B', '2015-02-12 14:21:42', 'VALID', null, '萤石矿', '2000.00', '1000000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-01 00:00:00', '0', '', null, null, null, '二级90%', '500.00', '吨', null, null, '10.00', 'CaF2 47', 'EXCEL');
INSERT INTO `output_info` VALUES ('10', 'CK20150212005', null, null, '原矿', null, null, null, 'A', '2015-02-12 14:21:42', 'VALID', null, '萤石矿', '2000.00', '1000000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-01 00:00:00', '0', '', null, null, null, '一级95%', '500.00', '吨', null, null, '10.00', 'CaF2 48', 'EXCEL');
INSERT INTO `output_info` VALUES ('11', 'CK20150212006', null, null, '原矿', null, null, null, 'A', '2015-02-12 14:21:42', 'VALID', null, '萤石矿', '1000.00', '500000.00', null, '甘F·5468866', '张健君', 'VVVVVV', 'AADDD', '2015-01-02 00:00:00', '0', '', null, null, null, '一级95%-97%', '500.00', '吨', null, null, '10.00', 'CaF2 45', 'EXCEL');
INSERT INTO `output_info` VALUES ('12', 'CK20150212007', null, null, '粉', null, null, null, 'A', '2015-02-12 14:21:42', 'VALID', null, '石粉', '1000.00', '50000.00', null, '甘F·5468867', '张健君', 'VVVVVV', '李强', '2015-01-02 00:00:00', '0', '', null, null, null, '一级92%-95%', '50.00', '吨', null, null, '10.00', 'Cb', 'EXCEL');
INSERT INTO `output_info` VALUES ('13', 'CK20150212008', null, null, '原矿', null, null, null, 'B', '2015-02-12 14:21:42', 'VALID', null, '萤石矿', '2000.00', '1000000.00', null, '甘F·5468868', '张健君', 'VVVVVV', '汪铭锐', '2015-01-02 00:00:00', '0', '', null, null, null, '二级90%', '500.00', '吨', null, null, '10.00', 'CaF2 47', 'EXCEL');
INSERT INTO `output_info` VALUES ('14', 'CK20150212009', null, null, '原矿', null, null, null, 'A', '2015-02-12 14:21:42', 'VALID', null, '萤石矿', '2000.00', '1000000.00', null, '甘F·5468869', '张健君', 'VVVVVV', 'AAAAAA', '2015-01-02 00:00:00', '0', '', null, null, null, '一级95%', '500.00', '吨', null, null, '10.00', 'CaF2 48', 'EXCEL');

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `merchant_id` varchar(50) DEFAULT NULL COMMENT '商家编码',
  `type` varchar(20) DEFAULT NULL COMMENT '类型（SEND-发货人， ACCEPT-收货人）',
  `craete_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(20) DEFAULT NULL COMMENT '类型',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', '金三胖', '13566998547', '1', 'SEND', '2015-02-02 22:18:37', 'VALID', '001');
INSERT INTO `person` VALUES ('2', '奥巴马', '15622113657', '1', 'SEND', '2015-02-02 22:19:04', 'VALID', '002');
INSERT INTO `person` VALUES ('3', '长全蛋', '18622365986', '1', 'ACCEPT', '2015-02-02 22:19:53', 'VALID', '003');
INSERT INTO `person` VALUES ('4', '王尼玛', '15788662365', '1', 'ACCEPT', '2015-02-02 23:02:13', 'VALID', '004');
INSERT INTO `person` VALUES ('5', '完尼玛', '18625654394', '2', 'SEND', '2015-02-03 14:19:56', 'VALID', '005');
INSERT INTO `person` VALUES ('6', '敖厂长', '15852526363', '2', 'ACCEPT', '2015-02-03 14:20:34', 'VALID', '006');

-- ----------------------------
-- Table structure for process_merchant
-- ----------------------------
DROP TABLE IF EXISTS `process_merchant`;
CREATE TABLE `process_merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='加工单位';

-- ----------------------------
-- Records of process_merchant
-- ----------------------------
INSERT INTO `process_merchant` VALUES ('1', '单位1');
INSERT INTO `process_merchant` VALUES ('2', '单位2');
INSERT INTO `process_merchant` VALUES ('3', '单位3');

-- ----------------------------
-- Table structure for provide_merchant
-- ----------------------------
DROP TABLE IF EXISTS `provide_merchant`;
CREATE TABLE `provide_merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '供货单位代码',
  `address` varchar(200) DEFAULT NULL COMMENT '供货单位地址',
  `name` varchar(50) DEFAULT NULL COMMENT '供货单位名称',
  `contacts` varchar(20) DEFAULT NULL COMMENT '供货单位联系人',
  `tel` varchar(50) DEFAULT NULL COMMENT '供货人联系电话',
  `bank_account` varchar(50) DEFAULT NULL COMMENT '供货单位银行账户',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '供货单位银行名称',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(20) DEFAULT NULL COMMENT '状态(VALID-有效， INVALID-无效）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='供货单位信息表';

-- ----------------------------
-- Records of provide_merchant
-- ----------------------------
INSERT INTO `provide_merchant` VALUES ('1', '001', '成都1', '国美电器1', '张三1', '13088889999', '2222222233333336', '花旗英航1', '没什么可说的1', '2015-02-02 21:59:24', 'VALID');
INSERT INTO `provide_merchant` VALUES ('2', '002', '成都2', '国美电器2', '张三2', '13088889999', '2222222233333336', '花旗英航2', '没什么可说的2', '2015-02-02 22:00:54', 'VALID');

-- ----------------------------
-- Table structure for purchase_type
-- ----------------------------
DROP TABLE IF EXISTS `purchase_type`;
CREATE TABLE `purchase_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(20) DEFAULT NULL COMMENT '类别名称',
  `material_id` varchar(50) DEFAULT NULL COMMENT '材料编码',
  `create_time` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购类别';

-- ----------------------------
-- Records of purchase_type
-- ----------------------------

-- ----------------------------
-- Table structure for receive
-- ----------------------------
DROP TABLE IF EXISTS `receive`;
CREATE TABLE `receive` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '借款单号',
  `receive_person` varchar(20) DEFAULT NULL COMMENT '负责人',
  `receive_time` datetime DEFAULT NULL COMMENT '借款时间',
  `money_lower` decimal(15,2) DEFAULT NULL COMMENT '借款金额小写',
  `money_capital` varchar(50) DEFAULT NULL COMMENT '借款金额大写',
  `reason` varchar(2000) DEFAULT NULL COMMENT '借款用途及理由',
  `receive_type` varchar(20) DEFAULT NULL,
  `receie_type` varchar(20) DEFAULT NULL COMMENT '借款类别',
  `check_num` varchar(50) DEFAULT NULL COMMENT '支票编号',
  `approve` varchar(20) DEFAULT NULL COMMENT '经办人',
  `verify` varchar(20) DEFAULT NULL COMMENT '财务准核人',
  `finance_verify` varchar(20) DEFAULT NULL COMMENT '财务审核人',
  `dept_verify` varchar(20) DEFAULT NULL COMMENT '部门审核人',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `annex` varchar(2000) DEFAULT NULL COMMENT '附件',
  `create_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `annex_url` varchar(200) DEFAULT NULL,
  `merchant` varchar(200) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL COMMENT '收到金额',
  `arrears` decimal(10,2) DEFAULT NULL COMMENT '欠款',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='借款信息表';

-- ----------------------------
-- Records of receive
-- ----------------------------
INSERT INTO `receive` VALUES ('6', '1423622699968', '11', '2015-02-10 00:00:00', '11.00', '11', '11', 'CHECK', null, '1111111', '11', '11', '11', '11', '11', '套帐.xls', '2015-02-06 14:05:22', 'VALID', '/upload/20150209\\\\套帐.xls', '11', '11.00', '11.00');
INSERT INTO `receive` VALUES ('7', '1423202903283', '22', '2015-02-07 00:00:00', '111.00', 'qq', 'qq', 'CASH', null, '', 'qq', 'qq', 'qq', 'qq', 'qq', null, '2015-02-06 14:08:23', 'INVALID', null, '22', '1.00', '1.00');
INSERT INTO `receive` VALUES ('8', '1423203024864', '1', '2015-02-06 14:10:24', '22.00', '2', '2', 'CASH', null, '', '2', '2', '2', '2', '2', null, '2015-02-06 14:10:24', 'VALID', null, '1', '2.00', '2.00');
INSERT INTO `receive` VALUES ('9', '1423203575718', '22', '2015-02-12 00:00:00', '22.00', '22', '22', 'CASH', null, '', '22', '22', '22', '22', '222', null, '2015-02-06 14:19:35', 'VALID', null, '22', '22.00', '22.00');
INSERT INTO `receive` VALUES ('10', '1423467632032', '', '2015-02-09 15:40:32', '0.00', '', '', 'CASH', null, '', '', '', '', '', '', '入库信息表.xls', '2015-02-09 15:40:32', 'VALID', '/upload/20150209\\\\入库信息表.xls', '', '0.00', '0.00');
INSERT INTO `receive` VALUES ('11', '1423467827097', '2', '2015-02-10 00:00:00', '2.00', '222', '222', 'CASH', null, '', '222', '22', '22', '2', 'dewd', '接口整理.txt', '2015-02-09 15:43:47', 'VALID', '/upload/20150209\\\\接口整理.txt', '2', '2.00', '22.00');
INSERT INTO `receive` VALUES ('12', '1423622685670', '3', '2015-02-13 00:00:00', '3.00', '33', '333333333', 'TRANS', null, '', '3', '3', '3', '3', '3333333333', null, '2015-02-11 10:44:45', 'VALID', null, '3', '3.00', '3.00');
INSERT INTO `receive` VALUES ('13', 'SK20150212001', '', '2015-02-12 14:52:08', '1.00', '1231231', '3213123', 'TRANS', null, '', '', '', '312', '', '', null, '2015-02-12 14:52:08', 'VALID', null, '111', '1.00', '1.00');
INSERT INTO `receive` VALUES ('14', 'SK20150212002', '', '2015-02-12 14:54:20', '111.00', '', '', 'TRANS', null, '', '', '', '', '', '', null, '2015-02-12 14:54:20', 'VALID', null, '', '1.00', '1.00');

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `craete_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(20) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('1', '001', '金三胖', '13566998547', '2015-02-02 22:18:37', 'VALID');
INSERT INTO `staff` VALUES ('2', '002', '奥巴马', '15622113657', '2015-02-02 22:19:04', 'VALID');
INSERT INTO `staff` VALUES ('3', '003', '长全蛋', '18622365986', '2015-02-02 22:19:53', 'VALID');
INSERT INTO `staff` VALUES ('4', '004', '王尼玛', '15788662365', '2015-02-02 23:02:13', 'VALID');
INSERT INTO `staff` VALUES ('5', '005', '完尼玛', '18625654394', '2015-02-03 14:19:56', 'VALID');
INSERT INTO `staff` VALUES ('6', '006', '敖厂长', '15852526363', '2015-02-03 14:20:34', 'VALID');

-- ----------------------------
-- Table structure for transport
-- ----------------------------
DROP TABLE IF EXISTS `transport`;
CREATE TABLE `transport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '运输单号',
  `transport_time` datetime DEFAULT NULL COMMENT '运输日期',
  `transport_merchant_id` int(11) DEFAULT NULL COMMENT '运输单位id',
  `transport_merchant_name` varchar(50) DEFAULT NULL COMMENT '运输单位名称',
  `input_output_code` varchar(50) DEFAULT NULL COMMENT '出入库单号',
  `send_address` varchar(200) DEFAULT NULL COMMENT '发货地址',
  `send_person` varchar(20) DEFAULT NULL COMMENT '发货人',
  `send_person_phone` varchar(20) DEFAULT NULL COMMENT '发货人电话',
  `accept_merchant` varchar(50) DEFAULT NULL COMMENT '收货单位',
  `accept_address` varchar(200) DEFAULT NULL COMMENT '收货地址',
  `accept_person` varchar(20) DEFAULT NULL COMMENT '收货人',
  `accept_person_phone` varchar(20) DEFAULT NULL COMMENT '收货人电话',
  `material_id` int(11) DEFAULT NULL COMMENT '货物id',
  `material_code` varchar(50) DEFAULT NULL COMMENT '货物编号',
  `material_name` varchar(50) DEFAULT NULL COMMENT '货物名称',
  `unit` varchar(20) DEFAULT NULL COMMENT '数量单位',
  `shipping_address` varchar(200) DEFAULT NULL COMMENT '装货地点',
  `shipping_person_phone` varchar(20) DEFAULT NULL COMMENT '装货人电话',
  `send_time` datetime DEFAULT NULL COMMENT '发货日期',
  `off_time` datetime DEFAULT NULL COMMENT '卸货日期',
  `weight_person_sign` varchar(20) DEFAULT NULL COMMENT '过磅人签字',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `car_num` varchar(20) DEFAULT NULL COMMENT '运输车号',
  `send_person_sign` varchar(20) DEFAULT NULL COMMENT '发货人签字',
  `transport_person_sign` varchar(20) DEFAULT NULL COMMENT '承运人签字',
  `dirver_sign` varchar(20) DEFAULT NULL COMMENT '司机签字',
  `create_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `fee` decimal(10,2) DEFAULT NULL COMMENT '运输费',
  `process_fee` decimal(10,2) DEFAULT NULL COMMENT '加工费',
  `material_standard_id` int(11) DEFAULT NULL COMMENT '货物类型id',
  `material_standard_name` varchar(50) DEFAULT NULL COMMENT '货物类型名称',
  `buy_money` decimal(10,2) DEFAULT NULL COMMENT '买入金额',
  `sale_money` decimal(10,2) DEFAULT NULL COMMENT '卖出金额',
  `weight_count` decimal(10,2) DEFAULT NULL COMMENT '加工厂过磅数量',
  `process_count` decimal(10,2) DEFAULT NULL COMMENT '已加工数量',
  `process_merchant_id` int(11) DEFAULT NULL COMMENT '加工单位id',
  `count` decimal(10,2) DEFAULT NULL COMMENT '已加工出的成品数量',
  `process_merchant_name` varchar(50) DEFAULT NULL COMMENT '加工单位名称',
  `cost` decimal(10,2) DEFAULT NULL COMMENT '成本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='承运单';

-- ----------------------------
-- Records of transport
-- ----------------------------
INSERT INTO `transport` VALUES ('1', '1', null, '1', '蚂蚁搬家', null, '1', '1', null, '1', '1', '1', '1', null, '001', '煤矿', '吨', null, null, '2015-02-06 10:01:00', '2015-02-06 00:00:00', null, null, '1', null, null, null, '2015-02-05 14:47:56', 'INVALID', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `transport` VALUES ('2', '2', null, '1', '蚂蚁搬家', null, '2', '2', '1111111', '2', '2', '2', '2', '1', '001', '煤矿', '吨', '1', '1', '2015-02-06 00:00:00', '2015-02-06 00:00:00', null, null, '222222', null, null, null, '2015-02-05 14:52:18', 'VALID', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `transport` VALUES ('3', '3', null, '1', '蚂蚁搬家', null, '3', '3', null, '3', '3', '3', '3', '1', '001', '煤矿', '吨', '3', '3', '2015-02-05 00:00:00', '2015-02-06 00:00:00', null, null, '3333', null, null, null, '2015-02-05 14:52:45', 'INVALID', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `transport` VALUES ('4', '5', null, '2', '灰狗运输', '1423119410405', '5', '5', '5', '5', '5', '5', '5', '2', '002', '金矿', '克', '5', '5', '2015-02-03 00:00:00', '2015-02-04 00:00:00', null, null, '555', null, null, null, '2015-02-05 14:56:50', 'VALID', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `transport` VALUES ('5', '3', null, '1', '蚂蚁搬家', '1423622084776', '3', '3', '3', '3', '3', '3', '3', '1', '001', '煤矿', '吨', '3', '3', null, '2015-02-11 00:00:00', null, null, '3', null, null, null, '2015-02-11 10:34:44', 'VALID', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `transport` VALUES ('6', '4', null, '1', '蚂蚁搬家', '1423622128179', '4', '4', '4', '4', '4', '4', '4', '1', '001', '煤矿', '吨', '4', '4', '2015-02-14 00:00:00', '2015-02-12 00:00:00', null, null, '4', null, null, null, '2015-02-11 10:35:28', 'VALID', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `transport` VALUES ('7', '5', null, '1', '蚂蚁搬家', '1423622237964', '5', '5', '5', '5', '5', '5', '5', '1', '001', '煤矿', '吨', '5', '5', '2015-02-15 00:00:00', '2015-02-16 00:00:00', null, null, '5', null, null, null, '2015-02-11 10:37:17', 'VALID', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `transport` VALUES ('8', null, null, '1', '蚂蚁搬家', 'CY20150212001', '', '', '', '', '', '', '', '1', '001', '煤矿', '吨', '', '', null, null, null, null, '', null, null, null, '2015-02-12 14:47:15', 'INVALID', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `transport` VALUES ('9', null, null, '1', '蚂蚁搬家', 'CY20150212001', '', '', '', '', '', '', '', '1', '001', '煤矿', '吨', '', '', null, null, null, null, '', null, null, null, '2015-02-12 14:49:12', 'INVALID', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `transport` VALUES ('10', null, null, '1', '蚂蚁搬家', 'CY20150212001', '', '', '', '', '', '', '', '1', '001', '煤矿', '吨', '', '', null, null, null, null, '', null, null, null, '2015-02-12 14:50:39', 'INVALID', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `transport` VALUES ('11', 'CY20150212001', null, '1', '蚂蚁搬家', 'CY20150212001', '', '', '', '', '', '', '', '1', '001', '煤矿', '吨', '', '', null, null, null, null, '', null, null, null, '2015-02-12 14:51:20', 'INVALID', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `transport` VALUES ('12', 'CY20150227001', null, '1', '蚂蚁搬家', 'CRK20150227001', '2', '2', '2', '2', '2', '2', '2', '1', '001', '煤矿', '吨', '2', '2', '2015-02-27 00:00:00', '2015-02-27 00:00:00', '3', '333333', '2', '3', '3', '3', '2015-02-27 15:54:40', 'VALID', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `transport` VALUES ('13', 'CY20150302001', null, '1', '蚂蚁搬家', 'CRK20150302001', '1', '1', '1', '1', '1', '1', '1', '1', '001', '煤矿', '吨', '1', '1', null, null, '1', '1', '1', '1', '1', '1', '2015-03-02 14:19:03', 'VALID', '3.00', '12.00', null, '', '3.00', '3.00', '3.00', '3.00', null, '3.00', '', null);
INSERT INTO `transport` VALUES ('14', 'CY20150302002', null, '1', '蚂蚁搬家', 'CRK20150302002', '3', '3', '3', '3', '3', '3', '3', '1', '001', '煤矿', '吨', '3', '3', '2015-03-12 00:00:00', '2015-03-11 00:00:00', '3', '3', '3', '3', '3', '3', '2015-03-02 14:21:33', 'VALID', '3.00', '4.00', '2', '材料类型2', '3.00', '3.00', '3.00', '3.00', '2', '3.00', '单位2', null);

-- ----------------------------
-- Table structure for transport_merchant
-- ----------------------------
DROP TABLE IF EXISTS `transport_merchant`;
CREATE TABLE `transport_merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transport_merchant
-- ----------------------------
INSERT INTO `transport_merchant` VALUES ('1', '蚂蚁搬家', '2015-02-05 14:44:39', 'VALID');
INSERT INTO `transport_merchant` VALUES ('2', '灰狗运输', '2015-02-05 14:45:48', 'VALID');
