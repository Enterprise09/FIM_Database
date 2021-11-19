-- 주식 정보(stock_tb)
CREATE TABLE stock_tb (
	stock_code number(6,0) NOT NULL,
	stock_price number(9,0),
	stock_intro varchar(3000),
	stock_company varchar(30),
	stock_date DATE,
	stcok_homepage varchar(50),
	stock_name varchar(40),
	CONSTRAINT PK_STOCK_TB PRIMARY KEY(stock_code),
);

INSERT INTO stock_tb VALUES(005930,70000,'삼성전자','삼성','1975-06-11','https://www.samsung.com/sec','삼성전자');
INSERT INTO stock_tb VALUES(003550,20500,'LG','LG','1970-02-13','http://www.lg.co.kr','LG');
INSERT INTO stock_tb VALUES(035420,30000,'NAVER','NAVER','2008-11-28','http://www.navercorp.com','NAVER');
INSERT INTO stock_tb VALUES(000062,5000,'SK하이닉스','SK','1996-12-26','http://www.skhynix.com','SK하이닉스');
INSERT INTO stock_tb VALUES(003572,60000,'카카오','카카오','2017-07-10','http://www.kakaocorp.com','카카오');
INSERT INTO stock_tb VALUES(000538,40000,'현대자동차','현대','1974-06-28','http://www.hyundai.com','현대차');
INSERT INTO stock_tb VALUES(207940,10000,'삼성바이오로직스','삼성','2016-11-10','http://www.samsungbiologics.com','삼성바이오로직스');
INSERT INTO stock_tb VALUES(000270,35200,'기아자동차','기아','1973-07-21','http://www.kia.com','기아');
INSERT INTO stock_tb VALUES(015760,21000,'한국전력','한국전력공사','1989-08-10','http://www.kepco.co.kr','한국전력');
INSERT INTO stock_tb VALUES(259960,41000,'크래프톤','크래프톤','2021-08-10','http://www.krafton.com','크래프톤');
INSERT INTO stock_tb VALUES(005490,24700,'포스코','포스코','1988-06-10','http://www.posco.co.kr','POSCO');
INSERT INTO stock_tb VALUES(352820,48690,'하이브','하이브','2020-10-15','http://www.bighitcorp.com','하이브');

-- 주식 거래량 기록(stock_deal_amt_his_tb)
CREATE TABLE stock_deal_amt_his_tb (
	stock_deal_amt_his_date DATE,
	stock_code number(6,0),
	stock_deal_amt_his number(15,0),
	CONSTRAINT PK_STOCK_DEAL_AMT_HIS_TB PRIMARY KEY(stock_deal_amt_his_date, stock_code),
	CONSTRAINT FK_STOCK_DEAL_AMT_HIS_TB FOREIGN KEY(stock_code) references stock_tb(stock_code)
);

-- 주식 호가 기록(stock_price_his_tb)
CREATE TABLE stock_price_his_tb (
	stock_price_his_date DATE,
	stock_code number(6,0),
	stock_price_his number(15,0),
	CONSTRAINT PK_STOCK_PRICE_HIS_TB PRIMARY KEY(stock_price_his_date, stock_code),
	CONSTRAINT FK_STOCK_PRICE_HIS_TB FOREIGN KEY(stock_code) references stock_tb(stock_code)
);

-- 주식 거래(stock_deal_tb)
CREATE TABLE stock_deal_tb (
	stock_deal_datetime TIMESTAMP,
	stock_code number(6,0),
	fim_acc_num varchar(25),
	stock_deal_type number(1,0),
	stock_deal_amt number(8,0),
	stock_deal_price number(8,0),
	stock_deal_res number(1,0),
	CONSTRAINT PK_STOCK_DEAL_TB PRIMARY KEY(stock_deal_datetime, stock_code),
	CONSTRAINT FK_STOCK_DEAL_TB_S FOREIGN KEY(stock_code) references stock_tb(stock_code),
	CONSTRAINT FK_STOCK_DEAL_TB_F FOREIGN KEY(fim_acc_num) references fim_acc_tb(fim_acc_num)
);

-- 트리거를 이용한 주식 통계 테이블(stocks_tb)
CREATE TABLE stocks_tb (
	fim_acc_num varchar(25),
	stock_code number(6,0),
	user_stock_name varchar(20),
	user_stock_qty number(8,0),
	user_stock_total number(10,0),
	CONSTRAINT PK_STOCKS_TB PRIMARY KEY(fim_acc_num, stock_code)
);