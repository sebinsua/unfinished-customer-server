--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: -
--

CREATE OR REPLACE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Category; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Category" (
    category_id uuid NOT NULL,
    establishment_id uuid,
    name text,
    type text,
    visibility boolean
);


--
-- Name: CategoryOfCategory; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "CategoryOfCategory" (
    category_of_category_id uuid NOT NULL,
    parent_id uuid,
    child_id uuid
);


--
-- Name: CompositeProduct; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "CompositeProduct" (
    composite_product_id uuid NOT NULL,
    name text,
    type text,
    query text,
    category_id uuid
);


--
-- Name: Customer; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Customer" (
    customer_id uuid NOT NULL,
    user_id uuid,
    establishment_id uuid
);


--
-- Name: Establishment; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Establishment" (
    establishment_id uuid NOT NULL,
    name text,
    location point,
    description text,
    photo_url text,
    table_map_url text,
    table_map_graph text,
    establishment_code text
);


--
-- Name: EstablishmentBarPerson; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "EstablishmentBarPerson" (
    establishment_bar_person_id uuid NOT NULL,
    establishment_id uuid,
    name text
);


--
-- Name: EstablishmentLoyalty; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "EstablishmentLoyalty" (
    establishment_loyalty_id uuid NOT NULL,
    establishment_id uuid NOT NULL,
    name text,
    instructions text
);


--
-- Name: Product; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Product" (
    product_id uuid NOT NULL,
    stock_id uuid,
    establishment_id uuid,
    name text,
    type text,
    photo_url text,
    category_id uuid
);


--
-- Name: ProductInstruction; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "ProductInstruction" (
    product_instruction_id uuid NOT NULL,
    product_id uuid,
    name text
);


--
-- Name: ProductPrice; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "ProductPrice" (
    product_price_id uuid NOT NULL,
    product_id uuid,
    quantity integer,
    in_stock boolean,
    price money
);


--
-- Name: Stock; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Stock" (
    stock_id uuid NOT NULL,
    establishment_id uuid,
    name text,
    type text,
    stock_level integer,
    in_stock boolean
);


--
-- Name: Tab; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Tab" (
    tab_id uuid NOT NULL,
    owner_type text,
    owner uuid,
    type text,
    identifier text,
    data text
);


--
-- Name: User; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "User" (
    user_id uuid NOT NULL,
    name text,
    avatar_url text,
    invite_code text
);


--
-- Name: UserCredit; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "UserCredit" (
    user_credit_id uuid NOT NULL,
    user_id uuid,
    amount integer
);


--
-- Name: UserFavourite; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "UserFavourite" (
    user_favourite_id uuid NOT NULL,
    user_id uuid,
    product_id uuid,
    establishment_id uuid
);


--
-- Name: UserFriend; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "UserFriend" (
    user_friend_id uuid NOT NULL,
    user_id uuid,
    friend_id uuid
);


--
-- Name: UserPaymentCard; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "UserPaymentCard" (
    user_payment_card_id uuid NOT NULL,
    user_id uuid,
    name text,
    last_4_digits text,
    expiry_date text,
    data text
);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    password character varying(128) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


--
-- Name: django_site; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE django_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE django_site_id_seq OWNED BY django_site.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE django_site ALTER COLUMN id SET DEFAULT nextval('django_site_id_seq'::regclass);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: pk_category_category_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Category"
    ADD CONSTRAINT pk_category_category_id PRIMARY KEY (category_id);


--
-- Name: pk_categoryofcategory_category_of_category_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "CategoryOfCategory"
    ADD CONSTRAINT pk_categoryofcategory_category_of_category_id PRIMARY KEY (category_of_category_id);


--
-- Name: pk_compositeproduct_composite_product_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "CompositeProduct"
    ADD CONSTRAINT pk_compositeproduct_composite_product_id PRIMARY KEY (composite_product_id);


--
-- Name: pk_customer_customer_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Customer"
    ADD CONSTRAINT pk_customer_customer_id PRIMARY KEY (customer_id);


--
-- Name: pk_establishment_establishment_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Establishment"
    ADD CONSTRAINT pk_establishment_establishment_id PRIMARY KEY (establishment_id);


--
-- Name: pk_establishmentbarperson_establishment_bar_person_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "EstablishmentBarPerson"
    ADD CONSTRAINT pk_establishmentbarperson_establishment_bar_person_id PRIMARY KEY (establishment_bar_person_id);


--
-- Name: pk_establishmentloyalty_establishment_loyalty_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "EstablishmentLoyalty"
    ADD CONSTRAINT pk_establishmentloyalty_establishment_loyalty_id PRIMARY KEY (establishment_loyalty_id);


--
-- Name: pk_product_product_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Product"
    ADD CONSTRAINT pk_product_product_id PRIMARY KEY (product_id);


--
-- Name: pk_productinstruction_product_instruction_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "ProductInstruction"
    ADD CONSTRAINT pk_productinstruction_product_instruction_id PRIMARY KEY (product_instruction_id);


--
-- Name: pk_productprice_product_price_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "ProductPrice"
    ADD CONSTRAINT pk_productprice_product_price_id PRIMARY KEY (product_price_id);


--
-- Name: pk_stock_stock_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Stock"
    ADD CONSTRAINT pk_stock_stock_id PRIMARY KEY (stock_id);


--
-- Name: pk_tab_tab_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Tab"
    ADD CONSTRAINT pk_tab_tab_id PRIMARY KEY (tab_id);


--
-- Name: pk_user_user_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT pk_user_user_id PRIMARY KEY (user_id);


--
-- Name: pk_usercredit_user_credit_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "UserCredit"
    ADD CONSTRAINT pk_usercredit_user_credit_id PRIMARY KEY (user_credit_id);


--
-- Name: pk_userfavourite_user_favourite_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "UserFavourite"
    ADD CONSTRAINT pk_userfavourite_user_favourite_id PRIMARY KEY (user_favourite_id);


--
-- Name: pk_userfriend_user_friend_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "UserFriend"
    ADD CONSTRAINT pk_userfriend_user_friend_id PRIMARY KEY (user_friend_id);


--
-- Name: pk_userpaymentcard_user_payment_card_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "UserPaymentCard"
    ADD CONSTRAINT pk_userpaymentcard_user_payment_card_id PRIMARY KEY (user_payment_card_id);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_728de91f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_728de91f FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: fk_category_establishment_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Category"
    ADD CONSTRAINT fk_category_establishment_id FOREIGN KEY (establishment_id) REFERENCES "Establishment"(establishment_id);


--
-- Name: fk_categoryofcategory_child_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CategoryOfCategory"
    ADD CONSTRAINT fk_categoryofcategory_child_id FOREIGN KEY (child_id) REFERENCES "Category"(category_id);


--
-- Name: fk_categoryofcategory_parent_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CategoryOfCategory"
    ADD CONSTRAINT fk_categoryofcategory_parent_id FOREIGN KEY (parent_id) REFERENCES "Category"(category_id);


--
-- Name: fk_compositeproduct_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "CompositeProduct"
    ADD CONSTRAINT fk_compositeproduct_category_id FOREIGN KEY (category_id) REFERENCES "Category"(category_id);


--
-- Name: fk_customer_establishment_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Customer"
    ADD CONSTRAINT fk_customer_establishment_id FOREIGN KEY (establishment_id) REFERENCES "Establishment"(establishment_id);


--
-- Name: fk_customer_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Customer"
    ADD CONSTRAINT fk_customer_user_id FOREIGN KEY (user_id) REFERENCES "User"(user_id);


--
-- Name: fk_establishmentbarperson_establishment_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "EstablishmentBarPerson"
    ADD CONSTRAINT fk_establishmentbarperson_establishment_id FOREIGN KEY (establishment_id) REFERENCES "Establishment"(establishment_id);


--
-- Name: fk_establishmentloyalty_establishment_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "EstablishmentLoyalty"
    ADD CONSTRAINT fk_establishmentloyalty_establishment_id FOREIGN KEY (establishment_id) REFERENCES "Establishment"(establishment_id);


--
-- Name: fk_product_category_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Product"
    ADD CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES "Category"(category_id);


--
-- Name: fk_product_establishment_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Product"
    ADD CONSTRAINT fk_product_establishment_id FOREIGN KEY (establishment_id) REFERENCES "Establishment"(establishment_id);


--
-- Name: fk_product_stock_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Product"
    ADD CONSTRAINT fk_product_stock_id FOREIGN KEY (stock_id) REFERENCES "Stock"(stock_id);


--
-- Name: fk_productinstruction_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProductInstruction"
    ADD CONSTRAINT fk_productinstruction_product_id FOREIGN KEY (product_id) REFERENCES "Product"(product_id);


--
-- Name: fk_productprice_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ProductPrice"
    ADD CONSTRAINT fk_productprice_product_id FOREIGN KEY (product_id) REFERENCES "Product"(product_id);


--
-- Name: fk_stock_establishment_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "Stock"
    ADD CONSTRAINT fk_stock_establishment_id FOREIGN KEY (establishment_id) REFERENCES "Establishment"(establishment_id);


--
-- Name: fk_usercredit_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserCredit"
    ADD CONSTRAINT fk_usercredit_user_id FOREIGN KEY (user_id) REFERENCES "User"(user_id);


--
-- Name: fk_userfavourite_establishment_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserFavourite"
    ADD CONSTRAINT fk_userfavourite_establishment_id FOREIGN KEY (establishment_id) REFERENCES "Establishment"(establishment_id);


--
-- Name: fk_userfavourite_product_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserFavourite"
    ADD CONSTRAINT fk_userfavourite_product_id FOREIGN KEY (product_id) REFERENCES "Product"(product_id);


--
-- Name: fk_userfavourite_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserFavourite"
    ADD CONSTRAINT fk_userfavourite_user_id FOREIGN KEY (user_id) REFERENCES "User"(user_id);


--
-- Name: fk_userfriend_friend_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserFriend"
    ADD CONSTRAINT fk_userfriend_friend_id FOREIGN KEY (friend_id) REFERENCES "User"(user_id);


--
-- Name: fk_userfriend_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserFriend"
    ADD CONSTRAINT fk_userfriend_user_id FOREIGN KEY (user_id) REFERENCES "User"(user_id);


--
-- Name: fk_userpaymentcard_user_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "UserPaymentCard"
    ADD CONSTRAINT fk_userpaymentcard_user_id FOREIGN KEY (user_id) REFERENCES "User"(user_id);


--
-- Name: group_id_refs_id_3cea63fe; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_3cea63fe FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_831107f1; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_831107f1 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_f2045483; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_f2045483 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: -
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM agoodattitude;
GRANT ALL ON SCHEMA public TO agoodattitude;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

