-- 트리거를 이용한 코인 통계 테이블(coin_tb)
CREATE TABLE coin_tb (
	fim_acc_num varchar(25),
	coin_code number(5,0),
	user_coin_name varchar(20),
	user_coin_qty number(8,0),
	user_coin_total number(10,0),
	CONSTRAINT PK_COIN_TB PRIMARY KEY(fim_acc_num, coin_code)
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

-- 트리거를 이용한 FIM 총 거래 내역 테이블(fim_acc_his_sum)
CREATE TABLE fim_acc_his_sum (
	fim_acc_num varchar(25) NOT NULL,
	fim_paym_datetime DATETIME,
	fim_paym_type number(1,0),
	fim_paym_name varchar(),
	fim_paym_amt number(9,0),
	fim_paym_qyt number(14,0),
	fim_paym_targetnum varchar(15,0),
    CONSTRAINT PK_FIM_ACC_HIS_SUM PRIMARY KEY(fim_acc_num, fim_paym_datetime)
);