CREATE TABLE "user_tb" (
	"user_id"	varchar(20)		NOT NULL,
	"user_pw"	varchar(30)		NULL,
	"user_pn"	char(20)		NULL,
	"user_em"	varchar(30)		NULL,
	"user_addr"	varchar(40)		NULL,
	"user_name"	varchar(20)		NULL
);

CREATE TABLE "acc_tb" (
	"acc_num"	varchar(25)		NOT NULL,
	"bank_code"	number(10,0)		NOT NULL,
	"fim_acc_num2"	varchar(25)		NOT NULL,
	"acc_bal"	number(16,0)		NULL,
	"acc_type"	number(1,0)		NULL,
	"acc_intrate"	number(2,2)		NULL,
	"fim_priority"	number(2)		NULL
);

CREATE TABLE "acc_his_tb" (
	"his_datetime"	DATETIME		NULL,
	"acc_num"	varchar(25)		NOT NULL,
	"his_type"	number(1,0)		NULL,
	"his_amt"	number(10,0)		NULL,
	"his_cont"	varchar(15,0)		NULL,
	"his_targetnum"	varchar(15,0)		NULL
);

CREATE TABLE "fim_acc_tb" (
	"fim_acc_num"	varchar(25)		NOT NULL,
	"user_id"	varchar(20)		NOT NULL
);

CREATE TABLE "card_tb" (
	"card_num"	varchar(25)		NOT NULL,
	"card_code"	number(10,0)		NOT NULL,
	"acc_num"	varchar(25)		NOT NULL,
	"card_pw"	number(4,0)		NULL,
	"card_exp"	DATE		NULL,
	"card_cvc"	number(3,0)		NULL
);

CREATE TABLE "card_paym_tb" (
	"card_paym_datetime"	DATETIME		NOT NULL,
	"card_num"	varchar(25)		NOT NULL,
	"card_paym_amt"	number(10,0)		NULL,
	"card_paym_cont"	varchar(15,0)		NULL,
	"card_paym_date"	DATE		NULL
);

CREATE TABLE "coin_info_tb" (
	"coin_code"	number(5,0)		NOT NULL,
	"coin_intro"	varchar(3000)		NULL,
	"coin_price"	number(9,0)		NULL,
	"coin_name"	varchar(20)		NOT NULL,
	"coin_date"	DATE		NULL,
	"coin_homepage"	varchar(50)		NULL
);

CREATE TABLE "coin_deal_tb" (
	"coin_deal_datetime"	DATETIME		NULL,
	"coin_code"	number(5,0)		NOT NULL,
	"fim_acc_num2"	varchar(25)		NOT NULL,
	"coin_deal_type"	number(1,0)		NULL,
	"coin_deal_amt"	number(8,0)		NULL,
	"coin_deal_price"	number(8,0)		NULL,
	"coin_deal_res"	number(1,0)		NULL,
	"coin_deal_canc"	number(1,0)		NULL
);

CREATE TABLE "coin_price_his_tb" (
	"coin_price_his_date"	DATE		NULL,
	"coin_code"	number(5,0)		NOT NULL,
	"coin_price_his"	number(9,0)		NULL
);

CREATE TABLE "coin_deal_amt_his_tb" (
	"coin_deal_amt_his_date"	DATE		NULL,
	"coin_code"	number(5,0)		NOT NULL,
	"coin_deal_amt_his"	number(15,0)		NULL
);

CREATE TABLE "stock_tb" (
	"stock_code"	number(5,0)		NOT NULL,
	"stock_price"	number(9,0)		NULL,
	"stock_intro"	varchar(3000)		NULL,
	"stock_company"	varchar(30)		NULL,
	"stock_date"	DATE		NULL,
	"stcok_homepage"	varchar(50)		NULL,
	"stock_name"	varchar(20)		NULL
);

CREATE TABLE "stock_deal_tb" (
	"stock_deal_datetime"	DATETIME		NOT NULL,
	"stock_code"	number(5,0)		NOT NULL,
	"fim_acc_num2"	varchar(25)		NOT NULL,
	"stock_deal_type"	number(1,0)		NULL,
	"stock_deal_amt"	number(8,0)		NULL,
	"stock_deal_price"	number(8,0)		NULL,
	"stock_deal_res"	number(1,0)		NULL,
	"stock_deal_canc_id"	number(2,0)		NOT NULL
);

CREATE TABLE "stock_deal_amt_his" (
	"stock_deal_amt_his_date"	DATE		NULL,
	"stock_code"	number(5,0)		NOT NULL,
	"stock_deal_amt_his"	number(15,0)		NULL
);

CREATE TABLE "stock_price_his_tb" (
	"stock_price_his_date"	DATE		NULL,
	"stock_code"	number(5,0)		NOT NULL,
	"stock_price_his"	number(9,0)		NULL
);

CREATE TABLE "bank_code" (
	"bank_code"	number(10,0)		NOT NULL,
	"bank_name"	varchar(20)		NULL
);

CREATE TABLE "card_code" (
	"card_code"	number(10,0)		NOT NULL,
	"bank_code"	number(10,0)		NOT NULL,
	"card_name"	varchar(20,0)		NULL
);

CREATE TABLE "fim_acc_his_sum" (
	"fim_acc_num"	varchar(25)		NOT NULL,
	"fim_paym_datetime"	DATETIME		NULL,
	"fim_paym_type"	number(1,0)		NULL,
	"fim_paym_name"	varchar()		NULL,
	"fim_paym_amt"	number(9,0)		NULL,
	"fim_paym_qyt"	number(14,0)		NULL,
	"fim_paym_targetnum"	varchar(15,0)		NULL
);

CREATE TABLE "fim_his_tb" (
	"fim_his_datetime"	DATETIME		NULL,
	"fim_acc_num"	varchar(25)		NOT NULL,
	"fim_his_type"	number(1,0)		NULL,
	"fim_his_amt"	number(10,0)		NULL,
	"fim_his_cont"	varchar(15,0)		NULL,
	"his_targetnum"	varchar(15,0)		NULL
);

CREATE TABLE "stock_deal_canc_attribute" (
	"stock_deal_canc_id"	number(2,0)		NOT NULL,
	"stock_deal_canc_name"	varchar		NULL
);

CREATE TABLE "stocks_tb" (
	"fim_acc_num"	varchar(25)		NOT NULL,
	"stock_code"	number(5,0)		NOT NULL,
	"user_stock_name"	varchar(20)		NOT NULL,
	"user_stock_qty"	number(8,0)		NULL,
	"user_stock_total"	number(10,0)		NULL
);

CREATE TABLE "coin_tb" (
	"fim_acc_num"	varchar(25)		NOT NULL,
	"coin_code"	number(5,0)		NOT NULL,
	"user_coin_name"	varchar(20)		NULL,
	"user_coin_qty"	number(8,0)		NULL,
	"user_coin_total"	number(10,0)		NULL
);

ALTER TABLE "user_tb" ADD CONSTRAINT "PK_USER_TB" PRIMARY KEY (
	"user_id"
);

ALTER TABLE "acc_tb" ADD CONSTRAINT "PK_ACC_TB" PRIMARY KEY (
	"acc_num"
);

ALTER TABLE "acc_his_tb" ADD CONSTRAINT "PK_ACC_HIS_TB" PRIMARY KEY (
	"his_datetime",
	"acc_num"
);

ALTER TABLE "fim_acc_tb" ADD CONSTRAINT "PK_FIM_ACC_TB" PRIMARY KEY (
	"fim_acc_num"
);

ALTER TABLE "card_tb" ADD CONSTRAINT "PK_CARD_TB" PRIMARY KEY (
	"card_num"
);

ALTER TABLE "card_paym_tb" ADD CONSTRAINT "PK_CARD_PAYM_TB" PRIMARY KEY (
	"card_paym_datetime",
	"card_num"
);

ALTER TABLE "coin_info_tb" ADD CONSTRAINT "PK_COIN_INFO_TB" PRIMARY KEY (
	"coin_code"
);

ALTER TABLE "coin_deal_tb" ADD CONSTRAINT "PK_COIN_DEAL_TB" PRIMARY KEY (
	"coin_deal_datetime",
	"coin_code"
);

ALTER TABLE "coin_price_his_tb" ADD CONSTRAINT "PK_COIN_PRICE_HIS_TB" PRIMARY KEY (
	"coin_price_his_date",
	"coin_code"
);

ALTER TABLE "coin_deal_amt_his_tb" ADD CONSTRAINT "PK_COIN_DEAL_AMT_HIS_TB" PRIMARY KEY (
	"coin_deal_amt_his_date",
	"coin_code"
);

ALTER TABLE "stock_tb" ADD CONSTRAINT "PK_STOCK_TB" PRIMARY KEY (
	"stock_code"
);

ALTER TABLE "stock_deal_tb" ADD CONSTRAINT "PK_STOCK_DEAL_TB" PRIMARY KEY (
	"stock_deal_datetime",
	"stock_code"
);

ALTER TABLE "stock_deal_amt_his" ADD CONSTRAINT "PK_STOCK_DEAL_AMT_HIS" PRIMARY KEY (
	"stock_deal_amt_his_date",
	"stock_code"
);

ALTER TABLE "stock_price_his_tb" ADD CONSTRAINT "PK_STOCK_PRICE_HIS_TB" PRIMARY KEY (
	"stock_price_his_date",
	"stock_code"
);

ALTER TABLE "bank_code" ADD CONSTRAINT "PK_BANK_CODE" PRIMARY KEY (
	"bank_code"
);

ALTER TABLE "card_code" ADD CONSTRAINT "PK_CARD_CODE" PRIMARY KEY (
	"card_code"
);

ALTER TABLE "fim_acc_his_sum" ADD CONSTRAINT "PK_FIM_ACC_HIS_SUM" PRIMARY KEY (
	"fim_acc_num",
	"fim_paym_datetime"
);

ALTER TABLE "fim_his_tb" ADD CONSTRAINT "PK_FIM_HIS_TB" PRIMARY KEY (
	"fim_his_datetime",
	"fim_acc_num"
);

ALTER TABLE "stock_deal_canc_attribute" ADD CONSTRAINT "PK_STOCK_DEAL_CANC_ATTRIBUTE" PRIMARY KEY (
	"stock_deal_canc_id"
);

ALTER TABLE "stocks_tb" ADD CONSTRAINT "PK_STOCKS_TB" PRIMARY KEY (
	"fim_acc_num",
	"stock_code"
);

ALTER TABLE "coin_tb" ADD CONSTRAINT "PK_COIN_TB" PRIMARY KEY (
	"fim_acc_num",
	"coin_code"
);

ALTER TABLE "acc_tb" ADD CONSTRAINT "FK_bank_code_TO_acc_tb_1" FOREIGN KEY (
	"bank_code"
)
REFERENCES "bank_code" (
	"bank_code"
);

ALTER TABLE "acc_tb" ADD CONSTRAINT "FK_fim_acc_tb_TO_acc_tb_1" FOREIGN KEY (
	"fim_acc_num2"
)
REFERENCES "fim_acc_tb" (
	"fim_acc_num"
);

ALTER TABLE "acc_his_tb" ADD CONSTRAINT "FK_acc_tb_TO_acc_his_tb_1" FOREIGN KEY (
	"acc_num"
)
REFERENCES "acc_tb" (
	"acc_num"
);

ALTER TABLE "fim_acc_tb" ADD CONSTRAINT "FK_user_tb_TO_fim_acc_tb_1" FOREIGN KEY (
	"user_id"
)
REFERENCES "user_tb" (
	"user_id"
);

ALTER TABLE "card_tb" ADD CONSTRAINT "FK_card_code_TO_card_tb_1" FOREIGN KEY (
	"card_code"
)
REFERENCES "card_code" (
	"card_code"
);

ALTER TABLE "card_tb" ADD CONSTRAINT "FK_acc_tb_TO_card_tb_1" FOREIGN KEY (
	"acc_num"
)
REFERENCES "acc_tb" (
	"acc_num"
);

ALTER TABLE "card_paym_tb" ADD CONSTRAINT "FK_card_tb_TO_card_paym_tb_1" FOREIGN KEY (
	"card_num"
)
REFERENCES "card_tb" (
	"card_num"
);

ALTER TABLE "coin_deal_tb" ADD CONSTRAINT "FK_coin_info_tb_TO_coin_deal_tb_1" FOREIGN KEY (
	"coin_code"
)
REFERENCES "coin_info_tb" (
	"coin_code"
);

ALTER TABLE "coin_deal_tb" ADD CONSTRAINT "FK_fim_acc_tb_TO_coin_deal_tb_1" FOREIGN KEY (
	"fim_acc_num2"
)
REFERENCES "fim_acc_tb" (
	"fim_acc_num"
);

ALTER TABLE "coin_price_his_tb" ADD CONSTRAINT "FK_coin_info_tb_TO_coin_price_his_tb_1" FOREIGN KEY (
	"coin_code"
)
REFERENCES "coin_info_tb" (
	"coin_code"
);

ALTER TABLE "coin_deal_amt_his_tb" ADD CONSTRAINT "FK_coin_info_tb_TO_coin_deal_amt_his_tb_1" FOREIGN KEY (
	"coin_code"
)
REFERENCES "coin_info_tb" (
	"coin_code"
);

ALTER TABLE "stock_deal_tb" ADD CONSTRAINT "FK_stock_tb_TO_stock_deal_tb_1" FOREIGN KEY (
	"stock_code"
)
REFERENCES "stock_tb" (
	"stock_code"
);

ALTER TABLE "stock_deal_tb" ADD CONSTRAINT "FK_fim_acc_tb_TO_stock_deal_tb_1" FOREIGN KEY (
	"fim_acc_num2"
)
REFERENCES "fim_acc_tb" (
	"fim_acc_num"
);

ALTER TABLE "stock_deal_tb" ADD CONSTRAINT "FK_stock_deal_canc_attribute_TO_stock_deal_tb_1" FOREIGN KEY (
	"stock_deal_canc_id"
)
REFERENCES "stock_deal_canc_attribute" (
	"stock_deal_canc_id"
);

ALTER TABLE "stock_deal_amt_his" ADD CONSTRAINT "FK_stock_tb_TO_stock_deal_amt_his_1" FOREIGN KEY (
	"stock_code"
)
REFERENCES "stock_tb" (
	"stock_code"
);

ALTER TABLE "stock_price_his_tb" ADD CONSTRAINT "FK_stock_tb_TO_stock_price_his_tb_1" FOREIGN KEY (
	"stock_code"
)
REFERENCES "stock_tb" (
	"stock_code"
);

ALTER TABLE "card_code" ADD CONSTRAINT "FK_bank_code_TO_card_code_1" FOREIGN KEY (
	"bank_code"
)
REFERENCES "bank_code" (
	"bank_code"
);

ALTER TABLE "fim_his_tb" ADD CONSTRAINT "FK_fim_acc_tb_TO_fim_his_tb_1" FOREIGN KEY (
	"fim_acc_num"
)
REFERENCES "fim_acc_tb" (
	"fim_acc_num"
);

