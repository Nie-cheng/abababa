/*
 Navicat Premium Data Transfer

 Source Server         : 我的链接
 Source Server Type    : MySQL
 Source Server Version : 80044
 Source Host           : localhost:3306
 Source Schema         : tushu

 Target Server Type    : MySQL
 Target Server Version : 80044
 File Encoding         : 65001

 Date: 30/01/2026 09:56:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO `auth_permission` VALUES (21, 'Can add user', 6, 'add_user');
INSERT INTO `auth_permission` VALUES (22, 'Can change user', 6, 'change_user');
INSERT INTO `auth_permission` VALUES (23, 'Can delete user', 6, 'delete_user');
INSERT INTO `auth_permission` VALUES (24, 'Can view user', 6, 'view_user');
INSERT INTO `auth_permission` VALUES (25, 'Can add article', 7, 'add_article');
INSERT INTO `auth_permission` VALUES (26, 'Can change article', 7, 'change_article');
INSERT INTO `auth_permission` VALUES (27, 'Can delete article', 7, 'delete_article');
INSERT INTO `auth_permission` VALUES (28, 'Can view article', 7, 'view_article');
INSERT INTO `auth_permission` VALUES (29, 'Can add blog', 8, 'add_blog');
INSERT INTO `auth_permission` VALUES (30, 'Can change blog', 8, 'change_blog');
INSERT INTO `auth_permission` VALUES (31, 'Can delete blog', 8, 'delete_blog');
INSERT INTO `auth_permission` VALUES (32, 'Can view blog', 8, 'view_blog');
INSERT INTO `auth_permission` VALUES (33, 'Can add up and down', 9, 'add_upanddown');
INSERT INTO `auth_permission` VALUES (34, 'Can change up and down', 9, 'change_upanddown');
INSERT INTO `auth_permission` VALUES (35, 'Can delete up and down', 9, 'delete_upanddown');
INSERT INTO `auth_permission` VALUES (36, 'Can view up and down', 9, 'view_upanddown');
INSERT INTO `auth_permission` VALUES (37, 'Can add tag', 10, 'add_tag');
INSERT INTO `auth_permission` VALUES (38, 'Can change tag', 10, 'change_tag');
INSERT INTO `auth_permission` VALUES (39, 'Can delete tag', 10, 'delete_tag');
INSERT INTO `auth_permission` VALUES (40, 'Can view tag', 10, 'view_tag');
INSERT INTO `auth_permission` VALUES (41, 'Can add comment', 11, 'add_comment');
INSERT INTO `auth_permission` VALUES (42, 'Can change comment', 11, 'change_comment');
INSERT INTO `auth_permission` VALUES (43, 'Can delete comment', 11, 'delete_comment');
INSERT INTO `auth_permission` VALUES (44, 'Can view comment', 11, 'view_comment');
INSERT INTO `auth_permission` VALUES (45, 'Can add category', 12, 'add_category');
INSERT INTO `auth_permission` VALUES (46, 'Can change category', 12, 'change_category');
INSERT INTO `auth_permission` VALUES (47, 'Can delete category', 12, 'delete_category');
INSERT INTO `auth_permission` VALUES (48, 'Can view category', 12, 'view_category');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_ts_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_ts_user_id` FOREIGN KEY (`user_id`) REFERENCES `ts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2026-01-21 01:31:36.965887', '1', 'Blog object (1)', 1, '[{\"added\": {}}]', 8, 2);
INSERT INTO `django_admin_log` VALUES (2, '2026-01-21 01:32:03.734052', '2', 'Blog object (2)', 1, '[{\"added\": {}}]', 8, 2);
INSERT INTO `django_admin_log` VALUES (3, '2026-01-21 01:33:16.186982', '1', 'Tag object (1)', 1, '[{\"added\": {}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (4, '2026-01-21 01:33:24.499994', '2', 'Tag object (2)', 1, '[{\"added\": {}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (5, '2026-01-21 01:33:32.932121', '3', 'Tag object (3)', 1, '[{\"added\": {}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (6, '2026-01-21 01:34:11.692511', '4', 'gangan的标签1', 1, '[{\"added\": {}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (7, '2026-01-21 01:34:19.054011', '5', 'gangan的标签2', 1, '[{\"added\": {}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (8, '2026-01-21 01:34:34.237254', '6', 'gangan的标签3', 1, '[{\"added\": {}}]', 10, 2);
INSERT INTO `django_admin_log` VALUES (9, '2026-01-21 01:34:51.597845', '1', 'Category object (1)', 1, '[{\"added\": {}}]', 12, 2);
INSERT INTO `django_admin_log` VALUES (10, '2026-01-21 01:35:10.555711', '2', 'yanyan的分类2', 1, '[{\"added\": {}}]', 12, 2);
INSERT INTO `django_admin_log` VALUES (11, '2026-01-21 01:35:17.235824', '3', 'yanyan的分类3', 1, '[{\"added\": {}}]', 12, 2);
INSERT INTO `django_admin_log` VALUES (12, '2026-01-21 01:35:31.644704', '4', 'gangan的分类1', 1, '[{\"added\": {}}]', 12, 2);
INSERT INTO `django_admin_log` VALUES (13, '2026-01-21 01:35:37.418728', '5', 'gangan的分类2', 1, '[{\"added\": {}}]', 12, 2);
INSERT INTO `django_admin_log` VALUES (14, '2026-01-21 01:35:46.191286', '6', 'gangan的分类3', 1, '[{\"added\": {}}]', 12, 2);
INSERT INTO `django_admin_log` VALUES (15, '2026-01-21 01:40:30.407135', '1', 'Article object (1)', 1, '[{\"added\": {}}]', 7, 2);
INSERT INTO `django_admin_log` VALUES (16, '2026-01-21 01:42:15.799520', '2', '不止是快！美团 LongCat 开源新模型，给 Agent 装上深度思考的大脑', 1, '[{\"added\": {}}]', 7, 2);
INSERT INTO `django_admin_log` VALUES (17, '2026-01-21 01:45:11.013418', '3', 'Sdcb Chats 1.8：又一次底层重构，彻底将模型提供商解耦', 1, '[{\"added\": {}}]', 7, 2);
INSERT INTO `django_admin_log` VALUES (18, '2026-01-21 02:23:23.713800', '2', 'yang', 2, '[{\"changed\": {\"fields\": [\"Blog\"]}}]', 6, 2);
INSERT INTO `django_admin_log` VALUES (19, '2026-01-21 02:23:29.031684', '1', 'nxcg', 2, '[{\"changed\": {\"fields\": [\"Blog\"]}}]', 6, 2);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'ts', 'article');
INSERT INTO `django_content_type` VALUES (8, 'ts', 'blog');
INSERT INTO `django_content_type` VALUES (12, 'ts', 'category');
INSERT INTO `django_content_type` VALUES (11, 'ts', 'comment');
INSERT INTO `django_content_type` VALUES (10, 'ts', 'tag');
INSERT INTO `django_content_type` VALUES (9, 'ts', 'upanddown');
INSERT INTO `django_content_type` VALUES (6, 'ts', 'user');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2026-01-17 02:58:58.505681');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2026-01-17 02:58:58.586984');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2026-01-17 02:58:58.818970');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2026-01-17 02:58:58.875427');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2026-01-17 02:58:58.881730');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2026-01-17 02:58:58.887899');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2026-01-17 02:58:58.895347');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2026-01-17 02:58:58.902964');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2026-01-17 02:58:58.914536');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2026-01-17 02:58:58.921753');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2026-01-17 02:58:58.929034');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0010_alter_group_name_max_length', '2026-01-17 02:58:58.950496');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0011_update_proxy_permissions', '2026-01-17 02:58:58.958728');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2026-01-17 02:58:58.966875');
INSERT INTO `django_migrations` VALUES (15, 'ts', '0001_initial', '2026-01-17 02:59:00.038737');
INSERT INTO `django_migrations` VALUES (16, 'admin', '0001_initial', '2026-01-17 02:59:00.176208');
INSERT INTO `django_migrations` VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2026-01-17 02:59:00.186482');
INSERT INTO `django_migrations` VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2026-01-17 02:59:00.195858');
INSERT INTO `django_migrations` VALUES (19, 'sessions', '0001_initial', '2026-01-17 02:59:00.231443');
INSERT INTO `django_migrations` VALUES (20, 'ts', '0002_alter_article_create_time', '2026-01-17 03:07:51.769175');
INSERT INTO `django_migrations` VALUES (21, 'ts', '0003_alter_article_blog_alter_article_category_and_more', '2026-01-22 03:14:34.203289');
INSERT INTO `django_migrations` VALUES (22, 'ts', '0004_alter_article_blog_alter_article_category_and_more', '2026-01-22 03:19:06.392398');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('x8pnoroa643llz3eli8jjfjx5tyxjjc1', '.eJxVjLEOwiAURf-F2RAKtLSOGkd3N_Ie7yFVQ5PSTsZ_lyZdup5z7v2KMBGLsyjXh7uJk_CwLsmvhWc_UuXNkSGEN-dN0Avyc5Jhyss8otwSudsi7_X0c9nbw0GCkuraktKq74cuDtYYqzGaXhsXWweWAV0INSBUitFga0h3jhkscQ1jaED8_rJ4PJQ:1vj7UU:kP3D20yLWiaY_td_jbQQlC28_cPaORj2MU1M--Qc634', '2026-02-06 03:05:42.953818');

-- ----------------------------
-- Table structure for ts_article
-- ----------------------------
DROP TABLE IF EXISTS `ts_article`;
CREATE TABLE `ts_article`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_delete` tinyint(1) NOT NULL,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_time` datetime(6) NOT NULL,
  `up_num` int NOT NULL,
  `down_num` int NOT NULL,
  `comment_num` int NOT NULL,
  `blog_id` bigint NULL DEFAULT NULL,
  `category_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ts_article_blog_id_b38a1f84_fk_ts_blog_id`(`blog_id` ASC) USING BTREE,
  INDEX `ts_article_category_id_09f0c541_fk_ts_category_id`(`category_id` ASC) USING BTREE,
  CONSTRAINT `ts_article_blog_id_b38a1f84_fk_ts_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `ts_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ts_article_category_id_09f0c541_fk_ts_category_id` FOREIGN KEY (`category_id`) REFERENCES `ts_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ts_article
-- ----------------------------
INSERT INTO `ts_article` VALUES (1, 0, 'SpringBoot3-外部化配置与aop实现', ' \nPOM文件中为何要以继承的方式引入SpringBoot？\n继承父工程的优势\n\n依赖管理：在父工程中定义依赖的版本，子模块直接引用而不必指定版本号\n插件管理：在父工程中配置插件，子模块直接使用\n属性设置：在父工程中定义一些通用属性，如项目编码、java版本等\n统一配置：可以统一多个子模块的构建配置', '                <div id=\"cnblogs_post_body\" class=\"blogpost-body cnblogs-markdown\">\r\n<h1 id=\"pom文件中为何要以继承的方式引入springboot\">POM文件中为何要以继承的方式引入SpringBoot？<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h1>\r\n<h2 id=\"继承父工程的优势\">继承父工程的优势<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<ol>\r\n<li>依赖管理：在父工程中定义依赖的版本，子模块直接引用而不必指定版本号</li>\r\n<li>插件管理：在父工程中配置插件，子模块直接使用</li>\r\n<li>属性设置：在父工程中定义一些通用属性，如项目编码、java版本等</li>\r\n<li>统一配置：可以统一多个子模块的构建配置，确保一致性。</li>\r\n</ol>\r\n<p>继承了父工程，那么引入依赖的时候不需要指定版本号，因为在父工程中，各种依赖的版本号已经预设好了。</p>\r\n<h1 id=\"springboot核心注解\">SpringBoot核心注解<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h1>\r\n<h2 id=\"springbootapplication\">@SpringBootApplication<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<p>被此标注表示该类是SpringBoot项目的入口类。</p>\r\n<p>此注解被以下三个注解标注，说明@SpringBootApplication同时有以下三个注解的功能</p>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"highlighter-hljs hljs language-less\"><span class=\"hljs-variable\">@SpringBootConfiguration</span>\r\n<span class=\"hljs-variable\">@EnableAutoConfiguration</span>\r\n<span class=\"hljs-variable\">@ComponentScan</span>\r\n</code></pre>\r\n<h3 id=\"springbootconfiguration\">@SpringBootConfiguration<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>@SpringBootConfiguration被@Configuration标注说明项目的主入口类同时是一个配置类，因此在主入口类中使用@Bean注解方法的话，该方法返回值对象会被纳入Ioc容器管理。</p>\r\n<h2 id=\"enableautoconfiguration\">@EnableAutoConfiguration<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<p>启用自动配置，SpringBoot默认情况下启用自动配置。</p>\r\n<p>自动配置有什么用？</p>\r\n<p>自动配置只要启动，SpringBoot就会去类路径中查找Class。根据类路径中有某些类来自动管理Bean，不需要程序员手动配置。</p>\r\n<p>比如SpringBoot检测到SqlSessionFactory,或者在application.properties中配置了数据源，SpringBoot会认为项目中含有MyBatis框架，会将MyBatis相关的Bean初始化，然后放到Ioc容器中管理起来。</p>\r\n<h3 id=\"componentscan\">@ComponentScan<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>@ComponentScan负责组件扫描。会扫描此包及此包下所有子包或子包的子包等的路径。</p>\r\n<h1 id=\"外部化配置\">外部化配置<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h1>\r\n<p>外部化配置是指将配置信息存储 在应用程序代码之外的地方。这样配置信息独立于 代码进行管理。方便配置修改。修改后不需要重新编译，也不需要重新部署。</p>\r\n<p><strong>springboot默认先找外部化配置</strong></p>\r\n<h2 id=\"applicationproperites\">Application.properites<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<ul>\r\n<li>\r\n<p>Application.properites配置文件是SpringBoot默认的额配置文件</p>\r\n</li>\r\n<li>\r\n<p>Application.properites不是必须的，SpringBoot提供了默认配置，如果需要修改默认配置，就在Application.properites中进行配置。</p>\r\n</li>\r\n<li>\r\n<p>Application.properites可以放在类路径中，也可以放在项目之外，因此成为外部化配置</p>\r\n</li>\r\n</ul>\r\n<p><strong>SpringBoot在启动时会从以下位置按顺序加载Application.properites：</strong></p>\r\n<ol>\r\n<li>file:./config/:  首先在SpringBoot当前工作目录下的config文件夹中查找（如果没找到Application.properites，会继续查找Application.yml，2个都没找到，才会进入下一个位置查找，以此类推）</li>\r\n<li>file:./: 这里找不到会继续查找下一个位置</li>\r\n<li>classpath:/config/:</li>\r\n<li>classpath:/</li>\r\n</ol>\r\n<p>如果在多个位置有相同属性的定义，那么最先检查的位置中的属性值先使用。</p>\r\n<p>如果要指定配置文件位置，可以通过--spring.config.location=进行指定，比如：</p>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-cmd highlighter-hljs hljs language-dos\">java -jar xxxx.jar --spring.config.location=file:///E:\\a\\b\\application.properties\r\n</code></pre>\r\n<p>注意：以上的--spring.config.location=file:///E:\\a\\b\\application.properties属于命令行参数，会被传递到main方法的（String[] args）参数上。</p>\r\n<h2 id=\"读取配置\">读取配置<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-java highlighter-hljs hljs\"><span class=\"hljs-comment\">// 读取配置文件中myapp.path的值，</span>\r\n<span class=\"hljs-comment\">// 如果这个key不存在，并且没有指定默认值，那么会报错</span>\r\n    <span class=\"hljs-comment\">// ${myapp.path:50}指定myapp.path的默认值是50</span>\r\n    <span class=\"hljs-meta\">@Value(\"${myapp.path:50}\")</span>\r\n    <span class=\"hljs-keyword\">private</span> String appPath;\r\n</code></pre>\r\n<h2 id=\"yaml语法规则\">YAML语法规则<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<h2 id=\"数据结构\">数据结构<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<ol>\r\n<li>\r\n<p>支持多种数据结构，包括：字符串、数字、布尔值、数组、List集合、Map键值对等</p>\r\n</li>\r\n<li>\r\n<p>yaml使用一个空格来分割属性名和属性值，比如：</p>\r\n</li>\r\n</ol>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-yaml highlighter-hljs hljs\"><span class=\"hljs-attr\">name:</span> <span class=\"hljs-string\">jack</span>\r\n</code></pre>\r\n<ol start=\"3\">\r\n<li>yaml使用换行+空格表示层级关系，注意不能使用tab 必须是空格，空格数量无要求，建议2个或4个，比如：</li>\r\n</ol>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-yaml highlighter-hljs hljs\"><span class=\"hljs-attr\">myapp:</span> \r\n  <span class=\"hljs-attr\">name:</span> <span class=\"hljs-string\">mall</span>\r\n</code></pre>\r\n<ol start=\"4\">\r\n<li>同级元素左侧对其</li>\r\n<li>大小写敏感</li>\r\n<li>使用# 进行注释</li>\r\n<li>在一个映射中，键必须唯一</li>\r\n<li>普通文本可以使用单引号，也可以使用双引号，也可以什么都不用<strong>（单引号中的\\n表示普通文本，双引号中的\\n表示换行）</strong></li>\r\n<li>保留文本原格式使用 |  比如：</li>\r\n</ol>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-yaml highlighter-hljs hljs\"><span class=\"hljs-attr\">username:</span> <span class=\"hljs-string\">|\r\n  aaaa\r\n  bbb\r\n  ccc\r\n</span></code></pre>\r\n<ol start=\"10\">\r\n<li>文档切割： --- 这个符号下面的配置认为是一个独立的yaml文件，便于大文件的阅读。</li>\r\n</ol>\r\n<h2 id=\"配置文件合并\">配置文件合并<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-properties highlighter-hljs hljs\"><span class=\"hljs-comment\">#properties文件合并</span>\r\n<span class=\"hljs-comment\"># 对于数组来说，使用逗号进行分隔开</span>\r\n<span class=\"hljs-attr\">spring.config.import</span>=<span class=\"hljs-string\">classpath:/application-mysql.properties,classpath:/application-redis.properties</span>\r\n</code></pre>\r\n<p>yml文件合并的第一种写法</p>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-yaml highlighter-hljs hljs\"><span class=\"hljs-attr\">spring:</span> \r\n  <span class=\"hljs-attr\">config:</span> \r\n    <span class=\"hljs-attr\">import:</span> [<span class=\"hljs-string\">classpath:/application-mysql.yml</span>,<span class=\"hljs-string\">classpath:/application-redis.yml</span>]\r\n</code></pre>\r\n<p>yml文件合并的第二种写法</p>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-yaml highlighter-hljs hljs\"><span class=\"hljs-attr\">spring:</span> \r\n  <span class=\"hljs-attr\">config:</span> \r\n    <span class=\"hljs-attr\">import:</span> \r\n      <span class=\"hljs-bullet\">-</span> <span class=\"hljs-string\">classpath:/application-mysql.yml</span>\r\n      <span class=\"hljs-bullet\">-</span> <span class=\"hljs-string\">classpath:/application-redis.yml</span>\r\n</code></pre>\r\n<h2 id=\"多环境切换\">多环境切换<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<p>开发环境配置文件：application-dev.properties</p>\r\n<p>测试环境配置文件：application-test.properties</p>\r\n<p>预生产环境配置文件：application-preprod.properties</p>\r\n<p>生产环境配置文件：application-prod.properties</p>\r\n<p>如果启用生产环境配置，可以有以下两种操作方式：</p>\r\n<ol>\r\n<li>在application.properties添加配置：spring.profiles.active=prod</li>\r\n<li>在命令行参数上添加： --spring.profiles.active=prod</li>\r\n</ol>\r\n<h2 id=\"将配置绑定到简单bean\">将配置绑定到简单Bean<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-java highlighter-hljs hljs\"><span class=\"hljs-keyword\">package</span> com.ali.bindtobean.config;\r\n\r\n<span class=\"hljs-keyword\">import</span> org.springframework.boot.context.properties.ConfigurationProperties;\r\n<span class=\"hljs-keyword\">import</span> org.springframework.context.annotation.Configuration;\r\n\r\n<span class=\"hljs-comment\">// 纳入Ioc容器</span>\r\n<span class=\"hljs-meta\">@Component</span>\r\n<span class=\"hljs-comment\">// 将配置文件一次性绑定到Bean对象上</span>\r\n<span class=\"hljs-meta\">@ConfigurationProperties(prefix = \"myapp\")</span>\r\n<span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">class</span> <span class=\"hljs-title class_\">AppConfig</span> {\r\n\r\n    <span class=\"hljs-comment\">// 要实现一次性绑定，配置文件中的属性名 必须和Bean对象的属性名要一致</span>\r\n    <span class=\"hljs-comment\">// 底层在给对象属性赋值时，调用了setter方法，因此每个属性必须有setter方法</span>\r\n  <span class=\"hljs-keyword\">private</span> String name;\r\n  <span class=\"hljs-keyword\">private</span> Integer age;\r\n  <span class=\"hljs-keyword\">private</span> String password;\r\n  <span class=\"hljs-keyword\">private</span> Boolean gender;\r\n\r\n    <span class=\"hljs-keyword\">public</span> String <span class=\"hljs-title function_\">getName</span><span class=\"hljs-params\">()</span> {\r\n        <span class=\"hljs-keyword\">return</span> name;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">setName</span><span class=\"hljs-params\">(String name)</span> {\r\n        <span class=\"hljs-built_in\">this</span>.name = name;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> Integer <span class=\"hljs-title function_\">getAge</span><span class=\"hljs-params\">()</span> {\r\n        <span class=\"hljs-keyword\">return</span> age;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">setAge</span><span class=\"hljs-params\">(Integer age)</span> {\r\n        <span class=\"hljs-built_in\">this</span>.age = age;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> String <span class=\"hljs-title function_\">getPassword</span><span class=\"hljs-params\">()</span> {\r\n        <span class=\"hljs-keyword\">return</span> password;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">setPassword</span><span class=\"hljs-params\">(String password)</span> {\r\n        <span class=\"hljs-built_in\">this</span>.password = password;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> Boolean <span class=\"hljs-title function_\">getGender</span><span class=\"hljs-params\">()</span> {\r\n        <span class=\"hljs-keyword\">return</span> gender;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">setGender</span><span class=\"hljs-params\">(Boolean gender)</span> {\r\n        <span class=\"hljs-built_in\">this</span>.gender = gender;\r\n    }\r\n\r\n    <span class=\"hljs-meta\">@Override</span>\r\n    <span class=\"hljs-keyword\">public</span> String <span class=\"hljs-title function_\">toString</span><span class=\"hljs-params\">()</span>{\r\n        <span class=\"hljs-keyword\">return</span> <span class=\"hljs-string\">\"AppConfig [name=\"</span> + name + <span class=\"hljs-string\">\", age=\"</span> + age + <span class=\"hljs-string\">\", gender=\"</span> + gender + <span class=\"hljs-string\">\"]\"</span>;\r\n    }\r\n}\r\n\r\n</code></pre>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-properties highlighter-hljs hljs\"><span class=\"hljs-attr\">spring.application.name</span>=<span class=\"hljs-string\">bindtobean</span>\r\n\r\n<span class=\"hljs-attr\">myapp.name</span>=<span class=\"hljs-string\">jack</span>\r\n<span class=\"hljs-attr\">myapp.age</span>=<span class=\"hljs-string\">12</span>\r\n<span class=\"hljs-attr\">myapp.password</span>=<span class=\"hljs-string\">123</span>\r\n<span class=\"hljs-attr\">myapp.gender</span>=<span class=\"hljs-string\">true</span>\r\n</code></pre>\r\n<h2 id=\"绑定嵌套bean\">绑定嵌套Bean<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<p>在一个Bean的属性中，有一个其他Bean类型。这样就是嵌套Bean。</p>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-java highlighter-hljs hljs\"><span class=\"hljs-keyword\">package</span> com.ali.bindtobean.bean;\r\n\r\n<span class=\"hljs-keyword\">import</span> org.springframework.boot.context.properties.ConfigurationProperties;\r\n<span class=\"hljs-keyword\">import</span> org.springframework.stereotype.Component;\r\n\r\n<span class=\"hljs-meta\">@Component</span>\r\n<span class=\"hljs-meta\">@ConfigurationProperties(prefix = \"app.xyz\")</span>\r\n<span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">class</span> <span class=\"hljs-title class_\">User</span> {\r\n    <span class=\"hljs-keyword\">private</span> String name;\r\n    <span class=\"hljs-keyword\">private</span> Address address;\r\n\r\n    <span class=\"hljs-keyword\">public</span> Address <span class=\"hljs-title function_\">getAddress</span><span class=\"hljs-params\">()</span> {\r\n        <span class=\"hljs-keyword\">return</span> address;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">setAddress</span><span class=\"hljs-params\">(Address address)</span> {\r\n        <span class=\"hljs-built_in\">this</span>.address = address;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> String <span class=\"hljs-title function_\">getName</span><span class=\"hljs-params\">()</span> {\r\n        <span class=\"hljs-keyword\">return</span> name;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">setName</span><span class=\"hljs-params\">(String name)</span> {\r\n        <span class=\"hljs-built_in\">this</span>.name = name;\r\n    }\r\n\r\n    <span class=\"hljs-meta\">@Override</span>\r\n    <span class=\"hljs-keyword\">public</span> String <span class=\"hljs-title function_\">toString</span><span class=\"hljs-params\">()</span> {\r\n        <span class=\"hljs-keyword\">return</span> <span class=\"hljs-string\">\"User [name=\"</span> + name + <span class=\"hljs-string\">\", address=\"</span> + address.toString() + <span class=\"hljs-string\">\"]\"</span>;\r\n    }\r\n}\r\n</code></pre>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-java highlighter-hljs hljs\"><span class=\"hljs-keyword\">package</span> com.ali.bindtobean.bean;\r\n\r\n<span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">class</span> <span class=\"hljs-title class_\">Address</span> {\r\n    <span class=\"hljs-keyword\">private</span> String city;\r\n    <span class=\"hljs-keyword\">private</span> String street;\r\n\r\n    <span class=\"hljs-keyword\">public</span> String <span class=\"hljs-title function_\">getCity</span><span class=\"hljs-params\">()</span> {\r\n        <span class=\"hljs-keyword\">return</span> city;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">setCity</span><span class=\"hljs-params\">(String city)</span> {\r\n        <span class=\"hljs-built_in\">this</span>.city = city;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> String <span class=\"hljs-title function_\">getStreet</span><span class=\"hljs-params\">()</span> {\r\n        <span class=\"hljs-keyword\">return</span> street;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">setStreet</span><span class=\"hljs-params\">(String street)</span> {\r\n        <span class=\"hljs-built_in\">this</span>.street = street;\r\n    }\r\n\r\n    <span class=\"hljs-meta\">@Override</span>\r\n    <span class=\"hljs-keyword\">public</span> String <span class=\"hljs-title function_\">toString</span><span class=\"hljs-params\">()</span> {\r\n        <span class=\"hljs-keyword\">return</span> <span class=\"hljs-string\">\"Address [city=\"</span> + city + <span class=\"hljs-string\">\", street=\"</span> + street + <span class=\"hljs-string\">\"]\"</span>;\r\n    }\r\n}\r\n</code></pre>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-properties highlighter-hljs hljs\"><span class=\"hljs-attr\">app.xyz.name</span>=<span class=\"hljs-string\">lucy</span>\r\n<span class=\"hljs-attr\">app.xyz.address.city</span>=<span class=\"hljs-string\">xj</span>\r\n<span class=\"hljs-attr\">app.xyz.address.street</span>=<span class=\"hljs-string\">dayang</span>\r\n</code></pre>\r\n<h2 id=\"其他方式绑定bean\">其他方式绑定Bean<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-java highlighter-hljs hljs\"><span class=\"hljs-comment\">// 在主入口程序添加以下注解，启用将配置信息绑定到User这个Bean</span>\r\n<span class=\"hljs-meta\">@EnableConfigurationProperties({User.class, Address.class})</span>\r\n</code></pre>\r\n<p>另一种方式：</p>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-java highlighter-hljs hljs\"><span class=\"hljs-comment\">// 在主入口程序添加以下注解，扫面指定包。将配置信息绑定到这个包下的类</span>\r\n<span class=\"hljs-meta\">@ConfigurationPropertiesScan(basePackages = \"com.ali.bindtobean.bean\")</span>\r\n</code></pre>\r\n<h2 id=\"复杂的属性结构绑定bean\">复杂的属性结构绑定Bean<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<p>绑定数组、集合、Map到Bean</p>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-properties highlighter-hljs hljs\"><span class=\"hljs-attr\">app2.abc.names[0]</span>=<span class=\"hljs-string\">jack</span>\r\n<span class=\"hljs-attr\">app2.abc.names[1]</span>=<span class=\"hljs-string\">lucy</span>\r\n<span class=\"hljs-attr\">app2.abc.names[2]</span>=<span class=\"hljs-string\">tom</span>\r\n\r\n<span class=\"hljs-attr\">app2.abc.addresses[0].city</span>=<span class=\"hljs-string\">bj</span>\r\n<span class=\"hljs-attr\">app2.abc.addresses[0].street</span>=<span class=\"hljs-string\">chaoyang</span>\r\n<span class=\"hljs-attr\">app2.abc.addresses[1].city</span>=<span class=\"hljs-string\">tj</span>\r\n<span class=\"hljs-attr\">app2.abc.addresses[1].street</span>=<span class=\"hljs-string\">nankai</span>\r\n\r\n<span class=\"hljs-attr\">app2.abc.addressList[0].city</span>=<span class=\"hljs-string\">bj_list</span>\r\n<span class=\"hljs-attr\">app2.abc.addressList[0].street</span>=<span class=\"hljs-string\">chaoyang_list</span>\r\n<span class=\"hljs-attr\">app2.abc.addressList[1].city</span>=<span class=\"hljs-string\">tj_list</span>\r\n<span class=\"hljs-attr\">app2.abc.addressList[1].street</span>=<span class=\"hljs-string\">nankai_list</span>\r\n<span class=\"hljs-comment\">\r\n# addr1 和addr2 都是key</span>\r\n<span class=\"hljs-attr\">app2.abc.addressMap.addr1.city</span>=<span class=\"hljs-string\">bj_map</span>\r\n<span class=\"hljs-attr\">app2.abc.addressMap.addr1.street</span>=<span class=\"hljs-string\">chaoyang_map</span>\r\n<span class=\"hljs-attr\">app2.abc.addressMap.addr2.city</span>=<span class=\"hljs-string\">tj_map</span>\r\n<span class=\"hljs-attr\">app2.abc.addressMap.addr2.street</span>=<span class=\"hljs-string\">nankai_map</span>\r\n</code></pre>\r\n<p>yaml文件配置方式如下：</p>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-yaml highlighter-hljs hljs\"><span class=\"hljs-attr\">app2:</span>\r\n    <span class=\"hljs-attr\">abc:</span>\r\n        <span class=\"hljs-attr\">names:</span>\r\n          <span class=\"hljs-bullet\">-</span> <span class=\"hljs-string\">tom</span>\r\n          <span class=\"hljs-bullet\">-</span> <span class=\"hljs-string\">smith</span>\r\n        <span class=\"hljs-attr\">addresses:</span>\r\n            <span class=\"hljs-bullet\">-</span> <span class=\"hljs-attr\">city:</span> <span class=\"hljs-string\">beijing</span>\r\n              <span class=\"hljs-attr\">street:</span> <span class=\"hljs-string\">chaoyang</span>\r\n            <span class=\"hljs-bullet\">-</span> <span class=\"hljs-attr\">city:</span> <span class=\"hljs-string\">tianjin</span>\r\n              <span class=\"hljs-attr\">street:</span> <span class=\"hljs-string\">nankai</span>\r\n       <span class=\"hljs-comment\"># addressList 可以写成 address-list</span>\r\n        <span class=\"hljs-attr\">addressList:</span>\r\n            <span class=\"hljs-bullet\">-</span> <span class=\"hljs-attr\">city:</span> <span class=\"hljs-string\">beijing</span>\r\n              <span class=\"hljs-attr\">street:</span> <span class=\"hljs-string\">chaoyang</span>\r\n            <span class=\"hljs-bullet\">-</span> <span class=\"hljs-attr\">city:</span> <span class=\"hljs-string\">tianjin</span>\r\n              <span class=\"hljs-attr\">street:</span> <span class=\"hljs-string\">nankai</span>\r\n        <span class=\"hljs-attr\">addressMap:</span>\r\n            <span class=\"hljs-attr\">addr1:</span>\r\n                <span class=\"hljs-attr\">city:</span> <span class=\"hljs-string\">beijing</span>\r\n                <span class=\"hljs-attr\">street:</span> <span class=\"hljs-string\">chaoyang</span>\r\n            <span class=\"hljs-attr\">addr2:</span>\r\n                <span class=\"hljs-attr\">city:</span> <span class=\"hljs-string\">tianjin</span>\r\n                <span class=\"hljs-attr\">street:</span> <span class=\"hljs-string\">nankai</span>\r\n</code></pre>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-java highlighter-hljs hljs\"><span class=\"hljs-keyword\">package</span> com.ali.bindtobean.bean;\r\n\r\n<span class=\"hljs-keyword\">import</span> org.springframework.boot.context.properties.ConfigurationProperties;\r\n<span class=\"hljs-keyword\">import</span> java.util.Map;\r\n\r\n<span class=\"hljs-meta\">@ConfigurationProperties(prefix = \"app2.abc\")</span>\r\n<span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">class</span> <span class=\"hljs-title class_\">AppBean</span> {\r\n    <span class=\"hljs-comment\">// 数组中元素是简单类型</span>\r\n    <span class=\"hljs-keyword\">private</span> String[] names;\r\n    <span class=\"hljs-comment\">// 数组中元素是Bean</span>\r\n    <span class=\"hljs-keyword\">private</span> Address[] addresses;\r\n    <span class=\"hljs-comment\">//List集合。List中元素是Bean</span>\r\n    <span class=\"hljs-keyword\">private</span>  List&lt;Address&gt; addressList;\r\n    <span class=\"hljs-comment\">//Map集合： String，Bean</span>\r\n    <span class=\"hljs-keyword\">private</span> Map&lt;String,Address&gt; addressMap;\r\n\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">setNames</span><span class=\"hljs-params\">(String[] names)</span> {\r\n        <span class=\"hljs-built_in\">this</span>.names = names;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">setAddresses</span><span class=\"hljs-params\">(Address[] addresses)</span> {\r\n        <span class=\"hljs-built_in\">this</span>.addresses = addresses;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">setAddressList</span><span class=\"hljs-params\">(List&lt;Address&gt; addressList)</span> {\r\n        <span class=\"hljs-built_in\">this</span>.addressList = addressList;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">setAddressMap</span><span class=\"hljs-params\">(Map&lt;String, Address&gt; addressMap)</span> {\r\n        <span class=\"hljs-built_in\">this</span>.addressMap = addressMap;\r\n    }\r\n\r\n    <span class=\"hljs-meta\">@Override</span>\r\n    <span class=\"hljs-keyword\">public</span> String <span class=\"hljs-title function_\">toString</span><span class=\"hljs-params\">()</span> {\r\n        <span class=\"hljs-keyword\">return</span> <span class=\"hljs-string\">\"\"</span>;\r\n    }\r\n}\r\n</code></pre>\r\n<h2 id=\"将配置绑定到第三方对象\">将配置绑定到第三方对象<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-yaml highlighter-hljs hljs\"><span class=\"hljs-attr\">other:</span>\r\n  <span class=\"hljs-attr\">abc:</span>\r\n    <span class=\"hljs-attr\">city:</span> <span class=\"hljs-string\">beijing</span>\r\n    <span class=\"hljs-attr\">street:</span> <span class=\"hljs-string\">daxing</span>\r\n</code></pre>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-java highlighter-hljs hljs\"><span class=\"hljs-keyword\">package</span> com.ali.bindtobean.config;\r\n\r\n<span class=\"hljs-keyword\">import</span> com.ali.bindtobean.bean.Address;\r\n<span class=\"hljs-keyword\">import</span> org.springframework.boot.context.properties.ConfigurationProperties;\r\n<span class=\"hljs-keyword\">import</span> org.springframework.context.annotation.Bean;\r\n<span class=\"hljs-keyword\">import</span> org.springframework.context.annotation.Configuration;\r\n\r\n<span class=\"hljs-meta\">@Configuration</span>\r\n<span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">class</span> <span class=\"hljs-title class_\">AppConfig2</span> {\r\n\r\n    <span class=\"hljs-comment\">//  address 是第三方类，使用以下方式完成配置到属性的绑定</span>\r\n    <span class=\"hljs-meta\">@Bean</span>\r\n    <span class=\"hljs-meta\">@ConfigurationProperties(prefix = \"other.abc\")</span>\r\n    <span class=\"hljs-keyword\">public</span> Address <span class=\"hljs-title function_\">address</span><span class=\"hljs-params\">()</span> {\r\n        <span class=\"hljs-keyword\">return</span> <span class=\"hljs-keyword\">new</span> <span class=\"hljs-title class_\">Address</span>();\r\n    }\r\n}\r\n</code></pre>\r\n<h2 id=\"指定配置数据来源\">指定配置数据来源<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-java highlighter-hljs hljs\"><span class=\"hljs-meta\">@Component</span>\r\n<span class=\"hljs-meta\">@ConfigurationProperties(prefix = \"app2.abc\")</span>\r\n<span class=\"hljs-comment\">// 指定配置数据来自/a/b/group-info.properties路径的配置文件</span>\r\n<span class=\"hljs-meta\">@PropertySource(\"classpath:/a/b/group-info.properties\")</span>\r\n<span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">class</span> <span class=\"hljs-title class_\">AppBean</span> {\r\n...\r\n}\r\n</code></pre>\r\n<h2 id=\"importresource注解\">@ImportResource注解<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<p>当SpringBoot项目中出现ApplicationContext.xml文件。并且文件中配置了Bean。要把这个Bean注入到容器中。</p>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-java highlighter-hljs hljs\"><span class=\"hljs-keyword\">package</span> com.ali.bindtobean.bean;\r\n\r\n\r\n<span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">class</span> <span class=\"hljs-title class_\">Person</span> {\r\n    <span class=\"hljs-keyword\">private</span> String name;\r\n    <span class=\"hljs-keyword\">private</span> <span class=\"hljs-type\">int</span> age;\r\n\r\n    <span class=\"hljs-keyword\">public</span> String <span class=\"hljs-title function_\">getName</span><span class=\"hljs-params\">()</span> {\r\n        <span class=\"hljs-keyword\">return</span> name;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">setName</span><span class=\"hljs-params\">(String name)</span> {\r\n        <span class=\"hljs-built_in\">this</span>.name = name;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-type\">int</span> <span class=\"hljs-title function_\">getAge</span><span class=\"hljs-params\">()</span> {\r\n        <span class=\"hljs-keyword\">return</span> age;\r\n    }\r\n\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">setAge</span><span class=\"hljs-params\">(<span class=\"hljs-type\">int</span> age)</span> {\r\n        <span class=\"hljs-built_in\">this</span>.age = age;\r\n    }\r\n\r\n    <span class=\"hljs-meta\">@Override</span>\r\n    <span class=\"hljs-keyword\">public</span> String <span class=\"hljs-title function_\">toString</span><span class=\"hljs-params\">()</span> {\r\n        <span class=\"hljs-keyword\">return</span> <span class=\"hljs-built_in\">super</span>.toString();\r\n    }\r\n}\r\n</code></pre>\r\n<p>配置文件如下：</p>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-xml highlighter-hljs hljs\"><span class=\"hljs-meta\">&lt;?xml version=\"1.0\" encoding=\"UTF-8\"?&gt;</span>\r\n<span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">beans</span> <span class=\"hljs-attr\">xmlns</span>=<span class=\"hljs-string\">\"http://www.springframework.org/schema/beans\"</span>\r\n       <span class=\"hljs-attr\">xmlns:xsi</span>=<span class=\"hljs-string\">\"http://www.w3.org/2001/XMLSchema-instance\"</span>\r\n       <span class=\"hljs-attr\">xsi:schemaLocation</span>=<span class=\"hljs-string\">\"http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans.xsd\"</span>&gt;</span>\r\n\r\n    <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">bean</span> <span class=\"hljs-attr\">id</span>=<span class=\"hljs-string\">\"person\"</span> <span class=\"hljs-attr\">class</span>=<span class=\"hljs-string\">\"com.ali.bindtobean.bean.Person\"</span>&gt;</span>\r\n        <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">property</span> <span class=\"hljs-attr\">name</span>=<span class=\"hljs-string\">\"name\"</span> <span class=\"hljs-attr\">value</span>=<span class=\"hljs-string\">\"jack\"</span>/&gt;</span>\r\n        <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">property</span> <span class=\"hljs-attr\">name</span>=<span class=\"hljs-string\">\"age\"</span> <span class=\"hljs-attr\">value</span>=<span class=\"hljs-string\">\"20\"</span>/&gt;</span>\r\n    <span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">bean</span>&gt;</span>\r\n<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">beans</span>&gt;</span>\r\n</code></pre>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-java highlighter-hljs hljs\"><span class=\"hljs-comment\">// 在主入口程序添加以下注解让applocationContext.xml文件生效</span>\r\n<span class=\"hljs-meta\">@ImportResource(\"classpath:/applocationContext.xml\")</span>\r\n</code></pre>\r\n<h2 id=\"environment\">Environment<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<p>spring提供的一个接口。SpringBoot启动的时候会把环境、系统信息封装到Environment对象中，需要获取这些信息，可使用Environment接口的方法。</p>\r\n<p>Environment对象主要包括</p>\r\n<ul>\r\n<li>当前激活的配置文件 active-profiles</li>\r\n<li>系统属性，如系统名字 、java版本</li>\r\n<li>环境变量</li>\r\n<li>应用程序启动时传给主方法的命令行参数</li>\r\n</ul>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-java highlighter-hljs hljs\"><span class=\"hljs-meta\">@Autowired</span>\r\n<span class=\"hljs-keyword\">private</span> Environment environment;\r\n\r\n<span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span>  <span class=\"hljs-title function_\">doSomething</span><span class=\"hljs-params\">()</span> {\r\n    <span class=\"hljs-comment\">// 获取当前激活的配置文件</span>\r\n    String[] activeProfiles = environment.getActiveProfiles();\r\n    <span class=\"hljs-keyword\">for</span> (String activeProfile : activeProfiles) {\r\n        System.out.println(activeProfile);\r\n    }\r\n    <span class=\"hljs-comment\">//  获取配置信息</span>\r\n    <span class=\"hljs-type\">String</span> <span class=\"hljs-variable\">property</span> <span class=\"hljs-operator\">=</span> environment.getProperty(<span class=\"hljs-string\">\"app.xyz.address.city\"</span>);\r\n    System.out.println(property);\r\n}\r\n</code></pre>\r\n<h1 id=\"springboot-aop实现\">SpringBoot aop实现<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h1>\r\n<p>添加依赖</p>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-xml highlighter-hljs hljs\"><span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">dependency</span>&gt;</span>\r\n    <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">groupId</span>&gt;</span>org.springframework.boot<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">groupId</span>&gt;</span>\r\n    <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">artifactId</span>&gt;</span>spring-boot-starter-aop<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">artifactId</span>&gt;</span>\r\n    <span class=\"hljs-tag\">&lt;<span class=\"hljs-name\">version</span>&gt;</span>3.3.5<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">version</span>&gt;</span>\r\n<span class=\"hljs-tag\">&lt;/<span class=\"hljs-name\">dependency</span>&gt;</span>\r\n</code></pre>\r\n<p>编写切面类</p>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"language-java highlighter-hljs hljs\"><span class=\"hljs-keyword\">package</span> com.ali.springaop.component;\r\n\r\n<span class=\"hljs-keyword\">import</span> org.aspectj.lang.JoinPoint;\r\n<span class=\"hljs-keyword\">import</span> org.aspectj.lang.annotation.Aspect;\r\n<span class=\"hljs-keyword\">import</span> org.aspectj.lang.annotation.Before;\r\n<span class=\"hljs-keyword\">import</span> org.aspectj.lang.annotation.Pointcut;\r\n<span class=\"hljs-keyword\">import</span> org.slf4j.LoggerFactory;\r\n<span class=\"hljs-keyword\">import</span> org.slf4j.Logger;\r\n<span class=\"hljs-keyword\">import</span> org.springframework.stereotype.Component;\r\n\r\n<span class=\"hljs-keyword\">import</span> java.util.Arrays;\r\n\r\n<span class=\"hljs-comment\">// 指定切面类</span>\r\n<span class=\"hljs-meta\">@Aspect</span>\r\n<span class=\"hljs-meta\">@Component</span>\r\n<span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">class</span> <span class=\"hljs-title class_\">LoggingAspect</span> {\r\n    <span class=\"hljs-keyword\">private</span> <span class=\"hljs-keyword\">static</span> <span class=\"hljs-keyword\">final</span> <span class=\"hljs-type\">Logger</span> <span class=\"hljs-variable\">logger</span> <span class=\"hljs-operator\">=</span> LoggerFactory.getLogger(LoggingAspect.class);\r\n\r\n    <span class=\"hljs-comment\">// 定义切入点，匹配所有以“service”结尾的包下的所有方法</span>\r\n    <span class=\"hljs-meta\">@Pointcut(\"execution(* com.ali.springaop.service..*(..))\")</span>\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">ServiceMethods</span><span class=\"hljs-params\">()</span>{\r\n\r\n    }\r\n\r\n    <span class=\"hljs-comment\">// 前置通知，切入点的方法执行前执行此代码</span>\r\n    <span class=\"hljs-meta\">@Before(\"ServiceMethods()\")</span>\r\n    <span class=\"hljs-keyword\">public</span> <span class=\"hljs-keyword\">void</span> <span class=\"hljs-title function_\">before</span><span class=\"hljs-params\">(JoinPoint joinPoint)</span> {\r\n        <span class=\"hljs-type\">String</span> <span class=\"hljs-variable\">methodName</span> <span class=\"hljs-operator\">=</span> joinPoint.getSignature().getName();\r\n        Object[] args = joinPoint.getArgs();\r\n        logger.info(<span class=\"hljs-string\">\"Method [{}] with parameters [{}] is called\"</span>, methodName, Arrays.toString(args));\r\n    }\r\n}\r\n</code></pre>\r\n\r\n</div>\r\n            ', '2026-01-21 01:40:30.386190', 10, 4, 2, 1, 2);
INSERT INTO `ts_article` VALUES (2, 0, '不止是快！美团 LongCat 开源新模型，给 Agent 装上深度思考的大脑', '但在 2026 年的今天，光快已经不够看了。面对那些复杂的 Agent 任务、全是坑的真实环境 API，还有各种逻辑陷阱，模型光有手速不行，还得脑子好使、扛得住事。', '<div id=\"cnblogs_post_body\" class=\"blogpost-body cnblogs-markdown\">\r\n<p><img alt=\"\" loading=\"lazy\" data-src=\"https://img2024.cnblogs.com/blog/759200/202601/759200-20260119010412390-169992565.png\" class=\"ls-is-cached lazyloaded medium-zoom-image\" src=\"https://img2024.cnblogs.com/blog/759200/202601/759200-20260119010412390-169992565.png\"></p>\r\n<p>提起美团的 LongCat（龙猫）大模型，不知道多少读者和我的第一反应一样就是<strong>快</strong>。确实，之前的 Flash 版本在推理速度上那是相当能打。</p>\r\n<p>但在 2026 年的今天，光快已经不够看了。面对那些复杂的 Agent 任务、全是坑的真实环境 API，还有各种逻辑陷阱，<strong>模型光有手速不行，还得脑子好使、扛得住事</strong>。</p>\r\n<p><strong>1 月 15 日，LongCat-Flash-Thinking-2601 正式发布并开源。</strong></p>\r\n<p>我不整那些虚的，直接总结这个版本——不止快！它让 LongCat 不再只是一个陪聊的机器人，而是一个经得起折腾、自带逻辑图谱、能处理真实世界问题的 Agent 基座。</p>\r\n<p><img alt=\"\" loading=\"lazy\" data-src=\"https://img2024.cnblogs.com/blog/759200/202601/759200-20260119010546140-137474634.png\" class=\"ls-is-cached lazyloaded medium-zoom-image\" src=\"https://img2024.cnblogs.com/blog/759200/202601/759200-20260119010546140-137474634.png\"></p>\r\n<blockquote>\r\n<p>GitHub 地址：<a href=\"https://github.com/meituan-longcat/LongCat-Flash-Thinking-2601\" target=\"_blank\" rel=\"noopener nofollow\">github.com/meituan-longcat/LongCat-Flash-Thinking-2601</a></p>\r\n</blockquote>\r\n<p>打个比方，如果说之前的 LongCat-Flash 是在做填空题，那现在的 LongCat-Flash-Thinking-2601 就是在做复杂的应用题。</p>\r\n<h2 id=\"一从快进化到全能\">一、从“快”进化到“全能”<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<p>翻翻龙猫家族的路线图，逻辑其实很清晰：</p>\r\n<ul>\r\n<li><strong>Flash-Chat 版本</strong>：主打快，极速响应。</li>\r\n<li><strong>Omni 版本</strong>：主打全，多模态全能。</li>\r\n<li><strong>Thinking 版本</strong>：主打专，深度推理和 Agent 能力。</li>\r\n</ul>\r\n<p>这次发布的 Thinking-2601，是一个基于混合专家（MoE）架构的 5600 亿参数高性能模型。它是专门冲着开发者构建 Agent 时最头疼的两个痛点去的。</p>\r\n<ol>\r\n<li>在 Demo 里演示猛如虎，一上生产环境就因为“噪声”挂掉</li>\r\n<li>遇到没见过的复杂任务，模型就开始一本正经地胡说八道</li>\r\n</ol>\r\n<h2 id=\"二为什么开发者值得关注这个版本\">二、为什么开发者值得关注这个版本？<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<h3 id=\"21-在噪音里长大的模型\">2.1 在噪音里长大的模型<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>搞过 Agent 开发的兄弟都懂，真实世界的 API 有多“脏”。网络超时、参数缺失、非标准的 JSON 返回...这些环境噪声，往往分分钟教通用模型做人。</p>\r\n<p>LongCat-Flash-Thinking-2601 在这方面做了个很有极客精神的尝试：它就是在“噪音”堆里长大的。</p>\r\n<ul>\r\n<li><strong>课程学习（Curriculum Learning）</strong>：研发团队利用 DORA 强化学习设施，训练时故意注入了各种类型和强度的噪声。</li>\r\n<li><strong>OOD（Out-of-Distribution）泛化</strong>：模型在包含 60+ 工具的里进行了大规模训练，在面对真实场景时游刃有余。</li>\r\n</ul>\r\n<p><img alt=\"\" loading=\"lazy\" data-src=\"https://img2024.cnblogs.com/blog/759200/202601/759200-20260119010556216-2043887261.png\" class=\"lazyloaded medium-zoom-image\" src=\"https://img2024.cnblogs.com/blog/759200/202601/759200-20260119010556216-2043887261.png\"></p>\r\n<p><strong>这对咱们写代码的有啥用？</strong></p>\r\n<p>以前为了让 Agent 稳定，你可能得写 80% 的代码来做异常处理。现在，这部分容错能力可以交给 LongCat-Flash-Thinking。它就像个经验丰富的老程序员，看到报错不会慌，而是会尝试通过逻辑推断去修补，试着把路走通。</p>\r\n<h3 id=\"22-并行思考\">2.2 并行思考<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>在处理复杂逻辑时，比如分析几万行的代码库，或制定那种牵一发而动全身的旅行计划。普通模型的思维往往是单线程的——<strong>一旦中间某一步走窄了或者钻了牛角尖，后面的推导就会像多米诺骨牌一样，全盘皆输</strong>。</p>\r\n<p><strong>为了治这个一步错、步步错的毛病</strong>，LongCat-Flash-Thinking 搞了个 Heavy Thinking Mode（深度推理模式），这不仅仅是算力的堆砌，它更像是咱们开会时的<strong>多人头脑风暴</strong>：</p>\r\n<ul>\r\n<li><strong>并行思考</strong>：既然一条路容易堵死，那就<strong>同时跑多条</strong>。遇到难题，模型瞬间开启几个“分身”线程，同时尝试几种完全不同的解法。</li>\r\n<li><strong>迭代摘要</strong>：分身多了容易乱，所以它还配了个<strong>脑子清醒的裁判</strong>。这个角色负责盯着所有分身，把逻辑最通的那条路挑出来，再喂给下一轮。</li>\r\n</ul>\r\n<p><strong>实际上手的感觉就是</strong>：刚敲完回车，屏幕上“唰”地一下弹出来 8 个 Thinker 线程。说实话，这反应速度真给我整不会了——毕竟早就习惯了深度思考的速度，LongCat-Flash-Thinking 这种秒回的并发思考，确实有点东西。</p>\r\n<p><img alt=\"\" loading=\"lazy\" data-src=\"https://img2024.cnblogs.com/blog/759200/202601/759200-20260119010607321-1386755150.gif\" class=\"lazyload\"></p>\r\n<h2 id=\"三实际上手\">三、实际上手<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<h3 id=\"31-抗造测试\">3.1 抗造测试<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>为了验证它是不是真能“抗造”，我故意设计了一个钓鱼环境，模拟了 API 报错：</p>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"highlighter-hljs hljs language-markdown\"><span class=\"hljs-section\"># 角色设定</span>\r\n你现在是一个智能 Agent。你的任务是帮助用户预订机票。\r\n请注意：你不能直接生成最终结果，必须模拟调用 API 的过程。\r\n你需要严格遵守 ReAct (Reasoning + Acting) 的格式进行回复。\r\n\r\n<span class=\"hljs-section\"># 虚拟工具</span>\r\n<span class=\"hljs-bullet\">1.</span> <span class=\"hljs-code\">`search_flight(origin, destination, date)`</span>: 查询航班。\r\n<span class=\"hljs-bullet\">2.</span> <span class=\"hljs-code\">`get_flight_details(flight_id)`</span>: 获取价格和详情。\r\n<span class=\"hljs-bullet\">3.</span> <span class=\"hljs-code\">`book_ticket(flight_id, passenger_name)`</span>: 下单。\r\n\r\n<span class=\"hljs-section\"># 要求</span>\r\n每次回复请只输出一步思考和一步行动，格式如下：\r\nThinking: [你的思考]\r\nAction: [调用的工具函数]\r\n\r\n然后等待我（用户）扮演“服务器”给你返回 Observation（观测结果）。\r\n\r\n<span class=\"hljs-section\"># 任务</span>\r\n用户指令：“帮我预订 2026.1.28 从北京去上海的早班机，价格在 1000 元以内。”\r\n\r\n请开始你的第一步。\r\n</code></pre>\r\n<p>然后我扮演服务器，给他返回了报错：<code>Observation: Error 502 Bad Gateway. Timeout.</code></p>\r\n<p><img alt=\"\" loading=\"lazy\" data-src=\"https://img2024.cnblogs.com/blog/759200/202601/759200-20260119010615792-970061076.png\" class=\"lazyload\"></p>\r\n<p><strong>模型输出：重新尝试查询航班信息...</strong>（稳！）</p>\r\n<h3 id=\"32-反直觉测试\">3.2 反直觉测试<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>反正下面这道题，我和我媳妇都算错了😅，看看模型能不能反应过来：</p>\r\n<pre class=\"highlighter-hljs\" highlighted=\"true\"><code class=\"highlighter-hljs hljs language-erlang\">我有 <span class=\"hljs-number\">100</span> 公斤土豆，经测定，这些土豆的含水量是 <span class=\"hljs-number\">99</span><span class=\"hljs-comment\">%。</span>\r\n我把土豆放在太阳下晒了一会儿，水分蒸发了一些。\r\n再次测定后发现，土豆现在的含水量变成了 <span class=\"hljs-number\">98</span><span class=\"hljs-comment\">%。</span>\r\n\r\n请问：现在这堆土豆总重量是多少公斤？\r\n</code></pre>\r\n<p><img alt=\"\" loading=\"lazy\" data-src=\"https://img2024.cnblogs.com/blog/759200/202601/759200-20260119010624539-322138854.png\" class=\"lazyload\"></p>\r\n<p><strong>模型输出：50 公斤</strong>（正确！）</p>\r\n<h3 id=\"33-速度测试\">3.3 速度测试<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>光凭体感说快不够严谨，我们直接看数据。在「随机复杂任务」评测中，同一个问题、不同模型的处理耗时对比如下：</p>\r\n<p><img alt=\"\" loading=\"lazy\" data-src=\"https://img2024.cnblogs.com/blog/759200/202601/759200-20260119010632668-874379243.png\" class=\"lazyload\"></p>\r\n<h2 id=\"四开源不如白嫖\">四、开源不如“白嫖”<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<p>开源虽好，但无奈显卡难倒英雄汉。</p>\r\n<p><img alt=\"\" loading=\"lazy\" data-src=\"https://img2024.cnblogs.com/blog/759200/202601/759200-20260119010640487-930553012.png\" class=\"lazyload\"></p>\r\n<blockquote>\r\n<p>Hugging Face 地址：<a href=\"https://huggingface.co/meituan-longcat/LongCat-Flash-Thinking-2601\" target=\"_blank\" rel=\"noopener nofollow\">huggingface.co/meituan-longcat/LongCat-Flash-Thinking-2601</a></p>\r\n</blockquote>\r\n<p>如果你手头没有 H100，或者不想折腾复杂的本地部署，也没关系——LongCat 官方已经帮你把服务起好了。</p>\r\n<p>最新的 LongCat-Flash-Thinking-2601 模型现已上线开放平台，并且给出了<strong>免费额度</strong>：</p>\r\n<ul>\r\n<li>兼容主流格式：支持 OpenAI 和 Anthropic API 格式，这意味着你现有的代码或工具，改个 URL 就能用。</li>\r\n<li>额度每日更新：每个账号每天自动到账 50 万 Tokens（每日凌晨自动刷新）。</li>\r\n</ul>\r\n<p><img alt=\"\" loading=\"lazy\" data-src=\"https://img2024.cnblogs.com/blog/759200/202601/759200-20260119010649092-2058872997.png\" class=\"lazyload\"></p>\r\n<p>目前可免费使用的模型：</p>\r\n<ul>\r\n<li>LongCat-Flash-Chat</li>\r\n<li>LongCat-Flash-Thinking</li>\r\n<li><strong>LongCat-Flash-Thinking-2601</strong></li>\r\n</ul>\r\n<p><strong>拿到了 API Key 能干啥？</strong> 格局打开，你可以直接把它塞进 Claude Code 里当编程助手，或者配置到 Cherry Studio 这种聚合神器里当主力模型。不用买卡，不用排队，填上 Key 就能让新一代“深度思考”模型为你打工！</p>\r\n<h2 id=\"五最后\">五、最后<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<p>这次 LongCat-Flash-Thinking-2601 的发布，给我的感觉：<strong>美团的大模型不再单纯卷速度，而是开始转向解决效率和工程可靠性</strong>。</p>\r\n<p>对于普通用户来说，它是更靠谱的 AI 助手。对于咱们开发者，这是一个抗造、免费开源的 Agent 基座。现在就去试试吧，看看这个学会了“深思熟虑”的龙猫，能不能搞定你手头最棘手的那个 Bug 或问题。</p>\r\n<p><img alt=\"\" loading=\"lazy\" data-src=\"https://img2024.cnblogs.com/blog/759200/202601/759200-20260119010659283-392583644.png\" class=\"lazyload\"></p>\r\n<ul>\r\n<li>GitHub：<a href=\"https://github.com/meituan-longcat/LongCat-Flash-Thinking-2601\" target=\"_blank\" rel=\"noopener nofollow\">https://github.com/meituan-longcat/LongCat-Flash-Thinking-2601</a></li>\r\n<li>Hugging Face：<a href=\"https://huggingface.co/meituan-longcat/LongCat-Flash-Thinking-2601\" target=\"_blank\" rel=\"noopener nofollow\">https://huggingface.co/meituan-longcat/LongCat-Flash-Thinking-2601</a></li>\r\n</ul>\r\n<blockquote>\r\n<p>立即体验：<a href=\"https://longcat.chat/\" target=\"_blank\" rel=\"noopener nofollow\">https://longcat.chat/</a></p>\r\n</blockquote>\r\n\r\n</div>', '2026-01-21 01:42:15.794534', 0, 0, 3, 2, 4);
INSERT INTO `ts_article` VALUES (3, 0, 'Sdcb Chats 1.8：又一次底层重构，彻底将模型提供商解耦', '这是又一篇补档文章，Chats已经发布了1.10，但2025年11月5日发布的1.8版本对我个人来说意义非凡，因为它彻底改变了项目对“模型提供商”的支持方式，从“写死在代码里”变成了“完全配置化”，为后续的可维护性和扩展性打下了坚实基础。', '<div id=\"cnblogs_post_body\" class=\"blogpost-body cnblogs-markdown\">\r\n<p>这是又一篇补档文章，Chats已经发布了1.10，但2025年11月5日发布的1.8版本对我个人来说意义非凡，因为它彻底改变了项目对“模型提供商”的支持方式，从“写死在代码里”变成了“完全配置化”，为后续的可维护性和扩展性打下了坚实基础。</p>\r\n<p>如果你还不了解 <strong>Sdcb Chats</strong>：简单说，这是一个支持多家主流模型服务商的 AI 网关。它不只能让你在一个统一界面里聚合管理所有模型，同时也兼容标准 API 协议，支持 Docker 一键部署。</p>\r\n<p>这篇文章聊聊 <strong>Chats 1.8 系列（1.8.0 + 1.8.1）</strong>。它不像“加一个新按钮”那样轻松，而是做了大量“地基工程”：把“模型提供商支持”从静态参考表迁移到了模型实例本身，并且补上了大量用户能直接感知到的体验升级。</p>\r\n<hr>\r\n<h2 id=\"18-的核心从静态参考表到模型实例级配置\">1.8 的核心：从“静态参考表”到“模型实例级配置”<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<p>到 chats 1.7.2 发布以来，已经支持有 18 个模型提供商，我当时为这 18 家模型提供商每一个模型都做了信息和数据跟踪，放到了 ModelReference 表，这个表有 297 条记录了，各大模型提供商卷大模型的速度越来越快，模型更新换代也越来越频繁，要可持续地维护这个表是非常困难的。</p>\r\n<p><img src=\"https://img2024.cnblogs.com/blog/233608/202601/233608-20260119170804080-2002986397.png\" alt=\"\" loading=\"lazy\" class=\"medium-zoom-image\"></p>\r\n<p>除此之外，代码中还有大量根据模型名称写死的逻辑，这导致越来越难以维护。我和项目的合作维护者讨论过许多次，有许多不同的意见，有的说可以继续沿用这种写死的方式，有的说应该做成配置化的方式，但我觉得可持续的维护能力才是我对 chats 项目最重要的承诺，所以我决定在 1.8 版本里彻底重构模型提供商的支持方式，做成完全配置化的方式，这样未来无论是新增模型提供商，还是调整已有模型的支持逻辑，都可以通过配置来完成，而不需要动代码。这个改动虽然在短期内增加了不少工作量，但我相信从长远来看，这会大大提升项目的可维护性和扩展性。</p>\r\n<p>更技术一点地说：<strong>1.8.0 把“模型能力配置”从 <code>ModelReference</code> 这种静态参考表，迁移到了 <code>Model</code>（模型实例）本身</strong>——模型不再依赖“引用一条固定模板”，而是每个模型实例都拥有完整、可编辑、可验证的能力配置。</p>\r\n<p><img src=\"https://img2024.cnblogs.com/blog/233608/202601/233608-20260119170804780-1304764941.png\" alt=\"\" loading=\"lazy\" class=\"medium-zoom-image\"></p>\r\n<h3 id=\"18-个模型能力字段落到-model终于能真正按实例定制\">18 个“模型能力字段”落到 Model：终于能真正“按实例定制”<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>这次迁移不是口头上的“配置化”，而是实打实的数据库变更：在 <code>src/scripts/db-migration/1.8/1.8.0.sql</code> 里，<code>Model</code> 表新增了一批能力字段（AllowSearch/AllowVision/AllowToolCall/温度范围/上下文窗口/最大输出 token/推理选项/图片尺寸/API 类型等），并且清理了多张静态参考表（<code>ModelReference</code>、<code>ModelProvider</code>、<code>Tokenizer</code>、<code>CurrencyRate</code>、<code>ReasoningResponseKind</code> ……）。</p>\r\n<p><img src=\"https://img2024.cnblogs.com/blog/233608/202601/233608-20260119170805164-1145274511.png\" alt=\"\" loading=\"lazy\" class=\"medium-zoom-image\"></p>\r\n<h3 id=\"第三种-api-类型imagegeneration图像模型终于名正言顺\">第三种 API 类型：ImageGeneration（图像模型终于“名正言顺”）<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>1.8.0 新增了 <code>ApiType.ImageGeneration</code>，把图像生成从“勉强兼容”的逻辑里拎了出来：ChatCompletion / Response / ImageGeneration 三分天下，<code>ChatFactory</code> 也按 <code>ApiType</code> 分派到不同实现。</p>\r\n<p><img src=\"https://img2024.cnblogs.com/blog/233608/202601/233608-20260119170805662-834816800.avif\" alt=\"\" loading=\"lazy\" class=\"medium-zoom-image\"></p>\r\n<h3 id=\"模型验证框架把填错配置的坑提前堵住\">模型验证框架：把“填错配置”的坑提前堵住<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>当能力配置变成“每个模型实例 18 个字段都可编辑”之后，靠用户自觉显然不现实。所以 1.8.0 加了 <code>UpdateModelRequest</code> 的验证框架（包含自定义验证特性和单测），把温度范围、token 上限、字段组合合法性都系统化了。</p>\r\n<p><img src=\"https://img2024.cnblogs.com/blog/233608/202601/233608-20260119170806121-2000732051.avif\" alt=\"\" loading=\"lazy\" class=\"medium-zoom-image\"></p>\r\n<h3 id=\"快速添加模型把配置很多字段的摩擦降下来\">快速添加模型：把“配置很多字段”的摩擦降下来<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>为了对冲“字段变多导致的配置成本”，1.8.0 在后台做了 Quick Add/批量添加模型的流程优化，并补上了默认配置（<code>src/FE/constants/modelDefaults.ts</code> 里能看到一些默认能力/范围策略）。</p>\r\n<p><img src=\"https://img2024.cnblogs.com/blog/233608/202601/233608-20260119170806489-55622397.avif\" alt=\"\" loading=\"lazy\" class=\"medium-zoom-image\"></p>\r\n<h3 id=\"图像链路重构从手写解析器到-imagesharp--全屏预览\">图像链路重构：从“手写解析器”到 ImageSharp + 全屏预览<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>1.8.0 还把图像处理这条链路整体重构了一遍：后端用 ImageSharp 替代了手写解析/嗅探逻辑（代码量直接少了一大截），前端新增了全屏 <code>ImagePreview</code> 组件，支持缩放动画、键盘导航和更顺滑的浏览体验。</p>\r\n<p><img src=\"https://img2024.cnblogs.com/blog/233608/202601/233608-20260119170806876-1841292448.avif\" alt=\"\" loading=\"lazy\" class=\"medium-zoom-image\"></p>\r\n<h3 id=\"骨架屏与按需加载把等待变成可预期\">骨架屏与按需加载：把“等待”变成“可预期”<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>1.8.0 在聊天消息加载、管理后台的模型管理等页面补了骨架屏，并做了按需加载/渐进式渲染：这不是性能“变快了多少 ms”的问题，而是用户感知上从“卡住了”变成“正在加载”。</p>\r\n<p><img src=\"https://img2024.cnblogs.com/blog/233608/202601/233608-20260119170807288-1746826065.avif\" alt=\"\" loading=\"lazy\" class=\"medium-zoom-image\"></p>\r\n<hr>\r\n<h2 id=\"181在架构变好之后把体验也抠到位\">1.8.1：在“架构变好”之后，把“体验也抠到位”<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<p>如果说 1.8.0 是地基，那么 1.8.1 更像是把常用路径都重新打磨了一遍：权限、推理内容展示、文件预览、聊天列表性能……这些都是你每天用 Chats 时能立刻感知到的变化。</p>\r\n<h3 id=\"全新的用户-模型权限管理终于能规模化授权了\">全新的“用户-模型权限”管理：终于能规模化授权了<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>1.8.1 新增了 <code>/admin/user-models</code>（按用户维度管理），同时在模型管理页也增加了“按模型维度管理用户”的入口。更关键的是它的交互设计：<strong>URL 作为状态唯一数据源</strong>，筛选/搜索/展开状态都能分享、刷新不丢。</p>\r\n<p><img src=\"https://img2024.cnblogs.com/blog/233608/202601/233608-20260119170807703-1850645716.png\" alt=\"\" loading=\"lazy\" class=\"medium-zoom-image\"><br>\r\n<img src=\"https://img2024.cnblogs.com/blog/233608/202601/233608-20260119170808024-210681632.avif\" alt=\"\" loading=\"lazy\" class=\"medium-zoom-image\"></p>\r\n<h3 id=\"推理内容生命周期追踪--自动折叠屏幕终于不被思考占满\">推理内容“生命周期追踪 + 自动折叠”：屏幕终于不被思考占满<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>推理模型越来越多，推理内容越来越长，UI 不能只“展示”——还得帮用户“管理注意力”。1.8.1 给 <code>ReasoningContent</code> 增加了 <code>finished</code> 语义：推理进行中自动展开、结束后自动折叠；工具调用区块也做了自动折叠与动画，且尊重用户手动操作优先级。</p>\r\n<p><img src=\"https://img2024.cnblogs.com/blog/233608/202601/233608-20260119170808347-1492521170.avif\" alt=\"\" loading=\"lazy\" class=\"medium-zoom-image\"></p>\r\n<h3 id=\"filepreview-组件重构附件展示不再各写一套\">FilePreview 组件重构：附件展示不再“各写一套”<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>1.8.1 引入了统一的 <code>FilePreview</code> 组件：图片/视频/音频直接预览，文档类显示图标+文件名+下载按钮；同时后端把文件处理从 Controller 下沉到了 Service 层，类型检查也更集中。</p>\r\n<p><img src=\"https://img2024.cnblogs.com/blog/233608/202601/233608-20260119170808792-1929118479.avif\" alt=\"\" loading=\"lazy\" class=\"medium-zoom-image\"></p>\r\n<h3 id=\"聊天列表缓存打开就快一点刷新也稳一点\">聊天列表缓存：打开就快一点，刷新也稳一点<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>聊天列表不是什么“酷功能”，但它决定了你每天打开 Chats 的第一感受。1.8.1 里新增了 <code>chatCache.ts</code>：以用户名绑定缓存键、24 小时过期、登出自动清理，并配合并行 API 加载，让首屏更“有感”。</p>\r\n<p><img src=\"https://img2024.cnblogs.com/blog/233608/202601/233608-20260119170809126-410299424.png\" alt=\"\" loading=\"lazy\" class=\"medium-zoom-image\"></p>\r\n<h3 id=\"提供商侧tokenpony-加入azure-openai-更名为-azure-ai-foundry\">提供商侧：TokenPony 加入，Azure OpenAI 更名为 Azure AI Foundry<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>1.8.1 新增了 TokenPony（ID=19），同时把 Azure OpenAI 的命名更新为 Azure AI Foundry（枚举值不变，属于代码层重命名），并补了一个小迁移脚本清理 Azure Host 里的 <code>api-version</code> 参数：<code>src/scripts/db-migration/1.8/1.8.1.sql</code>。</p>\r\n<p><img src=\"https://img2024.cnblogs.com/blog/233608/202601/233608-20260119170809460-172595794.png\" alt=\"\" loading=\"lazy\" class=\"medium-zoom-image\"></p>\r\n<h3 id=\"兼容性与稳定性openai-26-升级后推理内容解析修复\">兼容性与稳定性：OpenAI 2.6 升级后推理内容解析修复<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h3>\r\n<p>1.8.1 还处理了一个很“现实”的问题：OpenAI 客户端升级到 2.6.0 后，推理内容的解析/解码出现兼容性问题，导致部分推理段无法正确读取。这个点不显眼，但它直接影响你对推理模型的信任感，所以也被纳入 1.8.1 里修掉了。</p>\r\n<hr>\r\n<h2 id=\"升级提醒18-系列需要手动跑-sql-server-迁移脚本\">升级提醒：1.8 系列需要手动跑 SQL Server 迁移脚本<button class=\"cnblogs-toc-button\" title=\"显示目录导航\" aria-expanded=\"false\"></button></h2>\r\n<p>和 1.7 一样：Sdcb Chats 的数据库变更 <strong>不支持自动数据迁移</strong>。升级到 1.8 时请务必先备份数据库，并手动执行迁移脚本：</p>\r\n<ul>\r\n<li>1.8.0：<code>src/scripts/db-migration/1.8/1.8.0.sql</code></li>\r\n<li>1.8.1：<code>src/scripts/db-migration/1.8/1.8.1.sql</code>（清理 Azure AI Foundry 的 Host 参数）</li>\r\n</ul>\r\n<p>如果你用的是 SQLite/Postgres……老规矩：把脚本丢给 AI 先改，再边跑边修；或者能接受删库的话，让 Chats 启动时自动建新表结构也行。</p>\r\n<hr>\r\n<p>感谢大家的阅读！喜欢的朋友请给我的Github项目一个star：<a href=\"https://github.com/sdcb/chats\" target=\"_blank\" rel=\"noopener nofollow\">https://github.com/sdcb/chats</a><br>\r\n如果你好奇的话，这是完整的更新日志：<a href=\"https://github.com/sdcb/chats/blob/main/doc/zh-CN/release-notes/README.md\" target=\"_blank\" rel=\"noopener nofollow\">https://github.com/sdcb/chats/blob/main/doc/zh-CN/release-notes/README.md</a><br>\r\n有什么想法也欢迎在评论区留言交流，也欢迎加入我的 Chats微信群：<br>\r\n<img src=\"https://io.starworks.cc:88/cv-public/2026/chats-wxg-qr.png\" alt=\"\" loading=\"lazy\" class=\"medium-zoom-image\"></p>\r\n<p>（如果你更喜欢用QQ，可以用QQ群：<strong>498452653</strong>）我们一起探索更多AI技术硬核玩法。</p>\r\n\r\n</div>', '2026-01-21 01:45:11.007434', 16, 2, 0, 1, 2);
INSERT INTO `ts_article` VALUES (4, 0, '博客练习', '2026年/1/24项目学习', '2026年/1/24项目学习', '2026-01-24 03:56:17.976243', 0, 0, 0, 1, 2);
INSERT INTO `ts_article` VALUES (5, 0, '2026/1/24', '阿八八八八八', '阿八八八八八', '2026-01-24 03:59:23.955575', 0, 0, 0, 1, 1);

-- ----------------------------
-- Table structure for ts_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `ts_article_tag`;
CREATE TABLE `ts_article_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `article_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ts_article_tag_article_id_tag_id_4f627f73_uniq`(`article_id` ASC, `tag_id` ASC) USING BTREE,
  INDEX `ts_article_tag_tag_id_f8ec0cdf_fk_ts_tag_id`(`tag_id` ASC) USING BTREE,
  CONSTRAINT `ts_article_tag_article_id_ec8bd4e1_fk_ts_article_id` FOREIGN KEY (`article_id`) REFERENCES `ts_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ts_article_tag_tag_id_f8ec0cdf_fk_ts_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `ts_tag` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ts_article_tag
-- ----------------------------
INSERT INTO `ts_article_tag` VALUES (1, 1, 1);
INSERT INTO `ts_article_tag` VALUES (2, 1, 2);
INSERT INTO `ts_article_tag` VALUES (10, 1, 3);
INSERT INTO `ts_article_tag` VALUES (3, 2, 4);
INSERT INTO `ts_article_tag` VALUES (4, 2, 5);
INSERT INTO `ts_article_tag` VALUES (5, 3, 1);
INSERT INTO `ts_article_tag` VALUES (6, 3, 3);
INSERT INTO `ts_article_tag` VALUES (7, 4, 1);
INSERT INTO `ts_article_tag` VALUES (8, 4, 2);
INSERT INTO `ts_article_tag` VALUES (9, 5, 1);

-- ----------------------------
-- Table structure for ts_blog
-- ----------------------------
DROP TABLE IF EXISTS `ts_blog`;
CREATE TABLE `ts_blog`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_delete` tinyint(1) NOT NULL,
  `site_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_theme` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ts_blog
-- ----------------------------
INSERT INTO `ts_blog` VALUES (1, 0, 'yanyan的个人站点', 'yaya', '');
INSERT INTO `ts_blog` VALUES (2, 0, 'gangan的个人站点', 'gangan', '');

-- ----------------------------
-- Table structure for ts_category
-- ----------------------------
DROP TABLE IF EXISTS `ts_category`;
CREATE TABLE `ts_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ts_category_blog_id_ab84dfe1_fk_ts_blog_id`(`blog_id` ASC) USING BTREE,
  CONSTRAINT `ts_category_blog_id_ab84dfe1_fk_ts_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `ts_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ts_category
-- ----------------------------
INSERT INTO `ts_category` VALUES (1, 0, 'yanyan的分类1', 1);
INSERT INTO `ts_category` VALUES (2, 0, 'yanyan的分类2', 1);
INSERT INTO `ts_category` VALUES (3, 0, 'yanyan的分类3', 1);
INSERT INTO `ts_category` VALUES (4, 0, 'gangan的分类1', 2);
INSERT INTO `ts_category` VALUES (5, 0, 'gangan的分类2', 2);
INSERT INTO `ts_category` VALUES (6, 0, 'gangan的分类3', 2);
INSERT INTO `ts_category` VALUES (7, 0, '哈哈', 1);
INSERT INTO `ts_category` VALUES (8, 0, '哈哈', 1);
INSERT INTO `ts_category` VALUES (9, 1, '奥吧奥吧', 1);

-- ----------------------------
-- Table structure for ts_comment
-- ----------------------------
DROP TABLE IF EXISTS `ts_comment`;
CREATE TABLE `ts_comment`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_delete` tinyint(1) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_time` datetime(6) NOT NULL,
  `article_id` bigint NOT NULL,
  `parent_id` bigint NULL DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ts_comment_article_id_45a69552_fk_ts_article_id`(`article_id` ASC) USING BTREE,
  INDEX `ts_comment_parent_id_38285c3c_fk_ts_comment_id`(`parent_id` ASC) USING BTREE,
  INDEX `ts_comment_user_id_728e4a9e_fk_ts_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `ts_comment_article_id_45a69552_fk_ts_article_id` FOREIGN KEY (`article_id`) REFERENCES `ts_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ts_comment_parent_id_38285c3c_fk_ts_comment_id` FOREIGN KEY (`parent_id`) REFERENCES `ts_comment` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ts_comment_user_id_728e4a9e_fk_ts_user_id` FOREIGN KEY (`user_id`) REFERENCES `ts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ts_comment
-- ----------------------------
INSERT INTO `ts_comment` VALUES (1, 0, '你好', '2026-01-23 04:01:02.686789', 2, NULL, 1);
INSERT INTO `ts_comment` VALUES (2, 0, '@nxcg\n铸币吧', '2026-01-23 04:19:42.031910', 2, NULL, 1);
INSERT INTO `ts_comment` VALUES (3, 0, '@nxcg\n？', '2026-01-23 04:21:23.611976', 2, 2, 1);
INSERT INTO `ts_comment` VALUES (4, 0, '？\n', '2026-01-24 02:35:51.768214', 1, NULL, 1);
INSERT INTO `ts_comment` VALUES (5, 0, '@nxcg123\n3\n', '2026-01-25 16:02:25.422852', 1, 4, 1);

-- ----------------------------
-- Table structure for ts_tag
-- ----------------------------
DROP TABLE IF EXISTS `ts_tag`;
CREATE TABLE `ts_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_delete` tinyint(1) NOT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `blog_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ts_tag_blog_id_499f7e57_fk_ts_blog_id`(`blog_id` ASC) USING BTREE,
  CONSTRAINT `ts_tag_blog_id_499f7e57_fk_ts_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `ts_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ts_tag
-- ----------------------------
INSERT INTO `ts_tag` VALUES (1, 0, 'yanyan的标签1', 1);
INSERT INTO `ts_tag` VALUES (2, 0, 'yanyan的标签2', 1);
INSERT INTO `ts_tag` VALUES (3, 0, 'yanyan的标签3', 1);
INSERT INTO `ts_tag` VALUES (4, 0, 'gangan的标签1', 2);
INSERT INTO `ts_tag` VALUES (5, 0, 'gangan的标签2', 2);
INSERT INTO `ts_tag` VALUES (6, 0, 'gangan的标签3', 2);

-- ----------------------------
-- Table structure for ts_upanddown
-- ----------------------------
DROP TABLE IF EXISTS `ts_upanddown`;
CREATE TABLE `ts_upanddown`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `is_up` tinyint(1) NOT NULL,
  `article_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ts_upanddown_article_id_eaf5e12f_fk_ts_article_id`(`article_id` ASC) USING BTREE,
  INDEX `ts_upanddown_user_id_b5109b82_fk_ts_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `ts_upanddown_article_id_eaf5e12f_fk_ts_article_id` FOREIGN KEY (`article_id`) REFERENCES `ts_article` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ts_upanddown_user_id_b5109b82_fk_ts_user_id` FOREIGN KEY (`user_id`) REFERENCES `ts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ts_upanddown
-- ----------------------------
INSERT INTO `ts_upanddown` VALUES (1, 1, 3, 2);
INSERT INTO `ts_upanddown` VALUES (2, 1, 3, 2);
INSERT INTO `ts_upanddown` VALUES (3, 0, 1, 2);

-- ----------------------------
-- Table structure for ts_user
-- ----------------------------
DROP TABLE IF EXISTS `ts_user`;
CREATE TABLE `ts_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_delete` tinyint(1) NOT NULL,
  `phone` bigint NULL DEFAULT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `creat_time` datetime(6) NOT NULL,
  `blog_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `blog_id`(`blog_id` ASC) USING BTREE,
  CONSTRAINT `ts_user_blog_id_bf2eb112_fk_ts_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `ts_blog` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ts_user
-- ----------------------------
INSERT INTO `ts_user` VALUES (1, 'pbkdf2_sha256$600000$49GIzPlzrIxQ8tViKwCVmn$xm60wf1meyuEU0z/XrD9lJBCF6YQVR/eMPynRgxjZ24=', '2026-01-23 03:05:42.949861', 0, 'nxcg123', '', '', '896545985@qq.com', 0, 1, '2026-01-20 03:57:52.000000', 0, 13693988595, 'avatar/865885b0881611ebb6edd017c2d2eca2.png', '2026-01-20 03:57:52.943210', 1);
INSERT INTO `ts_user` VALUES (2, 'pbkdf2_sha256$600000$QSKrIdKcd5R8hJfyACgkLG$5Io8bmGWvmI+y7MirV2yQtNJJei/VHKOGjXjHCVV2v4=', '2026-01-23 02:27:23.543584', 1, 'yang', '', '', '', 1, 1, '2026-01-21 01:26:34.000000', 0, NULL, 'avatar', '2026-01-21 01:26:34.836089', 2);

-- ----------------------------
-- Table structure for ts_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_groups`;
CREATE TABLE `ts_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ts_user_groups_user_id_group_id_fc0054b6_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `ts_user_groups_group_id_7954c11f_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `ts_user_groups_group_id_7954c11f_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ts_user_groups_user_id_bd522479_fk_ts_user_id` FOREIGN KEY (`user_id`) REFERENCES `ts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ts_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for ts_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `ts_user_user_permissions`;
CREATE TABLE `ts_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ts_user_user_permissions_user_id_permission_id_ee45cba4_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `ts_user_user_permiss_permission_id_69639193_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `ts_user_user_permiss_permission_id_69639193_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ts_user_user_permissions_user_id_46f39627_fk_ts_user_id` FOREIGN KEY (`user_id`) REFERENCES `ts_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ts_user_user_permissions
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
