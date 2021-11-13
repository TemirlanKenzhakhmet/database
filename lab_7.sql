-- task 1
-- SQL provides large-object data types for character data (clob) and binary data (blob)
-- You can also use an SQL query to get the "locator" for a large object, and then use the locator to manipulate the object.

-- task 2.1
create role accountant;
create role administrator;
create role support;
grant all privileges on accounts, transactions to accountant;
grant all privileges on customers, accounts, transactions to administrator;
grant select, insert, delete on accounts to support;

-- task 2.2
create user Sabina;
grant accountant to Sabina;
create user Johny;
grant administrator to Johny;
create user Timokha;
grant support to Timokha;

-- task 2.3
grant administrator to Timokha with admin option;
-- or
grant all privileges on customers, accounts, transactions to Timokha with grant option;
-- or
alter role support createrole;

-- task 2.4
revoke insert on accounts from Timokha;

-- task 3.1
create assertion same_currency check
((select currency
  from accounts a join transactions on transactions.src_account = a.account_id) =
    (select currency
     from accounts a join transactions on transactions.dst_account = a.account_id));

-- task 3.2
alter table customers alter column birth_date set not null;

-- task 4
create type val as (sql varchar(3));
alter table accounts alter column currency type val;

-- task 5.1
create unique index un_cur on accounts(customer_id, currency);

-- task 5.2
create view trans
    as select * from transactions, accounts
            where src_account = accounts.account_id or dst_account = accounts.account_id;

create index search_trans on trans(currency, balance);

-- task 6
begin;
update accounts set balance = balance - 400 where account_id = 'RS88012';
savepoint oops;
update accounts set balance = balance + 400 where account_id = 'NT10204';
rollback to oops;
commit;
