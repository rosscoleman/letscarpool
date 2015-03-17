--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.6
-- Dumped by pg_dump version 9.3.6
-- Started on 2015-03-16 20:45:01

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE letscarpool;
--
-- TOC entry 1958 (class 1262 OID 16393)
-- Name: letscarpool; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE letscarpool WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE letscarpool OWNER TO postgres;

\connect letscarpool

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 1959 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 176 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1961 (class 0 OID 0)
-- Dependencies: 176
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 24604)
-- Name: location; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE location (
    id integer NOT NULL,
    address text,
    city character varying(100),
    state character(2),
    zip5 character(5),
    zip_plus_4 character(4),
    latitude double precision,
    longitude double precision
);


ALTER TABLE public.location OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 24602)
-- Name: Location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Location_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Location_id_seq" OWNER TO postgres;

--
-- TOC entry 1962 (class 0 OID 0)
-- Dependencies: 172
-- Name: Location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Location_id_seq" OWNED BY location.id;


--
-- TOC entry 171 (class 1259 OID 24587)
-- Name: app_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE app_user (
    id integer NOT NULL,
    first character varying(100),
    last character varying(100),
    email character varying(200)
);


ALTER TABLE public.app_user OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 24617)
-- Name: car; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE car (
    id integer NOT NULL,
    make character varying(100),
    model character varying(100),
    year integer
);


ALTER TABLE public.car OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 24615)
-- Name: car_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE car_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.car_id_seq OWNER TO postgres;

--
-- TOC entry 1963 (class 0 OID 0)
-- Dependencies: 174
-- Name: car_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE car_id_seq OWNED BY car.id;


--
-- TOC entry 170 (class 1259 OID 24585)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 1964 (class 0 OID 0)
-- Dependencies: 170
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY app_user.id;


--
-- TOC entry 1836 (class 2604 OID 24590)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY app_user ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 1838 (class 2604 OID 24620)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY car ALTER COLUMN id SET DEFAULT nextval('car_id_seq'::regclass);


--
-- TOC entry 1837 (class 2604 OID 24607)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY location ALTER COLUMN id SET DEFAULT nextval('"Location_id_seq"'::regclass);


--
-- TOC entry 1844 (class 2606 OID 24624)
-- Name: car_composite_unique; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY car
    ADD CONSTRAINT car_composite_unique UNIQUE (make, model, year);


--
-- TOC entry 1846 (class 2606 OID 24622)
-- Name: car_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY car
    ADD CONSTRAINT car_pk PRIMARY KEY (id);


--
-- TOC entry 1842 (class 2606 OID 24612)
-- Name: location_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY location
    ADD CONSTRAINT location_pk PRIMARY KEY (id);


--
-- TOC entry 1840 (class 2606 OID 24614)
-- Name: users_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY app_user
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- TOC entry 1960 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-03-16 20:45:01

--
-- PostgreSQL database dump complete
--

