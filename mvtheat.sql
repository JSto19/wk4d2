CREATE TABLE customer (
	cust_id SERIAL PRIMARY KEY,
	f_name VARCHAR(50),
	l_name VARCHAR(50),
	b_address VARCHAR(100),
	address VARCHAR(100),
	email VARCHAR(75),
	reward_prgrm INTEGER 
);

CREATE TABLE reward (
	cus_rew_id SERIAL PRIMARY KEY,
	points VARCHAR(1000),
	cust_id INTEGER,
	FOREIGN KEY(cust_id) REFERENCES customer(cust_id)
);

CREATE TABLE movie (
	ticket SERIAL PRIMARY KEY,
	seat_num VARCHAR(5),
	aisle_num VARCHAR(10),
	movie_time TIMESTAMP,
	cust_id INTEGER,
	FOREIGN KEY(cust_id) REFERENCES customer(cust_id)
);

CREATE TABLE ticket (
	order_id SERIAL PRIMARY KEY,
	total NUMERIC(6,2),
	quanitity INTEGER,
	event_date TIMESTAMP,
	pay_method VARCHAR(50),
	cust_id INTEGER,
	FOREIGN KEY(cust_id) REFERENCES customer(cust_id),
	cus_rew_id INTEGER,
	FOREIGN KEY(cus_rew_id) REFERENCES reward(cus_rew_id)
); --Had to change BOOLEAN to INTEGER. Also, cus_rew_id from reward-prgrm.

CREATE TABLE concessions (
	cust_order SERIAL PRIMARY KEY,
	food_cat VARCHAR(25),
	quantity INTEGER,
	total NUMERIC(6,2),
	cus_rew_id INTEGER,
	FOREIGN KEY(cus_rew_id) REFERENCES reward(cus_rew_id)
);--spelling error fixed, and ERD should have line to PK-reward table