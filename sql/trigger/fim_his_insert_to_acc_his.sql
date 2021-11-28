create or replace trigger fim_his_insert_to_acc_his
after insert on fim_his_tb
if inserting then
    if new.fim_his_type = 0 then
        
    elsif new.fim_his_type = 1 then
    
    else then
        dbms_output.put_line("invalid value - fim_his_type");
end if;