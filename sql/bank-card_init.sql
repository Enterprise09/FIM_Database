-- 회원 (user_tb)
CREATE TABLE user_tb (
	user_id varchar(20) PRIMARY KEY,
	user_pw varchar(30),
	user_pn char(20),
	user_em varchar(30),
	user_addr varchar(60),
	user_name varchar(20)
);

INSERT INTO user_tb VALUES('abcde', 'f123456', '010-1234-5678', 'abcde@naver.com', '인천광역시 계양구 작전서운동', '유덕창');
INSERT INTO user_tb VALUES('king123', 'q7851123', '010-7654-5431', 'king123@naver.com', '경기도 부천시 역곡3동', '사마철');
INSERT INTO user_tb VALUES('hhuunn', 'a546657s', '010-5672-8572', 'hhuunn@hanmail.net', '서울시 양천구 신정3동', '양수형');
INSERT INTO user_tb VALUES('yuhan', 's468d34q', '010-2495-7325', 'yuhan@gmail.com', '서울시 마포구 공덕동', '묵정호');
INSERT INTO user_tb VALUES('computer', 'g123qsa5', '010-3487-1365', 'computer@naver.com', '경기도 용인시 기흥구', '지혁궁');
INSERT INTO user_tb VALUES('software', 'h15esq83', '010-9734-7567', 'software@daum.net', '경기도 화성시 팔탄면', '추득만');
INSERT INTO user_tb VALUES('ssdhdd', 'z5gq1587', '010-1679-5431', 'ssdhdd@naver.com', '충청남도 연기군 조치원읍', '남익황');
INSERT INTO user_tb VALUES('zzzaaa', 'a453qf87', '010-7531-1347', 'zzzaaa@gmail.com', '부산광역시 부산진구 부전동', '육만춘');
INSERT INTO user_tb VALUES('haha369', '9sg4a6q', '010-7613-9753', 'haha369@naver.com', '대전광역시 서구 용문동', '태백홍');
INSERT INTO user_tb VALUES('hohoho', '55ad8gqs', '010-4687-6873', 'hohoho@naver.com', '강원도 양양군 손양면', '명지광');

-- FIM 계좌 (fim_acc_tb)
CREATE TABLE fim_acc_tb (
	fim_acc_num varchar(25) PRIMARY KEY,
	user_id varchar(20),
	CONSTRAINT fk_fim_acc_tb FOREIGN KEY(user_id) REFERENCES user_tb(user_id)
);

INSERT INTO fim_acc_tb VALUES('110422215369', 'abcde');
INSERT INTO fim_acc_tb VALUES('884202032024', 'king123');
INSERT INTO fim_acc_tb VALUES('547345770123', 'hhuunn');
INSERT INTO fim_acc_tb VALUES('431822453125', 'yuhan');
INSERT INTO fim_acc_tb VALUES('110425589144', 'computer');
INSERT INTO fim_acc_tb VALUES('874263185155', 'software');
INSERT INTO fim_acc_tb VALUES('651258151500', 'ssdhdd');
INSERT INTO fim_acc_tb VALUES('105023364489', 'zzzaaa');
INSERT INTO fim_acc_tb VALUES('111002548799', 'haha369');
INSERT INTO fim_acc_tb VALUES('123458666941', 'hohoho');

-- 은행코드 (bank_code_tb)
CREATE TABLE bank_code_tb(
	bank_code number(10,0) PRIMARY KEY,
	bank_name varchar(20)
);

INSERT INTO bank_code_tb VALUES(004, '국민 은행');
INSERT INTO bank_code_tb VALUES(020, '우리 은행');
INSERT INTO bank_code_tb VALUES(088, '신한 은행');
INSERT INTO bank_code_tb VALUES(081, '하나 은행');
INSERT INTO bank_code_tb VALUES(011, 'NH 농협');
INSERT INTO bank_code_tb VALUES(023, '제일 은행');
INSERT INTO bank_code_tb VALUES(045, '새마을 금고');
INSERT INTO bank_code_tb VALUES(090, '카카오 뱅크');

-- 카드코드 (card_code_tb) 
CREATE TABLE card_code_tb(
	card_code number(10,0) PRIMARY KEY,
	bank_code number(10,0),
	card_name varchar(20),
	CONSTRAINT fk_card_code_tb FOREIGN KEY(bank_code) REFERENCES bank_code_tb(bank_code)
);

INSERT INTO card_code_tb VALUES(111, 081, '하나 신용');
INSERT INTO card_code_tb VALUES(132, 081, '하나 체크');
INSERT INTO card_code_tb VALUES(155, 004, '국민 신용');
INSERT INTO card_code_tb VALUES(142, 004, '국민 체크');
INSERT INTO card_code_tb VALUES(133, 088, '신한 신용');
INSERT INTO card_code_tb VALUES(223, 088, '신한 체크');
INSERT INTO card_code_tb VALUES(548, 020, '우리 신용');
INSERT INTO card_code_tb VALUES(331, 020, '우리 체크');
INSERT INTO card_code_tb VALUES(125, 011, '농협 신용');
INSERT INTO card_code_tb VALUES(556, 011, '농협 체크');
INSERT INTO card_code_tb VALUES(218, 090, '카카오 신용');
INSERT INTO card_code_tb VALUES(355, 045, '새마을 신용');

-- 보유 계좌(acc_tb)
CREATE TABLE acc_tb(
	acc_num varchar2(25) PRIMARY KEY,
	bank_code number(10,0),
	fim_acc_num varchar(25),
	acc_bal number (16,0),
	acc_type number(1,0),
	acc_intrate number(4,2),
	fim_priority number(2),
	CONSTRAINT fk_acc_tb_b FOREIGN KEY(bank_code) REFERENCES bank_code_tb(bank_code),
	CONSTRAINT fk_acc_tb_f FOREIGN KEY(fim_acc_num) REFERENCES fim_acc_tb(fim_acc_num)
);

INSERT INTO acc_tb VALUES('9002167098234', 004, '110422215369', 3895400, 1, 1.77, 3);
INSERT INTO acc_tb VALUES('9002456856874', 081, '884202032024', 744000, 1, 1.43, 1);
INSERT INTO acc_tb VALUES('6565010166625', 081, '547345770123', 8491240, 2, 1.8, 2);
INSERT INTO acc_tb VALUES('6565010485548', 011, '431822453125', 662200, 3, 1.3, 3);
INSERT INTO acc_tb VALUES('3224022250365', 090, '110425589144', 330000, 4, 1.6, 2);
INSERT INTO acc_tb VALUES('3333145815497', 045, '874263185155', 2221100, 5, 1.92, 2);
INSERT INTO acc_tb VALUES('5560020414603', 020, '651258151500', 4000000, 6, 1.46, 1);
INSERT INTO acc_tb VALUES('1688010042339', 088, '105023364489', 3872000, 7, 1.74, 1);
INSERT INTO acc_tb VALUES('7900445851319', 011, '111002548799', 41000000, 8, 1.52, 3);
INSERT INTO acc_tb VALUES('5048839145232', 088, '123458666941', 500000, 9, 1.69, 1);

-- 카드(card_tb)
CREATE TABLE card_tb(
	card_num varchar2(25) PRIMARY KEY,
	card_code number(10,0),
	acc_num varchar(25),
	card_pw number(4,0),
	card_exp date,
	card_cvc number(3,0),
	CONSTRAINT fk_card_tb_a FOREIGN KEY(acc_num) REFERENCES acc_tb(acc_num),
	CONSTRAINT fk_card_tb_c FOREIGN KEY(card_code) REFERENCES card_code_tb(card_code)
);

INSERT INTO card_tb VALUES('9700450160451230', 111, '9002167098234', 1230, '2024-12-25', 120);
INSERT INTO card_tb VALUES('9700450764543240', 132, '9002456856874', 1112, '2024-08-26', 845);
INSERT INTO card_tb VALUES('1012154666248040', 142, '6565010166625', 2346, '2025-12-30', 684);
INSERT INTO card_tb VALUES('1012265480680120', 155, '6565010485548', 4898, '2025-06-30', 410);
INSERT INTO card_tb VALUES('3008209245680050', 556, '3224022250365', 9848, '2024-07-28', 503);
INSERT INTO card_tb VALUES('6070865482310500', 223, '3333145815497', 2865, '2023-12-10', 721);
INSERT INTO card_tb VALUES('9700478216510650', 132, '5560020414603', 4856, '2023-10-30', 165);
INSERT INTO card_tb VALUES('5560789512358000', 218, '1688010042339', 4865, '2025-11-30', 342);
INSERT INTO card_tb VALUES('4445079234567800', 355, '7900445851319', 6542, '2026-11-25', 945);

-- 카드 사용 내역(card_paym_tb)
CREATE TABLE card_paym_tb(
	card_paym_datetime date PRIMARY KEY,
	card_num varchar(25),
	card_paym_amt number(10,0),
	card_paym_cont varchar(15),
	card_paym_date date,
	CONSTRAINT fk_card_paym_tb FOREIGN KEY(card_num) REFERENCES card_tb(card_num)
);

-- 계좌 내역(acc_his_tb)
CREATE TABLE acc_his_tb(
	his_datetime date PRIMARY KEY,
	acc_num varchar(25),
	his_type number(1,0),
	his_amt number(10,0),
	his_cont number(15,0),
	his_targetnum varchar(15),
	CONSTRAINT acc_his_tb FOREIGN KEY(acc_num) REFERENCES acc_tb(acc_num)
);