/*
Navicat MySQL Data Transfer

Source Server         : localhost-mysql
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : zfb_dev

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-02-06 18:42:05
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
  `count` decimal(10,2) DEFAULT NULL COMMENT '入库数量',
  `money` decimal(10,2) DEFAULT NULL COMMENT '总金额',
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='入库信息表';

-- ----------------------------
-- Records of input_info
-- ----------------------------
INSERT INTO `input_info` VALUES ('1', '1422892976596', 'werwer', null, null, null, '001', '国美电器1', 'ewre', '2015-02-03 00:02:56', 'VALID', '001', '煤矿', '1.00', '1000.00', 'werwrwsdf', 'sdfsdf', 'sdf', '金三胖', '王尼玛', '2015-02-03 00:02:56', '23er2', '001', '004', null, null, '2000.00', '吨', null, null, null, null, 'ADD');
INSERT INTO `input_info` VALUES ('2', '1422893311314', '222', '001', '煤矿类型1', null, '001', '国美电器1', '222', '2015-02-03 00:08:31', 'VALID', '001', '煤矿', '2.00', '2000.00', '222', '222', '222', '金三胖', '王尼玛', '2015-02-03 00:08:31', '222', '001', '004', '001', 'A级', '1000.00', '克', null, null, null, null, 'ADD');
INSERT INTO `input_info` VALUES ('4', '1422937617701', '', '001', '煤矿类型1', null, '001', '国美电器1', '', '2015-02-03 12:26:57', 'INVALID', '001', '煤矿', '224.00', '224000.00', '', '', '', '金三胖', '王尼玛', '2015-02-03 12:26:57', '', '001', '004', '001', 'A级', '1000.00', '吨', null, null, null, null, 'ADD');
INSERT INTO `input_info` VALUES ('5', '1422943888875', 'aXX', '001', '煤矿类型1', null, '001', '国美电器1', 'X', '2015-02-03 14:11:28', 'VALID', '001', '煤矿', '21.00', '21000.00', 'X', 'X', 'X', '奥巴马', '长全蛋', '2015-02-03 14:11:28', 'X', '002', '003', '001', 'A级', '1000.00', '吨', null, null, null, null, 'ADD');
INSERT INTO `input_info` VALUES ('6', '1422975545526', 'cc', '001', '类型2', null, '2', '国美电器2', 'cc', '2015-02-03 22:59:05', 'VALID', '2', '金矿', '2.00', '100000.00', 'cc', 'cc', 'cc', '敖厂长', '敖厂长', '2015-02-03 22:59:05', 'cc', '6', '6', '001', 'B级', '50000.00', '克', null, null, null, null, 'ADD');
INSERT INTO `input_info` VALUES ('7', '1422977404108', 'ss', '001', '类型2', null, '1', '国美电器1', 'vv', '2015-02-03 23:30:04', 'VALID', '2', '金矿', '2.00', '100000.00', 'vv', 'vv', 'vv', '王尼玛', '王尼玛', '2015-02-03 23:30:04', 'vv', '4', '4', '001', 'B级', '50000.00', '克', null, null, null, null, 'ADD');
INSERT INTO `input_info` VALUES ('8', '1422977492529', '', '001', '类型2', null, '2', '国美电器2', '', '2015-02-03 23:32:32', 'VALID', '2', '金矿', '1.00', '50000.00', '', '', '', '敖厂长', '敖厂长', '2015-02-03 23:32:32', '', '6', '6', '001', 'B级', '50000.00', '克', null, null, null, null, 'ADD');
INSERT INTO `input_info` VALUES ('9', '1423034761121', 'vvvv', '001', '类型2', null, '2', '国美电器2', 'v', '2015-02-04 15:26:01', 'VALID', '2', '金矿', '3.00', '150000.00', 'v', 'v', 'v', '完尼玛', '金三胖', '2015-02-04 15:26:01', 'v', '5', '1', '001', 'B级', '50000.00', '克', null, null, null, null, 'ADD');
INSERT INTO `input_info` VALUES ('10', '1423056028876', 'aaa', '001', '煤矿类型1', null, '1', '国美电器1', 'aa', '2015-02-04 21:20:28', 'VALID', '1', '煤矿', '2.00', '1600.00', 'aa', 'aa', 'aa', '金三胖', '金三胖', '2015-02-04 21:20:28', 'aaa', '1', '1', '001', 'A级', '1000.00', '吨', null, null, '20.00', null, 'ADD');
INSERT INTO `input_info` VALUES ('11', '1423056646470', 'bb', '001', '煤矿类型1', null, '1', '国美电器1', 'bb', '2015-02-04 21:30:46', 'VALID', '1', '煤矿', '3.00', '2400.00', 'bb', 'bb', 'bb', '金三胖', '金三胖', '2015-02-04 21:30:46', 'bb', '1', '1', '001', 'A级', '1000.00', '吨', null, null, '20.00', null, 'ADD');

-- ----------------------------
-- Table structure for loan
-- ----------------------------
DROP TABLE IF EXISTS `loan`;
CREATE TABLE `loan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '借款单号',
  `loan_person` varchar(20) DEFAULT NULL COMMENT '借款人',
  `loan_time` datetime DEFAULT NULL COMMENT '借款时间',
  `money_lower` decimal(10,0) DEFAULT NULL COMMENT '借款金额小写',
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='借款信息表';

-- ----------------------------
-- Records of loan
-- ----------------------------
INSERT INTO `loan` VALUES ('1', '0001', '金三票', '2015-02-05 23:46:03', '100', '壹佰', '任性', '1', '设备部', '1', '设备部', 'CASH', null, '就不还钱', '里斯', '王五', '王尼玛', '草泥马', '你没', 'xxx.jpg', '2015-02-05 23:48:10', 'VALID', null);
INSERT INTO `loan` VALUES ('3', null, '4444', '2015-02-06 11:22:28', '0', null, null, null, '', null, '', null, null, null, null, null, null, null, null, null, '2015-02-06 11:23:45', 'INVALID', null);
INSERT INTO `loan` VALUES ('4', null, '3', '2015-02-06 11:24:12', '3', '3', '', '1', '技术部', '1', '技术部', 'CASH', '', '', '', '', '', '', '', null, '2015-02-06 11:24:12', 'INVALID', null);
INSERT INTO `loan` VALUES ('5', null, '3', '2015-02-14 00:00:00', '33', '3', '3', '1', '技术部', '1', '技术部', 'CASH', '', '3', '3', '3', '33', '3', '3', null, '2015-02-06 11:27:00', 'VALID', null);
INSERT INTO `loan` VALUES ('6', '1423214642654', null, '2015-02-06 17:24:02', '0', null, null, null, '', null, '', null, null, null, null, null, null, null, null, null, '2015-02-06 17:24:02', 'VALID', null);
INSERT INTO `loan` VALUES ('7', '1423217491007', '1', '2015-02-06 18:11:31', '1', '11', '1', '1', '技术部', '1', '技术部', 'CASH', '', '1', '1', '1', '1', '1', '1', null, '2015-02-06 18:11:31', 'VALID', null);
INSERT INTO `loan` VALUES ('8', '1423219078776', '34eesrfw', '2015-02-06 18:37:58', '1', '1', '1', '1', '技术部', '1', '技术部', 'CASH', '', '', '', '', '', '', '1', '套帐.xls', '2015-02-06 18:37:58', 'VALID', '/upload/20150206\\\\套帐.xls');

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
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `count` decimal(11,2) DEFAULT NULL COMMENT '材料数量',
  `discount` decimal(11,2) DEFAULT NULL COMMENT '材料折扣',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购类别';

-- ----------------------------
-- Records of material_standard
-- ----------------------------

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
  `count` decimal(10,2) DEFAULT NULL COMMENT '出库数量',
  `money` decimal(10,2) DEFAULT NULL COMMENT '总金额',
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='出库信息表';

-- ----------------------------
-- Records of output_info
-- ----------------------------
INSERT INTO `output_info` VALUES ('1', '1423036401740', '11', '001', '煤矿类型1', null, '1', '国美电器1', '111', '2015-02-04 15:53:21', 'VALID', '1', '煤矿', '1.00', '1000.00', '111', '111', '111', '金三胖', '金三胖', '2015-02-05 15:53:21', '0', '1111', '1', '1', '001', 'A级', '1000.00', '吨', null, null, '10.00', null, 'ADD');
INSERT INTO `output_info` VALUES ('2', '1423036639336', '222', '001', '煤矿类型1', null, '1', '国美电器1', '2', '2015-02-04 15:57:19', 'VALID', '1', '煤矿', '3.00', '3100.00', '2', '2', '2', '金三胖', '金三胖', '2015-02-04 15:57:19', '0', '2', '1', '1', '001', 'A级', '1000.00', '吨', null, null, '10.00', null, 'ADD');
INSERT INTO `output_info` VALUES ('3', '1423036980216', '3331', '001', '类型2', null, '1', '国美电器1', '31', '2015-02-04 16:03:00', 'VALID', '2', '金矿', '1.20', '60000.00', '31', '31', '31', '奥巴马', '奥巴马', '2015-02-04 16:03:00', '0', '31', '2', '2', '001', 'B级', '50000.00', '克', null, null, '10.00', null, 'ADD');
INSERT INTO `output_info` VALUES ('4', '1423038196323', '123123', '001', '煤矿类型1', null, '1', '国美电器1', '12', '2015-02-04 16:23:16', 'VALID', '1', '煤矿', '1.36', '1360.00', '12', '123', '123', '金三胖', '金三胖', '2015-02-04 16:23:16', '0', '123', '1', '1', '001', 'A级', '1000.00', '吨', null, null, '10.00', null, 'ADD');
INSERT INTO `output_info` VALUES ('5', '1423056671486', 'b', '001', '煤矿类型1', null, '1', '国美电器1', 'bb', '2015-02-04 21:31:11', 'VALID', '1', '煤矿', '4.00', '3200.00', 'b', 'b', 'b', '金三胖', '金三胖', '2015-02-04 21:31:11', '0', 'b', '1', '1', '001', 'A级', '1000.00', '吨', null, null, '20.00', null, 'ADD');

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
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for project_consultant
-- ----------------------------
DROP TABLE IF EXISTS `project_consultant`;
CREATE TABLE `project_consultant` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_consultant
-- ----------------------------

-- ----------------------------
-- Table structure for project_customer
-- ----------------------------
DROP TABLE IF EXISTS `project_customer`;
CREATE TABLE `project_customer` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_customer
-- ----------------------------

-- ----------------------------
-- Table structure for project_house_type
-- ----------------------------
DROP TABLE IF EXISTS `project_house_type`;
CREATE TABLE `project_house_type` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_house_type
-- ----------------------------

-- ----------------------------
-- Table structure for project_reserve
-- ----------------------------
DROP TABLE IF EXISTS `project_reserve`;
CREATE TABLE `project_reserve` (
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_reserve
-- ----------------------------

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
  `money_lower` decimal(10,0) DEFAULT NULL COMMENT '借款金额小写',
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='借款信息表';

-- ----------------------------
-- Records of receive
-- ----------------------------
INSERT INTO `receive` VALUES ('6', '1423202722781', '11', '2015-02-13 00:00:00', '11', '11', '11', 'CHECK', null, '1111111', '11', '11', '11', '11', '11', null, '2015-02-06 14:05:22', 'VALID', null, '11', '11.00', '11.00');
INSERT INTO `receive` VALUES ('7', '1423202903283', '22', '2015-02-07 00:00:00', '111', 'qq', 'qq', 'CASH', null, '', 'qq', 'qq', 'qq', 'qq', 'qq', null, '2015-02-06 14:08:23', 'INVALID', null, '22', '1.00', '1.00');
INSERT INTO `receive` VALUES ('8', '1423203024864', '1', '2015-02-06 14:10:24', '22', '2', '2', 'CASH', null, '', '2', '2', '2', '2', '2', null, '2015-02-06 14:10:24', 'VALID', null, '1', '2.00', '2.00');
INSERT INTO `receive` VALUES ('9', '1423203575718', '22', '2015-02-12 00:00:00', '22', '22', '22', 'CASH', null, '', '22', '22', '22', '22', '222', null, '2015-02-06 14:19:35', 'VALID', null, '22', '22.00', '22.00');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='承运单';

-- ----------------------------
-- Records of transport
-- ----------------------------
INSERT INTO `transport` VALUES ('1', '1', null, '1', '蚂蚁搬家', null, '1', '1', null, '1', '1', '1', '1', null, '001', '煤矿', '吨', null, null, '2015-02-06 10:01:00', '2015-02-06 00:00:00', null, null, '1', null, null, null, '2015-02-05 14:47:56', 'INVALID');
INSERT INTO `transport` VALUES ('2', '2', null, '1', '蚂蚁搬家', null, '2', '2', '1111111', '2', '2', '2', '2', '1', '001', '煤矿', '吨', '1', '1', '2015-02-06 00:00:00', '2015-02-06 00:00:00', null, null, '222222', null, null, null, '2015-02-05 14:52:18', 'VALID');
INSERT INTO `transport` VALUES ('3', '3', null, '1', '蚂蚁搬家', null, '3', '3', null, '3', '3', '3', '3', '1', '001', '煤矿', '吨', '3', '3', '2015-02-05 00:00:00', '2015-02-06 00:00:00', null, null, '3333', null, null, null, '2015-02-05 14:52:45', 'INVALID');
INSERT INTO `transport` VALUES ('4', '5', null, '2', '灰狗运输', '1423119410405', '5', '5', '5', '5', '5', '5', '5', '2', '002', '金矿', '克', '5', '5', '2015-02-03 00:00:00', '2015-02-04 00:00:00', null, null, '555', null, null, null, '2015-02-05 14:56:50', 'VALID');

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
