--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

-- Started on 2021-01-13 19:28:10

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
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 205 (class 1259 OID 57557)
-- Name: capteur; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.capteur (
    id bigint NOT NULL,
    longitude double precision NOT NULL,
    latitude double precision NOT NULL,
    intensite integer
);


ALTER TABLE public.capteur OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 57555)
-- Name: capteur_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.capteur_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capteur_id_seq OWNER TO postgres;

--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 204
-- Name: capteur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.capteur_id_seq OWNED BY public.capteur.id;


--
-- TOC entry 225 (class 1259 OID 73833)
-- Name: capteur_incident; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.capteur_incident (
    id bigint NOT NULL,
    date date NOT NULL,
    horaire time without time zone NOT NULL,
    intensite integer NOT NULL,
    id_capteur bigint NOT NULL,
    id_incident bigint NOT NULL
);


ALTER TABLE public.capteur_incident OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 73831)
-- Name: capteur_incident_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.capteur_incident_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.capteur_incident_id_seq OWNER TO postgres;

--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 224
-- Name: capteur_incident_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.capteur_incident_id_seq OWNED BY public.capteur_incident.id;


--
-- TOC entry 223 (class 1259 OID 65740)
-- Name: conf_pos_geo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conf_pos_geo (
    id bigint NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    rayon_km integer NOT NULL,
    b_actif boolean NOT NULL
);


ALTER TABLE public.conf_pos_geo OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 65738)
-- Name: conf_pos_geo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conf_pos_geo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.conf_pos_geo_id_seq OWNER TO postgres;

--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 222
-- Name: conf_pos_geo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conf_pos_geo_id_seq OWNED BY public.conf_pos_geo.id;


--
-- TOC entry 221 (class 1259 OID 65721)
-- Name: etablissement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etablissement (
    id bigint NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    nom character varying NOT NULL,
    id_etablissement_type bigint NOT NULL
);


ALTER TABLE public.etablissement OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 65719)
-- Name: etablissement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.etablissement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.etablissement_id_seq OWNER TO postgres;

--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 220
-- Name: etablissement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.etablissement_id_seq OWNED BY public.etablissement.id;


--
-- TOC entry 219 (class 1259 OID 65710)
-- Name: etablissement_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.etablissement_type (
    id bigint NOT NULL,
    libelle character varying NOT NULL,
    code character varying NOT NULL
);


ALTER TABLE public.etablissement_type OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 65708)
-- Name: etablissement_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.etablissement_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.etablissement_type_id_seq OWNER TO postgres;

--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 218
-- Name: etablissement_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.etablissement_type_id_seq OWNED BY public.etablissement_type.id;


--
-- TOC entry 203 (class 1259 OID 57531)
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
-- TOC entry 202 (class 1259 OID 57529)
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
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 202
-- Name: incident_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incident_id_seq OWNED BY public.incident.id;


--
-- TOC entry 217 (class 1259 OID 65699)
-- Name: incident_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incident_type (
    id bigint NOT NULL,
    libelle character varying NOT NULL,
    code character varying NOT NULL
);


ALTER TABLE public.incident_type OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 65697)
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
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 216
-- Name: incident_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incident_type_id_seq OWNED BY public.incident_type.id;


--
-- TOC entry 209 (class 1259 OID 65660)
-- Name: incident_vehicule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.incident_vehicule (
    id bigint NOT NULL,
    date date NOT NULL,
    id_incident bigint NOT NULL,
    id_vehicule bigint NOT NULL
);


ALTER TABLE public.incident_vehicule OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 65658)
-- Name: incident_vehicule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.incident_vehicule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incident_vehicule_id_seq OWNER TO postgres;

--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 208
-- Name: incident_vehicule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.incident_vehicule_id_seq OWNED BY public.incident_vehicule.id;


--
-- TOC entry 207 (class 1259 OID 57586)
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
-- TOC entry 206 (class 1259 OID 57584)
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
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 206
-- Name: utilisateur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.utilisateur.id;


--
-- TOC entry 211 (class 1259 OID 65666)
-- Name: vehicule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicule (
    id bigint NOT NULL,
    nom character varying NOT NULL,
    latitude double precision,
    longitude character varying,
    id_etablissement bigint NOT NULL,
    id_vehicule_type bigint NOT NULL,
    id_vehicule_etat bigint NOT NULL
);


ALTER TABLE public.vehicule OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 65688)
-- Name: vehicule_etat; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicule_etat (
    id bigint NOT NULL,
    libelle character varying NOT NULL,
    code character varying NOT NULL
);


ALTER TABLE public.vehicule_etat OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 65686)
-- Name: vehicule_etat_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicule_etat_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicule_etat_id_seq OWNER TO postgres;

--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 214
-- Name: vehicule_etat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicule_etat_id_seq OWNED BY public.vehicule_etat.id;


--
-- TOC entry 210 (class 1259 OID 65664)
-- Name: vehicule_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicule_id_seq OWNER TO postgres;

--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 210
-- Name: vehicule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicule_id_seq OWNED BY public.vehicule.id;


--
-- TOC entry 213 (class 1259 OID 65677)
-- Name: vehicule_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vehicule_type (
    id bigint NOT NULL,
    libelle character varying NOT NULL,
    code character varying NOT NULL,
    capacite_extinction integer
);


ALTER TABLE public.vehicule_type OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 65675)
-- Name: vehicule_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vehicule_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vehicule_type_id_seq OWNER TO postgres;

--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 212
-- Name: vehicule_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vehicule_type_id_seq OWNED BY public.vehicule_type.id;


--
-- TOC entry 2761 (class 2604 OID 57560)
-- Name: capteur id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capteur ALTER COLUMN id SET DEFAULT nextval('public.capteur_id_seq'::regclass);


--
-- TOC entry 2771 (class 2604 OID 73836)
-- Name: capteur_incident id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capteur_incident ALTER COLUMN id SET DEFAULT nextval('public.capteur_incident_id_seq'::regclass);


--
-- TOC entry 2770 (class 2604 OID 65743)
-- Name: conf_pos_geo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_pos_geo ALTER COLUMN id SET DEFAULT nextval('public.conf_pos_geo_id_seq'::regclass);


--
-- TOC entry 2769 (class 2604 OID 65724)
-- Name: etablissement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissement ALTER COLUMN id SET DEFAULT nextval('public.etablissement_id_seq'::regclass);


--
-- TOC entry 2768 (class 2604 OID 65713)
-- Name: etablissement_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissement_type ALTER COLUMN id SET DEFAULT nextval('public.etablissement_type_id_seq'::regclass);


--
-- TOC entry 2760 (class 2604 OID 57534)
-- Name: incident id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident ALTER COLUMN id SET DEFAULT nextval('public.incident_id_seq'::regclass);


--
-- TOC entry 2767 (class 2604 OID 65702)
-- Name: incident_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident_type ALTER COLUMN id SET DEFAULT nextval('public.incident_type_id_seq'::regclass);


--
-- TOC entry 2763 (class 2604 OID 65663)
-- Name: incident_vehicule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident_vehicule ALTER COLUMN id SET DEFAULT nextval('public.incident_vehicule_id_seq'::regclass);


--
-- TOC entry 2762 (class 2604 OID 57589)
-- Name: utilisateur id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.utilisateur ALTER COLUMN id SET DEFAULT nextval('public.utilisateur_id_seq'::regclass);


--
-- TOC entry 2764 (class 2604 OID 65669)
-- Name: vehicule id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicule ALTER COLUMN id SET DEFAULT nextval('public.vehicule_id_seq'::regclass);


--
-- TOC entry 2766 (class 2604 OID 65691)
-- Name: vehicule_etat id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicule_etat ALTER COLUMN id SET DEFAULT nextval('public.vehicule_etat_id_seq'::regclass);


--
-- TOC entry 2765 (class 2604 OID 65680)
-- Name: vehicule_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicule_type ALTER COLUMN id SET DEFAULT nextval('public.vehicule_type_id_seq'::regclass);


--
-- TOC entry 2929 (class 0 OID 57557)
-- Dependencies: 205
-- Data for Name: capteur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.capteur (id, longitude, latitude, intensite) FROM stdin;
1	4.9193855186348365	45.79696613664113	0
2	4.8930614456684305	45.81831765431368	0
3	4.882594727413693	45.8223451610719	0
4	4.9195992397721335	45.79269714693711	0
5	4.925145708387828	45.80144122436369	0
6	4.920183199449991	45.79088341556076	0
7	4.86591871415076	45.77980443955514	0
8	4.883638147438735	45.84858011056466	0
9	4.840235796226779	45.822295695745765	0
10	4.871315339469218	45.78460939895164	0
11	4.838971423953058	45.810131529763474	0
12	4.839606612591694	45.82500846913837	0
13	4.898523205388967	45.78602135117955	0
14	4.840478639895823	45.84470875276031	0
15	4.920167361365688	45.77699636482384	0
16	4.838249395428692	45.7927266011572	0
17	4.872055650406062	45.78479819634008	0
18	4.896545569618103	45.80488677982413	0
19	4.859233059015196	45.812467944986864	0
20	4.847196058290478	45.7676527167058	0
21	4.880165818149526	45.82120161854258	0
22	4.886842559414174	45.82222319854428	0
23	4.859287816573069	45.816291121626904	0
24	4.839670533196128	45.77350133521034	0
25	4.894075505667105	45.77895647393742	0
26	4.857043241936732	45.81555030267597	0
27	4.909512214999435	45.799984370551186	0
28	4.874361864211972	45.82055105220212	0
29	4.842640738228175	45.823997436275924	0
30	4.901090452286817	45.83650785072477	0
31	4.861858074527893	45.765670184580024	0
32	4.88811697791404	45.77758781510538	0
33	4.844877542096588	45.848327603723305	0
34	4.836913960345606	45.799985967620685	0
35	4.908048337258314	45.78475652888067	0
36	4.868402659328104	45.78371233433573	0
37	4.885051707136539	45.815584630069054	0
38	4.900058888181762	45.764860059119336	0
39	4.849942922326858	45.829590603418836	0
40	4.902511596157422	45.82149509929161	0
41	4.919466176629315	45.844098581779846	0
42	4.837291142435774	45.82053714940809	0
43	4.909829527793188	45.76774775181366	0
44	4.881964408509252	45.84764866336999	0
45	4.886303005212701	45.79728203620437	0
46	4.899504771339683	45.84073996733941	0
47	4.853659103770208	45.815861190947366	0
48	4.896631856432068	45.85286551339549	0
49	4.86858084763313	45.78206102060311	0
50	4.915110113032778	45.82853311727608	0
51	4.8400173718772255	45.84242238270973	0
52	4.864834968346447	45.793247467027314	0
53	4.863631001029278	45.84524617344467	0
54	4.912868685742008	45.806097700858764	0
55	4.8721064491825725	45.85051563766185	0
56	4.879273139312043	45.84416969597332	0
57	4.844673438990026	45.791764010139595	0
58	4.921130673993796	45.814275971158445	0
59	4.89886409276364	45.819971526830436	0
60	4.896768523723528	45.78411603619163	0
\.


--
-- TOC entry 2949 (class 0 OID 73833)
-- Dependencies: 225
-- Data for Name: capteur_incident; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.capteur_incident (id, date, horaire, intensite, id_capteur, id_incident) FROM stdin;
\.


--
-- TOC entry 2947 (class 0 OID 65740)
-- Dependencies: 223
-- Data for Name: conf_pos_geo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conf_pos_geo (id, latitude, longitude, rayon_km, b_actif) FROM stdin;
1	45.7633171081543	4.835659027099609	10	t
\.


--
-- TOC entry 2945 (class 0 OID 65721)
-- Dependencies: 221
-- Data for Name: etablissement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.etablissement (id, latitude, longitude, nom, id_etablissement_type) FROM stdin;
1	45.76364	4.84409	Centre d'intervention Lyon Corneille	1
4	45.78428	4.82116	Centre d'intervention Lyon Croix-Rousse	2
5	45.78001	4.87869	Centre d'intervention Villeurbanne	3
3	45.75017	4.84656	Centre d'intervention Lyon Rochat	2
\.


--
-- TOC entry 2943 (class 0 OID 65710)
-- Dependencies: 219
-- Data for Name: etablissement_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.etablissement_type (id, libelle, code) FROM stdin;
1	Centre de secours principal	CSP
2	Centre de secours	CS
3	Centre de première intervention	CPI
\.


--
-- TOC entry 2927 (class 0 OID 57531)
-- Dependencies: 203
-- Data for Name: incident; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incident (id, longitude, latitude, intensite, id_incident_type) FROM stdin;
\.


--
-- TOC entry 2941 (class 0 OID 65699)
-- Dependencies: 217
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
-- TOC entry 2933 (class 0 OID 65660)
-- Dependencies: 209
-- Data for Name: incident_vehicule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.incident_vehicule (id, date, id_incident, id_vehicule) FROM stdin;
\.


--
-- TOC entry 2931 (class 0 OID 57586)
-- Dependencies: 207
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.utilisateur (id, nom, prenom, password) FROM stdin;
1	Administrateur	\N	032679f8fb88a403ff786d628c7e9421cfa9773fd600dc4eea0c2a7f20bdbbb0
\.


--
-- TOC entry 2935 (class 0 OID 65666)
-- Dependencies: 211
-- Data for Name: vehicule; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicule (id, nom, latitude, longitude, id_etablissement, id_vehicule_type, id_vehicule_etat) FROM stdin;
1	CamionA	45.79696613664113	4.9193855186348365	1	1	1
2	CamionB	45.81831765431368	4.9193855186348365	2	2	1
3	CamionC	45.79696613664113	4.921130673993796	3	5	1
\.


--
-- TOC entry 2939 (class 0 OID 65688)
-- Dependencies: 215
-- Data for Name: vehicule_etat; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicule_etat (id, libelle, code) FROM stdin;
1	En Stand-by	SB
2	En intervention	INTER
3	En route pour intervention	RI
4	En route pour ravitaillement	RR
\.


--
-- TOC entry 2937 (class 0 OID 65677)
-- Dependencies: 213
-- Data for Name: vehicule_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vehicule_type (id, libelle, code, capacite_extinction) FROM stdin;
1	Vehicule Secours Routier	VSR	50
2	Echelle Pivotante Automatique	EPA	45
3	Fourgon pompe-tonne	FPT	55
4	Fourgon Pompe-Tonne Secours Routiers	FPTSR	70
5	Camion-citerne	CC	75
6	Camion-citerne Feux de forêts	CCF	30
7	Vehicule de Secours et d'Assistance aux Victimes	VSAV	10
8	Avion Bombardier d'eau	ABE	90
9	Hélicoptère Bombardier d'eau	HBE	80
\.


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 204
-- Name: capteur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.capteur_id_seq', 60, true);


--
-- TOC entry 2969 (class 0 OID 0)
-- Dependencies: 224
-- Name: capteur_incident_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.capteur_incident_id_seq', 1, true);


--
-- TOC entry 2970 (class 0 OID 0)
-- Dependencies: 222
-- Name: conf_pos_geo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conf_pos_geo_id_seq', 2, true);


--
-- TOC entry 2971 (class 0 OID 0)
-- Dependencies: 220
-- Name: etablissement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.etablissement_id_seq', 5, true);


--
-- TOC entry 2972 (class 0 OID 0)
-- Dependencies: 218
-- Name: etablissement_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.etablissement_type_id_seq', 3, true);


--
-- TOC entry 2973 (class 0 OID 0)
-- Dependencies: 202
-- Name: incident_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incident_id_seq', 1, false);


--
-- TOC entry 2974 (class 0 OID 0)
-- Dependencies: 216
-- Name: incident_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incident_type_id_seq', 6, true);


--
-- TOC entry 2975 (class 0 OID 0)
-- Dependencies: 208
-- Name: incident_vehicule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.incident_vehicule_id_seq', 1, false);


--
-- TOC entry 2976 (class 0 OID 0)
-- Dependencies: 206
-- Name: utilisateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.utilisateur_id_seq', 1, true);


--
-- TOC entry 2977 (class 0 OID 0)
-- Dependencies: 214
-- Name: vehicule_etat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicule_etat_id_seq', 4, true);


--
-- TOC entry 2978 (class 0 OID 0)
-- Dependencies: 210
-- Name: vehicule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicule_id_seq', 3, true);


--
-- TOC entry 2979 (class 0 OID 0)
-- Dependencies: 212
-- Name: vehicule_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vehicule_type_id_seq', 9, true);


--
-- TOC entry 2775 (class 2606 OID 57562)
-- Name: capteur capteur_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capteur
    ADD CONSTRAINT capteur_pk PRIMARY KEY (id);


--
-- TOC entry 2791 (class 2606 OID 65745)
-- Name: conf_pos_geo conf_pos_geo_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conf_pos_geo
    ADD CONSTRAINT conf_pos_geo_pk PRIMARY KEY (id);


--
-- TOC entry 2789 (class 2606 OID 65729)
-- Name: etablissement etablissement_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissement
    ADD CONSTRAINT etablissement_pk PRIMARY KEY (id);


--
-- TOC entry 2787 (class 2606 OID 65718)
-- Name: etablissement_type etablissement_type_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissement_type
    ADD CONSTRAINT etablissement_type_pk PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 57542)
-- Name: incident incident_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident
    ADD CONSTRAINT incident_pk PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 65707)
-- Name: incident_type incident_type_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident_type
    ADD CONSTRAINT incident_type_pk PRIMARY KEY (id);


--
-- TOC entry 2777 (class 2606 OID 65731)
-- Name: incident_vehicule incident_vehicule_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident_vehicule
    ADD CONSTRAINT incident_vehicule_pk PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 65696)
-- Name: vehicule_etat vehicule_etat_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicule_etat
    ADD CONSTRAINT vehicule_etat_pk PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 65674)
-- Name: vehicule vehicule_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicule
    ADD CONSTRAINT vehicule_pk PRIMARY KEY (id);


--
-- TOC entry 2781 (class 2606 OID 65685)
-- Name: vehicule_type vehicule_type_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicule_type
    ADD CONSTRAINT vehicule_type_pk PRIMARY KEY (id);


--
-- TOC entry 2799 (class 2606 OID 73842)
-- Name: capteur_incident capteur_incident_capteur_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capteur_incident
    ADD CONSTRAINT capteur_incident_capteur_fk FOREIGN KEY (id_capteur) REFERENCES public.capteur(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2798 (class 2606 OID 73837)
-- Name: capteur_incident capteur_incident_fk_1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.capteur_incident
    ADD CONSTRAINT capteur_incident_fk_1 FOREIGN KEY (id_incident) REFERENCES public.incident(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2797 (class 2606 OID 65756)
-- Name: etablissement etablissement_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.etablissement
    ADD CONSTRAINT etablissement_fk FOREIGN KEY (id_etablissement_type) REFERENCES public.etablissement_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2792 (class 2606 OID 65733)
-- Name: incident incident_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident
    ADD CONSTRAINT incident_fk FOREIGN KEY (id_incident_type) REFERENCES public.incident_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2793 (class 2606 OID 65761)
-- Name: incident_vehicule incident_vehicule_incident_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident_vehicule
    ADD CONSTRAINT incident_vehicule_incident_fk FOREIGN KEY (id_incident) REFERENCES public.incident(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2794 (class 2606 OID 65766)
-- Name: incident_vehicule incident_vehicule_vehicule_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.incident_vehicule
    ADD CONSTRAINT incident_vehicule_vehicule_fk FOREIGN KEY (id_vehicule) REFERENCES public.vehicule(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2796 (class 2606 OID 65751)
-- Name: vehicule vehicule_etat_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicule
    ADD CONSTRAINT vehicule_etat_fk FOREIGN KEY (id_vehicule_etat) REFERENCES public.vehicule_etat(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2795 (class 2606 OID 65746)
-- Name: vehicule vehicule_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vehicule
    ADD CONSTRAINT vehicule_type_fk FOREIGN KEY (id_vehicule_type) REFERENCES public.vehicule_type(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2021-01-13 19:28:11

--
-- PostgreSQL database dump complete
--

