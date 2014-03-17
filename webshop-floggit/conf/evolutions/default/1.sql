# --- Created by Ebean DDL
# To stop Ebean DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table category (
  category_id               integer auto_increment not null,
  staff_id                  integer,
  category_name             varchar(255),
  constraint pk_category primary key (category_id))
;

create table product (
  product_id                integer auto_increment not null,
  product_name              varchar(255),
  description               varchar(255),
  cost                      double,
  rrp                       double,
  constraint pk_product primary key (product_id))
;

create table shopping_basket (
  shopping_basket_id        integer auto_increment not null,
  user_id                   integer,
  product_id                integer,
  quantity                  integer,
  constraint pk_shopping_basket primary key (shopping_basket_id))
;

create table user (
  user_id                   integer auto_increment not null,
  email                     varchar(255),
  password                  varchar(255),
  first_name                varchar(255),
  sur_name                  varchar(255),
  street_address            varchar(255),
  post_code                 varchar(255),
  town                      varchar(255),
  telephone                 varchar(255),
  constraint pk_user primary key (user_id))
;




# --- !Downs

SET REFERENTIAL_INTEGRITY FALSE;

drop table if exists category;

drop table if exists product;

drop table if exists shopping_basket;

drop table if exists user;

SET REFERENTIAL_INTEGRITY TRUE;

