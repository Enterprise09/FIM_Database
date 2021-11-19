-- 코인 정보(coin_info_tb)
CREATE TABLE coin_info_tb (
	coin_code number(5,0),
	coin_intro varchar(3000),
	coin_price number(9,0),
	coin_name varchar(20),
	coin_date DATE,
	coin_homepage varchar(50),
	CONSTRAINT PK_COIN_INFO_TB PRIMARY KEY(coin_code)
);

INSERT INTO COIN_INFO_TB VALUES(01000, '비트', 79893000, '비트코인', '2009-01-03', 'https://bitcoin.org/ko/');
INSERT INTO COIN_INFO_TB VALUES(02000, '이더', 5654000, '이더리움', '2015-07-30', 'https://ethereum.org/ko/');
INSERT INTO COIN_INFO_TB VALUES(03000, '샌드', 3065, '샌드박스', '2011-06-01', 'https://www.sandbox.game/en/');
INSERT INTO COIN_INFO_TB VALUES(04000, '스텔라', 483, '스텔라루멘', '2014-07-01', 'https://www.stellar.org/');
INSERT INTO COIN_INFO_TB VALUES(05000, '도지', 325, '도지코인', '2013-12-06', 'https://dogecoin.com/');
INSERT INTO COIN_INFO_TB VALUES(06000, '리플코인', 1480, '리플', '2012-01-01', 'https://ripple.com/');
INSERT INTO COIN_INFO_TB VALUES(07000, '퀀텀코인', 20770, '퀀텀', '2016-01-01', 'https://qtum.org/ko');
INSERT INTO COIN_INFO_TB VALUES(08000, '이오스코인', 6090, '이오스', '2018-06-14', 'https://eos.io/');
INSERT INTO COIN_INFO_TB VALUES(09000, '라이트', 315100, '라이트코인', '2011-10-07', 'https://litecoin.org/ko/');
INSERT INTO COIN_INFO_TB VALUES(10000, '아크코인', 2295, '아크', '2016-10-15', 'https://ark.io/');

-- 코인 호가 기록(coin_price_his_tb)
CREATE TABLE coin_price_his_tb (
	coin_price_his_date timestamp,
	coin_code number(5,0),
	coin_price_his number(9,0),
	CONSTRAINT PK_COIN_PRICE_HIS_TB PRIMARY KEY(coin_price_his_date, coin_code),
	CONSTRAINT FK_COIN_PRICE_HIS_TB FOREIGN KEY(coin_code) references coin_info_tb(coin_code)
);

-- 코인 거래량 기록(coin_deal_amt_his_tb)
CREATE TABLE coin_deal_amt_his_tb (
	coin_deal_amt_his_date DATE,
	coin_code number(5,0),
	coin_deal_amt_his number(15,0),
	CONSTRAINT PK_COIN_DEAL_AMT_HIS_TB PRIMARY KEY(coin_deal_amt_his_date),
	CONSTRAINT FK_COIN_DEAL_AMT_HIS_TB FOREIGN KEY(coin_code) references coin_info_tb(coin_code)
);

-- 코인 거래(coin_deal_tb)
CREATE TABLE coin_deal_tb (
	coin_deal_datetime timestamp,
	coin_code number(5,0),
	fim_acc_num varchar(25),
	coin_deal_type number(1,0),
	coin_deal_amt number(8,0),
	coin_deal_price number(8,0),
	coin_deal_res number(1,0),
	coin_deal_canc number(1,0),
	CONSTRAINT PK_COIN_DEAL_TB PRIMARY KEY(coin_deal_datetime),
	CONSTRAINT FK_COIN_DEAL_TB_C FOREIGN KEY(coin_code) references coin_info_tb(coin_code),
	CONSTRAINT FK_COIN_DEAL_TB_F FOREIGN KEY(fim_acc_num) references fim_acc_tb(fim_acc_num)
);

-- 트리거를 이용한 코인 통계 테이블(coin_tb)
CREATE TABLE coin_tb (
	fim_acc_num varchar(25),
	coin_code number(5,0),
	user_coin_name varchar(20),
	user_coin_qty number(8,0),
	user_coin_total number(10,0),
	CONSTRAINT PK_COIN_TB PRIMARY KEY(fim_acc_num, coin_code)
);

insert into coin_deal_tb values('2021-11-10 16:53:05', 01000, '110422215369', 1, 20, 79893000, 1, null);

insert into coin_price_his_tb values('2021-11-10 16:53:00', 01000, 79893000);

insert into coin_deal_amt_his_tb values('2021-11-10', 01000, 20);