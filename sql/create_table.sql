CREATE TABLE finance.users (
	id varchar NOT Null,
	created_date date NOT NULL,
	birth_date date NULL,
	gender varchar NULL,
	last_rewards_login date NULL,
	state varchar NULL,
	sign_up_platform varchar NULL,
	sign_up_source varchar null
	-- CONSTRAINT users_pk PRIMARY KEY (id)
);

ALTER TABLE finance.users ADD CONSTRAINT users_pk PRIMARY KEY (id);


CREATE TABLE finance.receipt_reward_status (
	id bigserial NOT NULL,
	"name" varchar null
	-- CONSTRAINT receipt_reward_status_pk PRIMARY KEY (id)
);

insert into finance.receipt_reward_status
(name)
values
('FINISHED'),
('REJECTED'),
('SUBMITTED'),
('FLAGGED'),
('PENDING');

CREATE TABLE finance.receipts (
	id varchar NOT NULL,
	store_name varchar NULL,
	purchase_datetime timestamp NULL,
	date_scanned timestamp NULL,
	total_spent numeric NULL,
	rewards_receipt_status integer NOT NULL,
	user_id varchar NULL,
	user_viewed boolean NULL,
	purchased_item_count integer NULL,
	create_date timestamp NOT NULL,
	pending_date timestamp NULL,
	modify_date timestamp NULL,
	flagged_date timestamp NULL,
	processed_date timestamp NULL,
	finished_date timestamp NULL,
	rejected_date timestamp NULL,
	needs_fetch_review varchar NULL,
	digital_receipt boolean NULL,
	deleted varchar NULL,
	non_point_earning_receipt boolean NULL
	-- CONSTRAINT receipts_pk PRIMARY KEY (id),
	-- CONSTRAINT receipts_fk FOREIGN KEY (id) REFERENCES trial.users(id)
);

ALTER TABLE finance.receipts ADD CONSTRAINT receipts_pk PRIMARY KEY (id);
ALTER TABLE finance.receipts ADD CONSTRAINT receipts_fk FOREIGN KEY (user_id) REFERENCES finance.users(id);


CREATE TABLE finance.receipt_items (
	id varchar NOT NULL,
	receipt_id varchar NOT NULL,
	item_index integer NOT NULL,
	description varchar NULL,
	barcode varchar NULL,
	brand_code varchar NULL,
	quantity_purchased numeric NULL,
	total_final_price numeric NULL,
	points_earned numeric NULL,
	rewards_group varchar NULL,
	original_receipt_item_text varchar NULL,
	modify_date timestamp NOT NULL
);
ALTER TABLE finance.receipt_items ADD CONSTRAINT receipt_items_pk PRIMARY KEY (id);
ALTER TABLE finance.receipt_items ADD CONSTRAINT receipt_items_fk FOREIGN KEY (receipt_id) REFERENCES finance.receipts(id);

CREATE TABLE finance.brands (
	id varchar NOT NULL,
	barcode varchar NOT NULL,
	brand_code varchar NULL,
	cpg_id varchar NULL,
	category varchar NULL,
	category_code varchar NULL,
	"name" varchar NULL,
	romance_text varchar NULL,
	related_brand_ids varchar NULL
);


ALTER TABLE finance.brands ADD CONSTRAINT brands_pk PRIMARY KEY (barcode);
ALTER TABLE finance.brands ADD CONSTRAINT brands_un UNIQUE (id);
ALTER TABLE finance.receipt_items ADD CONSTRAINT receipt_items_fk FOREIGN KEY (barcode) REFERENCES finance.brands(barcode);
ALTER TABLE finance.receipt_items ADD CONSTRAINT receipt_items_fk_1 FOREIGN KEY (receipt_id) REFERENCES finance.receipt_items(id);




