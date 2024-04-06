drop table if exists admin_user;
create table admin_user(
admin_id bigint not null auto_increment comment '主键',
name varchar(64) not null comment '姓名',
username varchar(64) not null comment '账号',
password varchar(128) not null comment '密码',
phone varchar(64) comment '手机号码',
salt varchar(64) comment '盐',
avatar varchar(128) comment '头像',
email varchar(64) comment '邮箱',
introduction varchar(128) comment '描述',
status tinyint(4) default 0 comment '状态',
created_at timestamp(3) default current_timestamp(3) comment '创建时间',
updated_at timestamp(3) default current_timestamp(3) on update current_timestamp(3) comment '更新时间',
primary key(admin_id)
) comment '系统用户表';

drop table if exists admin_menu;
create table admin_menu(
menu_id bigint not null auto_increment comment '主键',
parent_id bigint default 0 comment '父级ID',
name varchar(64) comment '名称',
path varchar(64) comment '路径',
icon varchar(64) comment '图标',
status tinyint(4) default 0 comment '状态',
show_order int(11) default 0 comment '排序',
description varchar(128) comment '描述',
created_at timestamp(3) default current_timestamp(3) comment '创建时间',
updated_at timestamp(3) default current_timestamp(3) on update current_timestamp(3) comment '更新时间',
primary key(menu_id)
) comment '系统菜单表';

drop table if exists admin_role;
create table admin_role(
role_id bigint not null auto_increment comment '主键',
name varchar(64) comment '名称',
created_at timestamp(3) default current_timestamp(3) comment '创建时间',
updated_at timestamp(3) default current_timestamp(3) on update current_timestamp(3) comment '更新时间',
primary key(role_id)
) comment '系统角色表';

drop table if exists admin_role_menu;
create table admin_role_menu(
role_id bigint comment '角色ID',
menu_id bigint comment '菜单ID',
created_at timestamp(3) default current_timestamp(3) comment '创建时间',
key(role_id, menu_id)
) comment '系统角色菜单表';

drop table if exists admin_user_role;
create table admin_user_role(
admin_id bigint comment '用户ID',
role_id bigint comment '角色ID',
created_at timestamp(3) default current_timestamp(3) comment '创建时间',
key(admin_id, role_id)
) comment '系统用户角色表';

drop table if exists admin_login_record;
create table admin_login_record(
record_id bigint not null auto_increment comment '主键',
admin_id bigint comment '系统用户ID',
is_mobile tinyint(4) default 0 comment '是否移动端',
is_bot tinyint(4) default 0 comment '是否机器人',
mozilla varchar(64) comment 'mozilla',
platform varchar(64) comment '平台',
os varchar(64) comment '系统',
engine_name varchar(64) comment '引擎名称',
engine_version varchar(64) comment '引擎版本',
broswer_name varchar(64) comment '浏览器名称',
broswer_version varchar(64) comment '浏览器版本',
client_ip varchar(64) comment '客户端IP',
created_at timestamp(3) default current_timestamp(3) comment '创建时间',
primary key(record_id)
) comment '系统登录记录表';

drop table if exists admin_log;
create table admin_log(
log_id bigint not null auto_increment comment '主键',
admin_id bigint comment '用户ID',
uri varchar(128) comment '请求',
params text comment '参数',
created_at timestamp(3) default current_timestamp(3) comment '创建时间',
primary key(log_id)
) comment '系统操作记录表';

drop table if exists file_item;
create table file_item(
file_id bigint not null auto_increment comment '主键',
bucket_name varchar(64) comment '桶名称',
object_name varchar(64) comment '文件名称',
size int(11) default 0 comment '大小',
path varchar(128) comment '路径',
unqiue_id varchar(128) comment '唯一ID',
suffix varchar(64) comment '后缀',
file_type varchar(64) comment '文件类型',
created_at timestamp(3) default current_timestamp(3) comment '创建时间',
updated_at timestamp(3) default current_timestamp(3) on update current_timestamp(3) comment '更新时间',
primary key(file_id)
) comment '文件表';

drop table if exists sys_conf;
create table sys_conf(
conf_id bigint not null auto_increment comment '主键',
conf_key varchar(64) comment '配置KEY',
conf_name varchar(64) comment '配置名称',
conf_kind tinyint(4) default 0 comment '配置类型 0 自定义 1 文本 2 布尔 3 JSON',
conf_type tinyint(4) default 0 comment '使用环境 0b1 公共 0b10 服务端 0b100 客户端',
conf_value varchar(1024) comment '配置项',
description varchar(128) comment '描述',
status tinyint(4) default 1 comment '状态 0 无效 1 有效',
created_at timestamp(3) default current_timestamp(3) comment '创建时间',
updated_at timestamp(3) default current_timestamp(3) on update current_timestamp(3) comment '更新时间',
primary key(conf_id)
) comment '系统配置表';

INSERT INTO admin_user (admin_id, name, username, password, phone, salt, avatar, email, introduction, status, created_at, updated_at) 
VALUES (1, 'administrator', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, NULL, '', NULL, 1, now(3), now(3));

INSERT INTO admin_menu (menu_id, parent_id, name, path, icon, status, show_order, description, created_at, updated_at) VALUES (1, 0, '系统管理', NULL, NULL, 1, 0, '系统管理', now(3), now(3));
INSERT INTO admin_menu (menu_id, parent_id, name, path, icon, status, show_order, description, created_at, updated_at) VALUES (2, 1, '菜单管理', 'AdminMenuView', 'fa fa-circle-o text-yellow', 1, 1, '菜单管理', now(3), now(3));
INSERT INTO admin_menu (menu_id, parent_id, name, path, icon, status, show_order, description, created_at, updated_at) VALUES (3, 1, '角色管理', 'AdminRoleView', 'fa fa-circle-o text-yellow', 1, 2, '角色管理', now(3), now(3));
INSERT INTO admin_menu (menu_id, parent_id, name, path, icon, status, show_order, description, created_at, updated_at) VALUES (4, 1, '用户管理', 'AdminUserView', 'fa fa-circle-o text-red', 1, 3, '用户管理', now(3), now(3));

INSERT INTO admin_role (role_id, name, created_at, updated_at) VALUES (1, '超级管理员', now(3), now(3));

INSERT INTO admin_role_menu (role_id, menu_id, created_at) VALUES (1, 1, now(3));
INSERT INTO admin_role_menu (role_id, menu_id, created_at) VALUES (1, 2, now(3));
INSERT INTO admin_role_menu (role_id, menu_id, created_at) VALUES (1, 3, now(3));
INSERT INTO admin_role_menu (role_id, menu_id, created_at) VALUES (1, 4, now(3));

INSERT INTO admin_user_role (admin_id, role_id, created_at) VALUES (1, 1, now(3));

INSERT INTO sys_conf (conf_id, conf_key, conf_name, conf_kind, conf_type, conf_value, description, status, created_at, updated_at) VALUES (1, 'file_url', '资源域名', 1, 1, 'http://127.0.0.1:9000', '资源域名', 1, now(3), now(3));

