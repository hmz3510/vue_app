SET NAMES UTF8;
DROP DATABASE IF EXISTS app_hmz;
CREATE DATABASE app_hmz CHARSET = UTF8;
USE app_hmz;

/*轮播表*/
CREATE TABLE sc_index_carousel(
	lid INT(11) PRIMARY KEY AUTO_INCREMENT,
	img VARCHAR(256),
	title VARCHAR(128)
);
/*首页商品数据表*/
CREATE TABLE sc_laptop(
	lid INT(11) PRIMARY key AUTO_INCREMENT,
	family_id INT(11),
	fid_title VARCHAR(64),
	title VARCHAR(128),
	price decimal(10,2),
	took INT(11),
	img VARCHAR(256)
);

CREATE TABLE sc_laptop_nav(
	lid INT(11) PRIMARY KEY AUTO_INCREMENT,
	fid  INT(11),
	title VARCHAR(128)
);

CREATE TABLE sc_laptop_product(
	lid INT(11) PRIMARY KEY AUTO_INCREMENT,
	pid INT(11),
	title VARCHAR(64),
	img_url VARCHAR(256)
);
CREATE TABLE sc_laptop_head(
	lid INT(11),
	pid INT(11),
	title VARCHAR(64)

);

/*图片表*/
CREATE TABLE sc_laptop_pic(
	pid INT(11) PRIMARY KEY AUTO_INCREMENT,
	laptop_id INT(11),
	img VARCHAR(256)
);

/*用户表*/
CREATE TABLE sc_user(
	uid INT(11) PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(64),
	upwd VARCHAR(64),
	phone VARCHAR(11),
	gender boolean
);


/*商品数据表*/
CREATE TABLE sc_shopcart (
	iid INT(11) PRIMARY KEY AUTO_INCREMENT,
	user_id INT(11),
	product_id INT(11),
	count INT(11),
	isselect boolean
);


/*插入轮播数据*/
INSERT INTO sc_index_carousel values('NULL','http://localhost:4000/images/banner/ad1.jpg','轮播广告');
INSERT INTO sc_index_carousel values('NULL','http://localhost:4000/images/banner/ad2.jpg','轮播广告');
INSERT INTO sc_index_carousel values('NULL','http://localhost:4000/images/banner/ad4.jpg','轮播广告');

/*插入商品数据*/
INSERT INTO sc_laptop values ('1','1','坚果梅子','三只松鼠 坚果大礼包1430g每日零食中秋礼品礼盒7袋','95.5','10','http://localhost:4000/images/food/guess-1.jpg');
INSERT INTO sc_laptop values ('2','1','坚果梅子','费列罗Rocher金球榛果巧克力576粒婚庆情人节零食品七夕结婚喜糖','103.5','10','http://localhost:4000/images/food/guess-3.jpg');
INSERT INTO sc_laptop values ('3','1','坚果梅子','来伊份每日坚果混合天天坚果仁25gx30包组合零食大礼包成人儿童款','95.5','10','http://localhost:4000/images/food/guess-4.jpg');
INSERT INTO sc_laptop values ('4','1','坚果梅子','【三只松鼠_甜夹脆枣夹核桃仁258g】休闲零食特产红枣子夹核桃','36.6','10','http://localhost:4000/images/food/guess-8.jpg');
INSERT INTO sc_laptop values ('5','1','坚果梅子','良品铺子零食大礼包麻辣味组合一整箱混合装吃货膨化食品小吃批发','102.5','10','http://localhost:4000/images/food/guess-5.jpg');
INSERT INTO sc_laptop values ('6','1','坚果梅子','三只松鼠 坚果大礼包1430g每日零食中秋礼品礼盒7袋','95.5','10','http://localhost:4000/images/food/guess-1.jpg');

INSERT INTO sc_laptop values ('7','2','营养糕点','马来西亚进口 福多(fudo) 蛋糕 糕点小吃 早餐下午茶佳品','25.5','10','http://localhost:4000/images/food/chocopie.png');
INSERT INTO sc_laptop values ('8','2','营养糕点','卡尔顿北海道软面包','2','10','http://localhost:4000/images/food/cake.png');
INSERT INTO sc_laptop values ('9','2','营养糕点','零食高点小吃 友成口袋面包果粒吐司','2.20','10','http://localhost:4000/images/food/f2-l-3.png');
INSERT INTO sc_laptop values ('10','2','营养糕点','好丽友派 六枚小甜食点心甜品','12.2','10','http://localhost:4000/images/food/f2-l-1.png');
INSERT INTO sc_laptop values ('11','2','营养糕点','蔓越莓曲奇饼干','9.8','10','http://localhost:4000/images/food/f3-1-2.png');
INSERT INTO sc_laptop values ('12','2','营养糕点','台湾风味巴米丽塔麦芽饼干','0.33','10','http://localhost:4000/images/food/guess-2.jpg');

INSERT INTO sc_laptop values ('13','3','咖啡饮料','雀巢咖啡 早餐下午茶佳品','10.05','10','http://localhost:4000/images/food/f3-2-10.png');
INSERT INTO sc_laptop values ('14','3','咖啡饮料','雀巢咖啡 罐装 100g 好喝','15.5','10','http://localhost:4000/images/food/f3-2-11.png');
INSERT INTO sc_laptop values ('15','3','咖啡饮料','外国进口高级咖啡 熬夜必备','2.20','10','http://localhost:4000/images/food/f3-2-12.png');
INSERT INTO sc_laptop values ('16','3','咖啡饮料','雀巢咖啡 罐装 50g 好喝','36.00','10','http://localhost:4000/images/food/f3-2-13.png');
INSERT INTO sc_laptop values ('17','3','咖啡饮料','雀巢咖啡 早餐下午茶佳品','9.8','10','http://localhost:4000/images/food/f3-2-14.png');
INSERT INTO sc_laptop values ('18','3','咖啡饮料','包装奶粉，100g','0.33','10','http://localhost:4000/images/food/f3-2-15.png');




/*插入搜索*/
INSERT sc_laptop_nav values('1','1','热搜推荐');
INSERT sc_laptop_nav values('2','2','手机数码');
INSERT sc_laptop_nav values('3','3','生鲜果蔬');
INSERT sc_laptop_nav values('4','4','运动户外');
INSERT sc_laptop_nav values('5','5','家用电器');
INSERT sc_laptop_nav values('6','6','电脑办公');
INSERT sc_laptop_nav values('7','7','美妆护肤');
INSERT sc_laptop_nav values('8','8','女装内衣');
INSERT sc_laptop_nav values('9','9','个户清洁');
INSERT sc_laptop_nav values('10','10','生活充值');
INSERT sc_laptop_nav values('11','11','家具家纺');
INSERT sc_laptop_nav values('12','12','男装内衣');
INSERT sc_laptop_nav values('13','13','生活美食');
INSERT sc_laptop_nav values('14','14','酒水饮料');

/*插入分类数据*/
INSERT sc_laptop_product values("1",'1','手机','http://localhost:4000/images/tel/floor1_col2_01.jpg');
INSERT sc_laptop_product values("2",'1','电脑','http://localhost:4000/images/tel/find_01.jpg');
INSERT sc_laptop_product values("3",'1','女装','http://localhost:4000/images/tel/find_04.jpg');
INSERT sc_laptop_product values("4",'1','床套','http://localhost:4000/images/tel/find_06.jpg');
INSERT sc_laptop_product values("5",'1','耳机','http://localhost:4000/images/tel/floor1_col2_04.jpg');
INSERT sc_laptop_product values("6",'1','手表','http://localhost:4000/images/tel/floor1_col2_16.jpg');
INSERT sc_laptop_product values("7",'1','电饭锅','http://localhost:4000/images/tel/ll_02_01.jpg');
INSERT sc_laptop_product values("8",'1','吸尘器','http://localhost:4000/images/tel/ll_02_02.jpg');
INSERT sc_laptop_product values("9",'1','微波炉','http://localhost:4000/images/tel/ll_02_04.jpg');
INSERT sc_laptop_product values("10",'1','相机','http://localhost:4000/images/tel/ll_01_01.jpg');
INSERT sc_laptop_product values("11",'1','零食','http://localhost:4000/images/tel/ll_03_03.jpg');
INSERT sc_laptop_product values("12",'1','剃须刀','http://localhost:4000/images/tel/rank_col3_03.jpg');
INSERT sc_laptop_product values("13",'1','吹风机','http://localhost:4000/images/tel/rank_col3_05.jpg');
INSERT sc_laptop_product values("14",'1','洗衣液','http://localhost:4000/images/tel/ll_04_03.jpg');

INSERT sc_laptop_product values("15",'2','iphoneX','http://localhost:4000/images/tel/rank_col1_02.jpg');
INSERT sc_laptop_product values("16",'2','荣耀V10','http://localhost:4000/images/tel/floor1_col2_01.jpg');
INSERT sc_laptop_product values("17",'2','iphone6','http://localhost:4000/images/tel/floor1_col2_02.jpg');
INSERT sc_laptop_product values("18",'2','华为Mate10','http://localhost:4000/images/tel/floor1_col2_03.jpg');
INSERT sc_laptop_product values("19",'2','华为11','http://localhost:4000/images/tel/rank_col1_05.jpg');
INSERT sc_laptop_product values("20",'2','OPPOR11s','http://localhost:4000/images/tel/rank_col1_03.jpg');
INSERT sc_laptop_product values("21",'2','小米Note3','http://localhost:4000/images/tel/rank_col1_06.jpg');
INSERT sc_laptop_product values("22",'2','华为11','http://localhost:4000/images/tel/rank_col1_05.jpg');
INSERT sc_laptop_product values("23",'2','OPPOR11s','http://localhost:4000/images/tel/rank_col1_03.jpg');

INSERT sc_laptop_product values("24",'3','苹果','http://localhost:4000/images/food/11.png');
INSERT sc_laptop_product values("25",'3','樱桃','http://localhost:4000/images/food/1.png');
INSERT sc_laptop_product values("26",'3','桂圆','http://localhost:4000/images/food/2.png');
INSERT sc_laptop_product values("27",'3','蓝莓','http://localhost:4000/images/food/4.png');
INSERT sc_laptop_product values("28",'3','橙子','http://localhost:4000/images/food/5.png');
INSERT sc_laptop_product values("29",'3','龙虾','http://localhost:4000/images/food/f3-2-1.png');
INSERT sc_laptop_product values("30",'3','河虾','http://localhost:4000/images/food/f3-2-2.png');
INSERT sc_laptop_product values("31",'3','大闸蟹','http://localhost:4000/images/food/f3-2-5.png');

/*插入head*/
INSERT sc_laptop_head values("1",'1','热门搜索');
INSERT sc_laptop_head values("2",'2','热销推荐');
INSERT sc_laptop_head values("3",'3','新鲜水果 海鲜');

/*插入图片数据*/
INSERT sc_laptop_pic values('1','1','http://localhost:4000/images/details/fruit/5b72a1aaN6e7539a2.jpg');
INSERT sc_laptop_pic values('2','1','http://localhost:4000/images/details/fruit/5b72a1aaN3eea579a.jpg');
INSERT sc_laptop_pic values('3','1','http://localhost:4000/images/details/fruit/5b72a1aaN9ab987da.jpg');
INSERT sc_laptop_pic values('4','1','http://localhost:4000/images/details/fruit/5b72a1aaN64f24871.jpg');
INSERT sc_laptop_pic values('5','1','http://localhost:4000/images/details/fruit/5b72a33aNb32da185.jpg');
INSERT sc_laptop_pic values('6','1','http://localhost:4000/images/details/fruit/5b766580Nea529a05.jpg');
INSERT sc_laptop_pic values('7','1','http://localhost:4000/images/details/fruit/5b72a1aaN82c89175.jpg');

INSERT sc_laptop_pic values('8','2','http://localhost:4000/images/details/bijiben/be44924632f402de.jpg');
INSERT sc_laptop_pic values('9','2','http://localhost:4000/images/details/bijiben/597e71f2a511541c.jpg');
INSERT sc_laptop_pic values('10','2','http://localhost:4000/images/details/bijiben/a5fe385c3ba13ea5.jpg');
INSERT sc_laptop_pic values('11','2','http://localhost:4000/images/details/bijiben/b32ae8c75291bb08.jpg');
INSERT sc_laptop_pic values('12','2','http://localhost:4000/images/details/bijiben/b182b35c1b06748f.jpg');

/*插入用户信息*/
INSERT INTO sc_user values ('1','tom','123456','13578965412','0');

/*插入商品购物车*/
INSERT INTO	 sc_shopcart values('1','1','1','5','0');
INSERT INTO	 sc_shopcart values('2','1','6','10','0');
INSERT INTO	 sc_shopcart values('3','1','4','100','0');
INSERT INTO	 sc_shopcart values('4','1','2','11','0');
INSERT INTO	 sc_shopcart values('5','1','5','9','0');
