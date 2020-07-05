/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/7/5 14:55:39                            */
/*==============================================================*/


drop table if exists Company;

drop table if exists CompanyRequire;

drop table if exists Job;

drop table if exists User;

drop table if exists User_status;

/*==============================================================*/
/* Table: Company                                               */
/*==============================================================*/
create table Company
(
   C_id                 int not null,
   Cname                varchar(20) not null,
   CDescription         varchar(100),
   CLocation            varchar(100),
   primary key (C_id)
);

/*==============================================================*/
/* Table: CompanyRequire                                        */
/*==============================================================*/
create table CompanyRequire
(
   jobid                int not null,
   C_id                 int not null,
   Number               int,
   primary key (jobid, C_id)
);

/*==============================================================*/
/* Table: Job                                                   */
/*==============================================================*/
create table Job
(
   jobid                int not null,
   jobName              varchar(20) not null,
   jobDescribe          varchar(100) not null,
   primary key (jobid)
);

/*==============================================================*/
/* Table: User                                                  */
/*==============================================================*/
create table User
(
   UserID               int not null,
   Username             varchar(20) not null,
   Userpassword         varchar(20) not null,
   Usersex              char(4),
   UserNation           varchar(20),
   UserUniversity       varchar(100),
   UserTelephone        varchar(20),
   UserBrithday         date,
   UserMojar            varchar(20),
   primary key (UserID)
);

/*==============================================================*/
/* Table: User_status                                           */
/*==============================================================*/
create table User_status
(
   C_id                 int not null,
   UserID               int not null,
   jobid                int,
   status               int default 0,
   primary key (C_id, UserID)
);

alter table CompanyRequire add constraint FK_Relationship_5 foreign key (C_id)
      references Company (C_id) on delete restrict on update restrict;

alter table CompanyRequire add constraint FK_Relationship_6 foreign key (jobid)
      references Job (jobid) on delete restrict on update restrict;

alter table User_status add constraint FK_Relationship_2 foreign key (UserID)
      references User (UserID) on delete restrict on update restrict;

alter table User_status add constraint FK_Relationship_3 foreign key (C_id)
      references Company (C_id) on delete restrict on update restrict;

alter table User_status add constraint FK_Relationship_7 foreign key (jobid)
      references Job (jobid) on delete restrict on update restrict;

