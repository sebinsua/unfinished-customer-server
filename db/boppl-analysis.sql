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
-- Name: Order; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "Order" (
    order_id uuid NOT NULL,
    payment_type text,
    pre_auth text,
    fulfilled boolean,
    delivery_option text,
    table_identifier text,
    order_authorise_id text,
    order_authenticate_id text,
    amount_paid money,
    amount_tipped money,
    payment_details text,
    owner_id uuid,
    owner_type text,
    owner_name text,
    establishment_id uuid
);


--
-- Name: OrderItem; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "OrderItem" (
    order_item_id uuid NOT NULL,
    order_id uuid,
    product_id uuid,
    product_name text,
    product_instruction text,
    buyer_id uuid,
    buyer_name text,
    receiver_id uuid,
    receiver_name text
);


--
-- Name: pk_order_order_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "Order"
    ADD CONSTRAINT pk_order_order_id PRIMARY KEY (order_id);


--
-- Name: pk_orderitem_order_item_id; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "OrderItem"
    ADD CONSTRAINT pk_orderitem_order_item_id PRIMARY KEY (order_item_id);


--
-- Name: fk_orderitem_order_id; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "OrderItem"
    ADD CONSTRAINT fk_orderitem_order_id FOREIGN KEY (order_id) REFERENCES "Order"(order_id);


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

