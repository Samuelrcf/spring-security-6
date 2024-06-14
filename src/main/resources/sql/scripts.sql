 CREATE TABLE customer (
  id SERIAL PRIMARY KEY,
  name varchar(100) NOT NULL,
  email varchar(100) NOT NULL,
  mobile_number varchar(20) NOT NULL,
  pwd varchar(500) NOT NULL,
  role varchar(100) NOT NULL,
  create_dt date DEFAULT NULL
);
 
INSERT INTO customer (name,email,mobile_number, pwd, role,create_dt)
 VALUES ('Happy','happy@example.com','9876548337', '$2y$12$oRRbkNfwuR8ug4MlzH5FOeui.//1mkd.RsOAJMbykTSupVy.x/vb2', 'admin',current_date);
 
CREATE TABLE account (
  customer_id int REFERENCES customer(id),
   account_number int PRIMARY KEY,
  account_type varchar(100) NOT NULL,
  branch_address varchar(200) NOT NULL,
  create_dt date DEFAULT NULL
);
 
INSERT INTO account (customer_id, account_number, account_type, branch_address, create_dt)
 VALUES (1, 1865764534, 'Savings', '123 Main Street, New York', current_date);
 
CREATE TABLE account_transaction (
  transaction_id SERIAL PRIMARY KEY,
  account_number int NOT NULL REFERENCES account(account_number),
  customer_id int NOT NULL REFERENCES customer(id),
  transaction_dt date NOT NULL,
  transaction_summary varchar(200) NOT NULL,
  transaction_type varchar(100) NOT NULL,
  transaction_amt int NOT NULL,
  closing_balance int NOT NULL,
  create_dt date DEFAULT NULL
);
 
INSERT INTO account_transaction (account_number, customer_id, transaction_dt, transaction_summary, transaction_type,transaction_amt,
closing_balance, create_dt)  VALUES (1865764534, 1, current_date + INTERVAL '7 days', 'Coffee Shop', 'Withdrawal', 30,34500,current_date + INTERVAL '7 days');
 
INSERT INTO account_transaction (account_number, customer_id, transaction_dt, transaction_summary, transaction_type,transaction_amt,
closing_balance, create_dt)  VALUES (1865764534, 1, current_date + INTERVAL '6 days', 'Uber', 'Withdrawal', 100,34400,current_date + INTERVAL '6 days');
 
INSERT INTO account_transaction (account_number, customer_id, transaction_dt, transaction_summary, transaction_type,transaction_amt,
closing_balance, create_dt)  VALUES (1865764534, 1, current_date + INTERVAL '5 days', 'Self Deposit', 'Deposit', 500,34900,current_date + INTERVAL '5 days');
 
INSERT INTO account_transaction (account_number, customer_id, transaction_dt, transaction_summary, transaction_type,transaction_amt,
closing_balance, create_dt)  VALUES (1865764534, 1, current_date + INTERVAL '4 days', 'Ebay', 'Withdrawal', 600,34300,current_date + INTERVAL '4 days');
 
INSERT INTO account_transaction (account_number, customer_id, transaction_dt, transaction_summary, transaction_type,transaction_amt,
closing_balance, create_dt)  VALUES (1865764534, 1, current_date + INTERVAL '2 days', 'OnlineTransfer', 'Deposit', 700,35000,current_date + INTERVAL '2 days');
 
INSERT INTO account_transaction (account_number, customer_id, transaction_dt, transaction_summary, transaction_type,transaction_amt,
closing_balance, create_dt)  VALUES (1865764534, 1, current_date + INTERVAL '1 day', 'Amazon.com', 'Withdrawal', 100,34900,current_date + INTERVAL '1 day');
 
 
CREATE TABLE loan (
  loan_number SERIAL PRIMARY KEY,
  customer_id int NOT NULL REFERENCES customer(id),
  start_dt date NOT NULL,
  loan_type varchar(100) NOT NULL,
  total_loan int NOT NULL,
  amount_paid int NOT NULL,
  outstanding_amount int NOT NULL,
  create_dt date DEFAULT NULL
);
 
INSERT INTO loan ( customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
 VALUES ( 1, '2020-10-13', 'Home', 200000, 50000, 150000, '2020-10-13');
 
INSERT INTO loan ( customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
 VALUES ( 1, '2020-06-06', 'Vehicle', 40000, 10000, 30000, '2020-06-06');
 
INSERT INTO loan ( customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
 VALUES ( 1, '2018-02-14', 'Home', 50000, 10000, 40000, '2018-02-14');
 
INSERT INTO loan ( customer_id, start_dt, loan_type, total_loan, amount_paid, outstanding_amount, create_dt)
 VALUES ( 1, '2018-02-14', 'Personal', 10000, 3500, 6500, '2018-02-14');
 
CREATE TABLE card (
  id SERIAL NOT NULL PRIMARY KEY,
  card_number varchar(100) NOT NULL,
  customer_id int NOT NULL REFERENCES customer(id),
  card_type varchar(100) NOT NULL,
  total_limit int NOT NULL,
  amount_used int NOT NULL,
  available_amount int NOT NULL,
  create_dt date DEFAULT NULL
);
 
INSERT INTO card (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
 VALUES ('4565XXXX4656', 1, 'Credit', 10000, 500, 9500, current_date);
 
INSERT INTO card (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
 VALUES ('3455XXXX8673', 1, 'Credit', 7500, 600, 6900, current_date);
 
INSERT INTO card (card_number, customer_id, card_type, total_limit, amount_used, available_amount, create_dt)
 VALUES ('2359XXXX9346', 1, 'Credit', 20000, 4000, 16000, current_date);
 
CREATE TABLE notice_detail (
  id SERIAL PRIMARY KEY,
  notice_summary varchar(200) NOT NULL,
  notice_details varchar(500) NOT NULL,
  notic_beg_dt date NOT NULL,
  notic_end_dt date DEFAULT NULL,
  create_dt date DEFAULT NULL,
  update_dt date DEFAULT NULL
);
 
INSERT INTO notice_detail ( notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Home Loan Interest rates reduced', 'Home loan interest rates are reduced as per the goverment guidelines. The updated rates will be effective immediately',
current_date - INTERVAL '30 days', current_date + INTERVAL '30 days', current_date, null);
 
INSERT INTO notice_detail ( notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Net Banking Offers', 'Customers who will opt for Internet banking while opening a saving account will get a $50 amazon voucher',
current_date - INTERVAL '30 days', current_date + INTERVAL '30 days', current_date, null);
 
INSERT INTO notice_detail ( notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Mobile App Downtime', 'The mobile application of the EazyBank will be down from 2AM-5AM on 12/05/2020 due to maintenance activities',
current_date - INTERVAL '30 days', current_date + INTERVAL '30 days', current_date, null);
 
INSERT INTO notice_detail ( notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('E Auction notice', 'There will be a e-auction on 12/08/2020 on the Bank website for all the stubborn arrears.Interested parties can participate in the e-auction',
current_date - INTERVAL '30 days', current_date + INTERVAL '30 days', current_date, null);
 
INSERT INTO notice_detail ( notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('Launch of Millennia Cards', 'Millennia Credit Cards are launched for the premium customers of EazyBank. With these cards, you will get 5% cashback for each purchase',
current_date - INTERVAL '30 days', current_date + INTERVAL '30 days', current_date, null);
 
INSERT INTO notice_detail ( notice_summary, notice_details, notic_beg_dt, notic_end_dt, create_dt, update_dt)
VALUES ('COVID-19 Insurance', 'EazyBank launched an insurance policy which will cover COVID-19 expenses. Please reach out to the branch for more details',
current_date - INTERVAL '30 days', current_date + INTERVAL '30 days', current_date, null);
 
CREATE TABLE contact_message (
  id varchar(50) NOT NULL PRIMARY KEY,
  contact_name varchar(50) NOT NULL,
  contact_email varchar(100) NOT NULL,
  subject varchar(500) NOT NULL,
  message varchar(2000) NOT NULL,
  create_dt date DEFAULT NULL
);