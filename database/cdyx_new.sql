/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     2016/11/21 10:52:27                          */
/*==============================================================*/


/*drop index Relationship_7_FK;

drop index menu_PK;

drop table menu;

drop index menu_parent_PK;

drop table menu_parent;

drop index Relationship_4_FK;

drop index order_PK;

drop table "order";

drop index Relationship_5_FK;

drop index Relationship_3_FK;

drop index order_detail_PK;

drop table order_detail;

drop index position_PK;

drop table "position";

drop index Relationship_6_FK;

drop index sub_menu_PK;

drop table sub_menu;

drop index table_list_PK;

drop table table_list;

drop index Relationship_1_FK;

drop index user_PK;

drop table "user";*/

/*==============================================================*/
/* Table: menu                                                  */
/*==============================================================*/
create table menu (
   menu_id              INT4                 not null,
   menu_parent_id       INT4                 null,
   en_name_menu         VARCHAR(64)          null,
   cn_name_menu         VARCHAR(64)          null,
   desc_menu            VARCHAR(128)         null,
   constraint PK_MENU primary key (menu_id)
);

/*==============================================================*/
/* Index: menu_PK                                               */
/*==============================================================*/
create unique index menu_PK on menu (
menu_id
);

/*==============================================================*/
/* Index: Relationship_7_FK                                     */
/*==============================================================*/
create  index Relationship_7_FK on menu (
menu_parent_id
);

/*==============================================================*/
/* Table: menu_parent                                           */
/*==============================================================*/
create table menu_parent (
   menu_parent_id       INT4                 not null,
   en_name_menu_parent  VARCHAR(64)          null,
   "cn_name_menu-parent" VARCHAR(64)          null,
   desc_menu_parent     VARCHAR(128)         null,
   constraint PK_MENU_PARENT primary key (menu_parent_id)
);

/*==============================================================*/
/* Index: menu_parent_PK                                        */
/*==============================================================*/
create unique index menu_parent_PK on menu_parent (
menu_parent_id
);

/*==============================================================*/
/* Table: "order"                                               */
/*==============================================================*/
create table "order" (
   order_id             INT4                 not null,
   table__id            INT4                 null,
   create_time          DATE                 null,
   end_time             DATE                 null,
   discount             INT2                 null,
   total_price          MONEY                null,
   desc_order           VARCHAR(64)          null,
   order_status         BOOL                 null,
   constraint PK_ORDER primary key (order_id)
);

/*==============================================================*/
/* Index: order_PK                                              */
/*==============================================================*/
create unique index order_PK on "order" (
order_id
);

/*==============================================================*/
/* Index: Relationship_4_FK                                     */
/*==============================================================*/
create  index Relationship_4_FK on "order" (
table__id
);

/*==============================================================*/
/* Table: order_detail                                          */
/*==============================================================*/
create table order_detail (
   order_detail_id      INT4                 not null,
   sub_menu_id          INT4                 null,
   order_id             INT4                 null,
   end_time_detail      DATE                 null,
   order_detail_price   MONEY                null,
   order_detail_status  BOOL                 null,
   constraint PK_ORDER_DETAIL primary key (order_detail_id)
);

/*==============================================================*/
/* Index: order_detail_PK                                       */
/*==============================================================*/
create unique index order_detail_PK on order_detail (
order_detail_id
);

/*==============================================================*/
/* Index: Relationship_3_FK                                     */
/*==============================================================*/
create  index Relationship_3_FK on order_detail (
order_id
);

/*==============================================================*/
/* Index: Relationship_5_FK                                     */
/*==============================================================*/
create  index Relationship_5_FK on order_detail (
sub_menu_id
);

/*==============================================================*/
/* Table: "position"                                            */
/*==============================================================*/
create table "position" (
   pos_id               INT4                 not null,
   en_name_pos          VARCHAR(64)          null,
   cn_name_pos          VARCHAR(64)          null,
   desc＿position        CHAR(128)            null,
   constraint PK_POSITION primary key (pos_id)
);

/*==============================================================*/
/* Index: position_PK                                           */
/*==============================================================*/
create unique index position_PK on "position" (
pos_id
);

/*==============================================================*/
/* Table: sub_menu                                              */
/*==============================================================*/
create table sub_menu (
   sub_menu_id          INT4                 not null,
   menu_id              INT4                 null,
   en_name_sub_menu     VARCHAR(64)          null,
   cn_name_sub_menu     VARCHAR(64)          null,
   desc_sub_menu        VARCHAR(128)         null,
   price_sub_menu       MONEY                null,
   sub_menu_pic         VARCHAR(256)         null,
   sub_menu_status      BOOL                 null,
   constraint PK_SUB_MENU primary key (sub_menu_id)
);

/*==============================================================*/
/* Index: sub_menu_PK                                           */
/*==============================================================*/
create unique index sub_menu_PK on sub_menu (
sub_menu_id
);

/*==============================================================*/
/* Index: Relationship_6_FK                                     */
/*==============================================================*/
create  index Relationship_6_FK on sub_menu (
menu_id
);

/*==============================================================*/
/* Table: table_list                                            */
/*==============================================================*/
create table table_list (
   table__id            INT4                 not null,
   table_code           CHAR(4)              not null,
   table_desc           VARCHAR(16)          null,
   table_status         BOOL                 null,
   constraint PK_TABLE_LIST primary key (table__id)
);

/*==============================================================*/
/* Index: table_list_PK                                         */
/*==============================================================*/
create unique index table_list_PK on table_list (
table__id
);

/*==============================================================*/
/* Table: "user"                                                */
/*==============================================================*/
create table "user" (
   user_id              INT4                 not null,
   pos_id               INT4                 null,
   username             VARCHAR(16)          null,
   firstname            VARCHAR(16)          null,
   lastname             VARCHAR(16)          null,
   password             VARCHAR(128)         null,
   age                  INT2                 null,
   sex                  BOOL                 null,
   status_user          BOOL                 null,
   constraint PK_USER primary key (user_id)
);

/*==============================================================*/
/* Index: user_PK                                               */
/*==============================================================*/
create unique index user_PK on "user" (
user_id
);

/*==============================================================*/
/* Index: Relationship_1_FK                                     */
/*==============================================================*/
create  index Relationship_1_FK on "user" (
pos_id
);

alter table menu
   add constraint FK_MENU_RELATIONS_MENU_PAR foreign key (menu_parent_id)
      references menu_parent (menu_parent_id)
      on delete restrict on update restrict;

alter table "order"
   add constraint FK_ORDER_RELATIONS_TABLE_LI foreign key (table__id)
      references table_list (table__id)
      on delete restrict on update restrict;

alter table order_detail
   add constraint FK_ORDER_DE_RELATIONS_ORDER foreign key (order_id)
      references "order" (order_id)
      on delete restrict on update restrict;

alter table order_detail
   add constraint FK_ORDER_DE_RELATIONS_SUB_MENU foreign key (sub_menu_id)
      references sub_menu (sub_menu_id)
      on delete restrict on update restrict;

alter table sub_menu
   add constraint FK_SUB_MENU_RELATIONS_MENU foreign key (menu_id)
      references menu (menu_id)
      on delete restrict on update restrict;

alter table "user"
   add constraint FK_USER_RELATIONS_POSITION foreign key (pos_id)
      references "position" (pos_id)
      on delete restrict on update restrict;

