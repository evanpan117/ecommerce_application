PGDMP             	        	    x        	   bankingdb    12.4    12.2 :    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16384 	   bankingdb    DATABASE     g   CREATE DATABASE bankingdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE bankingdb;
                evan    false            �            1259    16422    account    TABLE       CREATE TABLE public.account (
    account_id bigint NOT NULL,
    account_no bigint NOT NULL,
    bank_name character varying(50) NOT NULL,
    ifsc character varying(32) NOT NULL,
    userid integer NOT NULL,
    total_balance bigint DEFAULT 0 NOT NULL
);
    DROP TABLE public.account;
       public         heap    evan    false            �            1259    16420    account_account_id_seq    SEQUENCE        CREATE SEQUENCE public.account_account_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.account_account_id_seq;
       public          evan    false    208            �           0    0    account_account_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.account_account_id_seq OWNED BY public.account.account_id;
          public          evan    false    207            �            1259    16387 	   bank_user    TABLE     �   CREATE TABLE public.bank_user (
    userid bigint NOT NULL,
    first_name character varying(32) NOT NULL,
    last_name character varying(32) NOT NULL,
    email character varying(32) NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE public.bank_user;
       public         heap    evan    false            �            1259    16385    bank_user_userid_seq    SEQUENCE     }   CREATE SEQUENCE public.bank_user_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.bank_user_userid_seq;
       public          evan    false    203            �           0    0    bank_user_userid_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.bank_user_userid_seq OWNED BY public.bank_user.userid;
          public          evan    false    202            �            1259    16453    products    TABLE     �   CREATE TABLE public.products (
    product_id bigint NOT NULL,
    product_name character varying(32) NOT NULL,
    product_price double precision NOT NULL,
    product_quantity integer NOT NULL,
    product_description character varying
);
    DROP TABLE public.products;
       public         heap    evan    false            �            1259    16451    products_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_product_id_seq;
       public          evan    false    212            �           0    0    products_product_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;
          public          evan    false    211            �            1259    16466    sales    TABLE     �   CREATE TABLE public.sales (
    sale_id bigint NOT NULL,
    sale_product_id bigint NOT NULL,
    sale_product_name character varying NOT NULL,
    sale_price double precision NOT NULL,
    sale_quantity integer NOT NULL
);
    DROP TABLE public.sales;
       public         heap    evan    false            �            1259    16462    sales_sale_id_seq    SEQUENCE     z   CREATE SEQUENCE public.sales_sale_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.sales_sale_id_seq;
       public          evan    false    215            �           0    0    sales_sale_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.sales_sale_id_seq OWNED BY public.sales.sale_id;
          public          evan    false    213            �            1259    16464    sales_sale_product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sales_sale_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.sales_sale_product_id_seq;
       public          evan    false    215            �           0    0    sales_sale_product_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.sales_sale_product_id_seq OWNED BY public.sales.sale_product_id;
          public          evan    false    214            �            1259    16399    tokens    TABLE     �   CREATE TABLE public.tokens (
    id bigint NOT NULL,
    access_token character varying(500) NOT NULL,
    userid bigint NOT NULL
);
    DROP TABLE public.tokens;
       public         heap    evan    false            �            1259    16395    tokens_id_seq    SEQUENCE     v   CREATE SEQUENCE public.tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tokens_id_seq;
       public          evan    false    206            �           0    0    tokens_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;
          public          evan    false    204            �            1259    16397    tokens_userid_seq    SEQUENCE     z   CREATE SEQUENCE public.tokens_userid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.tokens_userid_seq;
       public          evan    false    206            �           0    0    tokens_userid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.tokens_userid_seq OWNED BY public.tokens.userid;
          public          evan    false    205            �            1259    16436    transactions    TABLE     �   CREATE TABLE public.transactions (
    tr_id bigint NOT NULL,
    transaction_date timestamp without time zone NOT NULL,
    withdraw_amount numeric,
    deposit_amount numeric,
    balance numeric DEFAULT 0 NOT NULL,
    account_id bigint NOT NULL
);
     DROP TABLE public.transactions;
       public         heap    evan    false            �            1259    16434    transactions_tr_id_seq    SEQUENCE        CREATE SEQUENCE public.transactions_tr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.transactions_tr_id_seq;
       public          evan    false    210            �           0    0    transactions_tr_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.transactions_tr_id_seq OWNED BY public.transactions.tr_id;
          public          evan    false    209            <           2604    16425    account account_id    DEFAULT     x   ALTER TABLE ONLY public.account ALTER COLUMN account_id SET DEFAULT nextval('public.account_account_id_seq'::regclass);
 A   ALTER TABLE public.account ALTER COLUMN account_id DROP DEFAULT;
       public          evan    false    208    207    208            9           2604    16390    bank_user userid    DEFAULT     t   ALTER TABLE ONLY public.bank_user ALTER COLUMN userid SET DEFAULT nextval('public.bank_user_userid_seq'::regclass);
 ?   ALTER TABLE public.bank_user ALTER COLUMN userid DROP DEFAULT;
       public          evan    false    203    202    203            @           2604    16456    products product_id    DEFAULT     z   ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);
 B   ALTER TABLE public.products ALTER COLUMN product_id DROP DEFAULT;
       public          evan    false    212    211    212            A           2604    16469    sales sale_id    DEFAULT     n   ALTER TABLE ONLY public.sales ALTER COLUMN sale_id SET DEFAULT nextval('public.sales_sale_id_seq'::regclass);
 <   ALTER TABLE public.sales ALTER COLUMN sale_id DROP DEFAULT;
       public          evan    false    215    213    215            B           2604    16470    sales sale_product_id    DEFAULT     ~   ALTER TABLE ONLY public.sales ALTER COLUMN sale_product_id SET DEFAULT nextval('public.sales_sale_product_id_seq'::regclass);
 D   ALTER TABLE public.sales ALTER COLUMN sale_product_id DROP DEFAULT;
       public          evan    false    214    215    215            :           2604    16402 	   tokens id    DEFAULT     f   ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);
 8   ALTER TABLE public.tokens ALTER COLUMN id DROP DEFAULT;
       public          evan    false    204    206    206            ;           2604    16403    tokens userid    DEFAULT     n   ALTER TABLE ONLY public.tokens ALTER COLUMN userid SET DEFAULT nextval('public.tokens_userid_seq'::regclass);
 <   ALTER TABLE public.tokens ALTER COLUMN userid DROP DEFAULT;
       public          evan    false    205    206    206            >           2604    16439    transactions tr_id    DEFAULT     x   ALTER TABLE ONLY public.transactions ALTER COLUMN tr_id SET DEFAULT nextval('public.transactions_tr_id_seq'::regclass);
 A   ALTER TABLE public.transactions ALTER COLUMN tr_id DROP DEFAULT;
       public          evan    false    210    209    210            �          0    16422    account 
   TABLE DATA           a   COPY public.account (account_id, account_no, bank_name, ifsc, userid, total_balance) FROM stdin;
    public          evan    false    208   �@       �          0    16387 	   bank_user 
   TABLE DATA           S   COPY public.bank_user (userid, first_name, last_name, email, password) FROM stdin;
    public          evan    false    203   A       �          0    16453    products 
   TABLE DATA           r   COPY public.products (product_id, product_name, product_price, product_quantity, product_description) FROM stdin;
    public          evan    false    212   :B       �          0    16466    sales 
   TABLE DATA           g   COPY public.sales (sale_id, sale_product_id, sale_product_name, sale_price, sale_quantity) FROM stdin;
    public          evan    false    215   �B       �          0    16399    tokens 
   TABLE DATA           :   COPY public.tokens (id, access_token, userid) FROM stdin;
    public          evan    false    206   �B       �          0    16436    transactions 
   TABLE DATA           u   COPY public.transactions (tr_id, transaction_date, withdraw_amount, deposit_amount, balance, account_id) FROM stdin;
    public          evan    false    210   �F       �           0    0    account_account_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.account_account_id_seq', 2, true);
          public          evan    false    207            �           0    0    bank_user_userid_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.bank_user_userid_seq', 4, true);
          public          evan    false    202            �           0    0    products_product_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.products_product_id_seq', 7, true);
          public          evan    false    211            �           0    0    sales_sale_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.sales_sale_id_seq', 1, false);
          public          evan    false    213            �           0    0    sales_sale_product_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.sales_sale_product_id_seq', 1, false);
          public          evan    false    214            �           0    0    tokens_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.tokens_id_seq', 32, true);
          public          evan    false    204            �           0    0    tokens_userid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.tokens_userid_seq', 1, false);
          public          evan    false    205            �           0    0    transactions_tr_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.transactions_tr_id_seq', 25, true);
          public          evan    false    209            J           2606    16428    account account_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (account_id);
 >   ALTER TABLE ONLY public.account DROP CONSTRAINT account_pkey;
       public            evan    false    208            D           2606    16394    bank_user bank_user_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.bank_user
    ADD CONSTRAINT bank_user_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.bank_user DROP CONSTRAINT bank_user_email_key;
       public            evan    false    203            F           2606    16392    bank_user bank_user_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.bank_user
    ADD CONSTRAINT bank_user_pkey PRIMARY KEY (userid);
 B   ALTER TABLE ONLY public.bank_user DROP CONSTRAINT bank_user_pkey;
       public            evan    false    203            N           2606    16461    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            evan    false    212            P           2606    16475    sales sales_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.sales
    ADD CONSTRAINT sales_pkey PRIMARY KEY (sale_id);
 :   ALTER TABLE ONLY public.sales DROP CONSTRAINT sales_pkey;
       public            evan    false    215            H           2606    16408    tokens tokens_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            evan    false    206            L           2606    16445    transactions transactions_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (tr_id);
 H   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_pkey;
       public            evan    false    210            R           2606    16429    account account_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_userid_fkey FOREIGN KEY (userid) REFERENCES public.bank_user(userid);
 E   ALTER TABLE ONLY public.account DROP CONSTRAINT account_userid_fkey;
       public          evan    false    203    3142    208            Q           2606    16409    tokens tokens_userid_fkey    FK CONSTRAINT        ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_userid_fkey FOREIGN KEY (userid) REFERENCES public.bank_user(userid);
 C   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_userid_fkey;
       public          evan    false    206    203    3142            S           2606    16446 )   transactions transactions_account_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.account(account_id);
 S   ALTER TABLE ONLY public.transactions DROP CONSTRAINT transactions_account_id_fkey;
       public          evan    false    3146    210    208            �   ?   x�ƹ�0�x�t���^Hx���?��D�H��s��@!�G�K�L�����P�!�⾑���      �     x�eα��0 E�:|�5F�N��F]QYQg��!��8��u��m�nu�3��wH��ﯜ���,V*ڬA� �������T$).m;�᡹��*(\����1u��7�͟k�.��#�ޮ��c�IV�q��X�zԚVw�{��yw�V��a/,�k��⫫g�@z��V����A��DD�������r�
Sh��@��������ɣ�8������a~��f��Tt�zMJ�ك��ӽ�ޗ�\���0�W��W�5���N#8��c�lN�`�	$ʏ�(�/��sk      �   w   x�3��,���KU04�4���33�440���,V ���T��Ē���L�:.#R5�5qZ�����8���9��F�F@u�9)iY9�\fPQCQs���ļt�bcΒ��J�=... �K�      �      x������ � �      �   �  x���ǎ�J��̻�"c�$c0���E0�$�Oa�g9Ϻ�>UW��~=)�(WsI�VVr�k�X��ֵY�:n������mŷ�Ϲ��Y����6���2YX2u�ېŋ�r��Z���<��%�p)�pu���� �G�L"s)� �F��q�����gie5_�7�1%8z�mUM�:�K��◛|0���<�e�!��#d:�ta�������k��ܓ:܀65:��hy�j,1��c9�U	�����i��c��SyG"�R�4ԁ�:�5ř�4��y�'2ǵtg���.4��.BH�Ċ(ׄ07���D\j��d�$��s׬/��3��`��эޕ���Y�c��Rγ��S���_`Ί_�@7*@iog���&H���d�Rg�׺�5\s�"��#�W�s�M[0e�37B�?L�w�&�[�?{�R���.��Y�]Lo\����*(t\d��V���qy,�đ�\���q��"/�Q'8>��~#�k�_��`�MhY���i����2�+���4"�]�Tx�q~���YY-�����%���t�Z㺰�U$����/r�ʥ�ڰ�y{j���YB�ł�E��EL�����!԰��3$�[)�7ࢽ;��v|��-<�IcC��.]�Fʤ�S7�15h�gE_�7B�v���;��N_Ν�s9�,�}�5n�<xٙ�	<���K~�`P���Ϻr����J��l�f��h�)c�Y����������KB>�{-�e+uę��s����s��ʃn��<w�d-p���U!ȼ{\��K�(�m��f15����9֒�1\sצ���&që���jۙ��&��Dko�%vw�v�{��%��(�p*�#����!q���h\���V�%�꫇��Ȑ��ӛ��R�+䶉D{,���#����;~��w�P      �   4  x�m��q�0@ѳT�0���T���!�Tf����'��O�'�e�M`���s���>��	���G.'���:��c��%��8T�̲���t;���1I�$�ƙ����t2�-#x=��O�y>�&�T��,kh���/s�ŲaF�f���\�t.��u��������v��u"�w3�I�B�,������/�(��㛙���[DV8�R���aI����{ٔjA]��E֕=�k��͸�}��;/�w-�6�J�]� ű�V�Z�l敂?)hIz�N�)	��q�\�{�y���i��     