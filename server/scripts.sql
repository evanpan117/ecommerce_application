CREATE DATABASE bank_account;

\c bank_account;

CREATE TABLE admin_user(
  userid BIGSERIAL PRIMARY KEY NOT NULL,
  first_name VARCHAR(32) NOT NULL,
  last_name VARCHAR(32) NOT NULL,
  email VARCHAR(32) NOT NULL,
  password VARCHAR(255) NOT NULL,
  unique(email)
);

CREATE TABLE TOKENS(
  id BIGSERIAL PRIMARY KEY NOT NULL,
  access_token VARCHAR(500) NOT NULL,
  userid BIGSERIAL NOT NULL,
  FOREIGN KEY(userid) REFERENCES admin_user(userid)
);

CREATE TABLE account(
  account_id BIGSERIAL PRIMARY KEY NOT NULL,
  account_no BIGINT NOT NULL,
  bank_name VARCHAR(50) NOT NULL,
  ifsc VARCHAR(32) NOT NULL,
  userid INTEGER NOT NULL,
  total_balance BIGINT NOT NULL DEFAULT 0,
  FOREIGN KEY(userid) REFERENCES admin_user(userid)
);

CREATE TABLE transactions(
  tr_id BIGSERIAL PRIMARY KEY NOT NULL,
  transaction_date TIMESTAMP NOT NULL,
  withdraw_amount DECIMAL NULL,
  deposit_amount DECIMAL NULL,
  balance DECIMAL NOT NULL DEFAULT 0,
  account_id BIGINT NOT NULL,
  FOREIGN KEY(account_id) REFERENCES account(account_id)
);

CREATE TABLE public.products
(
    product_id bigint NOT NULL DEFAULT nextval('products_product_id_seq'::regclass),
    product_name character varying(32) COLLATE pg_catalog."default" NOT NULL,
    product_price double precision NOT NULL,
    product_quantity integer NOT NULL,
    product_description character varying COLLATE pg_catalog."default",
    CONSTRAINT products_pkey PRIMARY KEY (product_id)
);

CREATE TABLE public.sales
(
    sale_id bigint NOT NULL DEFAULT nextval('sales_sale_id_seq'::regclass),
    sale_product_id bigint NOT NULL DEFAULT nextval('sales_sale_product_id_seq'::regclass),
    sale_product_name character varying COLLATE pg_catalog."default" NOT NULL,
    sale_price double precision NOT NULL,
    sale_quantity integer NOT NULL,
    CONSTRAINT sales_pkey PRIMARY KEY (sale_id)
);



