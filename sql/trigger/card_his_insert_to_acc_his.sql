create or replace trigger card_paym_insert_to_acc_his
after inserting on card_paym_tb
for each row
begin
    if inserting then
        cursor c is 
        select * from card_tb 
        where card_num = new.card_num;

        c_res c%rowtype;
        fetch c into c_res;

        insert into acc_his_tb
        values (
            SYSDATE, //거래 시간
            c_res.acc_num, //계좌번호
            1, //송금종류
            new.card_paym_amt, //액수
            new.card_paym_cont, //거래내용
            null //계좌이체 수령인 계좌번호);
    end if;
end;
/