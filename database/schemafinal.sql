--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-03-15 19:35:46

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
-- TOC entry 217 (class 1259 OID 16652)
-- Name: group_member_vote; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_member_vote (
    group_id integer,
    member_id integer,
    restaurant_id integer,
    vote boolean DEFAULT false
);


ALTER TABLE public.group_member_vote OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16595)
-- Name: group_members; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_members (
    member_id bigint NOT NULL,
    member_name character varying NOT NULL,
    group_id integer NOT NULL,
    user_vote integer
);


ALTER TABLE public.group_members OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16600)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    group_id integer NOT NULL,
    user_id integer NOT NULL,
    event_name character varying NOT NULL,
    end_date timestamp without time zone NOT NULL,
    has_ended boolean NOT NULL,
    location character varying NOT NULL,
    invite_link character varying
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16605)
-- Name: groups_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_group_id_seq OWNER TO postgres;

--
-- TOC entry 3346 (class 0 OID 0)
-- Dependencies: 211
-- Name: groups_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_group_id_seq OWNED BY public.groups.group_id;


--
-- TOC entry 212 (class 1259 OID 16606)
-- Name: restaurant_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurant_group (
    restaurant_id integer NOT NULL,
    group_id integer NOT NULL,
    total_votes integer
);


ALTER TABLE public.restaurant_group OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16609)
-- Name: restaurants; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.restaurants (
    restaurant_id integer NOT NULL,
    name character varying NOT NULL,
    description character varying NOT NULL,
    hours_of_operation character varying NOT NULL,
    type character varying NOT NULL,
    open boolean NOT NULL,
    phone_number bigint NOT NULL,
    rating integer NOT NULL,
    city character varying NOT NULL,
    zip_code character varying(10) NOT NULL
);


ALTER TABLE public.restaurants OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16614)
-- Name: restaurants_restaurant_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.restaurants_restaurant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_restaurant_id_seq OWNER TO postgres;

--
-- TOC entry 3347 (class 0 OID 0)
-- Dependencies: 214
-- Name: restaurants_restaurant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.restaurants_restaurant_id_seq OWNED BY public.restaurants.restaurant_id;


--
-- TOC entry 215 (class 1259 OID 16615)
-- Name: seq_user_id; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seq_user_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq_user_id OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16616)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer DEFAULT nextval('public.seq_user_id'::regclass) NOT NULL,
    username character varying(50) NOT NULL,
    password_hash character varying(200) NOT NULL,
    role character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3186 (class 2604 OID 16620)
-- Name: groups group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN group_id SET DEFAULT nextval('public.groups_group_id_seq'::regclass);


--
-- TOC entry 3187 (class 2604 OID 16621)
-- Name: restaurants restaurant_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurants ALTER COLUMN restaurant_id SET DEFAULT nextval('public.restaurants_restaurant_id_seq'::regclass);


--
-- TOC entry 3191 (class 2606 OID 16625)
-- Name: groups groups_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pk PRIMARY KEY (group_id);


--
-- TOC entry 3197 (class 2606 OID 16627)
-- Name: users pk_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT pk_user PRIMARY KEY (user_id);


--
-- TOC entry 3193 (class 2606 OID 16629)
-- Name: restaurant_group restaurant_group_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_group
    ADD CONSTRAINT restaurant_group_pk PRIMARY KEY (restaurant_id, group_id);


--
-- TOC entry 3195 (class 2606 OID 16631)
-- Name: restaurants restaurants_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pk PRIMARY KEY (restaurant_id);


--
-- TOC entry 3198 (class 2606 OID 16632)
-- Name: group_members group_members_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_members
    ADD CONSTRAINT group_members_fk0 FOREIGN KEY (group_id) REFERENCES public.groups(group_id);


--
-- TOC entry 3199 (class 2606 OID 16637)
-- Name: groups groups_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_fk0 FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 3200 (class 2606 OID 16642)
-- Name: restaurant_group restaurant_group_fk0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_group
    ADD CONSTRAINT restaurant_group_fk0 FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(restaurant_id);


--
-- TOC entry 3201 (class 2606 OID 16647)
-- Name: restaurant_group restaurant_group_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.restaurant_group
    ADD CONSTRAINT restaurant_group_fk1 FOREIGN KEY (group_id) REFERENCES public.groups(group_id);


--
-- TOC entry 3348 (class 0 OID 0)
-- Dependencies: 215
-- Name: SEQUENCE seq_user_id; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.seq_user_id TO final_capstone_owner;
GRANT SELECT,USAGE ON SEQUENCE public.seq_user_id TO final_capstone_appuser;


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 216
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.users TO final_capstone_owner;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.users TO final_capstone_appuser;


-- Completed on 2022-03-15 19:35:47

--
-- PostgreSQL database dump complete
--

