--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.2

-- Started on 2020-12-02 23:32:50 PST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 208 (class 1259 OID 16422)
-- Name: account; Type: TABLE; Schema: public; Owner: evan
--

CREATE TABLE public.account (
    account_id bigint NOT NULL,
    account_no bigint NOT NULL,
    bank_name character varying(50) NOT NULL,
    ifsc character varying(32) NOT NULL,
    userid integer NOT NULL,
    total_balance bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.account OWNER TO evan;

--
-- TOC entry 207 (class 1259 OID 16420)
-- Name: account_account_id_seq; Type: SEQUENCE; Schema: public; Owner: evan
--

CREATE SEQUENCE public.account_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_account_id_seq OWNER TO evan;

--
-- TOC entry 3301 (class 0 OID 0)
-- Dependencies: 207
-- Name: account_account_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evan
--

ALTER SEQUENCE public.account_account_id_seq OWNED BY public.account.account_id;


--
-- TOC entry 203 (class 1259 OID 16387)
-- Name: admin_user; Type: TABLE; Schema: public; Owner: evan
--

CREATE TABLE public.admin_user (
    userid bigint NOT NULL,
    first_name character varying(32) NOT NULL,
    last_name character varying(32) NOT NULL,
    email character varying(32) NOT NULL,
    password character varying(255) NOT NULL
);


ALTER TABLE public.admin_user OWNER TO evan;

--
-- TOC entry 202 (class 1259 OID 16385)
-- Name: bank_user_userid_seq; Type: SEQUENCE; Schema: public; Owner: evan
--

CREATE SEQUENCE public.bank_user_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bank_user_userid_seq OWNER TO evan;

--
-- TOC entry 3302 (class 0 OID 0)
-- Dependencies: 202
-- Name: bank_user_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evan
--

ALTER SEQUENCE public.bank_user_userid_seq OWNED BY public.admin_user.userid;


--
-- TOC entry 212 (class 1259 OID 16453)
-- Name: products; Type: TABLE; Schema: public; Owner: evan
--

CREATE TABLE public.products (
    product_id bigint NOT NULL,
    product_name character varying(32) NOT NULL,
    product_price double precision NOT NULL,
    product_quantity integer NOT NULL,
    product_description character varying
);


ALTER TABLE public.products OWNER TO evan;

--
-- TOC entry 211 (class 1259 OID 16451)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: evan
--

CREATE SEQUENCE public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_product_id_seq OWNER TO evan;

--
-- TOC entry 3303 (class 0 OID 0)
-- Dependencies: 211
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evan
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 215 (class 1259 OID 16466)
-- Name: sales; Type: TABLE; Schema: public; Owner: evan
--

CREATE TABLE public.sales (
    sale_id bigint NOT NULL,
    sale_product_id bigint NOT NULL,
    sale_product_name character varying NOT NULL,
    sale_price double precision NOT NULL,
    sale_quantity integer NOT NULL
);


ALTER TABLE public.sales OWNER TO evan;

--
-- TOC entry 213 (class 1259 OID 16462)
-- Name: sales_sale_id_seq; Type: SEQUENCE; Schema: public; Owner: evan
--

CREATE SEQUENCE public.sales_sale_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_sale_id_seq OWNER TO evan;

--
-- TOC entry 3304 (class 0 OID 0)
-- Dependencies: 213
-- Name: sales_sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evan
--

ALTER SEQUENCE public.sales_sale_id_seq OWNED BY public.sales.sale_id;


--
-- TOC entry 214 (class 1259 OID 16464)
-- Name: sales_sale_product_id_seq; Type: SEQUENCE; Schema: public; Owner: evan
--

CREATE SEQUENCE public.sales_sale_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_sale_product_id_seq OWNER TO evan;

--
-- TOC entry 3305 (class 0 OID 0)
-- Dependencies: 214
-- Name: sales_sale_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evan
--

ALTER SEQUENCE public.sales_sale_product_id_seq OWNED BY public.sales.sale_product_id;


--
-- TOC entry 206 (class 1259 OID 16399)
-- Name: tokens; Type: TABLE; Schema: public; Owner: evan
--

CREATE TABLE public.tokens (
    id bigint NOT NULL,
    access_token character varying(500) NOT NULL,
    userid bigint NOT NULL
);


ALTER TABLE public.tokens OWNER TO evan;

--
-- TOC entry 204 (class 1259 OID 16395)
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: evan
--

CREATE SEQUENCE public.tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokens_id_seq OWNER TO evan;

--
-- TOC entry 3306 (class 0 OID 0)
-- Dependencies: 204
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evan
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- TOC entry 205 (class 1259 OID 16397)
-- Name: tokens_userid_seq; Type: SEQUENCE; Schema: public; Owner: evan
--

CREATE SEQUENCE public.tokens_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tokens_userid_seq OWNER TO evan;

--
-- TOC entry 3307 (class 0 OID 0)
-- Dependencies: 205
-- Name: tokens_userid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evan
--

ALTER SEQUENCE public.tokens_userid_seq OWNED BY public.tokens.userid;


--
-- TOC entry 210 (class 1259 OID 16436)
-- Name: transactions; Type: TABLE; Schema: public; Owner: evan
--

CREATE TABLE public.transactions (
    tr_id bigint NOT NULL,
    transaction_date timestamp without time zone NOT NULL,
    withdraw_amount numeric,
    deposit_amount numeric,
    balance numeric DEFAULT 0 NOT NULL,
    account_id bigint NOT NULL
);


ALTER TABLE public.transactions OWNER TO evan;

--
-- TOC entry 209 (class 1259 OID 16434)
-- Name: transactions_tr_id_seq; Type: SEQUENCE; Schema: public; Owner: evan
--

CREATE SEQUENCE public.transactions_tr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transactions_tr_id_seq OWNER TO evan;

--
-- TOC entry 3308 (class 0 OID 0)
-- Dependencies: 209
-- Name: transactions_tr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: evan
--

ALTER SEQUENCE public.transactions_tr_id_seq OWNED BY public.transactions.tr_id;


--
-- TOC entry 3132 (class 2604 OID 16425)
-- Name: account account_id; Type: DEFAULT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.account ALTER COLUMN account_id SET DEFAULT nextval('public.account_account_id_seq'::regclass);


--
-- TOC entry 3129 (class 2604 OID 16390)
-- Name: admin_user userid; Type: DEFAULT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.admin_user ALTER COLUMN userid SET DEFAULT nextval('public.bank_user_userid_seq'::regclass);


--
-- TOC entry 3136 (class 2604 OID 16456)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- TOC entry 3137 (class 2604 OID 16469)
-- Name: sales sale_id; Type: DEFAULT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.sales ALTER COLUMN sale_id SET DEFAULT nextval('public.sales_sale_id_seq'::regclass);


--
-- TOC entry 3138 (class 2604 OID 16470)
-- Name: sales sale_product_id; Type: DEFAULT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.sales ALTER COLUMN sale_product_id SET DEFAULT nextval('public.sales_sale_product_id_seq'::regclass);


--
-- TOC entry 3130 (class 2604 OID 16402)
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- TOC entry 3131 (class 2604 OID 16403)
-- Name: tokens userid; Type: DEFAULT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.tokens ALTER COLUMN userid SET DEFAULT nextval('public.tokens_userid_seq'::regclass);


--
-- TOC entry 3134 (class 2604 OID 16439)
-- Name: transactions tr_id; Type: DEFAULT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.transactions ALTER COLUMN tr_id SET DEFAULT nextval('public.transactions_tr_id_seq'::regclass);


--
-- TOC entry 3288 (class 0 OID 16422)
-- Dependencies: 208
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: evan
--

COPY public.account (account_id, account_no, bank_name, ifsc, userid, total_balance) FROM stdin;
2	123	hdfc	12345	4	3000000
1	1888548330	boa	19292283	1	8084
\.


--
-- TOC entry 3283 (class 0 OID 16387)
-- Dependencies: 203
-- Data for Name: admin_user; Type: TABLE DATA; Schema: public; Owner: evan
--

COPY public.admin_user (userid, first_name, last_name, email, password) FROM stdin;
2	test	abc	APPLE@GMAIL.COM	$2a$08$O8HhC9.CzeJn88bmWVrdYuoTlFmhD0gvBFazWKq4UmxM149dG2PCe
3	test1	pp	test@gmail.com	$2a$08$G7vp//o5RDsT1SmwXe7J.etRJGWlukTfXKtNwpDglC1rieuzTgnc2
4	Raj	chhatbar	chhatbarraj7@gmail.com	$2a$08$EWm2oWh46F/tCLj7QcjQ6OzIajblaEdmj3B4EPtxZ/Jmq9gfpg5T6
1	evan1	pan	ilivepan@gmail.com	$2a$08$qFwJSnI/akJVZgJCSoGVP.zkc0T6G.Bb45eHiwgGzrYzJY4fF6f4a
5	evan	pan	panhaojie8@gmail.com	$2a$08$mGpOHNbKnsIuQM4G1WxmJeg8S3QhIKJfgoq9gSQM3N2vOvTU1Cw.q
\.


--
-- TOC entry 3292 (class 0 OID 16453)
-- Dependencies: 212
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: evan
--

COPY public.products (product_id, product_name, product_price, product_quantity, product_description) FROM stdin;
10	cookie	2	19	\N
7	orange	2	10	tasty
9	coke	1	6	nice 
19	apple tree	50	25	\N
3	Iphone 123	899.66	99	This is the latest iphone
5	apple	2	187	Fuji apple
23	apple tree	50	25	\N
8	iphone 1	199	9	Original iphone
1	Iphone 11	799.66	97	This is the latest iphone
2	Iphone 11	799.66	95	This is the latest iphone
\.


--
-- TOC entry 3295 (class 0 OID 16466)
-- Dependencies: 215
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: evan
--

COPY public.sales (sale_id, sale_product_id, sale_product_name, sale_price, sale_quantity) FROM stdin;
\.


--
-- TOC entry 3286 (class 0 OID 16399)
-- Dependencies: 206
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: evan
--

COPY public.tokens (id, access_token, userid) FROM stdin;
3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE1OTk5NDg0NDB9._Vv3P3MdAuGravI0dDg3e7zoGnduwJ98PfiUYUPkm0o	1
5	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDAyMjQzOTV9.1hC9Ixv9EyQL-S--i8ZkE6Phu-ixRbebBqP8HBKjKWM	1
9	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDA1Mzg2ODl9.jDt3on7bWuRcuH0yxxNP5r6OoaydAXtYWSjiBDmf5EE	1
10	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDA1Mzg2OTF9.qp-j8k_2cE9OpgbRMSpWWUvdhJR-PGqUSLubl87i5Pg	1
11	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDA1Mzg2OTJ9.S4w_I02jl4jciPGbiTfrYWcDgSGmTlBAfh1RFqozrLQ	1
12	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDA1Mzg2OTR9.XcxmO4C9FRZdVlz905ECoxYOKcY5H1DUdrsGAoOM3AY	1
13	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDA1Mzg2OTV9.OJ6vTClJqSOHXU_STKbzi4U7ciD7LriYCwq4vUvdBks	1
19	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIzIiwiZW1haWwiOiJ0ZXN0QGdtYWlsLmNvbSIsImlhdCI6MTYwMDg4OTI3N30.yLZ9KmwZeZ5LujzfWJXiIZF3v4DhK2GFIEGx3Wa-6Z4	3
21	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIzIiwiZW1haWwiOiJ0ZXN0QGdtYWlsLmNvbSIsImlhdCI6MTYwMDkwMzMyMH0.yUUc75EjMaAvtPA_YbRVLpB8KE1ROvooI2hKugGenHI	3
23	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDEwNzU3ODl9._saCYfRIfZAbDaPoXX1Whm722LWFp_ZIDLODgFnSUaw	1
24	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiI0IiwiZW1haWwiOiJjaGhhdGJhcnJhajdAZ21haWwuY29tIiwiaWF0IjoxNjAxMDc2MDA2fQ.rR44dtTQbFpfoV0jNgyqd3cNvRLmBno7SwtnMpvlbcc	4
26	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiI0IiwiZW1haWwiOiJjaGhhdGJhcnJhajdAZ21haWwuY29tIiwiaWF0IjoxNjAxMzI4OTA5fQ.u-UsVgrW_AiiLctkhg1ZTMMzdobiarVhYPSf1v5oMRs	4
29	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDI4OTIyMzd9.5Bj1Z7Fgzb8-W8Q8k-RSM8wwqBvUy1aB_pzN7f0TK6E	1
30	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDMyNTQyNTV9.jvo3XhXdTunJVCtd1nDKojDeD2ZdT6Q5mkqsST5UnN4	1
31	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDMyNTQ4MTJ9.3nYtQfVq_I5ptnsWZRJLm99OSWm9q6aJZucoKXXb6QQ	1
32	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDMyNTg3MDV9.y36st0smeLOC2tiCLWsT8cHmAz0XpfJAYCMYlWrY6sE	1
35	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDM2NzY2MDJ9.ykHIJqnaqiVczjIhelFf17u_SgpNw5_9E5t-DgDB010	1
38	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDM3Mzk4OTF9.HhL7MIU6tlTkFTCDbovBCXXACBfyz17ekt0UkjpMQMM	1
41	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDYyNTE5OTl9.2iv2T3-clb9Y_m7Vi0rd9_Vj0j-Pz-wz-i9XWMiVoY0	1
43	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDY0NTMxODd9.HxJQTfBUn4qiQ8N4ybaEeZqQNAqU2xlSCQeIgshG5Eo	1
44	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDY4MDk1NTV9._Rjc1F5b6IMrv-Wpu2DB68e9ELN_DLgO6_CG7MIqwWI	1
54	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyaWQiOiIxIiwiZW1haWwiOiJpbGl2ZXBhbkBnbWFpbC5jb20iLCJpYXQiOjE2MDY5NzQ2NDF9.lNgKfQ69yDb038jE_qFQEFP0D--XDYFSLPPyQpJbIJs	1
\.


--
-- TOC entry 3290 (class 0 OID 16436)
-- Dependencies: 210
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: evan
--

COPY public.transactions (tr_id, transaction_date, withdraw_amount, deposit_amount, balance, account_id) FROM stdin;
1	2020-09-12 23:26:23.211	\N	12222	12222	1
2	2020-09-12 23:26:29.059	12	\N	12210	1
3	2020-09-16 02:45:32.284	5000	\N	7210	1
4	2020-09-16 02:45:40.536	\N	500	7710	1
5	2020-09-23 23:28:15.139	50	\N	7660	1
6	2020-09-25 23:25:21.345	\N	3000000	3000000	2
7	2020-09-29 06:09:50.77	\N	23	7683	1
8	2020-09-29 06:09:53.352	\N	23	7706	1
9	2020-09-29 06:09:54.488	\N	23	7729	1
10	2020-09-29 06:09:54.972	\N	23	7752	1
11	2020-09-29 06:09:55.156	\N	23	7775	1
12	2020-09-29 06:09:55.338	\N	23	7798	1
13	2020-09-29 06:09:55.85	\N	23	7821	1
14	2020-09-29 06:09:56.042	\N	23	7844	1
15	2020-09-29 06:09:56.22	\N	23	7867	1
16	2020-09-29 06:09:56.406	\N	23	7890	1
17	2020-09-29 06:09:56.59	\N	23	7913	1
18	2020-09-29 06:09:56.728	\N	23	7936	1
19	2020-09-29 06:09:56.88	\N	23	7959	1
20	2020-09-29 06:09:57.042	\N	23	7982	1
21	2020-09-29 06:09:57.208	\N	23	8005	1
22	2020-09-29 06:09:57.36	\N	23	8028	1
23	2020-09-29 06:09:58.504	\N	23	8051	1
24	2020-09-29 06:09:58.73	\N	23	8074	1
25	2020-10-01 05:19:39.874	\N	20	8094	1
26	2020-12-01 08:00:41.046	10	\N	8084	1
\.


--
-- TOC entry 3309 (class 0 OID 0)
-- Dependencies: 207
-- Name: account_account_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evan
--

SELECT pg_catalog.setval('public.account_account_id_seq', 2, true);


--
-- TOC entry 3310 (class 0 OID 0)
-- Dependencies: 202
-- Name: bank_user_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: evan
--

SELECT pg_catalog.setval('public.bank_user_userid_seq', 5, true);


--
-- TOC entry 3311 (class 0 OID 0)
-- Dependencies: 211
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evan
--

SELECT pg_catalog.setval('public.products_product_id_seq', 23, true);


--
-- TOC entry 3312 (class 0 OID 0)
-- Dependencies: 213
-- Name: sales_sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evan
--

SELECT pg_catalog.setval('public.sales_sale_id_seq', 1, false);


--
-- TOC entry 3313 (class 0 OID 0)
-- Dependencies: 214
-- Name: sales_sale_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evan
--

SELECT pg_catalog.setval('public.sales_sale_product_id_seq', 1, false);


--
-- TOC entry 3314 (class 0 OID 0)
-- Dependencies: 204
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evan
--

SELECT pg_catalog.setval('public.tokens_id_seq', 54, true);


--
-- TOC entry 3315 (class 0 OID 0)
-- Dependencies: 205
-- Name: tokens_userid_seq; Type: SEQUENCE SET; Schema: public; Owner: evan
--

SELECT pg_catalog.setval('public.tokens_userid_seq', 1, false);


--
-- TOC entry 3316 (class 0 OID 0)
-- Dependencies: 209
-- Name: transactions_tr_id_seq; Type: SEQUENCE SET; Schema: public; Owner: evan
--

SELECT pg_catalog.setval('public.transactions_tr_id_seq', 26, true);


--
-- TOC entry 3146 (class 2606 OID 16428)
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (account_id);


--
-- TOC entry 3140 (class 2606 OID 16394)
-- Name: admin_user bank_user_email_key; Type: CONSTRAINT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.admin_user
    ADD CONSTRAINT bank_user_email_key UNIQUE (email);


--
-- TOC entry 3142 (class 2606 OID 16392)
-- Name: admin_user bank_user_pkey; Type: CONSTRAINT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.admin_user
    ADD CONSTRAINT bank_user_pkey PRIMARY KEY (userid);


--
-- TOC entry 3150 (class 2606 OID 16461)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 3152 (class 2606 OID 16475)
-- Name: sales sales_pkey; Type: CONSTRAINT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (sale_id);


--
-- TOC entry 3144 (class 2606 OID 16408)
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3148 (class 2606 OID 16445)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (tr_id);


--
-- TOC entry 3154 (class 2606 OID 16429)
-- Name: account account_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_userid_fkey FOREIGN KEY (userid) REFERENCES public.admin_user(userid);


--
-- TOC entry 3153 (class 2606 OID 16409)
-- Name: tokens tokens_userid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_userid_fkey FOREIGN KEY (userid) REFERENCES public.admin_user(userid);


--
-- TOC entry 3155 (class 2606 OID 16446)
-- Name: transactions transactions_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: evan
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(account_id);


-- Completed on 2020-12-02 23:32:50 PST

--
-- PostgreSQL database dump complete
--

