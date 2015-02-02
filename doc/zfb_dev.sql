/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : zfb_dev

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2015-02-03 00:25:44
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
-- Table structure for input_info
-- ----------------------------
DROP TABLE IF EXISTS `input_info`;
CREATE TABLE `input_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '入库单号',
  `project_name` varchar(50) DEFAULT NULL COMMENT '项目工程名',
  `purchase_type_code` varchar(50) DEFAULT NULL COMMENT '采购类别编码',
  `purchase_type_name` varchar(20) DEFAULT NULL COMMENT '采购类别名称',
  `contract_num` varchar(50) DEFAULT NULL COMMENT '合同编号',
  `provide_merchant_code` varchar(50) DEFAULT NULL COMMENT '供应商编码',
  `provide_merchant_name` varchar(50) DEFAULT NULL COMMENT '供应商编码名称',
  `warehouse` varchar(50) DEFAULT NULL COMMENT '入库仓库',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(20) DEFAULT NULL COMMENT '状态(VALID-有效， INVALID-无效）',
  `material_code` varchar(50) DEFAULT NULL COMMENT '材料编码',
  `material_name` varchar(50) DEFAULT NULL COMMENT '材料名称',
  `count` int(11) DEFAULT NULL COMMENT '入库数量',
  `money` decimal(10,0) DEFAULT NULL COMMENT '总金额',
  `transport_person` varchar(20) DEFAULT NULL COMMENT '运输人',
  `car_num` varchar(20) DEFAULT NULL COMMENT '运输车号',
  `weigh_person` varchar(20) DEFAULT NULL COMMENT '过磅人',
  `send_person` varchar(20) DEFAULT NULL COMMENT '发货人',
  `accept_person` varchar(20) DEFAULT NULL COMMENT '收货人',
  `input_time` datetime DEFAULT NULL COMMENT '入库日期',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `send_person_code` varchar(50) DEFAULT NULL COMMENT '发货人编码',
  `accept_person_code` varchar(50) DEFAULT NULL COMMENT '收货人编码',
  `standard_code` varchar(50) DEFAULT NULL COMMENT '材料规格编码',
  `standard_name` varchar(50) DEFAULT NULL COMMENT '材料规格名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='入库信息表';

-- ----------------------------
-- Records of input_info
-- ----------------------------
INSERT INTO `input_info` VALUES ('1', '1422892976596', 'werwer', null, null, null, '001', '国美电器1', 'ewre', '2015-02-03 00:02:56', 'VALID', '001', '煤矿', '1', '1000', 'werwrwsdf', 'sdfsdf', 'sdf', '金三胖', '王尼玛', '2015-02-03 00:02:56', '23er2', '001', '004', null, null);
INSERT INTO `input_info` VALUES ('2', '1422893311314', '222', '001', '煤矿类型1', null, '001', '国美电器1', '222', '2015-02-03 00:08:31', 'VALID', '001', '煤矿', '2', '2000', '222', '222', '222', '金三胖', '王尼玛', '2015-02-03 00:08:31', '222', '001', '004', '001', 'A级');

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
  `loan_dept_code` varchar(50) DEFAULT NULL COMMENT '借款部门编码',
  `loan_dept_name` varchar(50) DEFAULT NULL COMMENT '借款部门名称',
  `use_dept_code` varchar(50) DEFAULT NULL COMMENT '使用部门编码',
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='借款信息表';

-- ----------------------------
-- Records of loan
-- ----------------------------

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '材料代码',
  `num` varchar(50) DEFAULT NULL COMMENT '材料编码',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `standard_code` varchar(50) DEFAULT NULL COMMENT '材料规格编码',
  `standard_name` varchar(50) DEFAULT NULL COMMENT '材料规格名称',
  `unit` varchar(50) DEFAULT NULL COMMENT '材料单位',
  `price` decimal(10,0) DEFAULT NULL COMMENT '价格',
  `count` int(11) DEFAULT NULL COMMENT '材料数量',
  `discount` int(11) DEFAULT NULL COMMENT '材料折扣',
  `type_code` varchar(50) DEFAULT NULL COMMENT '材料类别编码',
  `type_name` varchar(50) DEFAULT NULL COMMENT '材料类别名称',
  `create_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='材料信息表';

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES ('1', '001', 'aaa', '煤矿', '001', 'A级', '吨', '1000', '100', '800', '001', '煤矿类型1', '2015-02-02 22:02:44', 'VALID');
INSERT INTO `material` VALUES ('2', '002', 'bbb', '金矿', '001', 'B级', '克', '50000', '100', '4000', '001', '类型2', '2015-02-02 22:53:14', 'VALID');

-- ----------------------------
-- Table structure for material_standard
-- ----------------------------
DROP TABLE IF EXISTS `material_standard`;
CREATE TABLE `material_standard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `name` varchar(20) DEFAULT NULL COMMENT '类别名称',
  `material_code` varchar(50) DEFAULT NULL COMMENT '材料编码',
  `create_time` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购类别';

-- ----------------------------
-- Records of material_standard
-- ----------------------------

-- ----------------------------
-- Table structure for output_info
-- ----------------------------
DROP TABLE IF EXISTS `output_info`;
CREATE TABLE `output_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL COMMENT '出库单号',
  `project_name` varchar(50) DEFAULT NULL COMMENT '项目工程名',
  `purchase_type_code` varchar(50) DEFAULT NULL COMMENT '采购类别编码',
  `purchase_type_name` varchar(20) DEFAULT NULL COMMENT '供应商名称',
  `contract_num` varchar(50) DEFAULT NULL COMMENT '合同编号',
  `provide_merchant_code` varchar(50) DEFAULT NULL COMMENT '供应商编码',
  `provide_merchant_name` varchar(50) DEFAULT NULL COMMENT '供应商编码名称',
  `warehouse` varchar(50) DEFAULT NULL COMMENT '出库仓库',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(20) DEFAULT NULL COMMENT '状态(VALID-有效， INVALID-无效）',
  `material_code` varchar(50) DEFAULT NULL COMMENT '材料编码',
  `material_name` varchar(50) DEFAULT NULL COMMENT '材料名称',
  `count` int(11) DEFAULT NULL COMMENT '出库数量',
  `money` decimal(10,0) DEFAULT NULL COMMENT '总金额',
  `transport_peson` varchar(20) DEFAULT NULL COMMENT '运输人',
  `car_num` varchar(20) DEFAULT NULL COMMENT '运输车号',
  `weigh_person` varchar(20) DEFAULT NULL COMMENT '过磅人',
  `send_person` varchar(20) DEFAULT NULL COMMENT '发货人',
  `accept_person` varchar(20) DEFAULT NULL COMMENT '收货人',
  `output_time` datetime DEFAULT NULL COMMENT '出库日期',
  `is_clear` tinyint(4) DEFAULT '0' COMMENT '是否结清（0-未结清，1-已结清）',
  `remark` varchar(2000) DEFAULT NULL COMMENT '备注',
  `send_person_code` varchar(50) DEFAULT NULL COMMENT '发货人编码',
  `accept_person_code` varchar(50) DEFAULT NULL COMMENT '收货人编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出库信息表';

-- ----------------------------
-- Records of output_info
-- ----------------------------

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `merchant_code` varchar(50) DEFAULT NULL COMMENT '商家编码',
  `type` varchar(20) DEFAULT NULL COMMENT '类型（SEND-发货人， ACCEPT-收货人）',
  `craete_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` varchar(20) DEFAULT NULL COMMENT '类型',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('1', '金三胖', '13566998547', '001', 'SEND', '2015-02-02 22:18:37', 'VALID', '001');
INSERT INTO `person` VALUES ('2', '奥巴马', '15622113657', '001', 'SEND', '2015-02-02 22:19:04', 'VALID', '002');
INSERT INTO `person` VALUES ('3', '长全蛋', '18622365986', '002', 'ACCEPT', '2015-02-02 22:19:53', 'VALID', '003');
INSERT INTO `person` VALUES ('4', '王尼玛', '15788662365', '001', 'ACCEPT', '2015-02-02 23:02:13', 'VALID', '004');

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
  `material_code` varchar(50) DEFAULT NULL COMMENT '材料编码',
  `create_time` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购类别';

-- ----------------------------
-- Records of purchase_type
-- ----------------------------
