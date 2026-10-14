/*
 Navicat MySQL Dump SQL

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 80403 (8.4.3)
 Source Host           : localhost:3306
 Source Schema         : parroquia

 Target Server Type    : MySQL
 Target Server Version : 80403 (8.4.3)
 File Encoding         : 65001

 Date: 13/10/2026 21:19:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for actas
-- ----------------------------
DROP TABLE IF EXISTS `actas`;
CREATE TABLE `actas`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `libro_id` bigint UNSIGNED NOT NULL,
  `numero_hoja` int UNSIGNED NOT NULL,
  `numero_acta` int UNSIGNED NOT NULL,
  `fecha` date NULL DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `updated_user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_actas_libro`(`libro_id` ASC) USING BTREE,
  INDEX `idx_actas_hoja`(`libro_id` ASC, `numero_hoja` ASC) USING BTREE,
  INDEX `idx_actas_numero`(`libro_id` ASC, `numero_acta` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of actas
-- ----------------------------

-- ----------------------------
-- Table structure for actas_personas
-- ----------------------------
DROP TABLE IF EXISTS `actas_personas`;
CREATE TABLE `actas_personas`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `acta_id` bigint UNSIGNED NOT NULL,
  `persona_id` bigint UNSIGNED NOT NULL,
  `rol_id` bigint UNSIGNED NOT NULL,
  `created_user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `updated_user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_acta_persona_rol`(`acta_id` ASC, `persona_id` ASC, `rol_id` ASC) USING BTREE,
  INDEX `idx_actas_personas_acta`(`acta_id` ASC) USING BTREE,
  INDEX `idx_actas_personas_persona`(`persona_id` ASC) USING BTREE,
  INDEX `idx_actas_personas_rol`(`rol_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of actas_personas
-- ----------------------------

-- ----------------------------
-- Table structure for group_method
-- ----------------------------
DROP TABLE IF EXISTS `group_method`;
CREATE TABLE `group_method`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` bigint NOT NULL,
  `method_id` bigint NULL DEFAULT NULL,
  `created_user_id` bigint NULL DEFAULT NULL,
  `updated_user_id` bigint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `group_id`(`group_id` ASC) USING BTREE,
  INDEX `method_id`(`method_id` ASC) USING BTREE,
  CONSTRAINT `group_method_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `group_method_ibfk_2` FOREIGN KEY (`method_id`) REFERENCES `methods` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 122 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of group_method
-- ----------------------------
INSERT INTO `group_method` VALUES (1, 1, 1, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (2, 1, 2, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (3, 1, 3, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (4, 1, 4, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (5, 1, 5, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (6, 1, 6, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (7, 1, 7, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (8, 1, 8, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (9, 1, 9, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (10, 1, 10, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (11, 1, 11, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (12, 1, 12, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (13, 1, 13, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (14, 1, 14, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (15, 1, 15, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (16, 1, 16, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (17, 1, 17, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (18, 1, 18, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (19, 1, 19, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (20, 1, 20, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (21, 1, 21, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (22, 1, 22, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (23, 1, 23, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (24, 1, 24, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (25, 1, 25, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (26, 1, 26, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (27, 1, 27, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (28, 1, 28, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (29, 1, 29, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (30, 1, 30, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (31, 1, 31, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (32, 1, 32, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (33, 1, 33, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (34, 1, 34, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (35, 1, 35, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (36, 1, 36, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (37, 1, 37, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (38, 1, 38, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (39, 1, 39, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (40, 1, 40, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (41, 1, 41, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (42, 1, 42, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (43, 1, 43, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (44, 1, 44, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (45, 1, 45, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (46, 1, 46, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (47, 1, 47, NULL, NULL, NULL, NULL);
INSERT INTO `group_method` VALUES (58, 1, 51, NULL, NULL, '2026-10-13 20:40:02', '2026-10-13 20:40:02');
INSERT INTO `group_method` VALUES (59, 1, 52, NULL, NULL, '2026-10-13 20:40:03', '2026-10-13 20:40:03');
INSERT INTO `group_method` VALUES (60, 1, 54, NULL, NULL, '2026-10-13 20:40:03', '2026-10-13 20:40:03');
INSERT INTO `group_method` VALUES (61, 1, 49, NULL, NULL, '2026-10-13 20:40:04', '2026-10-13 20:40:04');
INSERT INTO `group_method` VALUES (62, 1, 53, NULL, NULL, '2026-10-13 20:40:04', '2026-10-13 20:40:04');
INSERT INTO `group_method` VALUES (63, 1, 55, NULL, NULL, '2026-10-13 20:40:05', '2026-10-13 20:40:05');
INSERT INTO `group_method` VALUES (64, 1, 48, NULL, NULL, '2026-10-13 20:40:05', '2026-10-13 20:40:05');
INSERT INTO `group_method` VALUES (65, 1, 50, NULL, NULL, '2026-10-13 20:40:06', '2026-10-13 20:40:06');
INSERT INTO `group_method` VALUES (66, 1, 59, NULL, NULL, '2026-10-13 20:54:57', '2026-10-13 20:54:57');
INSERT INTO `group_method` VALUES (67, 1, 60, NULL, NULL, '2026-10-13 20:54:58', '2026-10-13 20:54:58');
INSERT INTO `group_method` VALUES (68, 1, 62, NULL, NULL, '2026-10-13 20:54:58', '2026-10-13 20:54:58');
INSERT INTO `group_method` VALUES (69, 1, 57, NULL, NULL, '2026-10-13 20:54:59', '2026-10-13 20:54:59');
INSERT INTO `group_method` VALUES (70, 1, 61, NULL, NULL, '2026-10-13 20:54:59', '2026-10-13 20:54:59');
INSERT INTO `group_method` VALUES (71, 1, 63, NULL, NULL, '2026-10-13 20:55:00', '2026-10-13 20:55:00');
INSERT INTO `group_method` VALUES (72, 1, 56, NULL, NULL, '2026-10-13 20:55:00', '2026-10-13 20:55:00');
INSERT INTO `group_method` VALUES (73, 1, 58, NULL, NULL, '2026-10-13 20:55:01', '2026-10-13 20:55:01');
INSERT INTO `group_method` VALUES (74, 1, 67, NULL, NULL, '2026-10-13 20:56:58', '2026-10-13 20:56:58');
INSERT INTO `group_method` VALUES (75, 1, 68, NULL, NULL, '2026-10-13 20:56:59', '2026-10-13 20:56:59');
INSERT INTO `group_method` VALUES (76, 1, 70, NULL, NULL, '2026-10-13 20:57:00', '2026-10-13 20:57:00');
INSERT INTO `group_method` VALUES (77, 1, 65, NULL, NULL, '2026-10-13 20:57:00', '2026-10-13 20:57:00');
INSERT INTO `group_method` VALUES (78, 1, 69, NULL, NULL, '2026-10-13 20:57:01', '2026-10-13 20:57:01');
INSERT INTO `group_method` VALUES (79, 1, 71, NULL, NULL, '2026-10-13 20:57:01', '2026-10-13 20:57:01');
INSERT INTO `group_method` VALUES (80, 1, 64, NULL, NULL, '2026-10-13 20:57:02', '2026-10-13 20:57:02');
INSERT INTO `group_method` VALUES (81, 1, 66, NULL, NULL, '2026-10-13 20:57:03', '2026-10-13 20:57:03');
INSERT INTO `group_method` VALUES (82, 1, 75, NULL, NULL, '2026-10-13 20:58:46', '2026-10-13 20:58:46');
INSERT INTO `group_method` VALUES (83, 1, 76, NULL, NULL, '2026-10-13 20:58:46', '2026-10-13 20:58:46');
INSERT INTO `group_method` VALUES (84, 1, 78, NULL, NULL, '2026-10-13 20:58:47', '2026-10-13 20:58:47');
INSERT INTO `group_method` VALUES (85, 1, 73, NULL, NULL, '2026-10-13 20:58:47', '2026-10-13 20:58:47');
INSERT INTO `group_method` VALUES (86, 1, 77, NULL, NULL, '2026-10-13 20:58:48', '2026-10-13 20:58:48');
INSERT INTO `group_method` VALUES (87, 1, 79, NULL, NULL, '2026-10-13 20:58:48', '2026-10-13 20:58:48');
INSERT INTO `group_method` VALUES (88, 1, 72, NULL, NULL, '2026-10-13 20:58:49', '2026-10-13 20:58:49');
INSERT INTO `group_method` VALUES (89, 1, 74, NULL, NULL, '2026-10-13 20:58:50', '2026-10-13 20:58:50');
INSERT INTO `group_method` VALUES (90, 2, 67, NULL, NULL, '2026-10-13 21:01:50', '2026-10-13 21:01:50');
INSERT INTO `group_method` VALUES (91, 2, 68, NULL, NULL, '2026-10-13 21:01:50', '2026-10-13 21:01:50');
INSERT INTO `group_method` VALUES (92, 2, 70, NULL, NULL, '2026-10-13 21:01:50', '2026-10-13 21:01:50');
INSERT INTO `group_method` VALUES (93, 2, 65, NULL, NULL, '2026-10-13 21:01:51', '2026-10-13 21:01:51');
INSERT INTO `group_method` VALUES (94, 2, 69, NULL, NULL, '2026-10-13 21:01:51', '2026-10-13 21:01:51');
INSERT INTO `group_method` VALUES (95, 2, 71, NULL, NULL, '2026-10-13 21:01:52', '2026-10-13 21:01:52');
INSERT INTO `group_method` VALUES (96, 2, 64, NULL, NULL, '2026-10-13 21:01:52', '2026-10-13 21:01:52');
INSERT INTO `group_method` VALUES (97, 2, 66, NULL, NULL, '2026-10-13 21:01:52', '2026-10-13 21:01:52');
INSERT INTO `group_method` VALUES (98, 2, 59, NULL, NULL, '2026-10-13 21:01:56', '2026-10-13 21:01:56');
INSERT INTO `group_method` VALUES (99, 2, 60, NULL, NULL, '2026-10-13 21:01:57', '2026-10-13 21:01:57');
INSERT INTO `group_method` VALUES (100, 2, 62, NULL, NULL, '2026-10-13 21:01:57', '2026-10-13 21:01:57');
INSERT INTO `group_method` VALUES (101, 2, 57, NULL, NULL, '2026-10-13 21:01:58', '2026-10-13 21:01:58');
INSERT INTO `group_method` VALUES (102, 2, 61, NULL, NULL, '2026-10-13 21:01:58', '2026-10-13 21:01:58');
INSERT INTO `group_method` VALUES (103, 2, 63, NULL, NULL, '2026-10-13 21:01:59', '2026-10-13 21:01:59');
INSERT INTO `group_method` VALUES (104, 2, 56, NULL, NULL, '2026-10-13 21:01:59', '2026-10-13 21:01:59');
INSERT INTO `group_method` VALUES (105, 2, 58, NULL, NULL, '2026-10-13 21:02:00', '2026-10-13 21:02:00');
INSERT INTO `group_method` VALUES (106, 2, 75, NULL, NULL, '2026-10-13 21:02:05', '2026-10-13 21:02:05');
INSERT INTO `group_method` VALUES (107, 2, 76, NULL, NULL, '2026-10-13 21:02:05', '2026-10-13 21:02:05');
INSERT INTO `group_method` VALUES (108, 2, 78, NULL, NULL, '2026-10-13 21:02:06', '2026-10-13 21:02:06');
INSERT INTO `group_method` VALUES (109, 2, 73, NULL, NULL, '2026-10-13 21:02:06', '2026-10-13 21:02:06');
INSERT INTO `group_method` VALUES (110, 2, 77, NULL, NULL, '2026-10-13 21:02:07', '2026-10-13 21:02:07');
INSERT INTO `group_method` VALUES (111, 2, 79, NULL, NULL, '2026-10-13 21:02:07', '2026-10-13 21:02:07');
INSERT INTO `group_method` VALUES (112, 2, 72, NULL, NULL, '2026-10-13 21:02:08', '2026-10-13 21:02:08');
INSERT INTO `group_method` VALUES (113, 2, 74, NULL, NULL, '2026-10-13 21:02:08', '2026-10-13 21:02:08');
INSERT INTO `group_method` VALUES (114, 2, 51, NULL, NULL, '2026-10-13 21:02:11', '2026-10-13 21:02:11');
INSERT INTO `group_method` VALUES (115, 2, 52, NULL, NULL, '2026-10-13 21:02:11', '2026-10-13 21:02:11');
INSERT INTO `group_method` VALUES (116, 2, 54, NULL, NULL, '2026-10-13 21:02:12', '2026-10-13 21:02:12');
INSERT INTO `group_method` VALUES (117, 2, 49, NULL, NULL, '2026-10-13 21:02:12', '2026-10-13 21:02:12');
INSERT INTO `group_method` VALUES (118, 2, 53, NULL, NULL, '2026-10-13 21:02:13', '2026-10-13 21:02:13');
INSERT INTO `group_method` VALUES (119, 2, 55, NULL, NULL, '2026-10-13 21:02:13', '2026-10-13 21:02:13');
INSERT INTO `group_method` VALUES (120, 2, 48, NULL, NULL, '2026-10-13 21:02:14', '2026-10-13 21:02:14');
INSERT INTO `group_method` VALUES (121, 2, 50, NULL, NULL, '2026-10-13 21:02:14', '2026-10-13 21:02:14');

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `activo` tinyint NULL DEFAULT 1,
  `created_user_id` bigint NULL DEFAULT NULL,
  `updated_user_id` bigint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO `groups` VALUES (1, 'Programador', 1, -1, -1, NULL, NULL);
INSERT INTO `groups` VALUES (2, 'Administrador', 1, -1, -1, NULL, NULL);

-- ----------------------------
-- Table structure for libros
-- ----------------------------
DROP TABLE IF EXISTS `libros`;
CREATE TABLE `libros`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tipo_acta_id` bigint UNSIGNED NOT NULL,
  `numero` int UNSIGNED NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `activo` tinyint NOT NULL DEFAULT 1,
  `created_user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `updated_user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_libros_tipo_acta`(`tipo_acta_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of libros
-- ----------------------------

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `activo` tinyint NULL DEFAULT 1,
  `created_user_id` bigint NULL DEFAULT NULL,
  `updated_user_id` bigint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, 'Menu', 'MENUS', 'fas fa-th-list', 1, -1, -1, NULL, NULL);
INSERT INTO `menus` VALUES (2, 'Method', 'METODOS', 'fas fa-list-ul', 1, -1, -1, NULL, NULL);
INSERT INTO `menus` VALUES (3, 'Group', 'GRUPOS', 'fas fa-users-cog', 1, -1, -1, NULL, NULL);
INSERT INTO `menus` VALUES (4, 'User', 'USUARIOS', 'fas fa-users', 1, -1, -1, NULL, NULL);
INSERT INTO `menus` VALUES (5, 'Admin', 'ADMINS', 'fas fa-users', 1, -1, -1, NULL, NULL);
INSERT INTO `menus` VALUES (6, 'TipoActa', 'TIPO ACTA', 'fas fa-bookmark', 1, 1, 1, '2026-10-13 20:31:17', '2026-10-13 20:51:25');
INSERT INTO `menus` VALUES (7, 'Libro', 'LIBROS', 'fas fa-book', 1, 1, 1, '2026-10-13 20:54:45', '2026-10-13 20:54:45');
INSERT INTO `menus` VALUES (8, 'Acta', 'ACTAS', 'fas fa-address-card', 1, 1, 1, '2026-10-13 20:56:48', '2026-10-13 21:00:05');
INSERT INTO `menus` VALUES (9, 'Persona', 'PERSONAS', 'fas fa-user', 1, 1, 1, '2026-10-13 20:58:34', '2026-10-13 20:58:34');

-- ----------------------------
-- Table structure for methods
-- ----------------------------
DROP TABLE IF EXISTS `methods`;
CREATE TABLE `methods`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `menu_id` bigint NULL DEFAULT NULL,
  `is_menu` tinyint NULL DEFAULT NULL,
  `is_action` tinyint NULL DEFAULT NULL,
  `activo` tinyint NULL DEFAULT 1,
  `created_user_id` bigint NULL DEFAULT NULL,
  `updated_user_id` bigint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `menu_id`(`menu_id` ASC) USING BTREE,
  CONSTRAINT `methods_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of methods
-- ----------------------------
INSERT INTO `methods` VALUES (1, 'registrar', 'Registrar', NULL, NULL, 1, 1, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (2, 'lista', 'Lista', NULL, NULL, 1, 1, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (3, 'registrarBd', NULL, NULL, NULL, 1, 0, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (4, 'activarBd', NULL, 'Activar', 'fas fa-play', 1, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (5, 'desactivarBd', NULL, 'Desactivar', 'fas fa-pause', 1, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (6, 'modificar', NULL, 'Modificar', 'fas fa-pencil-alt', 1, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (7, 'eliminarBd', NULL, 'Eliminar', 'fas fa-trash', 1, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (8, 'modificarBd', NULL, NULL, NULL, 1, 0, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (9, 'registrar', 'Registrar', NULL, NULL, 2, 1, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (10, 'lista', 'Lista', NULL, NULL, 2, 1, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (11, 'registrarBd', NULL, NULL, NULL, 2, 0, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (12, 'activarBd', NULL, 'Activar', 'fas fa-play', 2, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (13, 'desactivarBd', NULL, 'Desactivar', 'fas fa-pause', 2, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (14, 'modificar', NULL, 'Modificar', 'fas fa-pencil-alt', 2, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (15, 'eliminarBd', NULL, 'Eliminar', 'fas fa-trash', 2, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (16, 'modificarBd', NULL, NULL, NULL, 2, 0, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (17, 'permisos', NULL, 'Asigna Permisos', 'fas fa-plus-square', 3, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (18, 'bajaPermiso', NULL, NULL, NULL, 3, 0, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (19, 'altaPermiso', NULL, NULL, NULL, 3, 0, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (20, 'registrar', 'Registrar', NULL, NULL, 3, 1, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (21, 'lista', 'Lista', NULL, NULL, 3, 1, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (22, 'registrarBd', NULL, NULL, NULL, 3, 0, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (23, 'activarBd', NULL, 'Activar', 'fas fa-play', 3, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (24, 'desactivarBd', NULL, 'Desactivar', 'fas fa-pause', 3, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (25, 'modificar', NULL, 'Modificar', 'fas fa-pencil-alt', 3, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (26, 'eliminarBd', NULL, 'Eliminar', 'fas fa-trash', 3, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (27, 'modificarBd', NULL, NULL, NULL, 3, 0, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (28, 'nuevaContra', NULL, 'Cambiar contraseña', 'fas fa-key', 4, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (29, 'nuevaContraBd', NULL, NULL, NULL, 4, 0, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (30, 'registrar', 'Registrar', NULL, NULL, 4, 1, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (31, 'lista', 'Lista', NULL, NULL, 4, 1, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (32, 'registrarBd', NULL, NULL, NULL, 4, 0, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (33, 'activarBd', NULL, 'Activar', 'fas fa-play', 4, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (34, 'desactivarBd', NULL, 'Desactivar', 'fas fa-pause', 4, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (35, 'modificar', NULL, 'Modificar', 'fas fa-pencil-alt', 4, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (36, 'eliminarBd', NULL, 'Eliminar', 'fas fa-trash', 4, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (37, 'modificarBd', NULL, NULL, NULL, 4, 0, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (38, 'nuevaContra', '', 'Cambiar contraseña', 'fas fa-key', 5, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (39, 'nuevaContraBd', '', '', '', 5, 0, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (40, 'registrar', 'Registrar', '', '', 5, 1, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (41, 'lista', 'Lista', '', '', 5, 1, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (42, 'registrarBd', '', '', '', 5, 0, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (43, 'activarBd', '', 'Activar', 'fas fa-play', 5, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (44, 'desactivarBd', '', 'Desactivar', 'fas fa-pause', 5, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (45, 'modificar', '', 'Modificar', 'fas fa-pencil-alt', 5, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (46, 'eliminarBd', '', 'Eliminar', 'fas fa-trash', 5, 0, 1, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (47, 'modificarBd', '', '', '', 5, 0, 0, 1, -1, -1, NULL, NULL);
INSERT INTO `methods` VALUES (48, 'registrar', 'Registrar', NULL, NULL, 6, 1, 0, 1, NULL, NULL, '2026-10-13 20:31:17', '2026-10-13 20:31:17');
INSERT INTO `methods` VALUES (49, 'lista', 'Lista', NULL, NULL, 6, 1, 0, 1, NULL, NULL, '2026-10-13 20:31:17', '2026-10-13 20:31:17');
INSERT INTO `methods` VALUES (50, 'registrarBd', NULL, NULL, NULL, 6, 0, 0, 1, NULL, NULL, '2026-10-13 20:31:17', '2026-10-13 20:31:17');
INSERT INTO `methods` VALUES (51, 'activarBd', NULL, 'Activar', 'fas fa-play', 6, 0, 1, 1, NULL, NULL, '2026-10-13 20:31:17', '2026-10-13 20:31:17');
INSERT INTO `methods` VALUES (52, 'desactivarBd', NULL, 'Desactivar', 'fas fa-pause', 6, 0, 1, 1, NULL, NULL, '2026-10-13 20:31:17', '2026-10-13 20:31:17');
INSERT INTO `methods` VALUES (53, 'modificar', NULL, 'Modificar', 'fas fa-pencil-alt', 6, 0, 1, 1, NULL, NULL, '2026-10-13 20:31:17', '2026-10-13 20:31:17');
INSERT INTO `methods` VALUES (54, 'eliminarBd', NULL, 'Eliminar', 'fas fa-trash', 6, 0, 1, 1, NULL, NULL, '2026-10-13 20:31:17', '2026-10-13 20:31:17');
INSERT INTO `methods` VALUES (55, 'modificarBd', NULL, NULL, NULL, 6, 0, 0, 1, NULL, NULL, '2026-10-13 20:31:17', '2026-10-13 20:31:17');
INSERT INTO `methods` VALUES (56, 'registrar', 'Registrar', NULL, NULL, 7, 1, 0, 1, NULL, NULL, '2026-10-13 20:54:45', '2026-10-13 20:54:45');
INSERT INTO `methods` VALUES (57, 'lista', 'Lista', NULL, NULL, 7, 1, 0, 1, NULL, NULL, '2026-10-13 20:54:45', '2026-10-13 20:54:45');
INSERT INTO `methods` VALUES (58, 'registrarBd', NULL, NULL, NULL, 7, 0, 0, 1, NULL, NULL, '2026-10-13 20:54:45', '2026-10-13 20:54:45');
INSERT INTO `methods` VALUES (59, 'activarBd', NULL, 'Activar', 'fas fa-play', 7, 0, 1, 1, NULL, NULL, '2026-10-13 20:54:45', '2026-10-13 20:54:45');
INSERT INTO `methods` VALUES (60, 'desactivarBd', NULL, 'Desactivar', 'fas fa-pause', 7, 0, 1, 1, NULL, NULL, '2026-10-13 20:54:45', '2026-10-13 20:54:45');
INSERT INTO `methods` VALUES (61, 'modificar', NULL, 'Modificar', 'fas fa-pencil-alt', 7, 0, 1, 1, NULL, NULL, '2026-10-13 20:54:45', '2026-10-13 20:54:45');
INSERT INTO `methods` VALUES (62, 'eliminarBd', NULL, 'Eliminar', 'fas fa-trash', 7, 0, 1, 1, NULL, NULL, '2026-10-13 20:54:45', '2026-10-13 20:54:45');
INSERT INTO `methods` VALUES (63, 'modificarBd', NULL, NULL, NULL, 7, 0, 0, 1, NULL, NULL, '2026-10-13 20:54:45', '2026-10-13 20:54:45');
INSERT INTO `methods` VALUES (64, 'registrar', 'Registrar', NULL, NULL, 8, 1, 0, 1, NULL, NULL, '2026-10-13 20:56:48', '2026-10-13 20:56:48');
INSERT INTO `methods` VALUES (65, 'lista', 'Lista', NULL, NULL, 8, 1, 0, 1, NULL, NULL, '2026-10-13 20:56:48', '2026-10-13 20:56:48');
INSERT INTO `methods` VALUES (66, 'registrarBd', NULL, NULL, NULL, 8, 0, 0, 1, NULL, NULL, '2026-10-13 20:56:48', '2026-10-13 20:56:48');
INSERT INTO `methods` VALUES (67, 'activarBd', NULL, 'Activar', 'fas fa-play', 8, 0, 1, 1, NULL, NULL, '2026-10-13 20:56:48', '2026-10-13 20:56:48');
INSERT INTO `methods` VALUES (68, 'desactivarBd', NULL, 'Desactivar', 'fas fa-pause', 8, 0, 1, 1, NULL, NULL, '2026-10-13 20:56:48', '2026-10-13 20:56:48');
INSERT INTO `methods` VALUES (69, 'modificar', NULL, 'Modificar', 'fas fa-pencil-alt', 8, 0, 1, 1, NULL, NULL, '2026-10-13 20:56:48', '2026-10-13 20:56:48');
INSERT INTO `methods` VALUES (70, 'eliminarBd', NULL, 'Eliminar', 'fas fa-trash', 8, 0, 1, 1, NULL, NULL, '2026-10-13 20:56:48', '2026-10-13 20:56:48');
INSERT INTO `methods` VALUES (71, 'modificarBd', NULL, NULL, NULL, 8, 0, 0, 1, NULL, NULL, '2026-10-13 20:56:48', '2026-10-13 20:56:48');
INSERT INTO `methods` VALUES (72, 'registrar', 'Registrar', NULL, NULL, 9, 1, 0, 1, NULL, NULL, '2026-10-13 20:58:34', '2026-10-13 20:58:34');
INSERT INTO `methods` VALUES (73, 'lista', 'Lista', NULL, NULL, 9, 1, 0, 1, NULL, NULL, '2026-10-13 20:58:34', '2026-10-13 20:58:34');
INSERT INTO `methods` VALUES (74, 'registrarBd', NULL, NULL, NULL, 9, 0, 0, 1, NULL, NULL, '2026-10-13 20:58:34', '2026-10-13 20:58:34');
INSERT INTO `methods` VALUES (75, 'activarBd', NULL, 'Activar', 'fas fa-play', 9, 0, 1, 1, NULL, NULL, '2026-10-13 20:58:34', '2026-10-13 20:58:34');
INSERT INTO `methods` VALUES (76, 'desactivarBd', NULL, 'Desactivar', 'fas fa-pause', 9, 0, 1, 1, NULL, NULL, '2026-10-13 20:58:34', '2026-10-13 20:58:34');
INSERT INTO `methods` VALUES (77, 'modificar', NULL, 'Modificar', 'fas fa-pencil-alt', 9, 0, 1, 1, NULL, NULL, '2026-10-13 20:58:34', '2026-10-13 20:58:34');
INSERT INTO `methods` VALUES (78, 'eliminarBd', NULL, 'Eliminar', 'fas fa-trash', 9, 0, 1, 1, NULL, NULL, '2026-10-13 20:58:34', '2026-10-13 20:58:34');
INSERT INTO `methods` VALUES (79, 'modificarBd', NULL, NULL, NULL, 9, 0, 0, 1, NULL, NULL, '2026-10-13 20:58:34', '2026-10-13 20:58:34');

-- ----------------------------
-- Table structure for methods_base
-- ----------------------------
DROP TABLE IF EXISTS `methods_base`;
CREATE TABLE `methods_base`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `menu_id` bigint NULL DEFAULT NULL,
  `is_menu` tinyint NULL DEFAULT NULL,
  `is_action` tinyint NULL DEFAULT NULL,
  `activo` tinyint NULL DEFAULT 1,
  `created_user_id` bigint NULL DEFAULT NULL,
  `updated_user_id` bigint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of methods_base
-- ----------------------------
INSERT INTO `methods_base` VALUES (1, 'nuevaContra', NULL, 'Cambiar contraseña', 'fas fa-key', 5, 0, 1, 0, -1, -1, NULL, '2025-02-02 10:47:57');
INSERT INTO `methods_base` VALUES (2, 'nuevaContraBd', NULL, NULL, NULL, 5, 0, 0, 0, -1, -1, NULL, '2025-02-02 10:47:58');
INSERT INTO `methods_base` VALUES (3, 'registrar', 'Registrar', NULL, NULL, 5, 1, 0, 1, -1, -1, NULL, '2025-02-02 10:42:40');
INSERT INTO `methods_base` VALUES (4, 'lista', 'Lista', NULL, NULL, 5, 1, 0, 1, -1, -1, NULL, '2025-02-02 10:42:42');
INSERT INTO `methods_base` VALUES (5, 'registrarBd', NULL, NULL, NULL, 5, 0, 0, 1, -1, -1, NULL, '2025-02-02 10:42:44');
INSERT INTO `methods_base` VALUES (6, 'activarBd', NULL, 'Activar', 'fas fa-play', 5, 0, 1, 1, -1, -1, NULL, '2025-02-02 10:42:17');
INSERT INTO `methods_base` VALUES (7, 'desactivarBd', NULL, 'Desactivar', 'fas fa-pause', 5, 0, 1, 1, -1, -1, NULL, '2025-02-02 10:42:23');
INSERT INTO `methods_base` VALUES (8, 'modificar', NULL, 'Modificar', 'fas fa-pencil-alt', 5, 0, 1, 1, -1, -1, NULL, '2025-02-02 10:42:21');
INSERT INTO `methods_base` VALUES (9, 'eliminarBd', NULL, 'Eliminar', 'fas fa-trash', 5, 0, 1, 1, -1, -1, NULL, '2025-02-02 10:42:25');
INSERT INTO `methods_base` VALUES (10, 'modificarBd', NULL, NULL, NULL, 5, 0, 0, 1, -1, -1, NULL, '2025-02-02 10:42:48');

-- ----------------------------
-- Table structure for personas
-- ----------------------------
DROP TABLE IF EXISTS `personas`;
CREATE TABLE `personas`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apellido_paterno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `apellido_materno` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fecha_nacimiento` date NULL DEFAULT NULL,
  `activo` tinyint NOT NULL DEFAULT 1,
  `created_user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `updated_user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_personas_name`(`name` ASC) USING BTREE,
  INDEX `idx_personas_apellidos`(`apellido_paterno` ASC, `apellido_materno` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personas
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `activo` tinyint NOT NULL DEFAULT 1,
  `created_user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `updated_user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `session_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES (1, '6f33e1ad89678372823cb963a18ef13b', 1, '2025-02-17 20:19:53', '2025-02-17 20:19:53');
INSERT INTO `sessions` VALUES (5, 'd762f29319815325df608b80ad868240', 2, '2026-10-13 21:02:34', '2026-10-13 21:02:34');

-- ----------------------------
-- Table structure for tipos_acta
-- ----------------------------
DROP TABLE IF EXISTS `tipos_acta`;
CREATE TABLE `tipos_acta`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `activo` tinyint NOT NULL DEFAULT 1,
  `created_user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `updated_user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tipos_acta
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `group_id` bigint NULL DEFAULT NULL,
  `activo` tinyint NULL DEFAULT 0,
  `created_user_id` bigint NULL DEFAULT NULL,
  `updated_user_id` bigint NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'admin', 'ed76e9ebfe90e6affbd3cbcb6a9a5f60', 'Ricardo', 'Rivera Sanchez', 'desarrollo@ingrivera.com', 1, 1, -1, -1, NULL, NULL);
INSERT INTO `users` VALUES (2, 'adminn', 'ed76e9ebfe90e6affbd3cbcb6a9a5f60', 'Ricardo', 'Rivera Sanchez', 'ricardo@ingrivera.com', 2, 1, -1, -1, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
