/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/11/22 12:59:37                          */
/*==============================================================*/


drop table if exists menu;

drop table if exists menu_parent;

drop table if exists `order`;

drop table if exists order_detail;

drop table if exists position;

drop table if exists sub_menu;

drop table if exists table_list;

drop table if exists user;

/*==============================================================*/
/* Table: menu                                                  */
/*==============================================================*/
create table menu
(
   menu_id              int not null,
   menu_parent_id       int,
   en_name_menu         varchar(64),
   cn_name_menu         varchar(64),
   desc_menu            varchar(128),
   primary key (menu_id)
);

/*==============================================================*/
/* Table: menu_parent                                           */
/*==============================================================*/
create table menu_parent
(
   menu_parent_id       int not null,
   en_name_menu_parent  varchar(64),
   cn_name_menu_parent varchar(64),
   desc_menu_parent     varchar(128),
   primary key (menu_parent_id)
);

/*==============================================================*/
/* Table: "order"                                               */
/*==============================================================*/
create table `order`
(
   order_id             int not null,
   table__id            int,
   create_time          datetime,
   end_time             datetime,
   discount             smallint,
   total_price          float(6,2),
   desc_order           varchar(64),
   order_status         bool,
   primary key (order_id)
);

/*==============================================================*/
/* Table: order_detail                                          */
/*==============================================================*/
create table order_detail
(
   order_detail_id      int not null,
   sub_menu_id          int,
   order_id             int,
   end_time_detail      datetime,
   order_detail_price   float(6,2),
   order_detail_status  bool,
   primary key (order_detail_id)
);

/*==============================================================*/
/* Table: position                                              */
/*==============================================================*/
create table `position`
(
   pos_id               int not null,
   en_name_pos          varchar(64),
   cn_name_pos          varchar(64),
   desc＿position        char(128),
   primary key (pos_id)
);

/*==============================================================*/
/* Table: sub_menu                                              */
/*==============================================================*/
create table sub_menu
(
   sub_menu_id          int not null,
   menu_id              int,
   en_name_sub_menu     varchar(64),
   cn_name_sub_menu     varchar(64),
   desc_sub_menu        varchar(128),
   price_sub_menu       float(6,2),
   sub_menu_pic         varchar(256),
   sub_menu_status      bool,
   primary key (sub_menu_id)
);

/*==============================================================*/
/* Table: table_list                                            */
/*==============================================================*/
create table table_list
(
   table__id            int not null,
   table_code           char(4) not null,
   table_desc           varchar(16),
   table_status         bool,
   primary key (table__id)
);

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table `user`
(
   user_id              int not null,
   pos_id               int,
   username             varchar(16),
   firstname            varchar(16),
   lastname             varchar(16),
   password             varchar(128),
   age                  smallint,
   sex                  bool,
   status_user          bool,
   primary key (user_id)
);

alter table menu add constraint FK_Relationship_7 foreign key (menu_parent_id)
      references menu_parent (menu_parent_id) on delete restrict on update restrict;

alter table `order` add constraint FK_Relationship_4 foreign key (table__id)
      references table_list (table__id) on delete restrict on update restrict;

alter table order_detail add constraint FK_Relationship_3 foreign key (order_id)
      references `order` (order_id) on delete restrict on update restrict;

alter table order_detail add constraint FK_Relationship_5 foreign key (sub_menu_id)
      references sub_menu (sub_menu_id) on delete restrict on update restrict;

alter table sub_menu add constraint FK_Relationship_6 foreign key (menu_id)
      references menu (menu_id) on delete restrict on update restrict;

alter table `user` add constraint FK_Relationship_1 foreign key (pos_id)
      references position (pos_id) on delete restrict on update restrict;

