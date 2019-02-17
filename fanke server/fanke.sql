SET NAMES UTF8;
CREATE DATABASE fanke CHARSET=UTF8;
use fanke;
CREATE TABLE index_carousel(
    id INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128)
);
INSERT INTO index_carousel VALUES
(null,"http://127.0.0.1:3000/img/lunbo/1.jpg"),
(null,"http://127.0.0.1:3000/img/lunbo/2.jpg"),
(null,"http://127.0.0.1:3000/img/lunbo/3.jpg"),
(null,"http://127.0.0.1:3000/img/lunbo/4.jpg"),
(null,"http://127.0.0.1:3000/img/lunbo/5.jpg"),
(null,"http://127.0.0.1:3000/img/lunbo/6.jpg");

CREATE TABLE nav_img(
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(32),
    img VARCHAR(128)
);
INSERT INTO nav_img VALUES
(null,"新品","http://127.0.0.1:3000/n1.jpg"),
(null,"羽绒服","http://127.0.0.1:3000/n2.jpg"),
(null,"衬衫","http://127.0.0.1:3000/n3.jpg"),
(null,"v团","http://127.0.0.1:3000/n4.jpg"),
(null,"获奖名单","http://127.0.0.1:3000/n5.jpg");

CREATE TABLE second(
    id INT PRIMARY KEY AUTO_INCREMENT,
    price INT,
    img VARCHAR(128)
);
INSERT INTO second VALUES
(null,110,"http://127.0.0.1:3000/img/miaosha/1.jpg"),
(null,200,"http://127.0.0.1:3000/img/miaosha/2.jpg"),
(null,220,"http://127.0.0.1:3000/img/miaosha/3.jpg"),
(null,170,"http://127.0.0.1:3000/img/miaosha/4.jpg"),
(null,255,"http://127.0.0.1:3000/img/miaosha/5.jpg"),
(null,111,"http://127.0.0.1:3000/img/miaosha/6.jpg"),
(null,333,"http://127.0.0.1:3000/img/miaosha/7.jpg"),
(null,255,"http://127.0.0.1:3000/img/miaosha/8.jpg");



CREATE TABLE index_carousel2(
    id INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128)
);
INSERT INTO index_carousel2 VALUES
(null,"http://127.0.0.1:3000/img/index/p1.jpg"),
(null,"http://127.0.0.1:3000/img/index/p2.jpg"),
(null,"http://127.0.0.1:3000/img/index/p3.jpg");

CREATE TABLE shangwu_carousel(
    id INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128)
);
INSERT INTO shangwu_carousel VALUES
(null,"http://127.0.0.1:3000/img/shangwu/01.jpg"),
(null,"http://127.0.0.1:3000/img/shangwu/02.jpg"),
(null,"http://127.0.0.1:3000/img/shangwu/03.jpg");

CREATE TABLE man(
    id INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128),
    title VARCHAR(16)
);
INSERT INTO man VALUES
(null,"http://127.0.0.1:3000/img/fenlei/man/1.jpg","免烫衬衫"),
(null,"http://127.0.0.1:3000/img/fenlei/man/2.jpg","休闲衬衫"),
(null,"http://127.0.0.1:3000/img/fenlei/man/3.jpg","卫衣"),
(null,"http://127.0.0.1:3000/img/fenlei/man/4.jpg","T恤衬衫"),
(null,"http://127.0.0.1:3000/img/fenlei/man/5.jpg","POLO衬衫"),
(null,"http://127.0.0.1:3000/img/fenlei/man/6.jpg","短袖衬衫"),
(null,"http://127.0.0.1:3000/img/fenlei/man/7.jpg","水柔棉"),
(null,"http://127.0.0.1:3000/img/fenlei/man/8.jpg","麻衬衫"),
(null,"http://127.0.0.1:3000/img/fenlei/man/9.jpg","针织衫"),
(null,"http://127.0.0.1:3000/img/fenlei/man/10.jpg","外套"),
(null,"http://127.0.0.1:3000/img/fenlei/man/11.jpg","西服"),
(null,"http://127.0.0.1:3000/img/fenlei/man/12.jpg","大衣"),
(null,"http://127.0.0.1:3000/img/fenlei/man/13.jpg","皮肤衣"),
(null,"http://127.0.0.1:3000/img/fenlei/man/14.jpg","休闲裤"),
(null,"http://127.0.0.1:3000/img/fenlei/man/15.jpg","牛仔裤"),
(null,"http://127.0.0.1:3000/img/fenlei/man/16.jpg","针织裤"),
(null,"http://127.0.0.1:3000/img/fenlei/man/17.jpg","羽绒服");

CREATE TABLE woman(
    id INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128),
    title VARCHAR(16)
);
INSERT INTO woman VALUES
(null,"http://127.0.0.1:3000/img/fenlei/woman/1.jpg","卫衣"),
(null,"http://127.0.0.1:3000/img/fenlei/woman/2.jpg","水柔棉"),
(null,"http://127.0.0.1:3000/img/fenlei/woman/3.jpg","T恤"),
(null,"http://127.0.0.1:3000/img/fenlei/woman/4.jpg","休闲衬衫"),
(null,"http://127.0.0.1:3000/img/fenlei/woman/5.jpg","麻衬衫裙"),
(null,"http://127.0.0.1:3000/img/fenlei/woman/6.jpg","针织衫"),
(null,"http://127.0.0.1:3000/img/fenlei/woman/7.jpg","外套"),
(null,"http://127.0.0.1:3000/img/fenlei/woman/8.jpg","皮肤衣"),
(null,"http://127.0.0.1:3000/img/fenlei/woman/9.jpg","运动遮干"),
(null,"http://127.0.0.1:3000/img/fenlei/woman/10.jpg","牛仔裤"),
(null,"http://127.0.0.1:3000/img/fenlei/woman/11.jpg","针织裤");

CREATE TABLE pindao(
    id INT PRIMARY KEY AUTO_INCREMENT,
    img VARCHAR(128)
);
INSERT INTO pindao VALUES
(null,"http://127.0.0.1:3000/img/pindao/1.jpg"),
(null,"http://127.0.0.1:3000/img/pindao/2.jpg"),
(null,"http://127.0.0.1:3000/img/pindao/3.jpg"),
(null,"http://127.0.0.1:3000/img/pindao/4.jpg"),
(null,"http://127.0.0.1:3000/img/pindao/5.jpg"),
(null,"http://127.0.0.1:3000/img/pindao/6.jpg"),
(null,"http://127.0.0.1:3000/img/pindao/7.jpg"),
(null,"http://127.0.0.1:3000/img/pindao/8.jpg"),
(null,"http://127.0.0.1:3000/img/pindao/9.jpg"),
(null,"http://127.0.0.1:3000/img/pindao/10.jpg"),
(null,"http://127.0.0.1:3000/img/pindao/11.jpg");

CREATE TABLE fanke_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(16),
    upwd VARCHAR(16)
);
CREATE TABLE shangwu(
    id INT PRIMARY KEY AUTO_INCREMENT,
    pid INT,
    img VARCHAR(128),
    title VARCHAR(64),
    price int,
    color VARCHAR(16)
);
INSERT INTO shangwu VALUES
(null,1,"http://127.0.0.1:3000/img/shangwu/1.jpg","凡客80免烫衬衫 白色",258,"白色"),
(null,1,"http://127.0.0.1:3000/img/shangwu/2.jpg","凡客80免烫衬衫 蓝色",258,"蓝色"),
(null,2,"http://127.0.0.1:3000/img/shangwu/3.jpg","凡客衬衫 吉国武 免烫 小方领 短袖4.0 浅灰",336,"浅灰"),
(null,2,"http://127.0.0.1:3000/img/shangwu/4.jpg","凡客衬衫 吉国武 免烫 小方领 短袖4.0 浅紫",336,"浅紫"),
(null,3,"http://127.0.0.1:3000/img/shangwu/5.jpg","凡客衬衫 吉国武 轻弹免烫 小方领 4.0 白色",498,"白色"),
(null,3,"http://127.0.0.1:3000/img/shangwu/6.jpg","凡客衬衫 吉国武 轻弹免烫 小方领 4.0 浅蓝",498,"浅蓝"),
(null,3,"http://127.0.0.1:3000/img/shangwu/7.jpg","凡客衬衫 吉国武 轻弹免烫 小方领 4.0 浅灰",498,"浅灰"),
(null,3,"http://127.0.0.1:3000/img/shangwu/8.jpg","凡客衬衫 吉国武 轻弹免烫 小方领 4.0 蓝色细条纹",498,"蓝色细条纹"),
(null,3,"http://127.0.0.1:3000/img/shangwu/9.jpg","凡客衬衫 吉国武 轻弹免烫 小方领 4.0 深蓝色细条纹",498,"深蓝色细条纹");

CREATE TABLE details(
    did INT PRIMARY KEY AUTO_INCREMENT,
    pid INT,
    color VARCHAR(16),
    price int,
    cimgs VARCHAR(1000),
    title VARCHAR(64)
);
INSERT into details VALUES
(null,1,"白色",338,'["http://127.0.0.1:3000/img/details/1/c1.jpg","http://127.0.0.1:3000/img/details/1/c2.jpg","http://127.0.0.1:3000/img/details/1/c3.jpg","http://127.0.0.1:3000/img/details/1/c4.jpg","http://127.0.0.1:3000/img/details/1/c5.jpg","http://127.0.0.1:3000/img/details/1/c6.jpg","http://127.0.0.1:3000/img/details/1/c7.jpg","http://127.0.0.1:3000/img/details/1/c8.jpg","http://127.0.0.1:3000/img/details/1/c9.jpg","http://127.0.0.1:3000/img/details/1/c10.jpg"]',"凡客80免烫衬衫 白色"),
(null,1,"蓝色",338,'["http://127.0.0.1:3000/img/details/1/e1.jpg","http://127.0.0.1:3000/img/details/1/e2.jpg","http://127.0.0.1:3000/img/details/1/e3.jpg","http://127.0.0.1:3000/img/details/1/e4.jpg","http://127.0.0.1:3000/img/details/1/e5.jpg","http://127.0.0.1:3000/img/details/1/e6.jpg","http://127.0.0.1:3000/img/details/1/e7.jpg","http://127.0.0.1:3000/img/details/1/e8.jpg","http://127.0.0.1:3000/img/details/1/e9.jpg"]',"凡客80免烫衬衫 蓝色");

CREATE TABLE details_img(
    id INT PRIMARY KEY AUTO_INCREMENT,
    pid int,
    imgs VARCHAR(1000)
);
INSERT INTO details_img VALUES
(null,1,'["http://127.0.0.1:3000/img/details/1/d1.jpg","http://127.0.0.1:3000/img/details/1/d2.jpg","http://127.0.0.1:3000/img/details/1/d3.jpg","http://127.0.0.1:3000/img/details/1/d4.jpg","http://127.0.0.1:3000/img/details/1/d5.jpg","http://127.0.0.1:3000/img/details/1/d6.jpg","http://127.0.0.1:3000/img/details/1/d7.jpg","http://127.0.0.1:3000/img/details/1/d8.jpg","http://127.0.0.1:3000/img/details/1/d9.jpg","http://127.0.0.1:3000/img/details/1/d10.jpg","http://127.0.0.1:3000/img/details/1/d11.jpg","http://127.0.0.1:3000/img/details/1/d12.jpg","http://127.0.0.1:3000/img/details/1/d13.jpg","http://127.0.0.1:3000/img/details/1/d14.jpg","http://127.0.0.1:3000/img/details/1/d15.jpg","http://127.0.0.1:3000/img/details/1/d16.jpg","http://127.0.0.1:3000/img/details/1/d17.jpg","http://127.0.0.1:3000/img/details/1/d18.jpg","http://127.0.0.1:3000/img/details/1/d19.jpg"]'),
(null,1,'["http://127.0.0.1:3000/img/details/1/d1.jpg","http://127.0.0.1:3000/img/details/1/d2.jpg","http://127.0.0.1:3000/img/details/1/d3.jpg","http://127.0.0.1:3000/img/details/1/d4.jpg","http://127.0.0.1:3000/img/details/1/d5.jpg","http://127.0.0.1:3000/img/details/1/d6.jpg","http://127.0.0.1:3000/img/details/1/d7.jpg","http://127.0.0.1:3000/img/details/1/d8.jpg","http://127.0.0.1:3000/img/details/1/d9.jpg","http://127.0.0.1:3000/img/details/1/d10.jpg","http://127.0.0.1:3000/img/details/1/d11.jpg","http://127.0.0.1:3000/img/details/1/d12.jpg","http://127.0.0.1:3000/img/details/1/d13.jpg","http://127.0.0.1:3000/img/details/1/d14.jpg","http://127.0.0.1:3000/img/details/1/d15.jpg","http://127.0.0.1:3000/img/details/1/d16.jpg","http://127.0.0.1:3000/img/details/1/d17.jpg","http://127.0.0.1:3000/img/details/1/d18.jpg","http://127.0.0.1:3000/img/details/1/d19.jpg"]');

CREATE TABLE spec(
    id INT PRIMARY KEY AUTO_INCREMENT,
    pid int,
    color VARCHAR(16),
    spec VARCHAR(64)
);
INSERT INTO spec VALUES
(null,1,"白色","[39,42]"),
(null,1,"蓝色","[37,38,39,40,41,42]");

CREATE TABLE cart(
    id INT PRIMARY KEY AUTO_INCREMENT,
    uid VARCHAR(16),
    pid int,
    price int,
    count int,
    spec int,
    color VARCHAR(16),
    selected int
);

