SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_auth_element_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_element_operation`;
CREATE TABLE `t_auth_element_operation`
(
    `id`            bigint(0)                                                     NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `element_name`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '页面元素名称',
    `element_code`  varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '页面元素唯一编码',
    `operation_type` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT '操作类型：0可点击  1可见',
    `create_time`   datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    `update_time`   datetime(0)                                                   NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限控制--页面元素操作表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_auth_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_menu`;
CREATE TABLE `t_auth_menu`
(
    `id`         bigint(0)                                                     NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '菜单项目名称',
    `code`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '唯一编码',
    `create_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 4
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限控制-页面访问表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_auth_role
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_role`;
CREATE TABLE `t_auth_role`
(
    `id`         bigint(0)                                                     NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
    `code`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '角色唯一编码',
    `create_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限控制--角色表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_auth_role_element_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_role_element_operation`;
CREATE TABLE `t_auth_role_element_operation`
(
    `id`                 bigint(0)   NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `role_id`            bigint(0)   NULL DEFAULT NULL COMMENT '角色id',
    `element_operation_id` bigint(0)   NULL DEFAULT NULL COMMENT '元素操作id',
    `create_time`        datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 2
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限控制--角色与元素操作关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_auth_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_auth_role_menu`;
CREATE TABLE `t_auth_role_menu`
(
    `id`         bigint(0)   NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `role_id`    bigint(0)   NULL DEFAULT NULL COMMENT '角色id',
    `menu_id`    bigint(0)   NULL DEFAULT NULL COMMENT '页面菜单id',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限控制--角色页面菜单关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_collection_group
-- ----------------------------
DROP TABLE IF EXISTS `t_collection_group`;
CREATE TABLE `t_collection_group`
(
    `id`         bigint(0)                                                    NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `user_id`    bigint(0)                                                    NULL DEFAULT NULL COMMENT '用户id',
    `name`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关注分组名称',
    `type`       varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '关注分组类型：0默认分组  1用户自定义分组',
    `create_time` datetime(0)                                                  NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0)                                                  NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 27
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '收藏分组表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_content
-- ----------------------------
DROP TABLE IF EXISTS `t_content`;
CREATE TABLE `t_content`
(
    `id`            bigint(0)   NOT NULL AUTO_INCREMENT,
    `content_detail` json        NULL COMMENT '内容详情',
    `create_time`   datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 71
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '动态内容表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_danmu
-- ----------------------------
DROP TABLE IF EXISTS `t_danmu`;
CREATE TABLE `t_danmu`
(
    `id`         bigint(0)                                                    NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `user_id`    bigint(0)                                                    NULL DEFAULT NULL COMMENT '用户id',
    `video_id`   bigint(0)                                                    NULL DEFAULT NULL COMMENT '视频Id',
    `content`    text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci        NULL COMMENT '弹幕内容',
    `danmu_time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '弹幕出现时间',
    `create_time` datetime(0)                                                  NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 369
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_general_ci COMMENT = '弹幕记录表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_file
-- ----------------------------
DROP TABLE IF EXISTS `t_file`;
CREATE TABLE `t_file`
(
    `id`         bigint(0)                                                     NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `url`        varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件存储路径',
    `type`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '文件类型',
    `md5`        varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件md5唯一标识串',
    `create_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 66
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '文件表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_following_group
-- ----------------------------
DROP TABLE IF EXISTS `t_following_group`;
CREATE TABLE `t_following_group`
(
    `id`         bigint(0)                                                    NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `user_id`    bigint(0)                                                    NULL DEFAULT NULL COMMENT '用户id',
    `name`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '关注分组名称',
    `type`       varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '关注分组类型：0特别关注  1悄悄关注 2默认分组  3用户自定义分组',
    `create_time` datetime(0)                                                  NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0)                                                  NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 27
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户关注分组表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `t_refresh_token`;
CREATE TABLE `t_refresh_token`
(
    `id`           bigint(0)                                                     NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `user_id`      bigint(0)                                                     NULL DEFAULT NULL COMMENT '用户id',
    `refresh_token` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '刷新令牌',
    `create_time`   datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '刷新令牌记录表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`
(
    `id`         bigint(0)                                                     NOT NULL AUTO_INCREMENT,
    `name`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
    `create_time` datetime(0)                                                   NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 120
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`
(
    `id`         bigint(0)                                                     NOT NULL AUTO_INCREMENT COMMENT '主键',
    `phone`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号',
    `email`      varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
    `password`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
    `salt`       varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '盐值',
    `create_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 44
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_coin
-- ----------------------------
DROP TABLE IF EXISTS `t_user_coin`;
CREATE TABLE `t_user_coin`
(
    `id`         bigint(0)   NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `user_id`    bigint(0)   NULL DEFAULT NULL COMMENT '用户id',
    `amount`     bigint(0)   NULL DEFAULT NULL COMMENT '硬币总数',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户硬币表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_following
-- ----------------------------
DROP TABLE IF EXISTS `t_user_following`;
CREATE TABLE `t_user_following`
(
    `id`          bigint(0)   NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `user_id`     bigint(0)   NULL DEFAULT NULL COMMENT '用户id',
    `following_id` int(0)      NULL DEFAULT NULL COMMENT '关注用户id',
    `group_id`     int(0)      NULL DEFAULT NULL COMMENT '关注分组id',
    `create_time`  datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 66
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户关注表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_info
-- ----------------------------
DROP TABLE IF EXISTS `t_user_info`;
CREATE TABLE `t_user_info`
(
    `id`         bigint(0)                                                     NOT NULL AUTO_INCREMENT COMMENT '主键',
    `user_id`    bigint(0)                                                     NULL DEFAULT NULL COMMENT '用户id',
    `nick`       varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
    `avatar`     varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
    `sign`       text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         NULL COMMENT '签名',
    `gender`     varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NULL DEFAULT NULL COMMENT '性别：0男 1女 2未知',
    `birth`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NULL DEFAULT NULL COMMENT '生日',
    `create_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 37
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户基本信息表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_moments
-- ----------------------------
DROP TABLE IF EXISTS `t_user_moments`;
CREATE TABLE `t_user_moments`
(
    `id`         bigint(0)                                                   NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `user_id`    bigint(0)                                                   NULL DEFAULT NULL COMMENT '用户id',
    `type`       varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '动态类型：0视频 1直播 2专栏动态',
    `content_id`  bigint(0)                                                   NULL DEFAULT NULL COMMENT '内容详情id',
    `create_time` datetime(0)                                                 NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0)                                                 NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 42
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户动态表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`
(
    `id`         bigint(0)   NOT NULL AUTO_INCREMENT,
    `user_id`    bigint(0)   NULL DEFAULT NULL COMMENT '用户id',
    `role_id`    bigint(0)   NULL DEFAULT NULL COMMENT '角色id',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 25
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户角色关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video
-- ----------------------------
DROP TABLE IF EXISTS `t_video`;
CREATE TABLE `t_video`
(
    `id`          bigint(0)                                                     NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `user_id`     bigint(0)                                                     NOT NULL COMMENT '用户id',
    `url`         varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频链接',
    `thumbnail`   longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL COMMENT '封面链接',
    `title`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频标题',
    `type`        varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci   NOT NULL COMMENT '视频类型：0原创 1转载',
    `duration`    varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '视频时长',
    `area`        varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '所在分区：0鬼畜 1音乐 2电影',
    `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci         NULL COMMENT '视频简介',
    `create_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 111
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频投稿记录表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_binary_picture
-- ----------------------------
DROP TABLE IF EXISTS `t_video_binary_picture`;
CREATE TABLE `t_video_binary_picture`
(
    `id`             bigint(0)                                                     NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `video_id`       bigint(0)                                                     NULL DEFAULT NULL COMMENT '视频id',
    `frame_no`       int(0)                                                        NULL DEFAULT NULL COMMENT '帧数',
    `url`            varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '图片链接',
    `video_timestamp` bigint(0)                                                     NULL DEFAULT NULL COMMENT '视频时间戳',
    `create_time`    datetime(0)                                                   NULL DEFAULT NULL,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 89
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_general_ci COMMENT = '视频二值图记录表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_coin
-- ----------------------------
DROP TABLE IF EXISTS `t_video_coin`;
CREATE TABLE `t_video_coin`
(
    `id`         bigint(0)   NOT NULL AUTO_INCREMENT COMMENT '视频投稿id',
    `user_id`    bigint(0)   NULL DEFAULT NULL COMMENT '用户id',
    `video_id`   bigint(0)   NULL DEFAULT NULL COMMENT '视频投稿id',
    `amount`     int(0)      NULL DEFAULT NULL COMMENT '投币数',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频硬币表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_collection
-- ----------------------------
DROP TABLE IF EXISTS `t_video_collection`;
CREATE TABLE `t_video_collection`
(
    `id`         bigint(0)   NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `video_id`   bigint(0)   NULL DEFAULT NULL COMMENT '视频投稿id',
    `user_id`    bigint(0)   NULL DEFAULT NULL COMMENT '用户id',
    `group_id`   bigint(0)   NULL DEFAULT NULL COMMENT '收藏分组id',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 30
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频收藏记录表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_video_comment`;
CREATE TABLE `t_video_comment`
(
    `id`          bigint(0)                                             NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `video_id`    bigint(0)                                             NOT NULL COMMENT '视频id',
    `user_id`     bigint(0)                                             NOT NULL COMMENT '用户id',
    `comment`     text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '评论',
    `reply_user_id` bigint(0)                                             NULL DEFAULT NULL COMMENT '回复用户id',
    `root_id`     bigint(0)                                             NULL DEFAULT NULL COMMENT '根节点评论id',
    `create_time` datetime(0)                                           NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime(0)                                           NULL DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 112
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频评论表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_like
-- ----------------------------
DROP TABLE IF EXISTS `t_video_like`;
CREATE TABLE `t_video_like`
(
    `id`         bigint(0)   NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `user_id`    bigint(0)   NOT NULL COMMENT '用户id',
    `video_id`   bigint(0)   NOT NULL COMMENT '视频投稿id',
    `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 35
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频点赞记录表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_operation
-- ----------------------------
DROP TABLE IF EXISTS `t_video_operation`;
CREATE TABLE `t_video_operation`
(
    `id`            bigint(0)                                                   NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `user_id`       bigint(0)                                                   NULL DEFAULT NULL COMMENT '用户id',
    `video_id`      bigint(0)                                                   NULL DEFAULT NULL COMMENT '视频id',
    `operation_type` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作类型：0点赞、1收藏、2投币',
    `create_time`   datetime(0)                                                 NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 72
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_general_ci COMMENT = '视频操作表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_video_tag`;
CREATE TABLE `t_video_tag`
(
    `id`         bigint(0)   NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `video_id`   bigint(0)   NOT NULL COMMENT '视频id',
    `tag_id`     bigint(0)   NOT NULL COMMENT '标签id',
    `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 254
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci COMMENT = '视频标签关联表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_video_view
-- ----------------------------
DROP TABLE IF EXISTS `t_video_view`;
CREATE TABLE `t_video_view`
(
    `id`         bigint(0)                                                     NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `video_id`   bigint(0)                                                     NOT NULL COMMENT '视频id',
    `user_id`    bigint(0)                                                     NULL DEFAULT NULL COMMENT '用户id',
    `client_id`  varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '客户端id',
    `ip`         varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci  NULL DEFAULT NULL COMMENT 'ip',
    `create_time` datetime(0)                                                   NULL DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 17
  CHARACTER SET = utf8mb3
  COLLATE = utf8mb3_general_ci COMMENT = '视频观看记录表'
  ROW_FORMAT = Dynamic;
