/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : profindo_test

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 08/02/2022 08:28:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for m_user
-- ----------------------------
DROP TABLE IF EXISTS `m_user`;
CREATE TABLE `m_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_pegawai` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `level` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of m_user
-- ----------------------------
INSERT INTO `m_user` VALUES (1, 'admin', '0cc175b9c0f1b6a831c399e269772661 ', '99', 1);
INSERT INTO `m_user` VALUES (2, 'rudi', 'YQ==', '3', 1);
INSERT INTO `m_user` VALUES (3, 'ruru', 'YQ==', '3', 1);

-- ----------------------------
-- Table structure for tb_apoteker
-- ----------------------------
DROP TABLE IF EXISTS `tb_apoteker`;
CREATE TABLE `tb_apoteker`  (
  `kode_apoteker` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_apoteker` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tanggal_lahir` date NULL DEFAULT NULL,
  PRIMARY KEY (`kode_apoteker`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_apoteker
-- ----------------------------
INSERT INTO `tb_apoteker` VALUES ('2494', 'Joni', '2022-02-08');
INSERT INTO `tb_apoteker` VALUES ('AP001', 'Indahssss', '1996-03-31');
INSERT INTO `tb_apoteker` VALUES ('AP002', 'Ayu', '1998-06-21');

-- ----------------------------
-- Table structure for tb_obat
-- ----------------------------
DROP TABLE IF EXISTS `tb_obat`;
CREATE TABLE `tb_obat`  (
  `kode_obat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_obat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `harga_obat` int(20) NULL DEFAULT NULL,
  `sisa_obat` int(20) NULL DEFAULT NULL,
  `tanggal_exp` date NULL DEFAULT NULL,
  PRIMARY KEY (`kode_obat`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_obat
-- ----------------------------
INSERT INTO `tb_obat` VALUES ('CM001', 'Prove D3-1000', 54000, 367, '2022-02-07');
INSERT INTO `tb_obat` VALUES ('CM002', 'Becom-Zet', 43000, 76, '2022-02-01');
INSERT INTO `tb_obat` VALUES ('CM003', 'Megazing', 33000, 150, '2021-01-13');
INSERT INTO `tb_obat` VALUES ('CM004', 'Zegavit', 40000, 300, '2022-07-01');
INSERT INTO `tb_obat` VALUES ('CM005', 'Panadol', 26000, 200, '2022-03-09');
INSERT INTO `tb_obat` VALUES ('CM006', 'Zenirex', 27000, 146, '2021-11-27');
INSERT INTO `tb_obat` VALUES ('CM007', 'Amoxilin', 19000, 90, '2021-10-19');
INSERT INTO `tb_obat` VALUES ('CM008', 'Betadine', 13000, 89, '2021-12-13');
INSERT INTO `tb_obat` VALUES ('CM009', 'Gliserol', 36000, 240, '2022-04-06');
INSERT INTO `tb_obat` VALUES ('CM010', 'Promag', 11000, 241, '2021-11-03');

-- ----------------------------
-- Table structure for trans_obat
-- ----------------------------
DROP TABLE IF EXISTS `trans_obat`;
CREATE TABLE `trans_obat`  (
  `id_trans` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_obat` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jumlah_jual` int(20) NOT NULL DEFAULT 0,
  `kode_apoteker` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tanggal_beli` date NOT NULL,
  PRIMARY KEY (`id_trans`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of trans_obat
-- ----------------------------
INSERT INTO `trans_obat` VALUES ('TRK001', 'CM004', 16, 'AP001', '2021-07-31');
INSERT INTO `trans_obat` VALUES ('TRK002', 'CM009', 34, 'AP001', '2021-08-09');
INSERT INTO `trans_obat` VALUES ('TRK003', 'CM007', 21, 'AP002', '2021-08-13');
INSERT INTO `trans_obat` VALUES ('TRK004', 'CM001', 26, 'AP002', '2021-08-27');
INSERT INTO `trans_obat` VALUES ('TRK005', 'CM004', 65, 'AP002', '2021-09-03');
INSERT INTO `trans_obat` VALUES ('TRK006', 'CM009', 32, 'AP001', '2021-09-06');
INSERT INTO `trans_obat` VALUES ('TRK007', 'CM005', 13, 'AP002', '2021-09-16');
INSERT INTO `trans_obat` VALUES ('TRK008', 'CM003', 11, 'AP001', '2021-09-28');
INSERT INTO `trans_obat` VALUES ('TRK009', 'CM009', 28, 'AP001', '2021-10-15');
INSERT INTO `trans_obat` VALUES ('TRK010', 'CM002', 44, 'AP002', '2021-10-20');

SET FOREIGN_KEY_CHECKS = 1;
