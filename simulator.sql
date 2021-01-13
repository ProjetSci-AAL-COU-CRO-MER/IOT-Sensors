--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

-- Started on 2021-01-13 19:28:27

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2853 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 205 (class 1259 OID 57457)
-- Name: config_pos_geo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.config_pos_geo (
    id bigint NOT NULL,
    longitude double precision NOT NULL,
    latitude double precision NOT NULL,
    rayon_km integer NOT NULL,
    b_actif boolean NOT NULL
);


ALTER TABLE public.config_pos_geo OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 57455)
-- Name: config_pos_geo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.config_pos_geo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.config_pos_geo_id_seq OWNER TO postgres;

--
-- TOC entry 2854 (class 0 OID 0)
-- Dependencies: 204
-- Name: config_pos_geo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.config_pos_geo_id_seq OWNED BY public.config_pos_geo.id;


--
-- TOC entry 203 (class 1259 OID 57451)
-- Name: incident; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incident (
    id bigint NOT NULL,
    longitude double precision NOT NULL,
    latitude double precision NOT NULL,
    intensite integer NOT NULL,
    id_incident_type bigint NOT NULL
);


ALTER TABLE public.incident OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 57449)
-- Name: incident_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incident_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incident_id_seq OWNER TO postgres;

--
-- TOC entry 2855 (class 0 OID 0)
-- Dependencies: 202
-- Name: incident_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incident_id_seq OWNED BY public.incident.id;


--
-- TOC entry 208 (class 1259 OID 65639)
-- Name: incident_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incident_type (
    id bigint NOT NULL,
    libelle character varying NOT NULL,
    code character varying NOT NULL
);


ALTER TABLE public.incident_type OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 65642)
-- Name: incident_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incident_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incident_type_id_seq OWNER TO postgres;

--
-- TOC entry 2856 (class 0 OID 0)
-- Dependencies: 209
-- Name: incident_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incident_type_id_seq OWNED BY public.incident_type.id;


--
-- TOC entry 207 (class 1259 OID 57463)
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.utilisateur (
    id bigint NOT NULL,
    nom character varying NOT NULL,
    prenom character varying,
    password character varying
);


ALTER TABLE public.utilisateur OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 57461)
-- Name: utilisateur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.utilisateur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.utilisateur_id_seq OWNER TO postgres;

--
-- TOC entry 2857 (class 0 OID 0)
-- Dependencies: 206
-- Name: utilisateur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.utilisateur.id;


--
-- TOC entry 2708 (class 2604 OID 57460)
-- Name: config_pos_geo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.config_pos_geo ALTER COLUMN id SET DEFAULT nextval('public.config_pos_geo_id_seq'::regclass);


--
-- TOC entry 2707 (class 2604 OID 57454)
-- Name: incident id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident ALTER COLUMN id SET DEFAULT nextval('public.incident_id_seq'::regclass);


--
-- TOC entry 2710 (class 2604 OID 65644)
-- Name: incident_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident_type ALTER COLUMN id SET DEFAULT nextval('public.incident_type_id_seq'::regclass);


--
-- TOC entry 2709 (class 2604 OID 57466)
-- Name: utilisateur id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur ALTER COLUMN id SET DEFAULT nextval('public.utilisateur_id_seq'::regclass);


--
-- TOC entry 2843 (class 0 OID 57457)
-- Dependencies: 205
-- Data for Name: config_pos_geo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.config_pos_geo (id, longitude, latitude, rayon_km, b_actif) FROM stdin;
1	4.835659027099609	45.7633171081543	10	t
\.


--
-- TOC entry 2841 (class 0 OID 57451)
-- Dependencies: 203
-- Data for Name: incident; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incident (id, longitude, latitude, intensite, id_incident_type) FROM stdin;
\.


--
-- TOC entry 2846 (class 0 OID 65639)
-- Dependencies: 208
-- Data for Name: incident_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incident_type (id, libelle, code) FROM stdin;
1	Incendie Classe A	INA
2	Incendie Classe B	INB
3	Incendie Classe C	INC
4	Incendie Classe D	IND
5	Incendie Classe E	INE
6	Incendie Classe F	INF
\.


--
-- TOC entry 2845 (class 0 OID 57463)
-- Dependencies: 207
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilisateur (id, nom, prenom, password) FROM stdin;
1	Administrateur	\N	032679f8fb88a403ff786d628c7e9421cfa9773fd600dc4eea0c2a7f20bdbbb0
\.


--
-- TOC entry 2858 (class 0 OID 0)
-- Dependencies: 204
-- Name: config_pos_geo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.config_pos_geo_id_seq', 3, true);


--
-- TOC entry 2859 (class 0 OID 0)
-- Dependencies: 202
-- Name: incident_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incident_id_seq', 1, false);


--
-- TOC entry 2860 (class 0 OID 0)
-- Dependencies: 209
-- Name: incident_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incident_type_id_seq', 6, true);


--
-- TOC entry 2861 (class 0 OID 0)
-- Dependencies: 206
-- Name: utilisateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilisateur_id_seq', 1, true);


--
-- TOC entry 2712 (class 2606 OID 65652)
-- Name: incident_type incident_type_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident_type
    ADD CONSTRAINT incident_type_pk PRIMARY KEY (id);


--
-- TOC entry 2713 (class 2606 OID 65653)
-- Name: incident incident_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident
    ADD CONSTRAINT incident_fk FOREIGN KEY (id_incident_type) REFERENCES public.incident_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2021-01-13 19:28:27

--
-- PostgreSQL database dump complete
--

