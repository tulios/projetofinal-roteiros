--
-- PostgreSQL database dump
--

SET client_encoding = 'utf-8';
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: viajarabessa
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE cities (
    id integer NOT NULL,
    state_id integer NOT NULL,
    name character varying(255),
    capital boolean,
    latitude double precision,
    longitude double precision
);


ALTER TABLE public.cities OWNER TO viajarabessa;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE countries (
    id integer NOT NULL,
    symbol character varying(255),
    name character varying(255)
);


ALTER TABLE public.countries OWNER TO viajarabessa;

--
-- Name: destinations; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE destinations (
    id integer NOT NULL,
    planned_cost double precision,
    start_date date,
    end_date date,
    vehicle_id integer,
    roadmap_id integer,
    city_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.destinations OWNER TO viajarabessa;

--
-- Name: evaluations; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE evaluations (
    id integer NOT NULL,
    criticism text,
    city_id integer NOT NULL,
    user_id integer NOT NULL,
    general integer DEFAULT 0,
    service integer DEFAULT 0,
    clean integer DEFAULT 0,
    "location" integer DEFAULT 0,
    price integer DEFAULT 0,
    infrastructure integer DEFAULT 0,
    attendance integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.evaluations OWNER TO viajarabessa;

--
-- Name: event_evaluations; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE event_evaluations (
    id integer NOT NULL,
    event_id integer NOT NULL,
    evaluation_id integer NOT NULL
);


ALTER TABLE public.event_evaluations OWNER TO viajarabessa;

--
-- Name: event_tips; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE event_tips (
    id integer NOT NULL,
    event_id integer,
    tip_id integer
);


ALTER TABLE public.event_tips OWNER TO viajarabessa;

--
-- Name: events; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    city_id integer,
    user_id integer,
    name character varying(255),
    "time" timestamp without time zone,
    address character varying(255),
    cost double precision DEFAULT 0.0,
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.events OWNER TO viajarabessa;

--
-- Name: programs; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE programs (
    id integer NOT NULL,
    date date,
    value double precision DEFAULT 0.0,
    description text,
    destination_id integer NOT NULL,
    tourist_sight_id integer,
    shop_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.programs OWNER TO viajarabessa;

--
-- Name: regions; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE regions (
    id integer NOT NULL,
    country_id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.regions OWNER TO viajarabessa;

--
-- Name: roadmaps; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE roadmaps (
    id integer NOT NULL,
    title character varying(255),
    description text,
    public boolean DEFAULT false,
    city_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.roadmaps OWNER TO viajarabessa;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.roles OWNER TO viajarabessa;

--
-- Name: roles_users; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE roles_users (
    role_id integer,
    user_id integer
);


ALTER TABLE public.roles_users OWNER TO viajarabessa;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO viajarabessa;

--
-- Name: shop_evaluations; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE shop_evaluations (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    evaluation_id integer NOT NULL
);


ALTER TABLE public.shop_evaluations OWNER TO viajarabessa;

--
-- Name: shop_tips; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE shop_tips (
    id integer NOT NULL,
    shop_id integer,
    tip_id integer
);


ALTER TABLE public.shop_tips OWNER TO viajarabessa;

--
-- Name: shops; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE shops (
    id integer NOT NULL,
    name character varying(255),
    address character varying(255),
    phone character varying(14),
    fax character varying(14),
    email character varying(255),
    site character varying(255),
    description text,
    additional_info text,
    key_words text,
    hits integer DEFAULT 0,
    city_id integer NOT NULL,
    user_id integer NOT NULL,
    tourist_sight_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.shops OWNER TO viajarabessa;

--
-- Name: states; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE states (
    id integer NOT NULL,
    region_id integer NOT NULL,
    symbol character varying(255),
    name character varying(255)
);


ALTER TABLE public.states OWNER TO viajarabessa;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.tags OWNER TO viajarabessa;

--
-- Name: tips; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE tips (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.tips OWNER TO viajarabessa;

--
-- Name: tourist_sight_evaluations; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE tourist_sight_evaluations (
    id integer NOT NULL,
    tourist_sight_id integer NOT NULL,
    evaluation_id integer NOT NULL
);


ALTER TABLE public.tourist_sight_evaluations OWNER TO viajarabessa;

--
-- Name: tourist_sight_tags; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE tourist_sight_tags (
    id integer NOT NULL,
    tourist_sight_id integer NOT NULL,
    tag_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.tourist_sight_tags OWNER TO viajarabessa;

--
-- Name: tourist_sight_tips; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE tourist_sight_tips (
    id integer NOT NULL,
    tourist_sight_id integer NOT NULL,
    tip_id integer NOT NULL
);


ALTER TABLE public.tourist_sight_tips OWNER TO viajarabessa;

--
-- Name: tourist_sights; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE tourist_sights (
    id integer NOT NULL,
    name character varying(255),
    address character varying(255),
    phone character varying(255),
    email character varying(255),
    visitation_period character varying(255),
    description text,
    city_id integer NOT NULL,
    user_id integer NOT NULL,
    hits integer DEFAULT 0,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.tourist_sights OWNER TO viajarabessa;

--
-- Name: users; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    "login" character varying(255),
    email character varying(255),
    sex character varying(1),
    birthday date,
    city_id integer,
    crypted_password character varying(40),
    salt character varying(40),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    remember_token character varying(255),
    remember_token_expires_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO viajarabessa;

--
-- Name: vehicles; Type: TABLE; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE TABLE vehicles (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.vehicles OWNER TO viajarabessa;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cities_id_seq OWNER TO viajarabessa;

--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('cities_id_seq', 1, false);


--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO viajarabessa;

--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('countries_id_seq', 1, false);


--
-- Name: destinations_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE destinations_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.destinations_id_seq OWNER TO viajarabessa;

--
-- Name: destinations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('destinations_id_seq', 3, true);


--
-- Name: evaluations_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE evaluations_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.evaluations_id_seq OWNER TO viajarabessa;

--
-- Name: evaluations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('evaluations_id_seq', 81, true);


--
-- Name: event_evaluations_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE event_evaluations_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.event_evaluations_id_seq OWNER TO viajarabessa;

--
-- Name: event_evaluations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('event_evaluations_id_seq', 5, true);


--
-- Name: event_tips_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE event_tips_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.event_tips_id_seq OWNER TO viajarabessa;

--
-- Name: event_tips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('event_tips_id_seq', 1, true);


--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE events_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO viajarabessa;

--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('events_id_seq', 55, true);


--
-- Name: programs_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE programs_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.programs_id_seq OWNER TO viajarabessa;

--
-- Name: programs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('programs_id_seq', 1, true);


--
-- Name: regions_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.regions_id_seq OWNER TO viajarabessa;

--
-- Name: regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('regions_id_seq', 1, false);


--
-- Name: roadmaps_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE roadmaps_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.roadmaps_id_seq OWNER TO viajarabessa;

--
-- Name: roadmaps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('roadmaps_id_seq', 4, true);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO viajarabessa;

--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('roles_id_seq', 1, false);


--
-- Name: shop_evaluations_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE shop_evaluations_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.shop_evaluations_id_seq OWNER TO viajarabessa;

--
-- Name: shop_evaluations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('shop_evaluations_id_seq', 22, true);


--
-- Name: shop_tips_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE shop_tips_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.shop_tips_id_seq OWNER TO viajarabessa;

--
-- Name: shop_tips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('shop_tips_id_seq', 2, true);


--
-- Name: shops_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE shops_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.shops_id_seq OWNER TO viajarabessa;

--
-- Name: shops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('shops_id_seq', 80, true);


--
-- Name: states_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.states_id_seq OWNER TO viajarabessa;

--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('states_id_seq', 1, false);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO viajarabessa;

--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('tags_id_seq', 1, false);


--
-- Name: tips_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE tips_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tips_id_seq OWNER TO viajarabessa;

--
-- Name: tips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('tips_id_seq', 15, true);


--
-- Name: tourist_sight_evaluations_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE tourist_sight_evaluations_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tourist_sight_evaluations_id_seq OWNER TO viajarabessa;

--
-- Name: tourist_sight_evaluations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('tourist_sight_evaluations_id_seq', 54, true);


--
-- Name: tourist_sight_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE tourist_sight_tags_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tourist_sight_tags_id_seq OWNER TO viajarabessa;

--
-- Name: tourist_sight_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('tourist_sight_tags_id_seq', 34, true);


--
-- Name: tourist_sight_tips_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE tourist_sight_tips_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tourist_sight_tips_id_seq OWNER TO viajarabessa;

--
-- Name: tourist_sight_tips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('tourist_sight_tips_id_seq', 12, true);


--
-- Name: tourist_sights_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE tourist_sights_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tourist_sights_id_seq OWNER TO viajarabessa;

--
-- Name: tourist_sights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('tourist_sights_id_seq', 79, true);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE users_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO viajarabessa;

--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('users_id_seq', 9, true);


--
-- Name: vehicles_id_seq; Type: SEQUENCE; Schema: public; Owner: viajarabessa
--

CREATE SEQUENCE vehicles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.vehicles_id_seq OWNER TO viajarabessa;

--
-- Name: vehicles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: viajarabessa
--

SELECT pg_catalog.setval('vehicles_id_seq', 1, false);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE destinations ALTER COLUMN id SET DEFAULT nextval('destinations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE evaluations ALTER COLUMN id SET DEFAULT nextval('evaluations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE event_evaluations ALTER COLUMN id SET DEFAULT nextval('event_evaluations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE event_tips ALTER COLUMN id SET DEFAULT nextval('event_tips_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE programs ALTER COLUMN id SET DEFAULT nextval('programs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE regions ALTER COLUMN id SET DEFAULT nextval('regions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE roadmaps ALTER COLUMN id SET DEFAULT nextval('roadmaps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE roles ALTER COLUMN id SET DEFAULT nextval('roles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE shop_evaluations ALTER COLUMN id SET DEFAULT nextval('shop_evaluations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE shop_tips ALTER COLUMN id SET DEFAULT nextval('shop_tips_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE shops ALTER COLUMN id SET DEFAULT nextval('shops_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE states ALTER COLUMN id SET DEFAULT nextval('states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE tips ALTER COLUMN id SET DEFAULT nextval('tips_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE tourist_sight_evaluations ALTER COLUMN id SET DEFAULT nextval('tourist_sight_evaluations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE tourist_sight_tags ALTER COLUMN id SET DEFAULT nextval('tourist_sight_tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE tourist_sight_tips ALTER COLUMN id SET DEFAULT nextval('tourist_sight_tips_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE tourist_sights ALTER COLUMN id SET DEFAULT nextval('tourist_sights_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: viajarabessa
--

ALTER TABLE vehicles ALTER COLUMN id SET DEFAULT nextval('vehicles_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO cities VALUES (1, 1, 'Acrelândia', false, -9.8253758999999992, -66.886479399999999);
INSERT INTO cities VALUES (2, 1, 'Assis Brasil', false, -10.9426919, -69.574574699999999);
INSERT INTO cities VALUES (3, 1, 'Brasiléia', false, -11.006940500000001, -68.742604);
INSERT INTO cities VALUES (4, 1, 'Bujari', false, -9.8227402999999995, -67.947528300000002);
INSERT INTO cities VALUES (5, 1, 'Capixaba', false, -10.5609474, -67.690336599999995);
INSERT INTO cities VALUES (6, 1, 'Cruzeiro do Sul', false, -7.6649022999999996, -72.650361099999998);
INSERT INTO cities VALUES (7, 1, 'Epitaciolândia', false, -11.0166536, -68.733681000000004);
INSERT INTO cities VALUES (8, 1, 'Feijó', false, -8.1706521999999993, -70.358231900000007);
INSERT INTO cities VALUES (9, 1, 'Jordão', false, -9.4343553999999994, -71.884539399999994);
INSERT INTO cities VALUES (10, 1, 'Mâncio Lima', false, -7.6222509000000001, -72.892339699999994);
INSERT INTO cities VALUES (11, 1, 'Manoel Urbano', false, -8.8734111999999996, -69.280180400000006);
INSERT INTO cities VALUES (12, 1, 'Marechal Thaumaturgo', false, -8.9413532999999994, -72.792541200000002);
INSERT INTO cities VALUES (13, 1, 'Plácido de Castro', false, -10.2673205, -67.188436199999998);
INSERT INTO cities VALUES (14, 1, 'Porto Acre', false, -9.5763222999999993, -67.550805499999996);
INSERT INTO cities VALUES (15, 1, 'Porto Walter', false, -8.2693522000000002, -72.744540099999995);
INSERT INTO cities VALUES (16, 1, 'Rodrigues Alves', false, -7.7303724000000003, -72.651439199999999);
INSERT INTO cities VALUES (17, 1, 'Santa Rosa do Purus', false, -9.4333574999999996, -70.493535199999997);
INSERT INTO cities VALUES (18, 1, 'Sena Madureira', false, -9.0672055, -68.6576716);
INSERT INTO cities VALUES (19, 1, 'Senador Guiomard', false, -10.1479684, -67.731960999999998);
INSERT INTO cities VALUES (20, 1, 'Tarauacá', false, -8.1356236000000006, -70.764977200000004);
INSERT INTO cities VALUES (21, 1, 'Xapuri', false, -10.6359712, -68.494586499999997);
INSERT INTO cities VALUES (22, 1, 'Rio Branco', true, -9.9739988999999998, -67.807568000000003);
INSERT INTO cities VALUES (23, 2, 'Acrelândia', false, -9.8253758999999992, -66.886479399999999);
INSERT INTO cities VALUES (24, 2, 'Assis Brasil', false, -22.639014299999999, -50.399535899999997);
INSERT INTO cities VALUES (25, 2, 'Brasiléia', false, -3.1009142000000001, -60.060757799999998);
INSERT INTO cities VALUES (26, 2, 'Bujari', false, -9.8227402999999995, -67.947528300000002);
INSERT INTO cities VALUES (27, 2, 'Capixaba', false, -9.9821127999999995, -67.828597099999996);
INSERT INTO cities VALUES (28, 2, 'Cruzeiro do Sul', false, -7.6649022999999996, -72.650361099999998);
INSERT INTO cities VALUES (29, 2, 'Epitaciolândia', false, -7.6545629999999996, -65.540497000000002);
INSERT INTO cities VALUES (30, 2, 'Feijó', false, -8.1706521999999993, -70.358231900000007);
INSERT INTO cities VALUES (31, 2, 'Jordão', false, -3.0369609999999998, -59.951724300000002);
INSERT INTO cities VALUES (32, 2, 'Mâncio Lima', false, -7.6222509000000001, -72.892339699999994);
INSERT INTO cities VALUES (33, 2, 'Manoel Urbano', false, -8.8734111999999996, -69.280180400000006);
INSERT INTO cities VALUES (34, 2, 'Marechal Thaumaturgo', false, -7.6545629999999996, -65.540497000000002);
INSERT INTO cities VALUES (35, 2, 'Plácido de Castro', false, -10.2673205, -67.188436199999998);
INSERT INTO cities VALUES (36, 2, 'Porto Acre', false, -9.5763222999999993, -67.550805499999996);
INSERT INTO cities VALUES (37, 2, 'Porto Walter', false, -8.2693522000000002, -72.744540099999995);
INSERT INTO cities VALUES (38, 2, 'Rodrigues Alves', false, -7.7303724000000003, -72.651439199999999);
INSERT INTO cities VALUES (39, 2, 'Santa Rosa do Purus', false, -5.8394544000000002, -64.308658199999996);
INSERT INTO cities VALUES (40, 2, 'Sena Madureira', false, -9.0672055, -68.6576716);
INSERT INTO cities VALUES (41, 2, 'Senador Guiomard', false, -7.6545629999999996, -65.540497000000002);
INSERT INTO cities VALUES (42, 2, 'Tarauacá', false, -8.1356236000000006, -70.764977200000004);
INSERT INTO cities VALUES (43, 2, 'Xapuri', false, -9.9922129000000002, -67.819057099999995);
INSERT INTO cities VALUES (44, 2, 'Manaus', true, -3.1071922999999999, -60.026126699999999);
INSERT INTO cities VALUES (45, 3, 'Amapá', false, 2.0510817000000001, -50.794464499999997);
INSERT INTO cities VALUES (46, 3, 'Calçoene', false, 2.4980353000000002, -50.949626600000002);
INSERT INTO cities VALUES (47, 3, 'Cutias', false, 0.95337499999999997, -50.777046200000001);
INSERT INTO cities VALUES (48, 3, 'Ferreira Gomes', false, 0.85376039999999997, -51.194077700000001);
INSERT INTO cities VALUES (49, 3, 'Itaubal', false, 1.683333, -51);
INSERT INTO cities VALUES (50, 3, 'Laranjal do Jari', false, -0.83235930000000002, -52.410395899999997);
INSERT INTO cities VALUES (51, 3, 'Mazagão', false, -0.1162033, -51.2859622);
INSERT INTO cities VALUES (52, 3, 'Oiapoque', false, 3.8314881000000001, -51.8354444);
INSERT INTO cities VALUES (53, 3, 'Pedra Branca do Amaparí', false, 0.76946780000000004, -51.953746199999998);
INSERT INTO cities VALUES (54, 3, 'Porto Grande', false, 0.70438650000000003, -51.409554);
INSERT INTO cities VALUES (55, 3, 'Pracuúba', false, 1.7238756, -50.875377899999997);
INSERT INTO cities VALUES (56, 3, 'Santana', false, -0.044217899999999997, -51.178431600000003);
INSERT INTO cities VALUES (57, 3, 'Serra do Navio', false, 0.86687340000000002, -52.025769599999997);
INSERT INTO cities VALUES (58, 3, 'Tartarugalzinho', false, 1.5059572999999999, -50.911406100000001);
INSERT INTO cities VALUES (59, 3, 'Vitória do Jari', false, -0.80609810000000004, -52.4799583);
INSERT INTO cities VALUES (60, 3, 'Macapá', true, 0.034456599999999997, -51.066563899999998);
INSERT INTO cities VALUES (61, 4, 'Abaetetuba', false, -1.7295061, -48.874252599999998);
INSERT INTO cities VALUES (62, 4, 'Abel Figueiredo', false, -4.9550210000000003, -48.393107999999998);
INSERT INTO cities VALUES (63, 4, 'Acará', false, -1.9603326000000001, -48.196543400000003);
INSERT INTO cities VALUES (64, 4, 'Afuá', false, 0.1525, -50.389721999999999);
INSERT INTO cities VALUES (65, 4, 'Água Azul do Norte', false, -6.8018394000000004, -50.467208300000003);
INSERT INTO cities VALUES (66, 4, 'Alenquer', false, -1.9424698, -54.7374382);
INSERT INTO cities VALUES (67, 4, 'Almeirim', false, -1.5205331, -52.581468000000001);
INSERT INTO cities VALUES (68, 4, 'Altamira', false, -3.1945972, -52.2093153);
INSERT INTO cities VALUES (69, 4, 'Anajás', false, -0.98733950000000004, -49.9404331);
INSERT INTO cities VALUES (70, 4, 'Ananindeua', false, -1.366384, -48.372231399999997);
INSERT INTO cities VALUES (71, 4, 'Anapu', false, -3.4725451999999999, -51.198642499999998);
INSERT INTO cities VALUES (72, 4, 'Augusto Corrêa', false, -1.0241411, -46.653811300000001);
INSERT INTO cities VALUES (73, 4, 'Aurora do Pará', false, -2.1343858, -47.555697299999999);
INSERT INTO cities VALUES (74, 4, 'Aveiro', false, -3.6108528999999998, -55.320374000000001);
INSERT INTO cities VALUES (75, 4, 'Bagre', false, -1.9003458, -50.164433699999996);
INSERT INTO cities VALUES (76, 4, 'Baião', false, -2.7931010000000001, -49.662800900000001);
INSERT INTO cities VALUES (77, 4, 'Bannach', false, -7.3483752999999998, -50.396438400000001);
INSERT INTO cities VALUES (78, 4, 'Barcarena', false, -1.5189079000000001, -48.617001000000002);
INSERT INTO cities VALUES (79, 4, 'Belterra', false, -2.6982895999999998, -54.888321300000001);
INSERT INTO cities VALUES (80, 4, 'Benevides', false, -1.361334, -48.2454246);
INSERT INTO cities VALUES (81, 4, 'Bom Jesus do Tocantins', false, -5.0499644000000004, -48.6099204);
INSERT INTO cities VALUES (82, 4, 'Bonito', false, -1.3633662, -47.306369599999996);
INSERT INTO cities VALUES (83, 4, 'Bragança', false, -1.0659524, -46.789510200000002);
INSERT INTO cities VALUES (84, 4, 'Brasil Novo', false, -3.3376728, -52.5745085);
INSERT INTO cities VALUES (85, 4, 'Brejo Grande do Araguaia', false, -5.7041221999999996, -48.411378599999999);
INSERT INTO cities VALUES (86, 4, 'Breu Branco', false, -4.0093579999999998, -49.461430200000002);
INSERT INTO cities VALUES (87, 4, 'Breves', false, -1.6825623999999999, -50.480836500000002);
INSERT INTO cities VALUES (88, 4, 'Bujaru', false, -1.52071, -48.043549300000002);
INSERT INTO cities VALUES (89, 4, 'Cachoeira do Arari', false, -1.0044187, -48.957357999999999);
INSERT INTO cities VALUES (90, 4, 'Cachoeira do Piriá', false, -1.7425157, -46.570720799999997);
INSERT INTO cities VALUES (91, 4, 'Cametá', false, -2.2540650000000002, -49.512282800000001);
INSERT INTO cities VALUES (92, 4, 'Canaã dos Carajás', false, -6.4973713000000002, -49.878435500000002);
INSERT INTO cities VALUES (93, 4, 'Capanema', false, -1.1964011000000001, -47.181609700000003);
INSERT INTO cities VALUES (94, 4, 'Capitão Poço', false, -1.7464396, -47.065910100000004);
INSERT INTO cities VALUES (95, 4, 'Castanhal', false, -1.2973326000000001, -47.922132499999996);
INSERT INTO cities VALUES (96, 4, 'Chaves', false, 0.1525, -49.999721999999998);
INSERT INTO cities VALUES (97, 4, 'Colares', false, -0.94166039999999995, -48.2730417);
INSERT INTO cities VALUES (98, 4, 'Conceição do Araguaia', false, -8.2581071000000001, -49.2695674);
INSERT INTO cities VALUES (99, 4, 'Concórdia do Pará', false, -1.9915598999999999, -47.949458800000002);
INSERT INTO cities VALUES (100, 4, 'Cumaru do Norte', false, -7.8245092999999999, -50.773454200000003);
INSERT INTO cities VALUES (101, 4, 'Curionópolis', false, -6.0661642999999996, -49.561058099999997);
INSERT INTO cities VALUES (102, 4, 'Curralinho', false, -0.53642800000000002, -49.184379999999997);
INSERT INTO cities VALUES (103, 4, 'Curuá', false, -1.9053245000000001, -55.169662600000002);
INSERT INTO cities VALUES (104, 4, 'Curuçá', false, -0.73987820000000004, -47.851888000000002);
INSERT INTO cities VALUES (105, 4, 'Dom Eliseu', false, -4.2966106999999996, -47.556608199999999);
INSERT INTO cities VALUES (106, 4, 'Eldorado dos Carajás', false, -6.1085617000000001, -49.346536800000003);
INSERT INTO cities VALUES (107, 4, 'Faro', false, -2.1696792999999999, -56.742139999999999);
INSERT INTO cities VALUES (108, 4, 'Floresta do Araguaia', false, -7.5543500000000003, -49.7134584);
INSERT INTO cities VALUES (109, 4, 'Garrafão do Norte', false, -1.9329767, -47.049593999999999);
INSERT INTO cities VALUES (110, 4, 'Goianésia do Pará', false, -3.8434973000000001, -49.092019800000003);
INSERT INTO cities VALUES (111, 4, 'Gurupá', false, -1.4053426, -51.640442399999998);
INSERT INTO cities VALUES (112, 4, 'Igarapé-Açu', false, -1.1278986, -47.615647500000001);
INSERT INTO cities VALUES (113, 4, 'Igarapé-Miri', false, -1.9770825000000001, -48.959379200000001);
INSERT INTO cities VALUES (114, 4, 'Inhangapi', false, -1.348463, -47.910639500000002);
INSERT INTO cities VALUES (115, 4, 'Ipixuna do Pará', false, -2.5586384, -47.495899100000003);
INSERT INTO cities VALUES (116, 4, 'Irituia', false, -1.7744626999999999, -47.4412995);
INSERT INTO cities VALUES (117, 4, 'Itaituba', false, -4.2701136999999996, -55.987330999999998);
INSERT INTO cities VALUES (118, 4, 'Itupiranga', false, -5.1734646, -49.365630299999999);
INSERT INTO cities VALUES (119, 4, 'Jacareacanga', false, -6.2066039000000002, -57.824474000000002);
INSERT INTO cities VALUES (120, 4, 'Jacundá', false, -4.5227909999999998, -49.439861999999998);
INSERT INTO cities VALUES (121, 4, 'Juruti', false, -3.7017829999999998, -56.582649000000004);
INSERT INTO cities VALUES (122, 4, 'Limoeiro do Ajuru', false, -1.8981159000000001, -49.390688900000001);
INSERT INTO cities VALUES (123, 4, 'Mãe do Rio', false, -2.0606933999999999, -47.553577300000001);
INSERT INTO cities VALUES (124, 4, 'Magalhães Barata', false, -0.79798959999999997, -47.602757400000002);
INSERT INTO cities VALUES (125, 4, 'Marabá', false, -5.3709318000000001, -49.1180588);
INSERT INTO cities VALUES (126, 4, 'Maracanã', false, -0.77853950000000005, -47.451186399999997);
INSERT INTO cities VALUES (127, 4, 'Marapanim', false, -0.71046310000000001, -47.697684000000002);
INSERT INTO cities VALUES (128, 4, 'Marituba', false, -1.3553199, -48.343203199999998);
INSERT INTO cities VALUES (129, 4, 'Medicilândia', false, -3.4486493, -52.889171400000002);
INSERT INTO cities VALUES (130, 4, 'Melgaço', false, -1.8048211000000001, -50.716957999999998);
INSERT INTO cities VALUES (131, 4, 'Mocajuba', false, -2.5920149000000001, -49.483209700000003);
INSERT INTO cities VALUES (132, 4, 'Moju', false, -1.884701, -48.765214999999998);
INSERT INTO cities VALUES (133, 4, 'Monte Alegre', false, -1.9989463000000001, -54.082890599999999);
INSERT INTO cities VALUES (134, 4, 'Muaná', false, -1.5283438, -49.217427700000002);
INSERT INTO cities VALUES (135, 4, 'Nova Esperança do Piriá', false, -2.2693487999999999, -46.966413600000003);
INSERT INTO cities VALUES (136, 4, 'Nova Ipixuna', false, -4.9229444000000004, -49.0719463);
INSERT INTO cities VALUES (137, 4, 'Nova Timboteua', false, -1.2131912, -47.388381099999997);
INSERT INTO cities VALUES (138, 4, 'Novo Progresso', false, -7.1446282999999999, -55.378599999999999);
INSERT INTO cities VALUES (139, 4, 'Novo Repartimento', false, -4.3313595999999999, -49.7964324);
INSERT INTO cities VALUES (140, 4, 'Óbidos', false, -1.9020444000000001, -55.5195644);
INSERT INTO cities VALUES (141, 4, 'Oeiras do Pará', false, -2.0023944, -49.845627700000001);
INSERT INTO cities VALUES (142, 4, 'Oriximiná', false, -1.7599435999999999, -55.862470199999997);
INSERT INTO cities VALUES (143, 4, 'Ourém', false, -1.5482043000000001, -47.110424299999998);
INSERT INTO cities VALUES (144, 4, 'Ourilândia do Norte', false, -6.7492966000000001, -51.081485999999998);
INSERT INTO cities VALUES (145, 4, 'Pacajá', false, -3.8354184999999998, -50.6379193);
INSERT INTO cities VALUES (146, 4, 'Palestina do Pará', false, -5.7495485000000004, -48.317758099999999);
INSERT INTO cities VALUES (147, 4, 'Paragominas', false, -2.9973850999999998, -47.353452300000001);
INSERT INTO cities VALUES (148, 4, 'Parauapebas', false, -6.0707409999999999, -49.9043353);
INSERT INTO cities VALUES (149, 4, 'Pau d`Arco', false, -7.8334951000000004, -50.042556699999999);
INSERT INTO cities VALUES (150, 4, 'Peixe-Boi', false, -1.2047551999999999, -47.315191599999999);
INSERT INTO cities VALUES (151, 4, 'Piçarra', false, -6.4421018999999999, -48.8712491);
INSERT INTO cities VALUES (152, 4, 'Placas', false, -3.8730728000000001, -54.219847100000003);
INSERT INTO cities VALUES (153, 4, 'Ponta de Pedras', false, -1.3905510000000001, -48.870343499999997);
INSERT INTO cities VALUES (154, 4, 'Portel', false, -1.9422948, -50.809064599999999);
INSERT INTO cities VALUES (155, 4, 'Porto de Moz', false, -1.7483443999999999, -52.238446000000003);
INSERT INTO cities VALUES (156, 4, 'Prainha', false, -6.6666670000000003, -57.75);
INSERT INTO cities VALUES (157, 4, 'Primavera', false, -0.94201860000000004, -47.117876299999999);
INSERT INTO cities VALUES (158, 4, 'Quatipuru', false, -0.89891030000000005, -47.011133600000001);
INSERT INTO cities VALUES (159, 4, 'Redenção', false, -8.0429341999999995, -50.022863800000003);
INSERT INTO cities VALUES (160, 4, 'Rio Maria', false, -7.3188864999999996, -50.032048199999998);
INSERT INTO cities VALUES (161, 4, 'Rondon do Pará', false, -4.7751631999999997, -48.067421799999998);
INSERT INTO cities VALUES (162, 4, 'Rurópolis', false, -4.0883864000000001, -54.914183100000002);
INSERT INTO cities VALUES (163, 4, 'Salinópolis', false, -0.63133859999999997, -47.346125700000002);
INSERT INTO cities VALUES (164, 4, 'Salvaterra', false, -0.75900429999999997, -48.512223200000001);
INSERT INTO cities VALUES (165, 4, 'Santa Bárbara do Pará', false, -1.2240991000000001, -48.294044900000003);
INSERT INTO cities VALUES (166, 4, 'Santa Cruz do Arari', false, -0.6643386, -49.163427300000002);
INSERT INTO cities VALUES (167, 4, 'Santa Isabel do Pará', false, -1.2993756000000001, -48.161003000000001);
INSERT INTO cities VALUES (168, 4, 'Santa Luzia do Pará', false, -1.4978631, -46.924098100000002);
INSERT INTO cities VALUES (169, 4, 'Santa Maria das Barreiras', false, -8.8362134999999995, -49.728115899999999);
INSERT INTO cities VALUES (170, 4, 'Santa Maria do Pará', false, -1.3509880000000001, -47.572212299999997);
INSERT INTO cities VALUES (171, 4, 'Santana do Araguaia', false, -9.3000000000000007, -50.100000000000001);
INSERT INTO cities VALUES (172, 4, 'Santarém', false, -0.95687999999999995, -46.994629000000003);
INSERT INTO cities VALUES (173, 4, 'Santarém Novo', false, -0.9306605, -47.385646000000001);
INSERT INTO cities VALUES (174, 4, 'Santo Antônio do Tauá', false, -1.1524067, -48.129178799999998);
INSERT INTO cities VALUES (175, 4, 'São Caetano de Odivelas', false, -0.74445919999999999, -48.028159100000003);
INSERT INTO cities VALUES (176, 4, 'São Domingos do Araguaia', false, -5.5375319999999997, -48.7298385);
INSERT INTO cities VALUES (177, 4, 'São Domingos do Capim', false, -1.675948, -47.765834599999998);
INSERT INTO cities VALUES (178, 4, 'São Félix do Xingu', false, -6.6414102000000002, -51.978977299999997);
INSERT INTO cities VALUES (179, 4, 'São Francisco do Pará', false, -1.1708689000000001, -47.7938677);
INSERT INTO cities VALUES (180, 4, 'São Geraldo do Araguaia', false, -6.3987828999999996, -48.552195099999999);
INSERT INTO cities VALUES (181, 4, 'São João da Ponta', false, -0.85083989999999998, -47.921419499999999);
INSERT INTO cities VALUES (182, 4, 'São João de Pirabas', false, -0.7798195, -47.181124699999998);
INSERT INTO cities VALUES (183, 4, 'São João do Araguaia', false, -5.3651960000000001, -48.788496799999997);
INSERT INTO cities VALUES (184, 4, 'São Miguel do Guamá', false, -1.6276657000000001, -47.4818517);
INSERT INTO cities VALUES (185, 4, 'São Sebastião da Boa Vista', false, -1.7131098, -49.552850900000003);
INSERT INTO cities VALUES (186, 4, 'Sapucaia', false, -6.9372927999999998, -49.691792700000001);
INSERT INTO cities VALUES (187, 4, 'Senador José Porfírio', false, -2.5810089999999999, -51.937074500000001);
INSERT INTO cities VALUES (188, 4, 'Soure', false, -0.66739470000000001, -48.507464200000001);
INSERT INTO cities VALUES (189, 4, 'Tailândia', false, -2.9473142000000001, -48.953306499999997);
INSERT INTO cities VALUES (190, 4, 'Terra Alta', false, -1.0393250999999999, -47.9060664);
INSERT INTO cities VALUES (191, 4, 'Terra Santa', false, -3.7227000000000001, -56.615879);
INSERT INTO cities VALUES (192, 4, 'Tomé-Açu', false, -2.4147403000000001, -48.149937199999997);
INSERT INTO cities VALUES (193, 4, 'Tracuateua', false, -1.0801784999999999, -46.901302899999997);
INSERT INTO cities VALUES (194, 4, 'Trairão', false, -4.5786721000000004, -55.9354309);
INSERT INTO cities VALUES (195, 4, 'Tucumã', false, -0.183333, -50.049999999999997);
INSERT INTO cities VALUES (196, 4, 'Tucuruí', false, -3.7689325999999999, -49.673651300000003);
INSERT INTO cities VALUES (197, 4, 'Ulianópolis', false, -3.7588856000000002, -47.490531500000003);
INSERT INTO cities VALUES (198, 4, 'Uruará', false, -3.7240563, -53.735496300000001);
INSERT INTO cities VALUES (199, 4, 'Vigia', false, -0.86299999999999999, -48.131070800000003);
INSERT INTO cities VALUES (200, 4, 'Viseu', false, -1.1935332999999999, -46.139504899999999);
INSERT INTO cities VALUES (201, 4, 'Vitória do Xingu', false, -2.8838997000000002, -52.004573999999998);
INSERT INTO cities VALUES (202, 4, 'Xinguara', false, -7.1011423999999996, -49.950059400000001);
INSERT INTO cities VALUES (203, 4, 'Belém', true, -22.912150199999999, -43.271801400000001);
INSERT INTO cities VALUES (204, 5, 'Alta Floresta d`Oeste', false, -11.9283778, -61.995138799999999);
INSERT INTO cities VALUES (205, 5, 'Alto Alegre dos Parecis', false, -12.128378700000001, -61.8515066);
INSERT INTO cities VALUES (206, 5, 'Alto Paraíso', false, -9.7453091999999994, -63.283398800000001);
INSERT INTO cities VALUES (207, 5, 'Alvorada d`Oeste', false, -11.4276117, -62.369451599999998);
INSERT INTO cities VALUES (208, 5, 'Ariquemes', false, -9.9137521, -63.043973100000002);
INSERT INTO cities VALUES (209, 5, 'Buritis', false, -10.2123697, -63.8295119);
INSERT INTO cities VALUES (210, 5, 'Cabixi', false, -13.492345200000001, -60.541206199999998);
INSERT INTO cities VALUES (211, 5, 'Cacaulândia', false, -10.3409636, -62.886284000000003);
INSERT INTO cities VALUES (212, 5, 'Cacoal', false, -11.4314923, -61.447696399999998);
INSERT INTO cities VALUES (213, 5, 'Campo Novo de Rondônia', false, -10.549576, -63.6174775);
INSERT INTO cities VALUES (214, 5, 'Candeias do Jamari', false, -8.7818547000000002, -63.702356199999997);
INSERT INTO cities VALUES (215, 5, 'Castanheiras', false, -11.4279504, -61.955172699999999);
INSERT INTO cities VALUES (216, 5, 'Cerejeiras', false, -13.189118799999999, -60.816361800000003);
INSERT INTO cities VALUES (217, 5, 'Chupinguaia', false, -12.550141699999999, -60.902298999999999);
INSERT INTO cities VALUES (218, 5, 'Colorado do Oeste', false, -13.117602099999999, -60.541226399999999);
INSERT INTO cities VALUES (219, 5, 'Corumbiara', false, -12.964457100000001, -60.816474399999997);
INSERT INTO cities VALUES (220, 5, 'Costa Marques', false, -12.415525000000001, -64.221527499999993);
INSERT INTO cities VALUES (221, 5, 'Cujubim', false, -9.3633690000000005, -62.585504200000003);
INSERT INTO cities VALUES (222, 5, 'Espigão d`Oeste', false, -11.525059300000001, -61.013850599999998);
INSERT INTO cities VALUES (223, 5, 'Governador Jorge Teixeira', false, -10.612875600000001, -62.734790799999999);
INSERT INTO cities VALUES (224, 5, 'Guajará-Mirim', false, -10.7909259, -65.332216000000003);
INSERT INTO cities VALUES (225, 5, 'Itapuã do Oeste', false, -9.1974736999999998, -63.165501499999998);
INSERT INTO cities VALUES (226, 5, 'Jaru', false, -10.432498499999999, -62.473289399999999);
INSERT INTO cities VALUES (227, 5, 'Ji-Paraná', false, -10.880826799999999, -61.941862700000001);
INSERT INTO cities VALUES (228, 5, 'Machadinho d`Oeste', false, -9.4302291, -62.004242699999999);
INSERT INTO cities VALUES (229, 5, 'Ministro Andreazza', false, -11.198437500000001, -61.512065300000003);
INSERT INTO cities VALUES (230, 5, 'Mirante da Serra', false, -11.027279, -62.678685299999998);
INSERT INTO cities VALUES (231, 5, 'Monte Negro', false, -10.251643700000001, -63.287216600000001);
INSERT INTO cities VALUES (232, 5, 'Nova Brasilândia d`Oeste', false, -11.7164906, -62.331162900000002);
INSERT INTO cities VALUES (233, 5, 'Nova Mamoré', false, -10.4131389, -65.327073299999995);
INSERT INTO cities VALUES (234, 5, 'Nova União', false, -10.907946799999999, -62.5579605);
INSERT INTO cities VALUES (235, 5, 'Novo Horizonte do Oeste', false, -11.709986199999999, -61.996883400000002);
INSERT INTO cities VALUES (236, 5, 'Ouro Preto do Oeste', false, -10.711720700000001, -62.254970899999996);
INSERT INTO cities VALUES (237, 5, 'Parecis', false, -12.175379299999999, -61.603505499999997);
INSERT INTO cities VALUES (238, 5, 'Pimenta Bueno', false, -11.6748235, -61.190991699999998);
INSERT INTO cities VALUES (239, 5, 'Pimenteiras do Oeste', false, -13.479305999999999, -61.037326);
INSERT INTO cities VALUES (240, 5, 'Presidente Médici', false, -11.1718397, -61.903151100000002);
INSERT INTO cities VALUES (241, 5, 'Primavera de Rondônia', false, -11.8170187, -61.321649499999999);
INSERT INTO cities VALUES (242, 5, 'Rio Crespo', false, -9.7053695999999992, -62.900507099999999);
INSERT INTO cities VALUES (243, 5, 'Rolim de Moura', false, -11.729926600000001, -61.779722499999998);
INSERT INTO cities VALUES (244, 5, 'Santa Luzia d`Oeste', false, -11.909523200000001, -61.778826799999997);
INSERT INTO cities VALUES (245, 5, 'São Felipe d`Oeste', false, -11.9013796, -61.502494499999997);
INSERT INTO cities VALUES (246, 5, 'São Francisco do Guaporé', false, -12.040482300000001, -63.572083999999997);
INSERT INTO cities VALUES (247, 5, 'São Miguel do Guaporé', false, -11.6934269, -62.687499500000001);
INSERT INTO cities VALUES (248, 5, 'Seringueiras', false, -11.7484114, -63.030572100000001);
INSERT INTO cities VALUES (249, 5, 'Teixeirópolis', false, -10.918374399999999, -62.249506199999999);
INSERT INTO cities VALUES (250, 5, 'Theobroma', false, -10.2404671, -62.359376599999997);
INSERT INTO cities VALUES (251, 5, 'Urupá', false, -11.1156408, -62.367975999999999);
INSERT INTO cities VALUES (252, 5, 'Vale do Anari', false, -9.8639501999999997, -62.165923100000001);
INSERT INTO cities VALUES (253, 5, 'Vale do Paraíso', false, -10.4493671, -62.1345259);
INSERT INTO cities VALUES (254, 5, 'Vilhena', false, -12.7340597, -60.1445857);
INSERT INTO cities VALUES (255, 5, 'Porto Velho', true, -8.7618252999999999, -63.901960000000003);
INSERT INTO cities VALUES (256, 6, 'Alto Alegre', false, 2.898056, -61.491388999999998);
INSERT INTO cities VALUES (257, 6, 'Amajari', false, 3.6530999999999998, -61.371464199999998);
INSERT INTO cities VALUES (258, 6, 'Bonfim', false, 3.0833330000000001, -59.950000000000003);
INSERT INTO cities VALUES (259, 6, 'Cantá', false, 2.6084643999999999, -60.596099100000004);
INSERT INTO cities VALUES (260, 6, 'Caracaraí', false, 1.8202326, -61.132395299999999);
INSERT INTO cities VALUES (261, 6, 'Caroebe', false, 0.89586359999999998, -59.694998400000003);
INSERT INTO cities VALUES (262, 6, 'Iracema', false, 2.1800283, -61.039991999999998);
INSERT INTO cities VALUES (263, 6, 'Mucajaí', false, 2.4300584999999999, -60.919621499999998);
INSERT INTO cities VALUES (264, 6, 'Normandia', false, 4.2043860000000004, -59.864960000000004);
INSERT INTO cities VALUES (265, 6, 'Pacaraima', false, 4.4170118, -61.140775599999998);
INSERT INTO cities VALUES (266, 6, 'Rorainópolis', false, 0.94563370000000002, -60.418434900000001);
INSERT INTO cities VALUES (267, 6, 'São João da Baliza', false, 0.94947780000000004, -59.911471499999998);
INSERT INTO cities VALUES (268, 6, 'São Luiz', false, 1.0497292, -60.149844600000002);
INSERT INTO cities VALUES (269, 6, 'Uiramutã', false, 4.5999663999999996, -60.157992100000001);
INSERT INTO cities VALUES (270, 6, 'Boa Vista', true, 2.8195383999999999, -60.671400599999998);
INSERT INTO cities VALUES (271, 7, 'Abreulândia', false, -9.6233091999999996, -49.150661200000002);
INSERT INTO cities VALUES (272, 7, 'Aguiarnópolis', false, -6.5582507000000003, -47.466801199999999);
INSERT INTO cities VALUES (273, 7, 'Aliança do Tocantins', false, -11.3048588, -48.9412722);
INSERT INTO cities VALUES (274, 7, 'Almas', false, -11.5727007, -47.170451100000001);
INSERT INTO cities VALUES (275, 7, 'Alvorada', false, -12.4775431, -49.127395300000003);
INSERT INTO cities VALUES (276, 7, 'Ananás', false, -6.3685511000000004, -48.069766899999998);
INSERT INTO cities VALUES (277, 7, 'Angico', false, -6.3919544000000004, -47.8670677);
INSERT INTO cities VALUES (278, 7, 'Aparecida do Rio Negro', false, -9.9518784, -47.968544100000003);
INSERT INTO cities VALUES (279, 7, 'Aragominas', false, -7.1619001000000004, -48.528263600000002);
INSERT INTO cities VALUES (280, 7, 'Araguacema', false, -8.8086886, -49.5577878);
INSERT INTO cities VALUES (281, 7, 'Araguaçu', false, -12.930675000000001, -49.816269400000003);
INSERT INTO cities VALUES (282, 7, 'Araguaína', false, -7.1920745000000004, -48.207789599999998);
INSERT INTO cities VALUES (283, 7, 'Araguanã', false, -6.5821728000000004, -48.6421268);
INSERT INTO cities VALUES (284, 7, 'Araguatins', false, -5.6561471000000001, -48.118915700000002);
INSERT INTO cities VALUES (285, 7, 'Arapoema', false, -7.6544192000000004, -49.0646494);
INSERT INTO cities VALUES (286, 7, 'Arraias', false, -12.9264218, -46.935181700000001);
INSERT INTO cities VALUES (287, 7, 'Augustinópolis', false, -5.4684942000000003, -47.889533100000001);
INSERT INTO cities VALUES (288, 7, 'Aurora do Tocantins', false, -12.7101405, -46.404196800000001);
INSERT INTO cities VALUES (289, 7, 'Axixá do Tocantins', false, -5.6149591000000001, -47.770820399999998);
INSERT INTO cities VALUES (290, 7, 'Babaçulândia', false, -7.2074769999999999, -47.763621700000002);
INSERT INTO cities VALUES (291, 7, 'Bandeirantes do Tocantins', false, -7.7570832000000003, -48.584576499999997);
INSERT INTO cities VALUES (292, 7, 'Barra do Ouro', false, -7.6893796999999999, -47.683420599999998);
INSERT INTO cities VALUES (293, 7, 'Barrolândia', false, -9.8365457999999997, -48.718820800000003);
INSERT INTO cities VALUES (294, 7, 'Bernardo Sayão', false, -7.8724154999999998, -48.891187600000002);
INSERT INTO cities VALUES (295, 7, 'Bom Jesus do Tocantins', false, -8.9703929999999996, -48.165726100000001);
INSERT INTO cities VALUES (296, 7, 'Brasilândia do Tocantins', false, -8.3891255999999998, -48.487892600000002);
INSERT INTO cities VALUES (297, 7, 'Brejinho de Nazaré', false, -11.000111800000001, -48.563852400000002);
INSERT INTO cities VALUES (298, 7, 'Buriti do Tocantins', false, -5.3179850999999996, -48.229051200000001);
INSERT INTO cities VALUES (299, 7, 'Cachoeirinha', false, -6.1190829000000004, -47.918311799999998);
INSERT INTO cities VALUES (300, 7, 'Campos Lindos', false, -7.9943822000000004, -46.868416600000003);
INSERT INTO cities VALUES (301, 7, 'Cariri do Tocantins', false, -11.8902892, -49.163726599999997);
INSERT INTO cities VALUES (302, 7, 'Carmolândia', false, -7.0333125000000001, -48.3961586);
INSERT INTO cities VALUES (303, 7, 'Carrasco Bonito', false, -5.3690936000000002, -48.0526251);
INSERT INTO cities VALUES (304, 7, 'Caseara', false, -9.2708065000000008, -49.946497800000003);
INSERT INTO cities VALUES (305, 7, 'Centenário', false, -8.9513868999999993, -47.336420699999998);
INSERT INTO cities VALUES (306, 7, 'Chapada da Natividade', false, -11.6176751, -47.751865000000002);
INSERT INTO cities VALUES (307, 7, 'Chapada de Areia', false, -10.139779799999999, -49.144788900000002);
INSERT INTO cities VALUES (308, 7, 'Colinas do Tocantins', false, -8.0562948999999993, -48.4773031);
INSERT INTO cities VALUES (309, 7, 'Colméia', false, -8.7238331000000002, -48.761814700000002);
INSERT INTO cities VALUES (310, 7, 'Combinado', false, -12.792525700000001, -46.5379048);
INSERT INTO cities VALUES (311, 7, 'Conceição do Tocantins', false, -12.217578700000001, -47.298136999999997);
INSERT INTO cities VALUES (312, 7, 'Couto de Magalhães', false, -8.2865722999999996, -49.2478093);
INSERT INTO cities VALUES (313, 7, 'Cristalândia', false, -10.596762999999999, -49.194557799999998);
INSERT INTO cities VALUES (314, 7, 'Crixás do Tocantins', false, -11.1007868, -48.9164648);
INSERT INTO cities VALUES (315, 7, 'Darcinópolis', false, -6.7185503000000004, -47.752870199999997);
INSERT INTO cities VALUES (316, 7, 'Dianópolis', false, -11.628099499999999, -46.821425900000001);
INSERT INTO cities VALUES (317, 7, 'Divinópolis do Tocantins', false, -9.7964359999999999, -49.210437800000001);
INSERT INTO cities VALUES (318, 7, 'Dois Irmãos do Tocantins', false, -9.2475494000000005, -49.063484199999998);
INSERT INTO cities VALUES (319, 7, 'Dueré', false, -11.3462265, -49.2682614);
INSERT INTO cities VALUES (320, 7, 'Esperantina', false, -5.3450971000000003, -48.510195000000003);
INSERT INTO cities VALUES (321, 7, 'Fátima', false, -10.7617022, -48.900840199999998);
INSERT INTO cities VALUES (322, 7, 'Figueirópolis', false, -12.1264494, -49.164719900000001);
INSERT INTO cities VALUES (323, 7, 'Filadélfia', false, -7.3393769999999998, -47.491070100000002);
INSERT INTO cities VALUES (324, 7, 'Formoso do Araguaia', false, -11.7956672, -49.531058700000003);
INSERT INTO cities VALUES (325, 7, 'Fortaleza do Tabocão', false, -9.0574200999999999, -48.519344500000003);
INSERT INTO cities VALUES (326, 7, 'Goianorte', false, -8.5868129999999994, -48.937069000000001);
INSERT INTO cities VALUES (327, 7, 'Goiatins', false, -7.7118662000000002, -47.314416299999998);
INSERT INTO cities VALUES (328, 7, 'Guaraí', false, -8.8344009000000003, -48.509876200000001);
INSERT INTO cities VALUES (329, 7, 'Gurupi', false, -11.724880600000001, -49.075961700000001);
INSERT INTO cities VALUES (330, 7, 'Ipueiras', false, -11.2335171, -48.458300999999999);
INSERT INTO cities VALUES (331, 7, 'Itacajá', false, -8.4000535000000003, -47.766152900000002);
INSERT INTO cities VALUES (332, 7, 'Itaguatins', false, -5.7764892999999997, -47.487838699999998);
INSERT INTO cities VALUES (333, 7, 'Itapiratins', false, -8.3839380000000006, -48.111667099999998);
INSERT INTO cities VALUES (334, 7, 'Itaporã do Tocantins', false, -8.5674013000000002, -48.691641099999998);
INSERT INTO cities VALUES (335, 7, 'Jaú do Tocantins', false, -12.653328800000001, -48.587003099999997);
INSERT INTO cities VALUES (336, 7, 'Juarina', false, -8.1193805999999995, -49.065430900000003);
INSERT INTO cities VALUES (337, 7, 'Lagoa da Confusão', false, -10.789454299999999, -49.630494800000001);
INSERT INTO cities VALUES (338, 7, 'Lagoa do Tocantins', false, -10.370421, -47.587928099999999);
INSERT INTO cities VALUES (339, 7, 'Lajeado', false, -9.7514117999999996, -48.357532300000003);
INSERT INTO cities VALUES (340, 7, 'Lavandeira', false, -12.785425800000001, -46.5086856);
INSERT INTO cities VALUES (341, 7, 'Lizarda', false, -9.5900090999999996, -46.675134100000001);
INSERT INTO cities VALUES (342, 7, 'Luzinópolis', false, -6.1824383000000003, -47.8596164);
INSERT INTO cities VALUES (343, 7, 'Marianópolis do Tocantins', false, -9.7859263999999992, -49.6519616);
INSERT INTO cities VALUES (344, 7, 'Mateiros', false, -10.5781586, -46.424022700000002);
INSERT INTO cities VALUES (345, 7, 'Maurilândia do Tocantins', false, -5.9527602999999996, -47.50403);
INSERT INTO cities VALUES (346, 7, 'Miracema do Tocantins', false, -9.5606538000000008, -48.394985300000002);
INSERT INTO cities VALUES (347, 7, 'Miranorte', false, -9.5279033999999996, -48.594773600000003);
INSERT INTO cities VALUES (348, 7, 'Monte do Carmo', false, -10.770328299999999, -48.109580100000002);
INSERT INTO cities VALUES (349, 7, 'Monte Santo do Tocantins', false, -10.001575300000001, -48.992187700000002);
INSERT INTO cities VALUES (350, 7, 'Muricilândia', false, -7.1473769000000003, -48.608222099999999);
INSERT INTO cities VALUES (351, 7, 'Natividade', false, -11.7098075, -47.730752000000003);
INSERT INTO cities VALUES (352, 7, 'Nazaré', false, -6.3726304999999996, -47.664411299999998);
INSERT INTO cities VALUES (353, 7, 'Nova Olinda', false, -7.6352617, -48.423776400000001);
INSERT INTO cities VALUES (354, 7, 'Nova Rosalândia', false, -10.5674832, -48.908724999999997);
INSERT INTO cities VALUES (355, 7, 'Novo Acordo', false, -9.9703237999999992, -47.669593200000001);
INSERT INTO cities VALUES (356, 7, 'Novo Alegre', false, -12.931944, -46.576110999999997);
INSERT INTO cities VALUES (357, 7, 'Novo Jardim', false, -11.817986700000001, -46.624597799999997);
INSERT INTO cities VALUES (358, 7, 'Oliveira de Fátima', false, -10.7080459, -48.9024711);
INSERT INTO cities VALUES (359, 7, 'Palmeirante', false, -7.8614483999999996, -47.927288400000002);
INSERT INTO cities VALUES (360, 7, 'Palmeiras do Tocantins', false, -6.6136568999999996, -47.546152800000002);
INSERT INTO cities VALUES (361, 7, 'Palmeirópolis', false, -13.0445539, -48.402620599999999);
INSERT INTO cities VALUES (362, 7, 'Paraíso do Tocantins', false, -10.172197300000001, -48.8809732);
INSERT INTO cities VALUES (363, 7, 'Paranã', false, -12.616180699999999, -47.883649499999997);
INSERT INTO cities VALUES (364, 7, 'Pau d`Arco', false, -9.733333, -48.649999999999999);
INSERT INTO cities VALUES (365, 7, 'Pedro Afonso', false, -8.9715000000000007, -48.175371200000001);
INSERT INTO cities VALUES (366, 7, 'Peixe', false, -12.0262229, -48.539617800000002);
INSERT INTO cities VALUES (367, 7, 'Pequizeiro', false, -8.5899382000000006, -48.926280599999998);
INSERT INTO cities VALUES (368, 7, 'Pindorama do Tocantins', false, -11.1386909, -47.578608199999998);
INSERT INTO cities VALUES (369, 7, 'Piraquê', false, -6.7753372000000001, -48.295222699999997);
INSERT INTO cities VALUES (370, 7, 'Pium', false, -10.443182200000001, -49.1825215);
INSERT INTO cities VALUES (371, 7, 'Ponte Alta do Bom Jesus', false, -12.0895283, -46.475453299999998);
INSERT INTO cities VALUES (372, 7, 'Ponte Alta do Tocantins', false, -10.742645, -47.537128299999999);
INSERT INTO cities VALUES (373, 7, 'Porto Alegre do Tocantins', false, -11.605838, -47.049122400000002);
INSERT INTO cities VALUES (374, 7, 'Porto Nacional', false, -10.707529600000001, -48.414268);
INSERT INTO cities VALUES (375, 7, 'Praia Norte', false, -5.3945419000000001, -47.811381599999997);
INSERT INTO cities VALUES (376, 7, 'Presidente Kennedy', false, -8.5294633999999991, -48.505357799999999);
INSERT INTO cities VALUES (377, 7, 'Pugmil', false, -10.424239500000001, -48.896172700000001);
INSERT INTO cities VALUES (378, 7, 'Recursolândia', false, -8.7643859000000006, -47.300320300000003);
INSERT INTO cities VALUES (379, 7, 'Riachinho', false, -6.4406425, -48.136144399999999);
INSERT INTO cities VALUES (380, 7, 'Rio da Conceição', false, -11.3914502, -46.874467899999999);
INSERT INTO cities VALUES (381, 7, 'Rio dos Bois', false, -9.3156584000000002, -48.542352000000001);
INSERT INTO cities VALUES (382, 7, 'Rio Sono', false, -9.3598884000000009, -47.8753247);
INSERT INTO cities VALUES (383, 7, 'Sampaio', false, -5.3534166000000001, -47.874760899999998);
INSERT INTO cities VALUES (384, 7, 'Sandolândia', false, -12.527032999999999, -49.935276500000001);
INSERT INTO cities VALUES (385, 7, 'Santa Fé do Araguaia', false, -7.1487617999999999, -48.703428700000003);
INSERT INTO cities VALUES (386, 7, 'Santa Maria do Tocantins', false, -8.8048166000000005, -47.787588499999998);
INSERT INTO cities VALUES (387, 7, 'Santa Rita do Tocantins', false, -10.8621927, -48.907482399999999);
INSERT INTO cities VALUES (388, 7, 'Santa Rosa do Tocantins', false, -11.4418866, -48.117207100000002);
INSERT INTO cities VALUES (389, 7, 'Santa Tereza do Tocantins', false, -10.289953300000001, -47.788055300000003);
INSERT INTO cities VALUES (390, 7, 'Santa Terezinha do Tocantins', false, -6.4337508000000003, -47.662737399999997);
INSERT INTO cities VALUES (391, 7, 'São Bento do Tocantins', false, -5.9180565999999999, -48.059667500000003);
INSERT INTO cities VALUES (392, 7, 'São Félix do Tocantins', false, -10.138547000000001, -46.649708599999997);
INSERT INTO cities VALUES (393, 7, 'São Miguel do Tocantins', false, -5.5547148999999996, -47.575424099999999);
INSERT INTO cities VALUES (394, 7, 'São Salvador do Tocantins', false, -12.7432628, -48.239047999999997);
INSERT INTO cities VALUES (395, 7, 'São Sebastião do Tocantins', false, -5.2662608999999998, -48.199623000000003);
INSERT INTO cities VALUES (396, 7, 'São Valério', false, -11.633333, -48.233333000000002);
INSERT INTO cities VALUES (397, 7, 'Silvanópolis', false, -11.145254100000001, -48.172229000000002);
INSERT INTO cities VALUES (398, 7, 'Sítio Novo do Tocantins', false, -5.6026182000000002, -47.639554599999997);
INSERT INTO cities VALUES (399, 7, 'Sucupira', false, -12.0158992, -48.934935299999999);
INSERT INTO cities VALUES (400, 7, 'Taguatinga', false, -12.399305999999999, -46.422197400000002);
INSERT INTO cities VALUES (401, 7, 'Taipas do Tocantins', false, -12.186259, -46.989820899999998);
INSERT INTO cities VALUES (402, 7, 'Talismã', false, -12.7950926, -49.0947636);
INSERT INTO cities VALUES (403, 7, 'Tocantínia', false, -9.5658799000000005, -48.374364200000002);
INSERT INTO cities VALUES (404, 7, 'Tocantinópolis', false, -6.3295333999999999, -47.416510700000003);
INSERT INTO cities VALUES (405, 7, 'Tupirama', false, -8.9717380000000002, -48.189433299999997);
INSERT INTO cities VALUES (406, 7, 'Tupiratins', false, -8.3864629999999991, -48.116315200000003);
INSERT INTO cities VALUES (407, 7, 'Wanderlândia', false, -6.8485168999999999, -47.963197700000002);
INSERT INTO cities VALUES (408, 7, 'Xambioá', false, -6.4136689999999996, -48.538573);
INSERT INTO cities VALUES (409, 7, 'Palmas', true, -10.168891, -48.331716700000001);
INSERT INTO cities VALUES (410, 8, 'Água Branca', false, -9.2540236999999994, -37.944872099999998);
INSERT INTO cities VALUES (411, 8, 'Aguiar', false, -9.5939580000000007, -35.760217500000003);
INSERT INTO cities VALUES (412, 8, 'Alagoa Grande', false, -9.1187679999999993, -37.742552400000001);
INSERT INTO cities VALUES (413, 8, 'Alagoa Nova', false, -8.9666669999999993, -37.75);
INSERT INTO cities VALUES (414, 8, 'Alagoinha', false, -10.166667, -36.383333);
INSERT INTO cities VALUES (415, 8, 'Alcantil', false, NULL, NULL);
INSERT INTO cities VALUES (416, 8, 'Algodão de Jandaíra', false, NULL, NULL);
INSERT INTO cities VALUES (417, 8, 'Alhandra', false, NULL, NULL);
INSERT INTO cities VALUES (418, 8, 'Amparo', false, -22.703999899999999, -46.750926200000002);
INSERT INTO cities VALUES (419, 8, 'Aparecida', false, -9.5747728999999993, -35.7495774);
INSERT INTO cities VALUES (420, 8, 'Araçagi', false, NULL, NULL);
INSERT INTO cities VALUES (421, 8, 'Arara', false, -22.373840000000001, -47.390789599999998);
INSERT INTO cities VALUES (422, 8, 'Araruna', false, -22.321432099999999, -49.049251900000002);
INSERT INTO cities VALUES (423, 8, 'Areia', false, -9.4687213999999997, -35.551127700000002);
INSERT INTO cities VALUES (424, 8, 'Areia de Baraúnas', false, NULL, NULL);
INSERT INTO cities VALUES (425, 8, 'Areial', false, -9.1577990000000007, -37.351748999999998);
INSERT INTO cities VALUES (426, 8, 'Aroeiras', false, NULL, NULL);
INSERT INTO cities VALUES (427, 8, 'Assunção', false, -9.1629588999999996, -36.0246961);
INSERT INTO cities VALUES (428, 8, 'Baía da Traição', false, -13.066667000000001, -43.566667000000002);
INSERT INTO cities VALUES (429, 8, 'Bananeiras', false, -9.8166670000000007, -36.616667);
INSERT INTO cities VALUES (430, 8, 'Baraúna', false, NULL, NULL);
INSERT INTO cities VALUES (431, 8, 'Barra de Santa Rosa', false, -9.6579834000000009, -35.758667500000001);
INSERT INTO cities VALUES (432, 8, 'Barra de Santana', false, -9.4106390999999991, -35.497505199999999);
INSERT INTO cities VALUES (433, 8, 'Barra de São Miguel', false, -9.8310124000000005, -35.9084699);
INSERT INTO cities VALUES (434, 8, 'Bayeux', false, -7.1372521000000004, -34.9818742);
INSERT INTO cities VALUES (435, 8, 'Belém', false, -9.5869532999999993, -36.483613099999999);
INSERT INTO cities VALUES (436, 8, 'Belém do Brejo do Cruz', false, -9.5869532999999993, -36.483613099999999);
INSERT INTO cities VALUES (437, 8, 'Bernardino Batista', false, NULL, NULL);
INSERT INTO cities VALUES (438, 8, 'Boa Ventura', false, -22.881010499999999, -43.110500000000002);
INSERT INTO cities VALUES (439, 8, 'Boa Vista', false, -9.5999999999999996, -37.733333000000002);
INSERT INTO cities VALUES (440, 8, 'Bom Jesus', false, -9.2166669999999993, -37.466667000000001);
INSERT INTO cities VALUES (441, 8, 'Bom Sucesso', false, NULL, NULL);
INSERT INTO cities VALUES (442, 8, 'Bonito de Santa Fé', false, -10.383333, -36.333333000000003);
INSERT INTO cities VALUES (443, 8, 'Boqueirão', false, -9.25, -37.866667);
INSERT INTO cities VALUES (444, 8, 'Borborema', false, NULL, NULL);
INSERT INTO cities VALUES (445, 8, 'Brejo do Cruz', false, NULL, NULL);
INSERT INTO cities VALUES (446, 8, 'Brejo dos Santos', false, NULL, NULL);
INSERT INTO cities VALUES (447, 8, 'Caaporã', false, NULL, NULL);
INSERT INTO cities VALUES (448, 8, 'Cabaceiras', false, NULL, NULL);
INSERT INTO cities VALUES (449, 8, 'Cabedelo', false, -7.1124409999999996, -34.855318199999999);
INSERT INTO cities VALUES (450, 8, 'Cachoeira dos Índios', false, -20.451020400000001, -54.596164899999998);
INSERT INTO cities VALUES (451, 8, 'Cacimba de Areia', false, NULL, NULL);
INSERT INTO cities VALUES (452, 8, 'Cacimba de Dentro', false, NULL, NULL);
INSERT INTO cities VALUES (453, 8, 'Cacimbas', false, -9.516667, -37.616667);
INSERT INTO cities VALUES (454, 8, 'Caiçara', false, -9.766667, -37.149999999999999);
INSERT INTO cities VALUES (455, 8, 'Cajazeiras', false, NULL, NULL);
INSERT INTO cities VALUES (456, 8, 'Cajazeirinhas', false, NULL, NULL);
INSERT INTO cities VALUES (457, 8, 'Caldas Brandão', false, NULL, NULL);
INSERT INTO cities VALUES (458, 8, 'Camalaú', false, NULL, NULL);
INSERT INTO cities VALUES (459, 8, 'Campina Grande', false, -7.2348470999999996, -35.892261499999996);
INSERT INTO cities VALUES (460, 8, 'Campo de Santana', false, -20.5210811, -47.3771889);
INSERT INTO cities VALUES (461, 8, 'Capim', false, -7.0499999999999998, -35.5);
INSERT INTO cities VALUES (462, 8, 'Caraúbas', false, NULL, NULL);
INSERT INTO cities VALUES (463, 8, 'Carrapateira', false, NULL, NULL);
INSERT INTO cities VALUES (464, 8, 'Casserengue', false, NULL, NULL);
INSERT INTO cities VALUES (465, 8, 'Catingueira', false, NULL, NULL);
INSERT INTO cities VALUES (466, 8, 'Catolé do Rocha', false, NULL, NULL);
INSERT INTO cities VALUES (467, 8, 'Caturité', false, NULL, NULL);
INSERT INTO cities VALUES (468, 8, 'Conceição', false, -19.9141592, -48.386420100000002);
INSERT INTO cities VALUES (469, 8, 'Condado', false, 37.250184699999998, -1.8772378999999999);
INSERT INTO cities VALUES (470, 8, 'Conde', false, -23.702130799999999, -46.626836599999997);
INSERT INTO cities VALUES (471, 8, 'Congo', false, NULL, NULL);
INSERT INTO cities VALUES (472, 8, 'Coremas', false, NULL, NULL);
INSERT INTO cities VALUES (473, 8, 'Coxixola', false, NULL, NULL);
INSERT INTO cities VALUES (474, 8, 'Cruz do Espírito Santo', false, -20.362091199999998, -40.389287099999997);
INSERT INTO cities VALUES (475, 8, 'Cubati', false, -23.983755299999999, -46.466333400000003);
INSERT INTO cities VALUES (476, 8, 'Cuité', false, NULL, NULL);
INSERT INTO cities VALUES (477, 8, 'Cuité de Mamanguape', false, -6.8386889000000002, -35.136530200000003);
INSERT INTO cities VALUES (478, 8, 'Cuitegi', false, NULL, NULL);
INSERT INTO cities VALUES (479, 8, 'Curral de Cima', false, NULL, NULL);
INSERT INTO cities VALUES (480, 8, 'Curral Velho', false, NULL, NULL);
INSERT INTO cities VALUES (481, 8, 'Damião', false, -9.5491177, -35.773127500000001);
INSERT INTO cities VALUES (482, 8, 'Desterro', false, -7.8541721000000004, -34.911409200000001);
INSERT INTO cities VALUES (483, 8, 'Diamante', false, 20.572140999999998, -100.4062814);
INSERT INTO cities VALUES (484, 8, 'Dona Inês', false, 17.027541299999999, -96.727869499999997);
INSERT INTO cities VALUES (485, 8, 'Duas Estradas', false, NULL, NULL);
INSERT INTO cities VALUES (486, 8, 'Emas', false, -23.191354199999999, -45.868601499999997);
INSERT INTO cities VALUES (487, 8, 'Esperança', false, -9.6409483999999992, -35.710427099999997);
INSERT INTO cities VALUES (488, 8, 'Fagundes', false, -9.5727928000000002, -35.788737699999999);
INSERT INTO cities VALUES (489, 8, 'Frei Martinho', false, NULL, NULL);
INSERT INTO cities VALUES (490, 8, 'Gado Bravo', false, NULL, NULL);
INSERT INTO cities VALUES (491, 8, 'Guarabira', false, -9.7468330999999999, -36.6606047);
INSERT INTO cities VALUES (492, 8, 'Gurinhém', false, NULL, NULL);
INSERT INTO cities VALUES (493, 8, 'Gurjão', false, NULL, NULL);
INSERT INTO cities VALUES (494, 8, 'Ibiara', false, NULL, NULL);
INSERT INTO cities VALUES (495, 8, 'Igaracy', false, NULL, NULL);
INSERT INTO cities VALUES (496, 8, 'Imaculada', false, -9.5865468000000007, -35.959860999999997);
INSERT INTO cities VALUES (497, 8, 'Ingá', false, -19.982624300000001, -43.945058000000003);
INSERT INTO cities VALUES (498, 8, 'Itabaiana', false, -9.4157734000000008, -38.203430300000001);
INSERT INTO cities VALUES (499, 8, 'Itaporanga', false, -10.233333, -36.566667000000002);
INSERT INTO cities VALUES (500, 8, 'Itapororoca', false, NULL, NULL);
INSERT INTO cities VALUES (501, 8, 'Itatuba', false, NULL, NULL);
INSERT INTO cities VALUES (502, 8, 'Jacaraú', false, NULL, NULL);
INSERT INTO cities VALUES (503, 8, 'Jericó', false, NULL, NULL);
INSERT INTO cities VALUES (504, 8, 'Juarez Távora', false, NULL, NULL);
INSERT INTO cities VALUES (505, 8, 'Juazeirinho', false, NULL, NULL);
INSERT INTO cities VALUES (506, 8, 'Junco do Seridó', false, NULL, NULL);
INSERT INTO cities VALUES (507, 8, 'Juripiranga', false, NULL, NULL);
INSERT INTO cities VALUES (508, 8, 'Juru', false, NULL, NULL);
INSERT INTO cities VALUES (509, 8, 'Lagoa', false, -9.5713057999999993, -36.781950500000001);
INSERT INTO cities VALUES (510, 8, 'Lagoa de Dentro', false, -8.9816075000000009, -35.193906400000003);
INSERT INTO cities VALUES (511, 8, 'Lagoa Seca', false, -9.8833330000000004, -36.566667000000002);
INSERT INTO cities VALUES (512, 8, 'Lastro', false, NULL, NULL);
INSERT INTO cities VALUES (513, 8, 'Livramento', false, -9.6645234999999996, -35.741487399999997);
INSERT INTO cities VALUES (514, 8, 'Logradouro', false, NULL, NULL);
INSERT INTO cities VALUES (515, 8, 'Lucena', false, -9.3118239999999997, -35.943613599999999);
INSERT INTO cities VALUES (516, 8, 'Mãe d`Água', false, NULL, NULL);
INSERT INTO cities VALUES (517, 8, 'Malta', false, -9.5744077999999995, -35.808417800000001);
INSERT INTO cities VALUES (518, 8, 'Mamanguape', false, -6.8386889000000002, -35.136530200000003);
INSERT INTO cities VALUES (519, 8, 'Manaíra', false, -7.1124409999999996, -34.855318199999999);
INSERT INTO cities VALUES (520, 8, 'Marcação', false, -9.6666670000000003, -37.516666999999998);
INSERT INTO cities VALUES (521, 8, 'Mari', false, -9.2166669999999993, -38.316667000000002);
INSERT INTO cities VALUES (522, 8, 'Marizópolis', false, NULL, NULL);
INSERT INTO cities VALUES (523, 8, 'Massaranduba', false, -26.4960421, -49.068660399999999);
INSERT INTO cities VALUES (524, 8, 'Mataraca', false, -9.5261893000000004, -36.007917300000003);
INSERT INTO cities VALUES (525, 8, 'Matinhas', false, -25.800624800000001, -48.534894899999998);
INSERT INTO cities VALUES (526, 8, 'Mato Grosso', false, -9.6999999999999993, -37.399999999999999);
INSERT INTO cities VALUES (527, 8, 'Maturéia', false, NULL, NULL);
INSERT INTO cities VALUES (528, 8, 'Mogeiro', false, NULL, NULL);
INSERT INTO cities VALUES (529, 8, 'Montadas', false, NULL, NULL);
INSERT INTO cities VALUES (530, 8, 'Monte Horebe', false, NULL, NULL);
INSERT INTO cities VALUES (531, 8, 'Monteiro', false, -9.5893929999999994, -35.760687500000003);
INSERT INTO cities VALUES (532, 8, 'Mulungu', false, -9.766667, -37.700000000000003);
INSERT INTO cities VALUES (533, 8, 'Natuba', false, -9.5723058000000005, -35.824176899999998);
INSERT INTO cities VALUES (534, 8, 'Nazarezinho', false, NULL, NULL);
INSERT INTO cities VALUES (535, 8, 'Nova Floresta', false, -19.929267100000001, -43.934549799999999);
INSERT INTO cities VALUES (536, 8, 'Nova Olinda', false, -9.5074851999999996, -36.024597499999999);
INSERT INTO cities VALUES (537, 8, 'Nova Palmeira', false, -9.4263800999999994, -36.645077200000003);
INSERT INTO cities VALUES (538, 8, 'Olho d`Água', false, -9.8666669999999996, -36.466667000000001);
INSERT INTO cities VALUES (539, 8, 'Olivedos', false, NULL, NULL);
INSERT INTO cities VALUES (540, 8, 'Ouro Velho', false, -9.6074731, -35.770797600000002);
INSERT INTO cities VALUES (541, 8, 'Parari', false, NULL, NULL);
INSERT INTO cities VALUES (542, 8, 'Passagem', false, -9.4333329999999993, -37.633333);
INSERT INTO cities VALUES (543, 8, 'Patos', false, -9.75, -37.483333000000002);
INSERT INTO cities VALUES (544, 8, 'Paulista', false, -7.8725021999999996, -34.8519887);
INSERT INTO cities VALUES (545, 8, 'Pedra Branca', false, -30.107731900000001, -51.3276507);
INSERT INTO cities VALUES (546, 8, 'Pedra Lavrada', false, NULL, NULL);
INSERT INTO cities VALUES (547, 8, 'Pedras de Fogo', false, -9.4166670000000003, -36.283332999999999);
INSERT INTO cities VALUES (548, 8, 'Pedro Régis', false, NULL, NULL);
INSERT INTO cities VALUES (549, 8, 'Piancó', false, NULL, NULL);
INSERT INTO cities VALUES (550, 8, 'Picuí', false, NULL, NULL);
INSERT INTO cities VALUES (551, 8, 'Pilar', false, -9.5896138000000004, -35.950723000000004);
INSERT INTO cities VALUES (552, 8, 'Pilões', false, NULL, NULL);
INSERT INTO cities VALUES (553, 8, 'Pilõezinhos', false, NULL, NULL);
INSERT INTO cities VALUES (554, 8, 'Pirpirituba', false, NULL, NULL);
INSERT INTO cities VALUES (555, 8, 'Pitimbu', false, -5.8660579999999998, -35.205762100000001);
INSERT INTO cities VALUES (556, 8, 'Pocinhos', false, NULL, NULL);
INSERT INTO cities VALUES (557, 8, 'Poço Dantas', false, -9.6634235000000004, -35.750447399999999);
INSERT INTO cities VALUES (558, 8, 'Poço de José de Moura', false, -9.6612784999999999, -35.704408100000002);
INSERT INTO cities VALUES (559, 8, 'Pombal', false, -9.6599833999999998, -35.756837500000003);
INSERT INTO cities VALUES (560, 8, 'Prata', false, -19.983332999999998, -48.233333000000002);
INSERT INTO cities VALUES (561, 8, 'Princesa Isabel', false, -9.6539433999999993, -35.732302300000001);
INSERT INTO cities VALUES (562, 8, 'Puxinanã', false, -9.5, -37.049999999999997);
INSERT INTO cities VALUES (563, 8, 'Queimadas', false, -22.7599637, -43.614459500000002);
INSERT INTO cities VALUES (564, 8, 'Quixabá', false, NULL, NULL);
INSERT INTO cities VALUES (565, 8, 'Remígio', false, -9.6050438000000007, -35.956182300000002);
INSERT INTO cities VALUES (566, 8, 'Riachão', false, -9.8333329999999997, -36.416666999999997);
INSERT INTO cities VALUES (567, 8, 'Riachão do Bacamarte', false, -9.8333329999999997, -36.416666999999997);
INSERT INTO cities VALUES (568, 8, 'Riachão do Poço', false, -9.8333329999999997, -36.416666999999997);
INSERT INTO cities VALUES (569, 8, 'Riacho de Santo Antônio', false, -9.3531796000000007, -35.500550199999999);
INSERT INTO cities VALUES (570, 8, 'Riacho dos Cavalos', false, NULL, NULL);
INSERT INTO cities VALUES (571, 8, 'Rio Tinto', false, NULL, NULL);
INSERT INTO cities VALUES (572, 8, 'Salgadinho', false, -9.4000000000000004, -38.333333000000003);
INSERT INTO cities VALUES (573, 8, 'Salgado de São Félix', false, -9.5999999999999996, -36.266666999999998);
INSERT INTO cities VALUES (574, 8, 'Santa Cecília', false, -9.6606635000000001, -35.717287200000001);
INSERT INTO cities VALUES (575, 8, 'Santa Cruz', false, -9.7833330000000007, -37.25);
INSERT INTO cities VALUES (576, 8, 'Santa Helena', false, -9.6923636000000002, -35.774327700000001);
INSERT INTO cities VALUES (577, 8, 'Santa Inês', false, -3.6750451000000002, -45.388829600000001);
INSERT INTO cities VALUES (578, 8, 'Santa Luzia', false, -9.983333, -36.266666999999998);
INSERT INTO cities VALUES (579, 8, 'Santa Rita', false, -9.5705328000000005, -35.785042599999997);
INSERT INTO cities VALUES (580, 8, 'Santa Teresinha', false, -8.8302779999999998, -35.559167000000002);
INSERT INTO cities VALUES (581, 8, 'Santana de Mangueira', false, -23.247925299999999, -47.296234900000002);
INSERT INTO cities VALUES (582, 8, 'Santana dos Garrotes', false, NULL, NULL);
INSERT INTO cities VALUES (583, 8, 'Santarém', false, NULL, NULL);
INSERT INTO cities VALUES (584, 8, 'Santo André', false, -9.6153481999999997, -35.749187399999997);
INSERT INTO cities VALUES (585, 8, 'São Bentinho', false, NULL, NULL);
INSERT INTO cities VALUES (586, 8, 'São Bento', false, -9.0732619999999997, -35.253830000000001);
INSERT INTO cities VALUES (587, 8, 'São Domingos de Pombal', false, -9.6500000000000004, -36.100000000000001);
INSERT INTO cities VALUES (588, 8, 'São Domingos do Cariri', false, -9.6500000000000004, -36.100000000000001);
INSERT INTO cities VALUES (589, 8, 'São Francisco', false, -9.6076630999999999, -35.729922199999997);
INSERT INTO cities VALUES (590, 8, 'São João do Cariri', false, NULL, NULL);
INSERT INTO cities VALUES (591, 8, 'São João do Rio do Peixe', false, -6.7312208, -38.448113800000002);
INSERT INTO cities VALUES (592, 8, 'São João do Tigre', false, NULL, NULL);
INSERT INTO cities VALUES (593, 8, 'São José da Lagoa Tapada', false, -9.6500000000000004, -36.166666999999997);
INSERT INTO cities VALUES (594, 8, 'São José de Caiana', false, -9.6500000000000004, -36.166666999999997);
INSERT INTO cities VALUES (595, 8, 'São José de Espinharas', false, -9.6500000000000004, -36.166666999999997);
INSERT INTO cities VALUES (596, 8, 'São José de Piranhas', false, -9.6500000000000004, -36.166666999999997);
INSERT INTO cities VALUES (597, 8, 'São José de Princesa', false, -9.6500000000000004, -36.166666999999997);
INSERT INTO cities VALUES (598, 8, 'São José do Bonfim', false, -22.918519799999999, -47.074619200000001);
INSERT INTO cities VALUES (599, 8, 'São José do Brejo do Cruz', false, -9.6500000000000004, -36.166666999999997);
INSERT INTO cities VALUES (600, 8, 'São José do Sabugi', false, -9.6500000000000004, -36.166666999999997);
INSERT INTO cities VALUES (601, 8, 'São José dos Cordeiros', false, -9.6500000000000004, -36.166666999999997);
INSERT INTO cities VALUES (602, 8, 'São José dos Ramos', false, -23.611763700000001, -46.575387999999997);
INSERT INTO cities VALUES (603, 8, 'São Mamede', false, NULL, NULL);
INSERT INTO cities VALUES (604, 8, 'São Miguel de Taipu', false, -22.216019200000002, -49.949696500000002);
INSERT INTO cities VALUES (605, 8, 'São Sebastião de Lagoa de Roça', false, -9.9327974000000001, -36.546976000000001);
INSERT INTO cities VALUES (606, 8, 'São Sebastião do Umbuzeiro', false, -9.9327974000000001, -36.546976000000001);
INSERT INTO cities VALUES (607, 8, 'Sapé', false, -22.901690800000001, -43.040529599999999);
INSERT INTO cities VALUES (608, 8, 'Seridó', false, NULL, NULL);
INSERT INTO cities VALUES (609, 8, 'Serra Branca', false, -9.4166667000000004, -36.5);
INSERT INTO cities VALUES (610, 8, 'Serra da Raiz', false, NULL, NULL);
INSERT INTO cities VALUES (611, 8, 'Serra Grande', false, -8.9752358000000001, -35.942155300000003);
INSERT INTO cities VALUES (612, 8, 'Serra Redonda', false, -7.0576249999999998, -35.6487184);
INSERT INTO cities VALUES (613, 8, 'Serraria', false, -9.5993279999999999, -35.716115600000002);
INSERT INTO cities VALUES (614, 8, 'Sertãozinho', false, -8.9162789999999994, -35.721729000000003);
INSERT INTO cities VALUES (615, 8, 'Sobrado', false, NULL, NULL);
INSERT INTO cities VALUES (616, 8, 'Solânea', false, NULL, NULL);
INSERT INTO cities VALUES (617, 8, 'Soledade', false, -8.0392683999999992, -34.873913999999999);
INSERT INTO cities VALUES (618, 8, 'Sossêgo', false, -9.6250081999999999, -35.742522299999997);
INSERT INTO cities VALUES (619, 8, 'Sousa', false, -22.216019200000002, -49.949696500000002);
INSERT INTO cities VALUES (620, 8, 'Sumé', false, NULL, NULL);
INSERT INTO cities VALUES (621, 8, 'Taperoá', false, NULL, NULL);
INSERT INTO cities VALUES (622, 8, 'Tavares', false, -9.6106008999999997, -35.959324000000002);
INSERT INTO cities VALUES (623, 8, 'Teixeira', false, -9.6467884000000002, -35.708932099999998);
INSERT INTO cities VALUES (624, 8, 'Tenório', false, -9.6616134999999996, -35.706987099999999);
INSERT INTO cities VALUES (625, 8, 'Triunfo', false, -9.4085149999999995, -36.150120000000001);
INSERT INTO cities VALUES (626, 8, 'Uiraúna', false, NULL, NULL);
INSERT INTO cities VALUES (627, 8, 'Umbuzeiro', false, -8.9333332999999993, -37.633333299999997);
INSERT INTO cities VALUES (628, 8, 'Várzea', false, -9.0333330000000007, -37.483333000000002);
INSERT INTO cities VALUES (629, 8, 'Vieirópolis', false, NULL, NULL);
INSERT INTO cities VALUES (630, 8, 'Vista Serrana', false, -23.561003800000002, -46.463137000000003);
INSERT INTO cities VALUES (631, 8, 'Zabelê', false, NULL, NULL);
INSERT INTO cities VALUES (632, 8, 'Maceió', true, -9.6662514999999996, -35.735098299999997);
INSERT INTO cities VALUES (633, 9, 'Abaíra', false, -13.242001699999999, -41.668595199999999);
INSERT INTO cities VALUES (634, 9, 'Abaré', false, -8.7413643000000008, -39.1185495);
INSERT INTO cities VALUES (635, 9, 'Acajutiba', false, -11.663785600000001, -38.019607499999999);
INSERT INTO cities VALUES (636, 9, 'Adustina', false, -10.5423276, -38.110905799999998);
INSERT INTO cities VALUES (637, 9, 'Água Fria', false, -14.766667, -40.183332999999998);
INSERT INTO cities VALUES (638, 9, 'Aiquara', false, -14.1218843, -39.884195300000002);
INSERT INTO cities VALUES (639, 9, 'Alagoinhas', false, -11.68177, -41.324699000000003);
INSERT INTO cities VALUES (640, 9, 'Alcobaça', false, -17.522614699999998, -39.198146299999998);
INSERT INTO cities VALUES (641, 9, 'Almadina', false, -14.7056319, -39.6348944);
INSERT INTO cities VALUES (642, 9, 'Amargosa', false, -12.068049999999999, -40.945591);
INSERT INTO cities VALUES (643, 9, 'Amélia Rodrigues', false, -12.401062100000001, -38.754995100000002);
INSERT INTO cities VALUES (644, 9, 'América Dourada', false, -11.4353949, -41.431817799999997);
INSERT INTO cities VALUES (645, 9, 'Anagé', false, -14.599535899999999, -41.133685499999999);
INSERT INTO cities VALUES (646, 9, 'Andaraí', false, -11.71255, -40.625819999999997);
INSERT INTO cities VALUES (647, 9, 'Andorinha', false, -10.3406714, -39.835260599999998);
INSERT INTO cities VALUES (648, 9, 'Angical', false, -12.699999999999999, -41.716667000000001);
INSERT INTO cities VALUES (649, 9, 'Anguera', false, -12.150246900000001, -39.246662499999999);
INSERT INTO cities VALUES (650, 9, 'Antas', false, -14.3461, -42.411430000000003);
INSERT INTO cities VALUES (651, 9, 'Antônio Cardoso', false, -12.375708400000001, -39.152169100000002);
INSERT INTO cities VALUES (652, 9, 'Antônio Gonçalves', false, -10.5700593, -40.2720792);
INSERT INTO cities VALUES (653, 9, 'Aporá', false, -12.616667, -39.166666999999997);
INSERT INTO cities VALUES (654, 9, 'Apuarema', false, -13.846576000000001, -39.730840700000002);
INSERT INTO cities VALUES (655, 9, 'Araças', false, -12.220227700000001, -38.205843600000001);
INSERT INTO cities VALUES (656, 9, 'Aracatu', false, -14.4281164, -41.461590600000001);
INSERT INTO cities VALUES (657, 9, 'Araci', false, -12.091200000000001, -42.565289);
INSERT INTO cities VALUES (658, 9, 'Aramari', false, -12.075552500000001, -38.495697700000001);
INSERT INTO cities VALUES (659, 9, 'Arataca', false, -15.259222299999999, -39.412289600000001);
INSERT INTO cities VALUES (660, 9, 'Aratuípe', false, -13.0748947, -38.991323899999998);
INSERT INTO cities VALUES (661, 9, 'Aurelino Leal', false, -14.3607873, -39.408552100000001);
INSERT INTO cities VALUES (662, 9, 'Baianópolis', false, -12.306392300000001, -44.534650300000003);
INSERT INTO cities VALUES (663, 9, 'Baixa Grande', false, -12.833333, -40.866667);
INSERT INTO cities VALUES (664, 9, 'Banzaê', false, -10.576586199999999, -38.606753599999998);
INSERT INTO cities VALUES (665, 9, 'Barra', false, -13.25163, -43.455348999999998);
INSERT INTO cities VALUES (666, 9, 'Barra da Estiva', false, -13.612963199999999, -41.323296300000003);
INSERT INTO cities VALUES (667, 9, 'Barra do Choça', false, -14.864112199999999, -40.5590647);
INSERT INTO cities VALUES (668, 9, 'Barra do Mendes', false, -11.8104072, -42.059212899999999);
INSERT INTO cities VALUES (669, 9, 'Barra do Rocha', false, -14.183760100000001, -39.5970102);
INSERT INTO cities VALUES (670, 9, 'Barreiras', false, -16.066666999999999, -39.333333000000003);
INSERT INTO cities VALUES (671, 9, 'Barro Alto', false, -11.766959099999999, -41.905607799999999);
INSERT INTO cities VALUES (672, 9, 'Barrocas', false, -11.529530400000001, -39.083256400000003);
INSERT INTO cities VALUES (673, 9, 'Barro Preto (antigo Gov. Lomanto Jr.)', false, -14.813333, -39.474443999999998);
INSERT INTO cities VALUES (674, 9, 'Belmonte', false, -15.859591399999999, -38.890267700000003);
INSERT INTO cities VALUES (675, 9, 'Belo Campo', false, -11.550000000000001, -41.616667);
INSERT INTO cities VALUES (676, 9, 'Biritinga', false, -11.6099593, -38.7943973);
INSERT INTO cities VALUES (677, 9, 'Boa Nova', false, -14.354175, -40.212921199999997);
INSERT INTO cities VALUES (678, 9, 'Boa Vista do Tupim', false, -12.662464999999999, -40.605382499999997);
INSERT INTO cities VALUES (679, 9, 'Bom Jesus da Lapa', false, -13.247650999999999, -43.4147569);
INSERT INTO cities VALUES (680, 9, 'Bom Jesus da Serra', false, -14.3679056, -40.514598499999998);
INSERT INTO cities VALUES (681, 9, 'Boninal', false, -12.702434500000001, -41.828411600000003);
INSERT INTO cities VALUES (682, 9, 'Bonito', false, -13.706619999999999, -44.615668999999997);
INSERT INTO cities VALUES (683, 9, 'Boquira', false, -12.813824800000001, -42.709002099999999);
INSERT INTO cities VALUES (684, 9, 'Botuporã', false, -13.3843511, -42.527497699999998);
INSERT INTO cities VALUES (685, 9, 'Brejões', false, -11.033333000000001, -41.416666999999997);
INSERT INTO cities VALUES (686, 9, 'Brejolândia', false, -12.470589, -43.973288599999997);
INSERT INTO cities VALUES (687, 9, 'Brotas de Macaúbas', false, -11.9979204, -42.625039299999997);
INSERT INTO cities VALUES (688, 9, 'Brumado', false, -14.197053800000001, -41.669308800000003);
INSERT INTO cities VALUES (689, 9, 'Buerarema', false, -14.9471138, -39.304361299999997);
INSERT INTO cities VALUES (690, 9, 'Buritirama', false, -10.715214, -43.639193800000001);
INSERT INTO cities VALUES (691, 9, 'Caatiba', false, -14.966013999999999, -40.419878799999999);
INSERT INTO cities VALUES (692, 9, 'Cabaceiras do Paraguaçu', false, -12.5256002, -39.179138500000001);
INSERT INTO cities VALUES (693, 9, 'Cachoeira', false, -13.064730000000001, -45.770221999999997);
INSERT INTO cities VALUES (694, 9, 'Caculé', false, -14.5040026, -42.220330400000002);
INSERT INTO cities VALUES (695, 9, 'Caém', false, -11.0864672, -40.420234899999997);
INSERT INTO cities VALUES (696, 9, 'Caetanos', false, -14.3354678, -40.904649300000003);
INSERT INTO cities VALUES (697, 9, 'Caetité', false, -14.0546848, -42.474437399999999);
INSERT INTO cities VALUES (698, 9, 'Cafarnaum', false, -11.689189300000001, -41.468553499999999);
INSERT INTO cities VALUES (699, 9, 'Cairu', false, -13.50342, -39.046449899999999);
INSERT INTO cities VALUES (700, 9, 'Caldeirão Grande', false, -12.8977, -40.022179000000001);
INSERT INTO cities VALUES (701, 9, 'Camacan', false, -15.414307000000001, -39.500991599999999);
INSERT INTO cities VALUES (702, 9, 'Camaçari', false, -12.6963594, -38.323351199999998);
INSERT INTO cities VALUES (703, 9, 'Camamu', false, -13.9412574, -39.121418200000001);
INSERT INTO cities VALUES (704, 9, 'Campo Alegre de Lourdes', false, -9.5169159000000008, -43.0119969);
INSERT INTO cities VALUES (705, 9, 'Campo Formoso', false, -11.316667000000001, -42.016666999999998);
INSERT INTO cities VALUES (706, 9, 'Canápolis', false, -13.0682428, -44.207203200000002);
INSERT INTO cities VALUES (707, 9, 'Canarana', false, -11.6851129, -41.769546599999998);
INSERT INTO cities VALUES (708, 9, 'Canavieiras', false, -15.6503762, -38.961630900000003);
INSERT INTO cities VALUES (709, 9, 'Candeal', false, -12.733333, -39.399999999999999);
INSERT INTO cities VALUES (710, 9, 'Candeias', false, -13.85, -39.383333);
INSERT INTO cities VALUES (711, 9, 'Candiba', false, -14.4018839, -42.862226900000003);
INSERT INTO cities VALUES (712, 9, 'Cândido Sales', false, -15.505440500000001, -41.237625899999998);
INSERT INTO cities VALUES (713, 9, 'Cansanção', false, -10.670920799999999, -39.499064500000003);
INSERT INTO cities VALUES (714, 9, 'Canudos', false, -11.965833, -41.626944000000002);
INSERT INTO cities VALUES (715, 9, 'Capela do Alto Alegre', false, -11.6652193, -39.837541299999998);
INSERT INTO cities VALUES (716, 9, 'Capim Grosso', false, -11.381622399999999, -40.012663199999999);
INSERT INTO cities VALUES (717, 9, 'Caraíbas', false, -12.629200000000001, -44.170119999999997);
INSERT INTO cities VALUES (718, 9, 'Caravelas', false, -17.713558599999999, -39.248367100000003);
INSERT INTO cities VALUES (719, 9, 'Cardeal da Silva', false, -11.9422674, -37.9557243);
INSERT INTO cities VALUES (720, 9, 'Carinhanha', false, -14.3052759, -43.766627200000002);
INSERT INTO cities VALUES (721, 9, 'Casa Nova', false, -9.4079840000000008, -41.157950999999997);
INSERT INTO cities VALUES (722, 9, 'Castro Alves', false, -12.7475191, -39.431121699999998);
INSERT INTO cities VALUES (723, 9, 'Catolândia', false, -12.3009738, -44.8631916);
INSERT INTO cities VALUES (724, 9, 'Catu', false, -13.099005, -38.793872999999998);
INSERT INTO cities VALUES (725, 9, 'Caturama', false, -13.330156199999999, -42.2921239);
INSERT INTO cities VALUES (726, 9, 'Central', false, -11.141967299999999, -42.1098584);
INSERT INTO cities VALUES (727, 9, 'Chorrochó', false, -8.9935457999999997, -39.196013399999998);
INSERT INTO cities VALUES (728, 9, 'Cícero Dantas', false, -10.5964396, -38.390965999999999);
INSERT INTO cities VALUES (729, 9, 'Cipó', false, -13.5, -42.366667);
INSERT INTO cities VALUES (730, 9, 'Coaraci', false, -14.641506700000001, -39.550389600000003);
INSERT INTO cities VALUES (731, 9, 'Cocos', false, -12.72222, -44.564579000000002);
INSERT INTO cities VALUES (732, 9, 'Conceição da Feira', false, -12.5063163, -38.9968231);
INSERT INTO cities VALUES (733, 9, 'Conceição do Almeida', false, -12.8085568, -39.199196100000002);
INSERT INTO cities VALUES (734, 9, 'Conceição do Coité', false, -11.5613674, -39.286099);
INSERT INTO cities VALUES (735, 9, 'Conceição do Jacuípe', false, -12.353997700000001, -38.804375399999998);
INSERT INTO cities VALUES (736, 9, 'Conde', false, -11.811102999999999, -37.611117499999999);
INSERT INTO cities VALUES (737, 9, 'Condeúba', false, -14.895262000000001, -41.969714199999999);
INSERT INTO cities VALUES (738, 9, 'Contendas do Sincorá', false, -13.762109499999999, -41.042592399999997);
INSERT INTO cities VALUES (739, 9, 'Coração de Maria', false, -12.233623100000001, -38.745355799999999);
INSERT INTO cities VALUES (740, 9, 'Cordeiros', false, -15.0400288, -41.934997199999998);
INSERT INTO cities VALUES (741, 9, 'Coribe', false, -13.829443400000001, -44.449178199999999);
INSERT INTO cities VALUES (742, 9, 'Coronel João Sá', false, -10.284072200000001, -37.926998099999999);
INSERT INTO cities VALUES (743, 9, 'Correntina', false, -13.3403685, -44.6430297);
INSERT INTO cities VALUES (744, 9, 'Cotegipe', false, -12.0192152, -44.267398);
INSERT INTO cities VALUES (745, 9, 'Cravolândia', false, -13.3625761, -39.804937500000001);
INSERT INTO cities VALUES (746, 9, 'Crisópolis', false, -11.5099825, -38.147919199999997);
INSERT INTO cities VALUES (747, 9, 'Cristópolis', false, -12.21027, -44.416405300000001);
INSERT INTO cities VALUES (748, 9, 'Cruz das Almas', false, -12.653031, -39.121949299999997);
INSERT INTO cities VALUES (749, 9, 'Curaçá', false, -8.9927110999999993, -39.899872600000002);
INSERT INTO cities VALUES (750, 9, 'Dário Meira', false, -14.4211639, -39.902325900000001);
INSERT INTO cities VALUES (751, 9, 'Dias d`Ávila', false, -12.612867899999999, -38.2974739);
INSERT INTO cities VALUES (752, 9, 'Dom Basílio', false, -13.7722164, -41.788843);
INSERT INTO cities VALUES (753, 9, 'Dom Macedo Costa', false, -12.976410899999999, -39.149007900000001);
INSERT INTO cities VALUES (754, 9, 'Elísio Medrado', false, -12.933050100000001, -39.512403599999999);
INSERT INTO cities VALUES (755, 9, 'Encruzilhada', false, -12.916667, -41.200000000000003);
INSERT INTO cities VALUES (756, 9, 'Entre Rios', false, -11.954529300000001, -38.068745200000002);
INSERT INTO cities VALUES (757, 9, 'Érico Cardoso', false, -13.4184179, -42.139840900000003);
INSERT INTO cities VALUES (758, 9, 'Esplanada', false, -11.7808194, -37.947099000000001);
INSERT INTO cities VALUES (759, 9, 'Euclides da Cunha', false, -10.506062399999999, -39.009239600000001);
INSERT INTO cities VALUES (760, 9, 'Eunápolis', false, -16.373096, -39.575135899999999);
INSERT INTO cities VALUES (761, 9, 'Fátima', false, -10.5930658, -38.217032699999997);
INSERT INTO cities VALUES (762, 9, 'Feira da Mata', false, -14.1994115, -44.287632700000003);
INSERT INTO cities VALUES (763, 9, 'Feira de Santana', false, -12.273282999999999, -38.9555504);
INSERT INTO cities VALUES (764, 9, 'Filadélfia', false, -10.741248499999999, -40.130825299999998);
INSERT INTO cities VALUES (765, 9, 'Firmino Alves', false, -14.9849049, -39.925969100000003);
INSERT INTO cities VALUES (766, 9, 'Floresta Azul', false, -14.847682600000001, -39.656360800000002);
INSERT INTO cities VALUES (767, 9, 'Formosa do Rio Preto', false, -11.038580700000001, -45.178560900000001);
INSERT INTO cities VALUES (768, 9, 'Gandu', false, -13.7381937, -39.480399599999998);
INSERT INTO cities VALUES (769, 9, 'Gavião', false, -11.4712692, -39.779028599999997);
INSERT INTO cities VALUES (770, 9, 'Gentio do Ouro', false, -11.4319364, -42.516250700000001);
INSERT INTO cities VALUES (771, 9, 'Glória', false, -9.3459228999999997, -38.272780699999998);
INSERT INTO cities VALUES (772, 9, 'Gongogi', false, -14.326564100000001, -39.4638414);
INSERT INTO cities VALUES (773, 9, 'Governador Mangabeira', false, -12.599129899999999, -39.021012399999996);
INSERT INTO cities VALUES (774, 9, 'Guajeru', false, -14.548072299999999, -41.939135399999998);
INSERT INTO cities VALUES (775, 9, 'Guanambi', false, -14.207094100000001, -42.782039900000001);
INSERT INTO cities VALUES (776, 9, 'Guaratinga', false, -16.563102600000001, -39.782567899999997);
INSERT INTO cities VALUES (777, 9, 'Heliópolis', false, -10.685073300000001, -38.288507299999999);
INSERT INTO cities VALUES (778, 9, 'Iaçu', false, -12.759568099999999, -40.2123767);
INSERT INTO cities VALUES (779, 9, 'Ibiassucê', false, -14.2588142, -42.2600172);
INSERT INTO cities VALUES (780, 9, 'Ibicaraí', false, -14.841429700000001, -39.592759299999997);
INSERT INTO cities VALUES (781, 9, 'Ibicoara', false, -13.411379200000001, -41.282822600000003);
INSERT INTO cities VALUES (782, 9, 'Ibicuí', false, -14.829886999999999, -39.9828622);
INSERT INTO cities VALUES (783, 9, 'Ibipeba', false, -11.641388299999999, -42.012614399999997);
INSERT INTO cities VALUES (784, 9, 'Ibipitanga', false, -12.8763044, -42.491794599999999);
INSERT INTO cities VALUES (785, 9, 'Ibiquera', false, -12.6478874, -40.939077900000001);
INSERT INTO cities VALUES (786, 9, 'Ibirapitanga', false, -14.151384200000001, -39.381543499999999);
INSERT INTO cities VALUES (787, 9, 'Ibirapuã', false, -17.667313700000001, -40.109503699999998);
INSERT INTO cities VALUES (788, 9, 'Ibirataia', false, -14.069493400000001, -39.640525400000001);
INSERT INTO cities VALUES (789, 9, 'Ibitiara', false, -12.656469599999999, -42.222145400000002);
INSERT INTO cities VALUES (790, 9, 'Ibititá', false, -11.5454208, -41.975476999999998);
INSERT INTO cities VALUES (791, 9, 'Ibotirama', false, -12.1817726, -43.213230799999998);
INSERT INTO cities VALUES (792, 9, 'Ichu', false, -11.748057599999999, -39.185724499999999);
INSERT INTO cities VALUES (793, 9, 'Igaporã', false, -13.7681649, -42.720801700000003);
INSERT INTO cities VALUES (794, 9, 'Igrapiúna', false, -13.825257799999999, -39.130493100000002);
INSERT INTO cities VALUES (795, 9, 'Iguaí', false, -14.7602905, -40.082549899999997);
INSERT INTO cities VALUES (796, 9, 'Ilhéus', false, -13.016667, -40.016666999999998);
INSERT INTO cities VALUES (797, 9, 'Inhambupe', false, -11.7858749, -38.349486200000001);
INSERT INTO cities VALUES (798, 9, 'Ipecaetá', false, -12.298945700000001, -39.3030051);
INSERT INTO cities VALUES (799, 9, 'Ipiaú', false, -14.1351736, -39.735055199999998);
INSERT INTO cities VALUES (800, 9, 'Ipirá', false, -12.1539243, -39.745029299999999);
INSERT INTO cities VALUES (801, 9, 'Ipupiara', false, -11.816709400000001, -42.616204000000003);
INSERT INTO cities VALUES (802, 9, 'Irajuba', false, -13.23691, -40.069865299999996);
INSERT INTO cities VALUES (803, 9, 'Iramaia', false, -12.366667, -41.366667);
INSERT INTO cities VALUES (804, 9, 'Iraquara', false, -12.2481002, -41.620977400000001);
INSERT INTO cities VALUES (805, 9, 'Irará', false, -12.047057000000001, -38.753799600000001);
INSERT INTO cities VALUES (806, 9, 'Irecê', false, -11.2999136, -41.856817800000002);
INSERT INTO cities VALUES (807, 9, 'Itabela', false, -16.5718891, -39.5591072);
INSERT INTO cities VALUES (808, 9, 'Itaberaba', false, -12.515776600000001, -40.304037000000001);
INSERT INTO cities VALUES (809, 9, 'Itabuna', false, -14.789205900000001, -39.277740799999997);
INSERT INTO cities VALUES (810, 9, 'Itacaré', false, -14.2767345, -38.998845799999998);
INSERT INTO cities VALUES (811, 9, 'Itaeté', false, -12.9834763, -40.977454700000003);
INSERT INTO cities VALUES (812, 9, 'Itagi', false, -14.1490822, -40.012636299999997);
INSERT INTO cities VALUES (813, 9, 'Itagibá', false, -14.282382200000001, -39.8462283);
INSERT INTO cities VALUES (814, 9, 'Itagimirim', false, -16.086773399999998, -39.619531700000003);
INSERT INTO cities VALUES (815, 9, 'Itaguaçu da Bahia', false, -11.0130932, -42.401139299999997);
INSERT INTO cities VALUES (816, 9, 'Itaju do Colônia', false, -15.1428651, -39.726518800000001);
INSERT INTO cities VALUES (817, 9, 'Itajuípe', false, -14.685159199999999, -39.364443299999998);
INSERT INTO cities VALUES (818, 9, 'Itamaraju', false, -17.0561066, -39.547249100000002);
INSERT INTO cities VALUES (819, 9, 'Itamari', false, -13.778206600000001, -39.689898300000003);
INSERT INTO cities VALUES (820, 9, 'Itambé', false, -15.245445200000001, -40.624309799999999);
INSERT INTO cities VALUES (821, 9, 'Itanagra', false, -12.260309100000001, -38.0509895);
INSERT INTO cities VALUES (822, 9, 'Itanhém', false, -17.150180599999999, -40.3286643);
INSERT INTO cities VALUES (823, 9, 'Itaparica', false, -12.9173422, -38.654599099999999);
INSERT INTO cities VALUES (824, 9, 'Itapé', false, -14.876528199999999, -39.433059100000001);
INSERT INTO cities VALUES (825, 9, 'Itapebi', false, -15.952550799999999, -39.533801799999999);
INSERT INTO cities VALUES (826, 9, 'Itapetinga', false, -15.256455900000001, -40.257636099999999);
INSERT INTO cities VALUES (827, 9, 'Itapicuru', false, -10.800000000000001, -40.383333);
INSERT INTO cities VALUES (828, 9, 'Itapitanga', false, -14.416207399999999, -39.545713200000002);
INSERT INTO cities VALUES (829, 9, 'Itaquara', false, -13.452700399999999, -39.937589600000003);
INSERT INTO cities VALUES (830, 9, 'Itarantim', false, -15.6557733, -40.058057300000002);
INSERT INTO cities VALUES (831, 9, 'Itatim', false, -12.713691600000001, -39.693397699999998);
INSERT INTO cities VALUES (832, 9, 'Itiruçu', false, -13.5073504, -40.142019300000001);
INSERT INTO cities VALUES (833, 9, 'Itiúba', false, -12.14152, -40.505482000000001);
INSERT INTO cities VALUES (834, 9, 'Itororó', false, -15.1174304, -40.068068400000001);
INSERT INTO cities VALUES (835, 9, 'Ituaçu', false, -13.8124354, -41.293597400000003);
INSERT INTO cities VALUES (836, 9, 'Ituberá', false, -13.7324582, -39.150480100000003);
INSERT INTO cities VALUES (837, 9, 'Iuiú', false, -14.4140298, -43.546032799999999);
INSERT INTO cities VALUES (838, 9, 'Jaborandi', false, -13.589205, -44.533518399999998);
INSERT INTO cities VALUES (839, 9, 'Jacaraci', false, -14.850671, -42.429923500000001);
INSERT INTO cities VALUES (840, 9, 'Jacobina', false, -11.1854516, -40.5360789);
INSERT INTO cities VALUES (841, 9, 'Jaguaquara', false, -13.528717800000001, -39.976784100000003);
INSERT INTO cities VALUES (842, 9, 'Jaguarari', false, -10.2435814, -40.1844191);
INSERT INTO cities VALUES (843, 9, 'Jaguaripe', false, -13.107830999999999, -38.889161100000003);
INSERT INTO cities VALUES (844, 9, 'Jandaíra', false, -11.5589982, -37.785188499999997);
INSERT INTO cities VALUES (845, 9, 'Jequié', false, -13.8510445, -40.081173399999997);
INSERT INTO cities VALUES (846, 9, 'Jeremoabo', false, -10.063958400000001, -38.340707000000002);
INSERT INTO cities VALUES (847, 9, 'Jiquiriçá', false, -13.2410228, -39.572570499999998);
INSERT INTO cities VALUES (848, 9, 'Jitaúna', false, -13.9902905, -39.8924181);
INSERT INTO cities VALUES (849, 9, 'João Dourado', false, -11.3488621, -41.665154399999999);
INSERT INTO cities VALUES (850, 9, 'Juazeiro', false, -15.569850000000001, -40.019489);
INSERT INTO cities VALUES (851, 9, 'Jucuruçu', false, -16.8298153, -40.164863400000002);
INSERT INTO cities VALUES (852, 9, 'Jussara', false, -11.048767, -41.969931199999998);
INSERT INTO cities VALUES (853, 9, 'Jussari', false, -15.1694367, -39.4882171);
INSERT INTO cities VALUES (854, 9, 'Jussiape', false, -13.5173193, -41.591033099999997);
INSERT INTO cities VALUES (855, 9, 'Lafaiete Coutinho', false, -13.6364371, -40.212068000000002);
INSERT INTO cities VALUES (856, 9, 'Lagoa Real', false, -14.032261200000001, -42.140802000000001);
INSERT INTO cities VALUES (857, 9, 'Laje', false, -13.1644215, -39.433087399999998);
INSERT INTO cities VALUES (858, 9, 'Lajedão', false, -17.592242899999999, -40.341755300000003);
INSERT INTO cities VALUES (859, 9, 'Lajedinho', false, -12.550000000000001, -41.649999999999999);
INSERT INTO cities VALUES (860, 9, 'Lajedo do Tabocal', false, -13.450151, -40.2392769);
INSERT INTO cities VALUES (861, 9, 'Lamarão', false, -13.699999999999999, -41.799999999999997);
INSERT INTO cities VALUES (862, 9, 'Lapão', false, -11.382876100000001, -41.831129699999998);
INSERT INTO cities VALUES (863, 9, 'Lauro de Freitas', false, -12.8939535, -38.327885500000001);
INSERT INTO cities VALUES (864, 9, 'Lençóis', false, -13.816667000000001, -41.716667000000001);
INSERT INTO cities VALUES (865, 9, 'Licínio de Almeida', false, -14.68275, -42.507392799999998);
INSERT INTO cities VALUES (866, 9, 'Livramento de Nossa Senhora', false, -13.643171600000001, -41.842222100000001);
INSERT INTO cities VALUES (867, 9, 'Luís Eduardo Magalhães', false, -12.0994054, -45.798259700000003);
INSERT INTO cities VALUES (868, 9, 'Macajuba', false, -12.1317393, -40.364067900000002);
INSERT INTO cities VALUES (869, 9, 'Macarani', false, -15.562877200000001, -40.427191899999997);
INSERT INTO cities VALUES (870, 9, 'Macaúbas', false, -13.0197729, -42.695533300000001);
INSERT INTO cities VALUES (871, 9, 'Macururé', false, -9.1582270000000001, -39.052642499999997);
INSERT INTO cities VALUES (872, 9, 'Madre de Deus', false, -12.7395332, -38.621272500000003);
INSERT INTO cities VALUES (873, 9, 'Maetinga', false, -14.659512599999999, -41.495058299999997);
INSERT INTO cities VALUES (874, 9, 'Maiquinique', false, -15.6164428, -40.245150600000002);
INSERT INTO cities VALUES (875, 9, 'Mairi', false, -11.711733199999999, -40.146284700000002);
INSERT INTO cities VALUES (876, 9, 'Malhada', false, -13.916667, -40.916666999999997);
INSERT INTO cities VALUES (877, 9, 'Malhada de Pedras', false, -14.385702500000001, -41.883450699999997);
INSERT INTO cities VALUES (878, 9, 'Manoel Vitorino', false, -14.146022800000001, -40.241961000000003);
INSERT INTO cities VALUES (879, 9, 'Mansidão', false, -10.715695500000001, -44.036972499999997);
INSERT INTO cities VALUES (880, 9, 'Maracás', false, -13.4283176, -40.4377864);
INSERT INTO cities VALUES (881, 9, 'Maragogipe', false, -12.778365000000001, -38.919499899999998);
INSERT INTO cities VALUES (882, 9, 'Maraú', false, -14.115426599999999, -38.993268499999999);
INSERT INTO cities VALUES (883, 9, 'Marcionílio Souza', false, -13.003424000000001, -40.5312774);
INSERT INTO cities VALUES (884, 9, 'Mascote', false, -15.572055199999999, -39.2917123);
INSERT INTO cities VALUES (885, 9, 'Mata de São João', false, -12.530553400000001, -38.299660799999998);
INSERT INTO cities VALUES (886, 9, 'Matina', false, -13.909637399999999, -42.847426900000002);
INSERT INTO cities VALUES (887, 9, 'Medeiros Neto', false, -17.374407000000001, -40.220135900000002);
INSERT INTO cities VALUES (888, 9, 'Miguel Calmon', false, -11.4269199, -40.594269599999997);
INSERT INTO cities VALUES (889, 9, 'Milagres', false, -12.870608300000001, -39.8511861);
INSERT INTO cities VALUES (890, 9, 'Mirangaba', false, -10.9553882, -40.570320899999999);
INSERT INTO cities VALUES (891, 9, 'Mirante', false, -14.2285015, -40.7732782);
INSERT INTO cities VALUES (892, 9, 'Monte Santo', false, -9.9666669999999993, -38.899999999999999);
INSERT INTO cities VALUES (893, 9, 'Morpará', false, -11.5597891, -43.276700300000002);
INSERT INTO cities VALUES (894, 9, 'Morro do Chapéu', false, -11.552404900000001, -41.157566000000003);
INSERT INTO cities VALUES (895, 9, 'Mortugaba', false, -15.022573, -42.367646399999998);
INSERT INTO cities VALUES (896, 9, 'Mucugê', false, -12.21552, -37.879829000000001);
INSERT INTO cities VALUES (897, 9, 'Mucuri', false, -18.055546799999998, -39.549660199999998);
INSERT INTO cities VALUES (898, 9, 'Mulungu do Morro', false, -11.9692376, -41.637986099999999);
INSERT INTO cities VALUES (899, 9, 'Mundo Novo', false, -13.4, -41.216667000000001);
INSERT INTO cities VALUES (900, 9, 'Muniz Ferreira', false, -12.98798, -39.100487600000001);
INSERT INTO cities VALUES (901, 9, 'Muquém de São Francisco', false, -12.0649815, -43.542505900000002);
INSERT INTO cities VALUES (902, 9, 'Muritiba', false, -12.636895000000001, -39.095857000000002);
INSERT INTO cities VALUES (903, 9, 'Mutuípe', false, -13.2057427, -39.502862);
INSERT INTO cities VALUES (904, 9, 'Nazaré', false, -13.0354724, -39.003303899999999);
INSERT INTO cities VALUES (905, 9, 'Nilo Peçanha', false, -13.603593500000001, -39.103938499999998);
INSERT INTO cities VALUES (906, 9, 'Nordestina', false, -10.814506700000001, -39.431027200000003);
INSERT INTO cities VALUES (907, 9, 'Nova Canaã', false, -14.7798015, -40.144982400000004);
INSERT INTO cities VALUES (908, 9, 'Nova Fátima', false, -11.601820200000001, -39.626971599999997);
INSERT INTO cities VALUES (909, 9, 'Nova Ibiá', false, -13.832564100000001, -39.592533600000003);
INSERT INTO cities VALUES (910, 9, 'Nova Itarana', false, -13.012726799999999, -40.076656);
INSERT INTO cities VALUES (911, 9, 'Nova Redenção', false, -12.8157262, -41.075287199999998);
INSERT INTO cities VALUES (912, 9, 'Nova Soure', false, -11.2340464, -38.484803499999998);
INSERT INTO cities VALUES (913, 9, 'Nova Viçosa', false, -17.872155100000001, -39.385588499999997);
INSERT INTO cities VALUES (914, 9, 'Novo Horizonte', false, -14.1, -39.366667);
INSERT INTO cities VALUES (915, 9, 'Novo Triunfo', false, -10.3323489, -38.447869099999998);
INSERT INTO cities VALUES (916, 9, 'Olindina', false, -11.3634684, -38.328247500000003);
INSERT INTO cities VALUES (917, 9, 'Oliveira dos Brejinhos', false, -12.313627800000001, -42.895122700000002);
INSERT INTO cities VALUES (918, 9, 'Ouriçangas', false, -12.016340899999999, -38.626399599999999);
INSERT INTO cities VALUES (919, 9, 'Ourolândia', false, -10.9676396, -41.086615700000003);
INSERT INTO cities VALUES (920, 9, 'Palmas de Monte Alto', false, -14.2666907, -43.166690799999998);
INSERT INTO cities VALUES (921, 9, 'Palmeiras', false, -11.15, -42.049999999999997);
INSERT INTO cities VALUES (922, 9, 'Paramirim', false, -12.016667, -42.216667000000001);
INSERT INTO cities VALUES (923, 9, 'Paratinga', false, -12.690560400000001, -43.183150300000001);
INSERT INTO cities VALUES (924, 9, 'Paripiranga', false, -10.6829898, -37.855505999999998);
INSERT INTO cities VALUES (925, 9, 'Pau Brasil', false, -15.465233, -39.650195799999999);
INSERT INTO cities VALUES (926, 9, 'Paulo Afonso', false, -9.4109704000000001, -38.235844499999999);
INSERT INTO cities VALUES (927, 9, 'Pé de Serra', false, -13.680630000000001, -41.076248);
INSERT INTO cities VALUES (928, 9, 'Pedrão', false, -12.131315600000001, -38.648362900000002);
INSERT INTO cities VALUES (929, 9, 'Pedro Alexandre', false, -10.106714, -37.9871354);
INSERT INTO cities VALUES (930, 9, 'Piatã', false, -13.152243, -41.768281799999997);
INSERT INTO cities VALUES (931, 9, 'Pilão Arcado', false, -10.036715600000001, -42.462653500000002);
INSERT INTO cities VALUES (932, 9, 'Pindaí', false, -14.4945577, -42.687069800000003);
INSERT INTO cities VALUES (933, 9, 'Pindobaçu', false, -10.745967200000001, -40.357940999999997);
INSERT INTO cities VALUES (934, 9, 'Pintadas', false, -11.809106999999999, -39.911529100000003);
INSERT INTO cities VALUES (935, 9, 'Piraí do Norte', false, -13.739883900000001, -39.3760008);
INSERT INTO cities VALUES (936, 9, 'Piripá', false, -14.9346417, -41.717530400000001);
INSERT INTO cities VALUES (937, 9, 'Piritiba', false, -11.7301407, -40.555681800000002);
INSERT INTO cities VALUES (938, 9, 'Planaltino', false, -13.2467696, -40.375432600000003);
INSERT INTO cities VALUES (939, 9, 'Planalto', false, -14.6603923, -40.478874699999999);
INSERT INTO cities VALUES (940, 9, 'Poções', false, -10.373488, -41.921267999999998);
INSERT INTO cities VALUES (941, 9, 'Pojuca', false, -12.429247800000001, -38.3291459);
INSERT INTO cities VALUES (942, 9, 'Ponto Novo', false, -14.033333000000001, -39.283332999999999);
INSERT INTO cities VALUES (943, 9, 'Porto Seguro', false, -16.451106299999999, -39.064602100000002);
INSERT INTO cities VALUES (944, 9, 'Potiraguá', false, -15.595758399999999, -39.857579700000002);
INSERT INTO cities VALUES (945, 9, 'Prado', false, -17.3325827, -39.230825199999998);
INSERT INTO cities VALUES (946, 9, 'Presidente Dutra', false, -11.296768399999999, -41.987151699999998);
INSERT INTO cities VALUES (947, 9, 'Presidente Jânio Quadros', false, -14.6887984, -41.679357699999997);
INSERT INTO cities VALUES (948, 9, 'Presidente Tancredo Neves', false, -13.454003200000001, -39.4207477);
INSERT INTO cities VALUES (949, 9, 'Queimadas', false, -10.979165500000001, -39.6248358);
INSERT INTO cities VALUES (950, 9, 'Quijingue', false, -10.753170600000001, -39.208816400000003);
INSERT INTO cities VALUES (951, 9, 'Quixabeira', false, -12.59782, -39.125487999999997);
INSERT INTO cities VALUES (952, 9, 'Rafael Jambeiro', false, -12.399234999999999, -39.515492899999998);
INSERT INTO cities VALUES (953, 9, 'Remanso', false, -9.6043363999999993, -42.101735400000003);
INSERT INTO cities VALUES (954, 9, 'Retirolândia', false, -11.4795377, -39.415960900000002);
INSERT INTO cities VALUES (955, 9, 'Riachão das Neves', false, -11.7468679, -44.906339000000003);
INSERT INTO cities VALUES (956, 9, 'Riachão do Jacuípe', false, -11.8116497, -39.385845099999997);
INSERT INTO cities VALUES (957, 9, 'Riacho de Santana', false, -13.598194599999999, -42.9262899);
INSERT INTO cities VALUES (958, 9, 'Ribeira do Amparo', false, -11.0434033, -38.4370099);
INSERT INTO cities VALUES (959, 9, 'Ribeira do Pombal', false, -10.831285899999999, -38.5302273);
INSERT INTO cities VALUES (960, 9, 'Ribeirão do Largo', false, -15.446081, -40.7401111);
INSERT INTO cities VALUES (961, 9, 'Rio de Contas', false, -13.5838103, -41.810071800000003);
INSERT INTO cities VALUES (962, 9, 'Rio do Antônio', false, -14.4078973, -42.074684099999999);
INSERT INTO cities VALUES (963, 9, 'Rio do Pires', false, -13.1254481, -42.296725600000002);
INSERT INTO cities VALUES (964, 9, 'Rio Real', false, -11.485283600000001, -37.934363599999998);
INSERT INTO cities VALUES (965, 9, 'Rodelas', false, -8.8460012999999993, -38.753783900000002);
INSERT INTO cities VALUES (966, 9, 'Ruy Barbosa', false, -12.277696000000001, -40.499365099999999);
INSERT INTO cities VALUES (967, 9, 'Salinas da Margarida', false, -12.8655828, -38.763511800000003);
INSERT INTO cities VALUES (968, 9, 'Santa Bárbara', false, -14.066667000000001, -42.366667);
INSERT INTO cities VALUES (969, 9, 'Santa Brígida', false, -9.7206793999999999, -38.125728000000002);
INSERT INTO cities VALUES (970, 9, 'Santa Cruz Cabrália', false, -16.278570500000001, -39.027603499999998);
INSERT INTO cities VALUES (971, 9, 'Santa Cruz da Vitória', false, -14.961665, -39.810242199999998);
INSERT INTO cities VALUES (972, 9, 'Santa Inês', false, -13.2895067, -39.811341400000003);
INSERT INTO cities VALUES (973, 9, 'Santa Luzia', false, -10.983333, -45.549999999999997);
INSERT INTO cities VALUES (974, 9, 'Santa Maria da Vitória', false, -13.373094399999999, -44.190385599999999);
INSERT INTO cities VALUES (975, 9, 'Santa Rita de Cássia', false, -11.0052944, -44.514066300000003);
INSERT INTO cities VALUES (976, 9, 'Santa Teresinha', false, -8.8666669999999996, -39.049999999999997);
INSERT INTO cities VALUES (977, 9, 'Santaluz', false, -11.256522500000001, -39.366592199999999);
INSERT INTO cities VALUES (978, 9, 'Santana', false, -14.48141, -41.808498);
INSERT INTO cities VALUES (979, 9, 'Santanópolis', false, -12.021720699999999, -38.868019400000001);
INSERT INTO cities VALUES (980, 9, 'Santo Amaro', false, -12.5729931, -38.714798999999999);
INSERT INTO cities VALUES (981, 9, 'Santo Antônio de Jesus', false, -12.9532066, -39.274606900000002);
INSERT INTO cities VALUES (982, 9, 'Santo Estêvão', false, -12.4331906, -39.2499039);
INSERT INTO cities VALUES (983, 9, 'São Desidério', false, -12.3521079, -44.984224500000003);
INSERT INTO cities VALUES (984, 9, 'São Domingos', false, -12.800000000000001, -41.616667);
INSERT INTO cities VALUES (985, 9, 'São Felipe', false, -14.81822, -41.384602000000001);
INSERT INTO cities VALUES (986, 9, 'São Félix', false, -12.666667, -40.733333000000002);
INSERT INTO cities VALUES (987, 9, 'São Félix do Coribe', false, -13.406667000000001, -44.186388999999998);
INSERT INTO cities VALUES (988, 9, 'São Francisco do Conde', false, -12.629232500000001, -38.680592799999999);
INSERT INTO cities VALUES (989, 9, 'São Gabriel', false, -11.250151199999999, -41.903315999999997);
INSERT INTO cities VALUES (990, 9, 'São Gonçalo dos Campos', false, -12.4271669, -38.973992799999998);
INSERT INTO cities VALUES (991, 9, 'São José da Vitória', false, -15.0775764, -39.3376637);
INSERT INTO cities VALUES (992, 9, 'São José do Jacuípe', false, -11.421283799999999, -39.870691200000003);
INSERT INTO cities VALUES (993, 9, 'São Miguel das Matas', false, -13.0416308, -39.463809400000002);
INSERT INTO cities VALUES (994, 9, 'São Sebastião do Passé', false, -12.513876099999999, -38.495181299999999);
INSERT INTO cities VALUES (995, 9, 'Sapeaçu', false, -12.7261594, -39.179284799999998);
INSERT INTO cities VALUES (996, 9, 'Sátiro Dias', false, -11.5989225, -38.590001800000003);
INSERT INTO cities VALUES (997, 9, 'Saubara', false, -12.737878, -38.769175699999998);
INSERT INTO cities VALUES (998, 9, 'Saúde', false, -10.940463299999999, -40.406943599999998);
INSERT INTO cities VALUES (999, 9, 'Seabra', false, -12.421355999999999, -41.7668027);
INSERT INTO cities VALUES (1000, 9, 'Sebastião Laranjeiras', false, -14.566841699999999, -42.936126700000003);
INSERT INTO cities VALUES (1001, 9, 'Senhor do Bonfim', false, -10.465939799999999, -40.180800400000003);
INSERT INTO cities VALUES (1002, 9, 'Sento Sé', false, -9.7406974999999996, -41.880054000000001);
INSERT INTO cities VALUES (1003, 9, 'Serra do Ramalho', false, -13.594639600000001, -43.549206400000003);
INSERT INTO cities VALUES (1004, 9, 'Serra Dourada', false, -12.750165600000001, -43.9401218);
INSERT INTO cities VALUES (1005, 9, 'Serra Preta', false, -12.1639509, -39.332165199999999);
INSERT INTO cities VALUES (1006, 9, 'Serrinha', false, -15.22241, -41.465541999999999);
INSERT INTO cities VALUES (1007, 9, 'Serrolândia', false, -11.418634300000001, -40.2943894);
INSERT INTO cities VALUES (1008, 9, 'Simões Filho', false, -12.7855898, -38.4055319);
INSERT INTO cities VALUES (1009, 9, 'Sítio do Mato', false, -13.0859421, -43.468611000000003);
INSERT INTO cities VALUES (1010, 9, 'Sítio do Quinto', false, -10.345498299999999, -38.216913400000003);
INSERT INTO cities VALUES (1011, 9, 'Sobradinho', false, -9.4594339999999999, -40.825448000000002);
INSERT INTO cities VALUES (1012, 9, 'Souto Soares', false, -12.0891103, -41.637970299999999);
INSERT INTO cities VALUES (1013, 9, 'Tabocas do Brejo Velho', false, -12.6976502, -44.002354199999999);
INSERT INTO cities VALUES (1014, 9, 'Tanhaçu', false, -14.0195946, -41.235213299999998);
INSERT INTO cities VALUES (1015, 9, 'Tanque Novo', false, -10.800000000000001, -44.100000000000001);
INSERT INTO cities VALUES (1016, 9, 'Tanquinho', false, -12.703010000000001, -39.717109999999998);
INSERT INTO cities VALUES (1017, 9, 'Taperoá', false, -13.5383532, -39.100224400000002);
INSERT INTO cities VALUES (1018, 9, 'Tapiramutá', false, -11.844033100000001, -40.791938700000003);
INSERT INTO cities VALUES (1019, 9, 'Teixeira de Freitas', false, -17.5459438, -39.723853400000003);
INSERT INTO cities VALUES (1020, 9, 'Teodoro Sampaio', false, -12.2823165, -38.615832900000001);
INSERT INTO cities VALUES (1021, 9, 'Teofilândia', false, -11.4860633, -38.973522500000001);
INSERT INTO cities VALUES (1022, 9, 'Teolândia', false, -13.5903019, -39.481859399999998);
INSERT INTO cities VALUES (1023, 9, 'Terra Nova', false, -12.3920742, -38.616021000000003);
INSERT INTO cities VALUES (1024, 9, 'Tremedal', false, -14.972493399999999, -41.414376300000001);
INSERT INTO cities VALUES (1025, 9, 'Tucano', false, -10.962546400000001, -38.790423500000003);
INSERT INTO cities VALUES (1026, 9, 'Uauá', false, -9.8430307999999993, -39.479624399999999);
INSERT INTO cities VALUES (1027, 9, 'Ubaíra', false, -13.251880699999999, -39.654203199999998);
INSERT INTO cities VALUES (1028, 9, 'Ubaitaba', false, -14.304757199999999, -39.323244299999999);
INSERT INTO cities VALUES (1029, 9, 'Ubatã', false, -14.1973143, -39.512693599999999);
INSERT INTO cities VALUES (1030, 9, 'Uibaí', false, -11.339941400000001, -42.132123800000002);
INSERT INTO cities VALUES (1031, 9, 'Umburanas', false, -13.199999999999999, -40.799999999999997);
INSERT INTO cities VALUES (1032, 9, 'Una', false, -15.2695629, -39.069420999999998);
INSERT INTO cities VALUES (1033, 9, 'Urandi', false, -14.772121200000001, -42.654162999999997);
INSERT INTO cities VALUES (1034, 9, 'Uruçuca', false, -14.5868088, -39.291381600000001);
INSERT INTO cities VALUES (1035, 9, 'Utinga', false, -11.023682000000001, -43.009278000000002);
INSERT INTO cities VALUES (1036, 9, 'Valença', false, -13.3740243, -39.067600900000002);
INSERT INTO cities VALUES (1037, 9, 'Valente', false, -11.411380299999999, -39.463328199999999);
INSERT INTO cities VALUES (1038, 9, 'Várzea da Roça', false, -11.6083806, -40.133723500000002);
INSERT INTO cities VALUES (1039, 9, 'Várzea do Poço', false, -11.5314549, -40.312576700000001);
INSERT INTO cities VALUES (1040, 9, 'Várzea Nova', false, -11.2549185, -40.944670000000002);
INSERT INTO cities VALUES (1041, 9, 'Varzedo', false, -12.9706165, -39.393698800000003);
INSERT INTO cities VALUES (1042, 9, 'Vera Cruz', false, -12.633333, -41.033332999999999);
INSERT INTO cities VALUES (1043, 9, 'Vereda', false, -12.949999999999999, -41.783332999999999);
INSERT INTO cities VALUES (1044, 9, 'Vitória da Conquista', false, -14.8642428, -40.837073799999999);
INSERT INTO cities VALUES (1045, 9, 'Wagner', false, -12.291969099999999, -41.175200099999998);
INSERT INTO cities VALUES (1046, 9, 'Wanderley', false, -12.1128882, -43.900801600000001);
INSERT INTO cities VALUES (1047, 9, 'Wenceslau Guimarães', false, -13.6891795, -39.4811725);
INSERT INTO cities VALUES (1048, 9, 'Xique-Xique', false, -9.5260829999999999, -43.604111000000003);
INSERT INTO cities VALUES (1049, 9, 'Salvador', true, 19.527228399999998, -99.099278200000001);
INSERT INTO cities VALUES (1050, 10, 'Abaiara', false, -7.3419854000000004, -39.043860700000003);
INSERT INTO cities VALUES (1051, 10, 'Acarape', false, -4.2265397, -38.707679300000002);
INSERT INTO cities VALUES (1052, 10, 'Acaraú', false, -2.8896799999999998, -40.108502100000003);
INSERT INTO cities VALUES (1053, 10, 'Acopiara', false, -6.0944789000000004, -39.454526899999998);
INSERT INTO cities VALUES (1054, 10, 'Aiuaba', false, -6.5697755000000004, -40.124546199999997);
INSERT INTO cities VALUES (1055, 10, 'Alcântaras', false, -3.5875355999999998, -40.544519600000001);
INSERT INTO cities VALUES (1056, 10, 'Altaneira', false, -6.9985695999999997, -39.743988700000003);
INSERT INTO cities VALUES (1057, 10, 'Alto Santo', false, -5.5213738000000001, -38.271753699999998);
INSERT INTO cities VALUES (1058, 10, 'Amontada', false, -3.4913889999999999, -39.576110999999997);
INSERT INTO cities VALUES (1059, 10, 'Antonina do Norte', false, -6.7715179000000001, -39.986233300000002);
INSERT INTO cities VALUES (1060, 10, 'Apuiarés', false, -3.9513145000000001, -39.4329696);
INSERT INTO cities VALUES (1061, 10, 'Aquiraz', false, -3.9025356000000002, -38.388531700000001);
INSERT INTO cities VALUES (1062, 10, 'Aracati', false, -4.5627335000000002, -37.769090300000002);
INSERT INTO cities VALUES (1063, 10, 'Aracoiaba', false, -4.3731366999999999, -38.811157100000003);
INSERT INTO cities VALUES (1064, 10, 'Ararendá', false, -4.7521741999999998, -40.827257199999998);
INSERT INTO cities VALUES (1065, 10, 'Araripe', false, -7.2015836999999996, -40.031868000000003);
INSERT INTO cities VALUES (1066, 10, 'Aratuba', false, -4.4181378999999996, -39.043016899999998);
INSERT INTO cities VALUES (1067, 10, 'Arneiroz', false, -6.3185779000000002, -40.162168299999998);
INSERT INTO cities VALUES (1068, 10, 'Assaré', false, -6.8753697000000003, -39.874749600000001);
INSERT INTO cities VALUES (1069, 10, 'Aurora', false, -6.9343348000000002, -38.964295800000002);
INSERT INTO cities VALUES (1070, 10, 'Baixio', false, -5.9166670000000003, -39.200000000000003);
INSERT INTO cities VALUES (1071, 10, 'Banabuiú', false, -5.3140179999999999, -38.923369399999999);
INSERT INTO cities VALUES (1072, 10, 'Barbalha', false, -7.3055149000000004, -39.302452700000003);
INSERT INTO cities VALUES (1073, 10, 'Barreira', false, -4.2883582000000002, -38.641334800000003);
INSERT INTO cities VALUES (1074, 10, 'Barro', false, -7.1829264999999998, -38.784852700000002);
INSERT INTO cities VALUES (1075, 10, 'Barroquinha', false, -3.0194554999999998, -41.131493599999999);
INSERT INTO cities VALUES (1076, 10, 'Baturité', false, -4.3279342999999999, -38.884595599999997);
INSERT INTO cities VALUES (1077, 10, 'Beberibe', false, -4.1788957, -38.133457900000003);
INSERT INTO cities VALUES (1078, 10, 'Bela Cruz', false, -3.0539961, -40.174089700000003);
INSERT INTO cities VALUES (1079, 10, 'Boa Viagem', false, -5.1279792999999998, -39.733014400000002);
INSERT INTO cities VALUES (1080, 10, 'Brejo Santo', false, -7.4868864000000004, -38.979760400000004);
INSERT INTO cities VALUES (1081, 10, 'Camocim', false, -2.9131448999999998, -40.846331499999998);
INSERT INTO cities VALUES (1082, 10, 'Campos Sales', false, -7.0760806000000001, -40.375952400000003);
INSERT INTO cities VALUES (1083, 10, 'Canindé', false, -4.3579492999999996, -39.301960800000003);
INSERT INTO cities VALUES (1084, 10, 'Capistrano', false, -4.4720933, -38.904018800000003);
INSERT INTO cities VALUES (1085, 10, 'Caridade', false, -4.2262694999999999, -39.200293899999998);
INSERT INTO cities VALUES (1086, 10, 'Cariré', false, -3.9506480000000002, -40.472611200000003);
INSERT INTO cities VALUES (1087, 10, 'Caririaçu', false, -7.0458493000000004, -39.281039300000003);
INSERT INTO cities VALUES (1088, 10, 'Cariús', false, -6.5423798, -39.489712500000003);
INSERT INTO cities VALUES (1089, 10, 'Carnaubal', false, -4.1595082000000003, -40.945183800000002);
INSERT INTO cities VALUES (1090, 10, 'Cascavel', false, -4.1308663000000001, -38.235645699999999);
INSERT INTO cities VALUES (1091, 10, 'Catarina', false, -6.1279627999999997, -39.878012099999999);
INSERT INTO cities VALUES (1092, 10, 'Catunda', false, -4.6479739000000002, -40.202572600000003);
INSERT INTO cities VALUES (1093, 10, 'Caucaia', false, -3.7345362999999998, -38.656324699999999);
INSERT INTO cities VALUES (1094, 10, 'Cedro', false, -6.6075195999999998, -39.060607300000001);
INSERT INTO cities VALUES (1095, 10, 'Chaval', false, -3.0521957, -41.240444400000001);
INSERT INTO cities VALUES (1096, 10, 'Choró', false, -4.8305975999999999, -39.135813800000001);
INSERT INTO cities VALUES (1097, 10, 'Chorozinho', false, -4.2997353, -38.497688699999998);
INSERT INTO cities VALUES (1098, 10, 'Coreaú', false, -3.5404452000000002, -40.6646304);
INSERT INTO cities VALUES (1099, 10, 'Crateús', false, -5.1985302000000004, -40.668954300000003);
INSERT INTO cities VALUES (1100, 10, 'Crato', false, -7.2298543999999998, -39.4090834);
INSERT INTO cities VALUES (1101, 10, 'Croatá', false, -4.4046649000000002, -40.912372599999998);
INSERT INTO cities VALUES (1102, 10, 'Cruz', false, -2.9194051999999999, -40.170266599999998);
INSERT INTO cities VALUES (1103, 10, 'Deputado Irapuan Pinheiro', false, -5.9217358999999998, -39.2643974);
INSERT INTO cities VALUES (1104, 10, 'Ererê', false, -6.0324792, -38.349113600000003);
INSERT INTO cities VALUES (1105, 10, 'Eusébio', false, -3.8902855000000001, -38.451257200000001);
INSERT INTO cities VALUES (1106, 10, 'Farias Brito', false, -6.9219822000000004, -39.566164299999997);
INSERT INTO cities VALUES (1107, 10, 'Forquilha', false, -3.8024060999999998, -40.268685699999999);
INSERT INTO cities VALUES (1108, 10, 'Fortim', false, -4.4525956999999998, -37.8003225);
INSERT INTO cities VALUES (1109, 10, 'Frecheirinha', false, -3.7604525999999998, -40.816039600000003);
INSERT INTO cities VALUES (1110, 10, 'General Sampaio', false, -4.0519581999999996, -39.437161600000003);
INSERT INTO cities VALUES (1111, 10, 'Graça', false, -4.0466816000000003, -40.749657300000003);
INSERT INTO cities VALUES (1112, 10, 'Granja', false, -3.1229003, -40.834179499999998);
INSERT INTO cities VALUES (1113, 10, 'Granjeiro', false, -6.8861622999999996, -39.219883699999997);
INSERT INTO cities VALUES (1114, 10, 'Groaíras', false, -3.9172018999999998, -40.376785499999997);
INSERT INTO cities VALUES (1115, 10, 'Guaiúba', false, -4.0418465000000001, -38.637781699999998);
INSERT INTO cities VALUES (1116, 10, 'Guaraciaba do Norte', false, -4.1669733999999998, -40.749894300000001);
INSERT INTO cities VALUES (1117, 10, 'Guaramiranga', false, -4.2713869000000004, -38.946244100000001);
INSERT INTO cities VALUES (1118, 10, 'Hidrolândia', false, -4.3968151000000004, -40.4348691);
INSERT INTO cities VALUES (1119, 10, 'Horizonte', false, -4.0975159000000003, -38.490932600000001);
INSERT INTO cities VALUES (1120, 10, 'Ibaretama', false, -4.7972305999999998, -38.752867899999998);
INSERT INTO cities VALUES (1121, 10, 'Ibiapina', false, -3.9251526999999999, -40.895338299999999);
INSERT INTO cities VALUES (1122, 10, 'Ibicuitinga', false, -4.9596217999999999, -38.628407000000003);
INSERT INTO cities VALUES (1123, 10, 'Icapuí', false, -4.7023807, -37.347983200000002);
INSERT INTO cities VALUES (1124, 10, 'Icó', false, -6.4020682999999998, -38.855200600000003);
INSERT INTO cities VALUES (1125, 10, 'Iguatu', false, -6.3480707000000001, -39.306562999999997);
INSERT INTO cities VALUES (1126, 10, 'Independência', false, -5.3926227000000004, -40.299568700000002);
INSERT INTO cities VALUES (1127, 10, 'Ipaporanga', false, -4.8980172, -40.755797800000003);
INSERT INTO cities VALUES (1128, 10, 'Ipaumirim', false, -6.7803459000000004, -38.714949799999999);
INSERT INTO cities VALUES (1129, 10, 'Ipu', false, -4.3229794000000004, -40.710641099999997);
INSERT INTO cities VALUES (1130, 10, 'Ipueiras', false, -4.5409319000000004, -40.720125299999999);
INSERT INTO cities VALUES (1131, 10, 'Iracema', false, -5.8116497999999996, -38.297217000000003);
INSERT INTO cities VALUES (1132, 10, 'Irauçuba', false, -3.7557909999999999, -39.788920099999999);
INSERT INTO cities VALUES (1133, 10, 'Itaiçaba', false, -4.6742612000000001, -37.8222758);
INSERT INTO cities VALUES (1134, 10, 'Itaitinga', false, -3.9720970000000002, -38.528978799999997);
INSERT INTO cities VALUES (1135, 10, 'Itapagé', false, -3.6910047000000001, -39.580155499999996);
INSERT INTO cities VALUES (1136, 10, 'Itapipoca', false, -3.4938682999999999, -39.5768494);
INSERT INTO cities VALUES (1137, 10, 'Itapiúna', false, -4.5645398999999998, -38.917155000000001);
INSERT INTO cities VALUES (1138, 10, 'Itarema', false, -2.9279663, -39.917459800000003);
INSERT INTO cities VALUES (1139, 10, 'Itatira', false, -4.5274872999999998, -39.624623200000002);
INSERT INTO cities VALUES (1140, 10, 'Jaguaretama', false, -5.6140730999999997, -38.7668514);
INSERT INTO cities VALUES (1141, 10, 'Jaguaribara', false, -5.6621226, -38.618828399999998);
INSERT INTO cities VALUES (1142, 10, 'Jaguaribe', false, -5.8866750999999997, -38.620274500000001);
INSERT INTO cities VALUES (1143, 10, 'Jaguaruana', false, -4.8309253999999999, -37.781608599999998);
INSERT INTO cities VALUES (1144, 10, 'Jardim', false, -3.4575, -39.050832999999997);
INSERT INTO cities VALUES (1145, 10, 'Jati', false, -7.6925556999999998, -39.008380799999998);
INSERT INTO cities VALUES (1146, 10, 'Jijoca de Jericoacoara', false, -2.8004541999999999, -40.510095100000001);
INSERT INTO cities VALUES (1147, 10, 'Juazeiro do Norte', false, -7.2213564000000003, -39.313818699999999);
INSERT INTO cities VALUES (1148, 10, 'Jucás', false, -6.5185915999999997, -39.528876699999998);
INSERT INTO cities VALUES (1149, 10, 'Lavras da Mangabeira', false, -6.7521386000000003, -38.973201799999998);
INSERT INTO cities VALUES (1150, 10, 'Limoeiro do Norte', false, -5.1488883999999997, -38.097659100000001);
INSERT INTO cities VALUES (1151, 10, 'Madalena', false, -4.8583075999999998, -39.576262100000001);
INSERT INTO cities VALUES (1152, 10, 'Maracanaú', false, -3.8782063999999998, -38.626050499999998);
INSERT INTO cities VALUES (1153, 10, 'Maranguape', false, -3.8906504000000002, -38.681869900000002);
INSERT INTO cities VALUES (1154, 10, 'Marco', false, -3.1245256000000001, -40.148949500000001);
INSERT INTO cities VALUES (1155, 10, 'Martinópole', false, -3.2219350000000002, -40.6913895);
INSERT INTO cities VALUES (1156, 10, 'Massapê', false, -3.5212561999999998, -40.341025100000003);
INSERT INTO cities VALUES (1157, 10, 'Mauriti', false, -7.3952859000000002, -38.7698587);
INSERT INTO cities VALUES (1158, 10, 'Meruoca', false, -3.5463393000000001, -40.445278799999997);
INSERT INTO cities VALUES (1159, 10, 'Milagres', false, -7.3028192000000001, -38.945729);
INSERT INTO cities VALUES (1160, 10, 'Milhã', false, -5.6718042999999998, -39.194025699999997);
INSERT INTO cities VALUES (1161, 10, 'Miraíma', false, -3.5663076999999999, -39.965583299999999);
INSERT INTO cities VALUES (1162, 10, 'Missão Velha', false, -7.2502597, -39.144763400000002);
INSERT INTO cities VALUES (1163, 10, 'Mombaça', false, -5.7431204999999999, -39.628501);
INSERT INTO cities VALUES (1164, 10, 'Monsenhor Tabosa', false, -4.7895308999999999, -40.060649599999998);
INSERT INTO cities VALUES (1165, 10, 'Morada Nova', false, -5.1056248999999996, -38.367114100000002);
INSERT INTO cities VALUES (1166, 10, 'Moraújo', false, -3.4740688, -40.673381499999998);
INSERT INTO cities VALUES (1167, 10, 'Morrinhos', false, -3.2389274000000001, -40.116717299999998);
INSERT INTO cities VALUES (1168, 10, 'Mucambo', false, -4.2711110000000003, -40.830278);
INSERT INTO cities VALUES (1169, 10, 'Mulungu', false, -5.9319439999999997, -39.372777999999997);
INSERT INTO cities VALUES (1170, 10, 'Nova Olinda', false, -7.0928693000000003, -39.678301300000001);
INSERT INTO cities VALUES (1171, 10, 'Nova Russas', false, -4.7058580000000001, -40.565318300000001);
INSERT INTO cities VALUES (1172, 10, 'Novo Oriente', false, -5.5339413999999998, -40.775144300000001);
INSERT INTO cities VALUES (1173, 10, 'Ocara', false, -4.4860785999999999, -38.594281500000001);
INSERT INTO cities VALUES (1174, 10, 'Orós', false, -6.2426053000000001, -38.902968899999998);
INSERT INTO cities VALUES (1175, 10, 'Pacajus', false, -4.1739845000000004, -38.463795400000002);
INSERT INTO cities VALUES (1176, 10, 'Pacatuba', false, -3.9843611000000001, -38.616142500000002);
INSERT INTO cities VALUES (1177, 10, 'Pacoti', false, -4.2246015999999997, -38.925427900000003);
INSERT INTO cities VALUES (1178, 10, 'Pacujá', false, -3.9895111999999999, -40.698263900000001);
INSERT INTO cities VALUES (1179, 10, 'Palhano', false, -4.7457187000000003, -37.961325899999999);
INSERT INTO cities VALUES (1180, 10, 'Palmácia', false, -4.1513641000000003, -38.847388299999999);
INSERT INTO cities VALUES (1181, 10, 'Paracuru', false, -3.4252490999999998, -39.024568299999999);
INSERT INTO cities VALUES (1182, 10, 'Paraipaba', false, -3.4416110999999998, -39.1491452);
INSERT INTO cities VALUES (1183, 10, 'Parambu', false, -6.2094348000000004, -40.6947641);
INSERT INTO cities VALUES (1184, 10, 'Paramoti', false, -4.1009596000000004, -39.234356099999999);
INSERT INTO cities VALUES (1185, 10, 'Pedra Branca', false, -4.5083330000000004, -38.796388999999998);
INSERT INTO cities VALUES (1186, 10, 'Penaforte', false, -7.8292004999999998, -39.079406400000003);
INSERT INTO cities VALUES (1187, 10, 'Pentecoste', false, -3.7914875000000001, -39.266116199999999);
INSERT INTO cities VALUES (1188, 10, 'Pereiro', false, -6.0455322000000002, -38.459962400000002);
INSERT INTO cities VALUES (1189, 10, 'Pindoretama', false, -4.0259815000000003, -38.306696199999998);
INSERT INTO cities VALUES (1190, 10, 'Piquet Carneiro', false, -5.7976609999999997, -39.408755399999997);
INSERT INTO cities VALUES (1191, 10, 'Pires Ferreira', false, -4.2370279000000002, -40.636618499999997);
INSERT INTO cities VALUES (1192, 10, 'Poranga', false, -4.7476780999999999, -40.922551900000002);
INSERT INTO cities VALUES (1193, 10, 'Porteiras', false, -7.5304525, -39.122589499999997);
INSERT INTO cities VALUES (1194, 10, 'Potengi', false, -7.0927340000000001, -40.030257900000002);
INSERT INTO cities VALUES (1195, 10, 'Potiretama', false, -5.6443687000000002, -38.2396745);
INSERT INTO cities VALUES (1196, 10, 'Quiterianópolis', false, -5.8449704000000002, -40.696263899999998);
INSERT INTO cities VALUES (1197, 10, 'Quixadá', false, -4.9781326999999997, -39.018799000000001);
INSERT INTO cities VALUES (1198, 10, 'Quixelô', false, -6.2553761000000003, -39.197161100000002);
INSERT INTO cities VALUES (1199, 10, 'Quixeramobim', false, -5.1981159999999997, -39.296201199999999);
INSERT INTO cities VALUES (1200, 10, 'Quixeré', false, -5.0777948999999998, -37.985396199999997);
INSERT INTO cities VALUES (1201, 10, 'Redenção', false, -4.2263676999999999, -38.731359400000002);
INSERT INTO cities VALUES (1202, 10, 'Reriutaba', false, -4.1344132, -40.568629000000001);
INSERT INTO cities VALUES (1203, 10, 'Russas', false, -4.9393050000000001, -37.978620100000001);
INSERT INTO cities VALUES (1204, 10, 'Saboeiro', false, -6.5413224999999997, -39.907740599999997);
INSERT INTO cities VALUES (1205, 10, 'Salitre', false, -7.2823017999999999, -40.455903200000002);
INSERT INTO cities VALUES (1206, 10, 'Santa Quitéria', false, -4.3323798, -40.157336100000002);
INSERT INTO cities VALUES (1207, 10, 'Santana do Acaraú', false, -3.4608538000000002, -40.217732099999999);
INSERT INTO cities VALUES (1208, 10, 'Santana do Cariri', false, -7.1882637999999996, -39.737674800000001);
INSERT INTO cities VALUES (1209, 10, 'São Benedito', false, -4.0442755000000004, -40.867891100000001);
INSERT INTO cities VALUES (1210, 10, 'São Gonçalo do Amarante', false, -3.6073252999999998, -38.970489000000001);
INSERT INTO cities VALUES (1211, 10, 'São João do Jaguaribe', false, -5.2771261999999997, -38.267839500000001);
INSERT INTO cities VALUES (1212, 10, 'São Luís do Curu', false, -3.6701967, -39.244928999999999);
INSERT INTO cities VALUES (1213, 10, 'Senador Pompeu', false, -5.5887346000000004, -39.371307000000002);
INSERT INTO cities VALUES (1214, 10, 'Senador Sá', false, -3.348255, -40.4608919);
INSERT INTO cities VALUES (1215, 10, 'Sobral', false, -3.6597651999999998, -40.248377400000003);
INSERT INTO cities VALUES (1216, 10, 'Solonópole', false, -5.7263206999999996, -39.008988299999999);
INSERT INTO cities VALUES (1217, 10, 'Tabuleiro do Norte', false, -5.2542941000000001, -38.124706400000001);
INSERT INTO cities VALUES (1218, 10, 'Tamboril', false, -4.8322190000000003, -40.321492499999998);
INSERT INTO cities VALUES (1219, 10, 'Tarrafas', false, -6.6852456, -39.760315599999998);
INSERT INTO cities VALUES (1220, 10, 'Tauá', false, -6.0002757000000004, -40.296769099999999);
INSERT INTO cities VALUES (1221, 10, 'Tejuçuoca', false, -3.9864377000000002, -39.571754599999998);
INSERT INTO cities VALUES (1222, 10, 'Tianguá', false, -3.7377403999999999, -40.991757900000003);
INSERT INTO cities VALUES (1223, 10, 'Trairi', false, -3.2775609000000001, -39.269732099999999);
INSERT INTO cities VALUES (1224, 10, 'Tururu', false, -3.5848960000000001, -39.440980500000002);
INSERT INTO cities VALUES (1225, 10, 'Ubajara', false, -3.8581642, -40.927566499999998);
INSERT INTO cities VALUES (1226, 10, 'Umari', false, -6.6477260999999999, -38.698006599999999);
INSERT INTO cities VALUES (1227, 10, 'Umirim', false, -3.6853037, -39.343985799999999);
INSERT INTO cities VALUES (1228, 10, 'Uruburetama', false, -3.6302503000000002, -39.505431999999999);
INSERT INTO cities VALUES (1229, 10, 'Uruoca', false, -3.3167727, -40.556209600000003);
INSERT INTO cities VALUES (1230, 10, 'Varjota', false, -4.1828566, -40.474989299999997);
INSERT INTO cities VALUES (1231, 10, 'Várzea Alegre', false, -6.7819455, -39.296543200000002);
INSERT INTO cities VALUES (1232, 10, 'Viçosa do Ceará', false, -3.5632402000000001, -41.0947836);
INSERT INTO cities VALUES (1233, 10, 'Fortaleza', true, -3.7183942999999999, -38.543394800000002);
INSERT INTO cities VALUES (1234, 11, 'Açailândia', false, -4.9539375999999997, -47.501892300000002);
INSERT INTO cities VALUES (1235, 11, 'Afonso Cunha', false, -4.1331068999999996, -43.323650700000002);
INSERT INTO cities VALUES (1236, 11, 'Água Doce do Maranhão', false, -2.845974, -42.116263600000003);
INSERT INTO cities VALUES (1237, 11, 'Alcântara', false, -2.3976253999999999, -44.404456500000002);
INSERT INTO cities VALUES (1238, 11, 'Aldeias Altas', false, -4.6206148999999996, -43.463470899999997);
INSERT INTO cities VALUES (1239, 11, 'Altamira do Maranhão', false, -4.162541, -45.473548399999999);
INSERT INTO cities VALUES (1240, 11, 'Alto Alegre do Maranhão', false, -4.2147929, -44.449862500000002);
INSERT INTO cities VALUES (1241, 11, 'Alto Alegre do Pindaré', false, -3.6878758999999999, -45.841213699999997);
INSERT INTO cities VALUES (1242, 11, 'Alto Parnaíba', false, -9.1114032999999992, -45.930499599999997);
INSERT INTO cities VALUES (1243, 11, 'Amapá do Maranhão', false, -1.6747183000000001, -46.003997099999999);
INSERT INTO cities VALUES (1244, 11, 'Amarante do Maranhão', false, -5.5689716000000002, -46.737753699999999);
INSERT INTO cities VALUES (1245, 11, 'Anajatuba', false, -3.2661158000000001, -44.614538199999998);
INSERT INTO cities VALUES (1246, 11, 'Anapurus', false, -3.6715979999999999, -43.115878000000002);
INSERT INTO cities VALUES (1247, 11, 'Apicum-Açu', false, -1.5768869000000001, -45.0794329);
INSERT INTO cities VALUES (1248, 11, 'Araguanã', false, -2.9522775000000001, -45.660608199999999);
INSERT INTO cities VALUES (1249, 11, 'Araioses', false, -2.8840542999999998, -41.916679199999997);
INSERT INTO cities VALUES (1250, 11, 'Arame', false, -4.7463043000000003, -45.898587599999999);
INSERT INTO cities VALUES (1251, 11, 'Arari', false, -3.4606849999999998, -44.782242400000001);
INSERT INTO cities VALUES (1252, 11, 'Axixá', false, -2.8449532999999998, -44.060894300000001);
INSERT INTO cities VALUES (1253, 11, 'Bacabal', false, -3.6260759999999999, -47.028869999999998);
INSERT INTO cities VALUES (1254, 11, 'Bacabeira', false, -2.9705550999999999, -44.308760999999997);
INSERT INTO cities VALUES (1255, 11, 'Bacuri', false, -4.4927590000000004, -44.348121999999996);
INSERT INTO cities VALUES (1256, 11, 'Bacurituba', false, -2.7061601999999998, -44.738222800000003);
INSERT INTO cities VALUES (1257, 11, 'Balsas', false, -7.5329164000000004, -46.035026600000002);
INSERT INTO cities VALUES (1258, 11, 'Barão de Grajaú', false, -6.7569185000000003, -43.024569300000003);
INSERT INTO cities VALUES (1259, 11, 'Barra do Corda', false, -5.5058132999999998, -45.235083600000003);
INSERT INTO cities VALUES (1260, 11, 'Barreirinhas', false, -2.7493801000000002, -42.832832699999997);
INSERT INTO cities VALUES (1261, 11, 'Bela Vista do Maranhão', false, -3.7299364000000002, -45.306874100000002);
INSERT INTO cities VALUES (1262, 11, 'Belágua', false, -3.1625106000000001, -43.510260600000002);
INSERT INTO cities VALUES (1263, 11, 'Benedito Leite', false, -7.2435891000000003, -44.571752400000001);
INSERT INTO cities VALUES (1264, 11, 'Bequimão', false, -2.4494796000000001, -44.782563099999997);
INSERT INTO cities VALUES (1265, 11, 'Bernardo do Mearim', false, -4.6060761000000001, -44.774729899999997);
INSERT INTO cities VALUES (1266, 11, 'Boa Vista do Gurupi', false, -1.791266, -46.300479099999997);
INSERT INTO cities VALUES (1267, 11, 'Bom Jardim', false, -7.0203800000000003, -46.490791000000002);
INSERT INTO cities VALUES (1268, 11, 'Bom Jesus das Selvas', false, -4.4217848999999996, -46.764468100000002);
INSERT INTO cities VALUES (1269, 11, 'Bom Lugar', false, -6.2999999999999998, -44.350000000000001);
INSERT INTO cities VALUES (1270, 11, 'Brejo', false, -2.1499999999999999, -44.683332999999998);
INSERT INTO cities VALUES (1271, 11, 'Brejo de Areia', false, -4.101667, -45.491388999999998);
INSERT INTO cities VALUES (1272, 11, 'Buriti', false, -3.9428339000000001, -42.9267368);
INSERT INTO cities VALUES (1273, 11, 'Buriti Bravo', false, -5.8356452000000001, -43.827295200000002);
INSERT INTO cities VALUES (1274, 11, 'Buriticupu', false, -4.3426935999999996, -46.4016047);
INSERT INTO cities VALUES (1275, 11, 'Buritirana', false, -5.5987245999999997, -47.016475499999999);
INSERT INTO cities VALUES (1276, 11, 'Cachoeira Grande', false, -2.9261039000000002, -44.057294300000002);
INSERT INTO cities VALUES (1277, 11, 'Cajapió', false, -2.8757853, -44.6718975);
INSERT INTO cities VALUES (1278, 11, 'Cajari', false, -3.3031359999999999, -44.884635099999997);
INSERT INTO cities VALUES (1279, 11, 'Campestre do Maranhão', false, -6.1717405999999997, -47.363177200000003);
INSERT INTO cities VALUES (1280, 11, 'Cândido Mendes', false, -1.4427289000000001, -45.722002199999999);
INSERT INTO cities VALUES (1281, 11, 'Cantanhede', false, -3.6472983000000001, -44.378396700000003);
INSERT INTO cities VALUES (1282, 11, 'Capinzal do Norte', false, -4.7283491, -44.326977900000003);
INSERT INTO cities VALUES (1283, 11, 'Carolina', false, -7.3377920000000003, -47.467914899999997);
INSERT INTO cities VALUES (1284, 11, 'Carutapera', false, -1.2029403999999999, -46.016648099999998);
INSERT INTO cities VALUES (1285, 11, 'Caxias', false, -3.2000000000000002, -45.450000000000003);
INSERT INTO cities VALUES (1286, 11, 'Cedral', false, -1.9983287000000001, -44.5352453);
INSERT INTO cities VALUES (1287, 11, 'Central do Maranhão', false, -2.1999789999999999, -44.823904300000002);
INSERT INTO cities VALUES (1288, 11, 'Centro do Guilherme', false, -2.3215644000000002, -46.097220900000003);
INSERT INTO cities VALUES (1289, 11, 'Centro Novo do Maranhão', false, -2.1059589999999999, -46.173676299999997);
INSERT INTO cities VALUES (1290, 11, 'Chapadinha', false, -2.1166670000000001, -45.133333);
INSERT INTO cities VALUES (1291, 11, 'Cidelândia', false, -5.1520855000000001, -47.734899900000002);
INSERT INTO cities VALUES (1292, 11, 'Codó', false, -4.4549427000000001, -43.878860699999997);
INSERT INTO cities VALUES (1293, 11, 'Coelho Neto', false, -4.2556947999999997, -43.014743600000003);
INSERT INTO cities VALUES (1294, 11, 'Colinas', false, -6.0270191000000004, -44.2460922);
INSERT INTO cities VALUES (1295, 11, 'Conceição do Lago-Açu', false, -3.8555193999999999, -44.883106300000001);
INSERT INTO cities VALUES (1296, 11, 'Coroatá', false, -4.1251695000000002, -44.130413300000001);
INSERT INTO cities VALUES (1297, 11, 'Cururupu', false, -1.8289176, -44.863409500000003);
INSERT INTO cities VALUES (1298, 11, 'Davinópolis', false, -5.5542881, -47.405577999999998);
INSERT INTO cities VALUES (1299, 11, 'Dom Pedro', false, -4.483333, -44.450000000000003);
INSERT INTO cities VALUES (1300, 11, 'Duque Bacelar', false, -4.1489732000000004, -42.9492361);
INSERT INTO cities VALUES (1301, 11, 'Esperantinópolis', false, -4.8682657999999996, -44.671999399999997);
INSERT INTO cities VALUES (1302, 11, 'Estreito', false, -5.7833329999999998, -43.25);
INSERT INTO cities VALUES (1303, 11, 'Feira Nova do Maranhão', false, -6.9543375999999997, -46.678898400000001);
INSERT INTO cities VALUES (1304, 11, 'Fernando Falcão', false, -6.1570454000000003, -44.893562799999998);
INSERT INTO cities VALUES (1305, 11, 'Formosa da Serra Negra', false, -6.4298640000000002, -46.175200599999997);
INSERT INTO cities VALUES (1306, 11, 'Fortaleza dos Nogueiras', false, -6.9601990999999996, -46.178806100000003);
INSERT INTO cities VALUES (1307, 11, 'Fortuna', false, -5.7227303000000003, -44.158320400000001);
INSERT INTO cities VALUES (1308, 11, 'Godofredo Viana', false, -1.4053087, -45.780413500000002);
INSERT INTO cities VALUES (1309, 11, 'Gonçalves Dias', false, -5.1452746999999999, -44.295271);
INSERT INTO cities VALUES (1310, 11, 'Governador Archer', false, -5.0212770000000004, -44.2695267);
INSERT INTO cities VALUES (1311, 11, 'Governador Edison Lobão', false, -5.7493692000000003, -47.359197899999998);
INSERT INTO cities VALUES (1312, 11, 'Governador Eugênio Barros', false, -5.3107677999999998, -44.247396700000003);
INSERT INTO cities VALUES (1313, 11, 'Governador Luiz Rocha', false, -5.5014130000000003, -44.068505600000002);
INSERT INTO cities VALUES (1314, 11, 'Governador Newton Bello', false, -3.4270063999999998, -45.662392400000002);
INSERT INTO cities VALUES (1315, 11, 'Governador Nunes Freire', false, -2.1231732000000001, -45.8823474);
INSERT INTO cities VALUES (1316, 11, 'Graça Aranha', false, -5.3764661, -44.3424184);
INSERT INTO cities VALUES (1317, 11, 'Grajaú', false, -3.5833330000000001, -45.266666999999998);
INSERT INTO cities VALUES (1318, 11, 'Guimarães', false, -2.1321726000000001, -44.600458699999997);
INSERT INTO cities VALUES (1319, 11, 'Humberto de Campos', false, -2.5995520000000001, -43.464390999999999);
INSERT INTO cities VALUES (1320, 11, 'Icatu', false, -2.7666767999999999, -44.059383199999999);
INSERT INTO cities VALUES (1321, 11, 'Igarapé do Meio', false, -3.6680461000000002, -45.223516500000002);
INSERT INTO cities VALUES (1322, 11, 'Igarapé Grande', false, -4.5553137000000001, -44.854039399999998);
INSERT INTO cities VALUES (1323, 11, 'Imperatriz', false, -5.5255017999999998, -47.477048500000002);
INSERT INTO cities VALUES (1324, 11, 'Itaipava do Grajaú', false, -5.1068689999999997, -45.815449000000001);
INSERT INTO cities VALUES (1325, 11, 'Itapecuru Mirim', false, -3.3950106999999998, -44.360071499999997);
INSERT INTO cities VALUES (1326, 11, 'Itinga do Maranhão', false, -4.4521486000000001, -47.530014100000002);
INSERT INTO cities VALUES (1327, 11, 'Jatobá', false, -6.4664910000000004, -43.284610999999998);
INSERT INTO cities VALUES (1328, 11, 'Jenipapo dos Vieiras', false, -5.3268680000000002, -45.560306699999998);
INSERT INTO cities VALUES (1329, 11, 'João Lisboa', false, -5.4463254000000001, -47.403115900000003);
INSERT INTO cities VALUES (1330, 11, 'Joselândia', false, -4.9064860000000001, -44.716439700000002);
INSERT INTO cities VALUES (1331, 11, 'Junco do Maranhão', false, -1.8408504000000001, -46.087972700000002);
INSERT INTO cities VALUES (1332, 11, 'Lago da Pedra', false, -4.3339699999999999, -45.168491000000003);
INSERT INTO cities VALUES (1333, 11, 'Lago do Junco', false, -4.4066669999999997, -44.931944000000001);
INSERT INTO cities VALUES (1334, 11, 'Lago dos Rodrigues', false, -4.6023740000000002, -44.983992399999998);
INSERT INTO cities VALUES (1335, 11, 'Lago Verde', false, -3.9290039000000001, -44.858457199999997);
INSERT INTO cities VALUES (1336, 11, 'Lagoa do Mato', false, -2.4666670000000002, -44.700000000000003);
INSERT INTO cities VALUES (1337, 11, 'Lagoa Grande do Maranhão', false, -4.9254607000000004, -45.411213400000001);
INSERT INTO cities VALUES (1338, 11, 'Lajeado Novo', false, -6.1935209999999996, -47.030020100000002);
INSERT INTO cities VALUES (1339, 11, 'Lima Campos', false, -4.5205677, -44.467101800000002);
INSERT INTO cities VALUES (1340, 11, 'Loreto', false, -7.0784086000000004, -45.138934200000001);
INSERT INTO cities VALUES (1341, 11, 'Luís Domingues', false, -1.3222130999999999, -45.893261299999999);
INSERT INTO cities VALUES (1342, 11, 'Magalhães de Almeida', false, -3.3933076, -42.207431499999998);
INSERT INTO cities VALUES (1343, 11, 'Maracaçumé', false, -2.0414086999999999, -45.955144799999999);
INSERT INTO cities VALUES (1344, 11, 'Marajá do Sena', false, -4.6301068000000001, -45.596864500000002);
INSERT INTO cities VALUES (1345, 11, 'Maranhãozinho', false, -2.2411639999999999, -45.850761200000001);
INSERT INTO cities VALUES (1346, 11, 'Mata Roma', false, -3.6209087000000002, -43.109077900000003);
INSERT INTO cities VALUES (1347, 11, 'Matinha', false, -4.1763769999999996, -45.344971000000001);
INSERT INTO cities VALUES (1348, 11, 'Matões', false, -4.7166670000000002, -44.383333);
INSERT INTO cities VALUES (1349, 11, 'Matões do Norte', false, -3.6307562, -44.552990899999998);
INSERT INTO cities VALUES (1350, 11, 'Milagres do Maranhão', false, -3.5368704000000002, -42.653252700000003);
INSERT INTO cities VALUES (1351, 11, 'Mirador', false, -6.3619531, -44.348974200000001);
INSERT INTO cities VALUES (1352, 11, 'Miranda do Norte', false, -3.5691657999999999, -44.579261099999997);
INSERT INTO cities VALUES (1353, 11, 'Mirinzal', false, -2.0641900999999998, -44.777744900000002);
INSERT INTO cities VALUES (1354, 11, 'Monção', false, -3.4927549999999998, -45.2501046);
INSERT INTO cities VALUES (1355, 11, 'Montes Altos', false, -5.8319709, -47.067754000000001);
INSERT INTO cities VALUES (1356, 11, 'Morros', false, -9.4502039999999994, -46.298031000000002);
INSERT INTO cities VALUES (1357, 11, 'Nina Rodrigues', false, -3.4648184, -43.9052194);
INSERT INTO cities VALUES (1358, 11, 'Nova Colinas', false, -7.1164098999999998, -46.257140700000001);
INSERT INTO cities VALUES (1359, 11, 'Nova Iorque', false, -2.9288690000000002, -44.935710999999998);
INSERT INTO cities VALUES (1360, 11, 'Nova Olinda do Maranhão', false, -2.8457447999999999, -45.690111299999998);
INSERT INTO cities VALUES (1361, 11, 'Olho d`Água das Cunhãs', false, -4.1381119999999996, -45.121361999999998);
INSERT INTO cities VALUES (1362, 11, 'Olinda Nova do Maranhão', false, -2.9162233999999998, -45.087181299999997);
INSERT INTO cities VALUES (1363, 11, 'Paço do Lumiar', false, -2.5305412999999999, -44.105219499999997);
INSERT INTO cities VALUES (1364, 11, 'Palmeirândia', false, -2.6817519999999999, -44.917000100000003);
INSERT INTO cities VALUES (1365, 11, 'Paraibano', false, -6.4317447999999997, -43.980053699999999);
INSERT INTO cities VALUES (1366, 11, 'Parnarama', false, -5.6693207000000001, -43.099504000000003);
INSERT INTO cities VALUES (1367, 11, 'Passagem Franca', false, -6.1708952999999998, -43.784597099999999);
INSERT INTO cities VALUES (1368, 11, 'Pastos Bons', false, -6.5998616999999999, -44.072499499999999);
INSERT INTO cities VALUES (1369, 11, 'Paulino Neves', false, -2.7268070999999998, -42.5370876);
INSERT INTO cities VALUES (1370, 11, 'Paulo Ramos', false, -4.2181369999999996, -45.183182000000002);
INSERT INTO cities VALUES (1371, 11, 'Pedreiras', false, -4.5743510000000001, -44.5986817);
INSERT INTO cities VALUES (1372, 11, 'Pedro do Rosário', false, -2.9772717000000002, -45.346442099999997);
INSERT INTO cities VALUES (1373, 11, 'Penalva', false, -3.2816746999999999, -45.174841999999998);
INSERT INTO cities VALUES (1374, 11, 'Peri Mirim', false, -2.5799044000000002, -44.855172600000003);
INSERT INTO cities VALUES (1375, 11, 'Peritoró', false, -4.3823629999999998, -44.3369918);
INSERT INTO cities VALUES (1376, 11, 'Pindaré-Mirim', false, -3.6099999999999999, -45.338889000000002);
INSERT INTO cities VALUES (1377, 11, 'Pinheiro', false, -3.9166669999999999, -45.083333000000003);
INSERT INTO cities VALUES (1378, 11, 'Pio XII', false, -3.8990594999999999, -45.175708299999997);
INSERT INTO cities VALUES (1379, 11, 'Pirapemas', false, -3.7277578999999998, -44.223420699999998);
INSERT INTO cities VALUES (1380, 11, 'Poção de Pedras', false, -4.7318347999999997, -44.888430800000002);
INSERT INTO cities VALUES (1381, 11, 'Porto Franco', false, -6.3413114999999998, -47.401573599999999);
INSERT INTO cities VALUES (1382, 11, 'Porto Rico do Maranhão', false, -1.9924177000000001, -44.644663000000001);
INSERT INTO cities VALUES (1383, 11, 'Presidente Dutra', false, -5.2903264999999999, -44.489739399999998);
INSERT INTO cities VALUES (1384, 11, 'Presidente Juscelino', false, -2.9223537999999998, -44.067564300000001);
INSERT INTO cities VALUES (1385, 11, 'Presidente Médici', false, -2.3853639000000002, -45.811790999999999);
INSERT INTO cities VALUES (1386, 11, 'Presidente Sarney', false, -2.6007742999999999, -45.4190234);
INSERT INTO cities VALUES (1387, 11, 'Presidente Vargas', false, -3.4865974999999998, -44.054044500000003);
INSERT INTO cities VALUES (1388, 11, 'Primeira Cruz', false, -2.5586717000000001, -43.362809300000002);
INSERT INTO cities VALUES (1389, 11, 'Raposa', false, -6.516667, -44.183332999999998);
INSERT INTO cities VALUES (1390, 11, 'Riachão', false, -3.1166670000000001, -42.366667);
INSERT INTO cities VALUES (1391, 11, 'Ribamar Fiquene', false, -5.9325742000000004, -47.377454100000001);
INSERT INTO cities VALUES (1392, 11, 'Rosário', false, -1.8333330000000001, -44.833333000000003);
INSERT INTO cities VALUES (1393, 11, 'Sambaíba', false, -5.3578869999999998, -46.083351);
INSERT INTO cities VALUES (1394, 11, 'Santa Filomena do Maranhão', false, -5.5011606999999998, -44.561570000000003);
INSERT INTO cities VALUES (1395, 11, 'Santa Helena', false, -3.516667, -42.799999999999997);
INSERT INTO cities VALUES (1396, 11, 'Santa Inês', false, -3.5499999999999998, -44.816667000000002);
INSERT INTO cities VALUES (1397, 11, 'Santa Luzia', false, -7.6373179999999996, -47.200240999999998);
INSERT INTO cities VALUES (1398, 11, 'Santa Luzia do Paruá', false, -2.6096713, -45.753415699999998);
INSERT INTO cities VALUES (1399, 11, 'Santa Quitéria do Maranhão', false, -3.4998562, -42.565031099999999);
INSERT INTO cities VALUES (1400, 11, 'Santa Rita', false, -3.8470689999999998, -43.886710999999998);
INSERT INTO cities VALUES (1401, 11, 'Santana do Maranhão', false, -3.1112617, -42.412269799999997);
INSERT INTO cities VALUES (1402, 11, 'Santo Amaro do Maranhão', false, -2.4878532999999998, -43.292797800000002);
INSERT INTO cities VALUES (1403, 11, 'Santo Antônio dos Lopes', false, -4.8639859000000003, -44.354837199999999);
INSERT INTO cities VALUES (1404, 11, 'São Benedito do Rio Preto', false, -3.3331697, -43.527928699999997);
INSERT INTO cities VALUES (1405, 11, 'São Bento', false, -2.3166669999999998, -45.450000000000003);
INSERT INTO cities VALUES (1406, 11, 'São Bernardo', false, -3.3614223000000001, -42.418894999999999);
INSERT INTO cities VALUES (1407, 11, 'São Domingos do Azeitão', false, -6.8128045000000004, -44.643745600000003);
INSERT INTO cities VALUES (1408, 11, 'São Domingos do Maranhão', false, -5.5793682999999996, -44.383055900000002);
INSERT INTO cities VALUES (1409, 11, 'São Félix de Balsas', false, -7.0817189000000003, -44.815658999999997);
INSERT INTO cities VALUES (1410, 11, 'São Francisco do Brejão', false, -5.1234156000000004, -47.418387799999998);
INSERT INTO cities VALUES (1411, 11, 'São Francisco do Maranhão', false, -6.2525835000000001, -42.860391700000001);
INSERT INTO cities VALUES (1412, 11, 'São João Batista', false, -2.9544578000000001, -44.806930399999999);
INSERT INTO cities VALUES (1413, 11, 'São João do Carú', false, -3.5476538999999998, -46.161898700000002);
INSERT INTO cities VALUES (1414, 11, 'São João do Paraíso', false, -6.4593664999999998, -47.056604499999999);
INSERT INTO cities VALUES (1415, 11, 'São João do Soter', false, -5.1079128000000003, -43.809353600000001);
INSERT INTO cities VALUES (1416, 11, 'São João dos Patos', false, -6.4953984, -43.702899799999997);
INSERT INTO cities VALUES (1417, 11, 'São José de Ribamar', false, -2.5631805000000001, -44.062564199999997);
INSERT INTO cities VALUES (1418, 11, 'São José dos Basílios', false, -5.0531259999999998, -44.5381486);
INSERT INTO cities VALUES (1419, 11, 'São Luís Gonzaga do Maranhão', false, -4.3808807999999999, -44.670482100000001);
INSERT INTO cities VALUES (1420, 11, 'São Mateus do Maranhão', false, -4.0405378000000001, -44.468230499999997);
INSERT INTO cities VALUES (1421, 11, 'São Pedro da Água Branca', false, -5.0002142999999997, -48.291518400000001);
INSERT INTO cities VALUES (1422, 11, 'São Pedro dos Crentes', false, -6.8247200000000001, -46.532064300000002);
INSERT INTO cities VALUES (1423, 11, 'São Raimundo das Mangabeiras', false, -7.0220940000000001, -45.481528400000002);
INSERT INTO cities VALUES (1424, 11, 'São Raimundo do Doca Bezerra', false, -5.1095629999999996, -45.077272299999997);
INSERT INTO cities VALUES (1425, 11, 'São Roberto', false, -5.0197725000000002, -44.994298700000002);
INSERT INTO cities VALUES (1426, 11, 'São Vicente Ferrer', false, -2.8956284000000001, -44.881317899999999);
INSERT INTO cities VALUES (1427, 11, 'Satubinha', false, -3.9156596000000001, -45.245702799999997);
INSERT INTO cities VALUES (1428, 11, 'Senador Alexandre Costa', false, -5.3065388999999996, -44.027376199999999);
INSERT INTO cities VALUES (1429, 11, 'Senador La Rocque', false, -5.4473725000000002, -47.293118200000002);
INSERT INTO cities VALUES (1430, 11, 'Serrano do Maranhão', false, -1.8485706, -45.123155199999999);
INSERT INTO cities VALUES (1431, 11, 'Sítio Novo', false, -4.9870029999999996, -46.577469000000001);
INSERT INTO cities VALUES (1432, 11, 'Sucupira do Norte', false, -6.4798368999999996, -44.188538200000004);
INSERT INTO cities VALUES (1433, 11, 'Sucupira do Riachão', false, -6.4110860000000001, -43.5436166);
INSERT INTO cities VALUES (1434, 11, 'Tasso Fragoso', false, -8.4679830000000003, -45.757285699999997);
INSERT INTO cities VALUES (1435, 11, 'Timbiras', false, -4.2568824000000003, -43.930748999999999);
INSERT INTO cities VALUES (1436, 11, 'Timon', false, -5.0950943000000004, -42.836958799999998);
INSERT INTO cities VALUES (1437, 11, 'Trizidela do Vale', false, -4.5667229000000003, -44.626869900000003);
INSERT INTO cities VALUES (1438, 11, 'Tufilândia', false, -3.7097031999999999, -45.575311900000003);
INSERT INTO cities VALUES (1439, 11, 'Tuntum', false, -5.3202385999999997, -44.636199400000002);
INSERT INTO cities VALUES (1440, 11, 'Turiaçu', false, -1.6622454, -45.391803000000003);
INSERT INTO cities VALUES (1441, 11, 'Turilândia', false, -2.1990387999999998, -45.3430538);
INSERT INTO cities VALUES (1442, 11, 'Tutóia', false, -2.7596873999999998, -42.274428700000001);
INSERT INTO cities VALUES (1443, 11, 'Urbano Santos', false, -3.2083488999999998, -43.4044898);
INSERT INTO cities VALUES (1444, 11, 'Vargem Grande', false, -3.5434689000000001, -43.918197499999998);
INSERT INTO cities VALUES (1445, 11, 'Viana', false, -3.2072653, -44.9993318);
INSERT INTO cities VALUES (1446, 11, 'Vila Nova dos Martírios', false, -5.0048044999999997, -48.1074822);
INSERT INTO cities VALUES (1447, 11, 'Vitória do Mearim', false, -3.4641060000000001, -44.863079999999997);
INSERT INTO cities VALUES (1448, 11, 'Vitorino Freire', false, -4.0752300000000004, -45.173999999999999);
INSERT INTO cities VALUES (1449, 11, 'Zé Doca', false, -3.2570654000000001, -45.649995199999999);
INSERT INTO cities VALUES (1450, 11, 'São Luís', true, -2.5307312, -44.306825799999999);
INSERT INTO cities VALUES (1451, 12, 'Água Branca', false, -7.766667, -36.383333);
INSERT INTO cities VALUES (1452, 12, 'Aguiar', false, -7.0930524000000004, -38.170133900000003);
INSERT INTO cities VALUES (1453, 12, 'Alagoa Grande', false, -7.0822433, -35.599193);
INSERT INTO cities VALUES (1454, 12, 'Alagoa Nova', false, -7.0679869999999996, -35.761147299999998);
INSERT INTO cities VALUES (1455, 12, 'Alagoinha', false, -6.9532454000000001, -35.538511499999998);
INSERT INTO cities VALUES (1456, 12, 'Alcantil', false, -7.7345943000000004, -36.075672300000001);
INSERT INTO cities VALUES (1457, 12, 'Algodão de Jandaíra', false, -6.8110172000000002, -35.915234300000002);
INSERT INTO cities VALUES (1458, 12, 'Alhandra', false, -7.4393251999999999, -34.913572899999998);
INSERT INTO cities VALUES (1459, 12, 'Amparo', false, -7.5683685000000001, -37.052445800000001);
INSERT INTO cities VALUES (1460, 12, 'Aparecida', false, -6.7716824000000004, -38.047852800000001);
INSERT INTO cities VALUES (1461, 12, 'Araçagi', false, -6.8474197999999999, -35.381990199999997);
INSERT INTO cities VALUES (1462, 12, 'Arara', false, -7.9666670000000002, -36.766666999999998);
INSERT INTO cities VALUES (1463, 12, 'Araruna', false, -6.5558525000000003, -35.747481800000003);
INSERT INTO cities VALUES (1464, 12, 'Areia', false, -7.25, -36.833333000000003);
INSERT INTO cities VALUES (1465, 12, 'Areia de Baraúnas', false, -7.1086343999999997, -36.950002599999998);
INSERT INTO cities VALUES (1466, 12, 'Areial', false, -7.0609628999999998, -35.936170699999998);
INSERT INTO cities VALUES (1467, 12, 'Aroeiras', false, -7.0666669999999998, -37.166666999999997);
INSERT INTO cities VALUES (1468, 12, 'Assunção', false, -7.0767574, -36.729382899999997);
INSERT INTO cities VALUES (1469, 12, 'Baía da Traição', false, -6.6910740000000004, -34.935098500000002);
INSERT INTO cities VALUES (1470, 12, 'Bananeiras', false, -6.7510509000000001, -35.633349099999997);
INSERT INTO cities VALUES (1471, 12, 'Baraúna', false, -6.6339836999999999, -36.270339);
INSERT INTO cities VALUES (1472, 12, 'Barra de Santa Rosa', false, -6.7216503999999997, -36.062810399999996);
INSERT INTO cities VALUES (1473, 12, 'Barra de Santana', false, -7.5245889999999997, -35.998137499999999);
INSERT INTO cities VALUES (1474, 12, 'Barra de São Miguel', false, -7.7486861999999999, -36.319459199999997);
INSERT INTO cities VALUES (1475, 12, 'Bayeux', false, -7.1249900000000004, -34.932056799999998);
INSERT INTO cities VALUES (1476, 12, 'Belém', false, -7.6166669999999996, -37.983333000000002);
INSERT INTO cities VALUES (1477, 12, 'Belém do Brejo do Cruz', false, -6.1873417999999996, -37.531455399999999);
INSERT INTO cities VALUES (1478, 12, 'Bernardino Batista', false, -6.4523799000000004, -38.551356400000003);
INSERT INTO cities VALUES (1479, 12, 'Boa Ventura', false, -7.4118164999999996, -38.209284500000003);
INSERT INTO cities VALUES (1480, 12, 'Boa Vista', false, -6.5999999999999996, -36.133333);
INSERT INTO cities VALUES (1481, 12, 'Bom Jesus', false, -7, -38.383333);
INSERT INTO cities VALUES (1482, 12, 'Bom Sucesso', false, -7.1833330000000002, -36.366667);
INSERT INTO cities VALUES (1483, 12, 'Bonito de Santa Fé', false, -7.3083255999999999, -38.505202699999998);
INSERT INTO cities VALUES (1484, 12, 'Boqueirão', false, -7.4802885999999997, -36.133939499999997);
INSERT INTO cities VALUES (1485, 12, 'Borborema', false, -6.8044843000000004, -35.595933799999997);
INSERT INTO cities VALUES (1486, 12, 'Brejo do Cruz', false, -6.3456998999999996, -37.4968583);
INSERT INTO cities VALUES (1487, 12, 'Brejo dos Santos', false, -6.3780868999999996, -37.824767799999996);
INSERT INTO cities VALUES (1488, 12, 'Caaporã', false, -7.5157717000000002, -34.9081969);
INSERT INTO cities VALUES (1489, 12, 'Cabaceiras', false, -7.4890834999999996, -36.288314800000002);
INSERT INTO cities VALUES (1490, 12, 'Cabedelo', false, -6.9802080999999996, -34.830356899999998);
INSERT INTO cities VALUES (1491, 12, 'Cachoeira dos Índios', false, -6.9260859000000004, -38.674299599999998);
INSERT INTO cities VALUES (1492, 12, 'Cacimba de Areia', false, -7.0989861999999997, -37.165245300000002);
INSERT INTO cities VALUES (1493, 12, 'Cacimba de Dentro', false, -6.6391831000000003, -35.778235100000003);
INSERT INTO cities VALUES (1494, 12, 'Cacimbas', false, -7.2194861000000001, -37.125146000000001);
INSERT INTO cities VALUES (1495, 12, 'Caiçara', false, -7.8499999999999996, -36.733333000000002);
INSERT INTO cities VALUES (1496, 12, 'Cajazeiras', false, -6.8863398, -38.561417800000001);
INSERT INTO cities VALUES (1497, 12, 'Cajazeirinhas', false, -6.9681379000000003, -37.8038971);
INSERT INTO cities VALUES (1498, 12, 'Caldas Brandão', false, -7.1261858, -35.311031800000002);
INSERT INTO cities VALUES (1499, 12, 'Camalaú', false, -7.8860188000000004, -36.823518200000002);
INSERT INTO cities VALUES (1500, 12, 'Campina Grande', false, -7.2307180999999998, -35.8816664);
INSERT INTO cities VALUES (1501, 12, 'Campo de Santana', false, -6.4855020999999997, -35.630663900000002);
INSERT INTO cities VALUES (1502, 12, 'Capim', false, -6.9162853999999996, -35.167530499999998);
INSERT INTO cities VALUES (1503, 12, 'Caraúbas', false, -7.7275479999999996, -36.493834499999998);
INSERT INTO cities VALUES (1504, 12, 'Carrapateira', false, -6.3499999999999996, -36.350000000000001);
INSERT INTO cities VALUES (1505, 12, 'Casserengue', false, -6.8091862000000001, -35.8168966);
INSERT INTO cities VALUES (1506, 12, 'Catingueira', false, -6.5, -38.466667000000001);
INSERT INTO cities VALUES (1507, 12, 'Catolé do Rocha', false, -6.3410317000000003, -37.749566199999997);
INSERT INTO cities VALUES (1508, 12, 'Caturité', false, -7.4130241999999997, -36.030219700000004);
INSERT INTO cities VALUES (1509, 12, 'Conceição', false, -7.5519471999999999, -38.509970899999999);
INSERT INTO cities VALUES (1510, 12, 'Condado', false, -7.2166670000000002, -37.616667);
INSERT INTO cities VALUES (1511, 12, 'Conde', false, -7.2606950000000001, -34.908311699999999);
INSERT INTO cities VALUES (1512, 12, 'Congo', false, -7.7946263, -36.661668900000002);
INSERT INTO cities VALUES (1513, 12, 'Coremas', false, -6.9992640000000002, -37.935182099999999);
INSERT INTO cities VALUES (1514, 12, 'Coxixola', false, -7.6252842000000003, -36.603242299999998);
INSERT INTO cities VALUES (1515, 12, 'Cruz do Espírito Santo', false, -7.1368499999999999, -35.088071999999997);
INSERT INTO cities VALUES (1516, 12, 'Cubati', false, -6.8678843000000001, -36.341838699999997);
INSERT INTO cities VALUES (1517, 12, 'Cuité', false, -6.4817267000000003, -36.1496049);
INSERT INTO cities VALUES (1518, 12, 'Cuité de Mamanguape', false, -6.9100853000000004, -35.267131300000003);
INSERT INTO cities VALUES (1519, 12, 'Cuitegi', false, -6.8951269999999996, -35.514955200000003);
INSERT INTO cities VALUES (1520, 12, 'Curral de Cima', false, -6.7237840000000002, -35.262321100000001);
INSERT INTO cities VALUES (1521, 12, 'Curral Velho', false, -7.5498874000000002, -38.1958555);
INSERT INTO cities VALUES (1522, 12, 'Damião', false, -6.6315828999999997, -35.905036099999997);
INSERT INTO cities VALUES (1523, 12, 'Desterro', false, -7.2789314999999997, -37.086783799999999);
INSERT INTO cities VALUES (1524, 12, 'Diamante', false, -7.4332216000000004, -38.261499899999997);
INSERT INTO cities VALUES (1525, 12, 'Dona Inês', false, -6.6081849999999998, -35.292591000000002);
INSERT INTO cities VALUES (1526, 12, 'Duas Estradas', false, -6.6855836000000002, -35.4152323);
INSERT INTO cities VALUES (1527, 12, 'Emas', false, -7.1555852, -37.671250200000003);
INSERT INTO cities VALUES (1528, 12, 'Esperança', false, -7.6666670000000003, -38.049999999999997);
INSERT INTO cities VALUES (1529, 12, 'Fagundes', false, -7.3459878999999999, -35.797535799999999);
INSERT INTO cities VALUES (1530, 12, 'Frei Martinho', false, -6.4041360000000003, -36.448591200000003);
INSERT INTO cities VALUES (1531, 12, 'Gado Bravo', false, -7.5431892999999999, -35.800635999999997);
INSERT INTO cities VALUES (1532, 12, 'Guarabira', false, -6.8555178000000003, -35.490124000000002);
INSERT INTO cities VALUES (1533, 12, 'Gurinhém', false, -7.1226856999999999, -35.422479699999997);
INSERT INTO cities VALUES (1534, 12, 'Gurjão', false, -7.2477866999999998, -36.485441100000003);
INSERT INTO cities VALUES (1535, 12, 'Ibiara', false, -7.5022649000000001, -38.403976999999998);
INSERT INTO cities VALUES (1536, 12, 'Igaracy', false, -7.1662049000000003, -38.141543800000001);
INSERT INTO cities VALUES (1537, 12, 'Imaculada', false, -7.3914979000000001, -37.506806099999999);
INSERT INTO cities VALUES (1538, 12, 'Ingá', false, -6.516667, -35.283332999999999);
INSERT INTO cities VALUES (1539, 12, 'Itabaiana', false, -7.3293891000000002, -35.333333099999997);
INSERT INTO cities VALUES (1540, 12, 'Itaporanga', false, -7.3027378000000001, -38.150393999999999);
INSERT INTO cities VALUES (1541, 12, 'Itapororoca', false, -6.8308397999999997, -35.247049099999998);
INSERT INTO cities VALUES (1542, 12, 'Itatuba', false, -7.3725871999999999, -35.632236499999998);
INSERT INTO cities VALUES (1543, 12, 'Jacaraú', false, -6.6167832000000004, -35.282631199999997);
INSERT INTO cities VALUES (1544, 12, 'Jericó', false, -6.5427479999999996, -37.805647800000003);
INSERT INTO cities VALUES (1545, 12, 'Juarez Távora', false, -7.1722579, -35.567104899999997);
INSERT INTO cities VALUES (1546, 12, 'Juazeirinho', false, -7.0670814000000002, -36.578340699999998);
INSERT INTO cities VALUES (1547, 12, 'Junco do Seridó', false, -6.9948158999999999, -36.711474699999997);
INSERT INTO cities VALUES (1548, 12, 'Juripiranga', false, -7.3765004999999997, -35.2349484);
INSERT INTO cities VALUES (1549, 12, 'Juru', false, -7.5415397000000004, -37.8124836);
INSERT INTO cities VALUES (1550, 12, 'Lagoa', false, -7.266667, -38.350000000000001);
INSERT INTO cities VALUES (1551, 12, 'Lagoa de Dentro', false, -7.7999999999999998, -38.100000000000001);
INSERT INTO cities VALUES (1552, 12, 'Lagoa Seca', false, -6.4333330000000002, -36.283332999999999);
INSERT INTO cities VALUES (1553, 12, 'Lastro', false, -6.5121805999999998, -38.169653500000003);
INSERT INTO cities VALUES (1554, 12, 'Livramento', false, -7.3739292000000001, -36.946877800000003);
INSERT INTO cities VALUES (1555, 12, 'Logradouro', false, -7.2833329999999998, -38.083333000000003);
INSERT INTO cities VALUES (1556, 12, 'Lucena', false, -6.8992655000000003, -34.869070100000002);
INSERT INTO cities VALUES (1557, 12, 'Mãe d`Água', false, -7.2527860000000004, -37.432848399999997);
INSERT INTO cities VALUES (1558, 12, 'Malta', false, -6.9056287000000003, -37.522229899999999);
INSERT INTO cities VALUES (1559, 12, 'Mamanguape', false, -6.8386889000000002, -35.136530200000003);
INSERT INTO cities VALUES (1560, 12, 'Manaíra', false, -7.6979183999999998, -38.148684299999999);
INSERT INTO cities VALUES (1561, 12, 'Marcação', false, -6.5666669999999998, -36.366667);
INSERT INTO cities VALUES (1562, 12, 'Mari', false, -7.0499102000000002, -35.310999700000004);
INSERT INTO cities VALUES (1563, 12, 'Marizópolis', false, -6.8387076000000002, -38.351972099999998);
INSERT INTO cities VALUES (1564, 12, 'Massaranduba', false, -7.1892697999999999, -35.790748600000001);
INSERT INTO cities VALUES (1565, 12, 'Mataraca', false, -6.6020532999999997, -35.0509184);
INSERT INTO cities VALUES (1566, 12, 'Matinhas', false, -7.1107863, -35.794155600000003);
INSERT INTO cities VALUES (1567, 12, 'Mato Grosso', false, -7.5999999999999996, -37.799999999999997);
INSERT INTO cities VALUES (1568, 12, 'Maturéia', false, -7.2664841999999998, -37.349189799999998);
INSERT INTO cities VALUES (1569, 12, 'Mogeiro', false, -7.2979447999999998, -35.478008199999998);
INSERT INTO cities VALUES (1570, 12, 'Montadas', false, -7.0868149999999996, -35.944808799999997);
INSERT INTO cities VALUES (1571, 12, 'Monte Horebe', false, -7.2126349000000003, -38.575317099999999);
INSERT INTO cities VALUES (1572, 12, 'Monteiro', false, -7.8914996000000004, -37.116885500000002);
INSERT INTO cities VALUES (1573, 12, 'Mulungu', false, -7.0833329999999997, -37.583333000000003);
INSERT INTO cities VALUES (1574, 12, 'Natuba', false, -7.6438889999999997, -35.552115000000001);
INSERT INTO cities VALUES (1575, 12, 'Nazarezinho', false, -6.9116831000000003, -38.319654900000003);
INSERT INTO cities VALUES (1576, 12, 'Nova Floresta', false, -6.4547115000000002, -36.203064300000001);
INSERT INTO cities VALUES (1577, 12, 'Nova Olinda', false, -7.471787, -38.038552199999998);
INSERT INTO cities VALUES (1578, 12, 'Nova Palmeira', false, -6.6788929000000001, -36.415700200000003);
INSERT INTO cities VALUES (1579, 12, 'Olho d`Água', false, -7.2060814999999998, -37.753195900000001);
INSERT INTO cities VALUES (1580, 12, 'Olivedos', false, -6.9852850999999996, -36.237338999999999);
INSERT INTO cities VALUES (1581, 12, 'Ouro Velho', false, -7.6214177000000003, -37.1527916);
INSERT INTO cities VALUES (1582, 12, 'Parari', false, -7.3160771000000002, -36.655643499999996);
INSERT INTO cities VALUES (1583, 12, 'Passagem', false, -6.5333329999999998, -36.066667000000002);
INSERT INTO cities VALUES (1584, 12, 'Patos', false, -7.0255646, -37.277932100000001);
INSERT INTO cities VALUES (1585, 12, 'Paulista', false, -6.5946714999999996, -37.621296399999999);
INSERT INTO cities VALUES (1586, 12, 'Pedra Branca', false, -7.0499999999999998, -38.033332999999999);
INSERT INTO cities VALUES (1587, 12, 'Pedra Lavrada', false, -6.7537833999999997, -36.4703406);
INSERT INTO cities VALUES (1588, 12, 'Pedras de Fogo', false, -7.4062489999999999, -35.110734999999998);
INSERT INTO cities VALUES (1589, 12, 'Pedro Régis', false, -6.6518635000000002, -35.267191099999998);
INSERT INTO cities VALUES (1590, 12, 'Piancó', false, -7.1980233, -37.929537199999999);
INSERT INTO cities VALUES (1591, 12, 'Picuí', false, -6.5472710000000003, -36.362090600000002);
INSERT INTO cities VALUES (1592, 12, 'Pilar', false, -7.2704507999999999, -35.254332499999997);
INSERT INTO cities VALUES (1593, 12, 'Pilões', false, -6.7116670000000003, -35.609999999999999);
INSERT INTO cities VALUES (1594, 12, 'Pilõezinhos', false, -6.8823848999999999, -35.540633399999997);
INSERT INTO cities VALUES (1595, 12, 'Pirpirituba', false, -6.7802541999999999, -35.488602999999998);
INSERT INTO cities VALUES (1596, 12, 'Pitimbu', false, -7.4714725, -34.812289100000001);
INSERT INTO cities VALUES (1597, 12, 'Pocinhos', false, -7.516667, -37.083333000000003);
INSERT INTO cities VALUES (1598, 12, 'Poço Dantas', false, -6.3793894, -38.516656099999999);
INSERT INTO cities VALUES (1599, 12, 'Poço de José de Moura', false, -6.5719817000000003, -38.529356300000003);
INSERT INTO cities VALUES (1600, 12, 'Pombal', false, -6.7688515000000002, -37.795726899999998);
INSERT INTO cities VALUES (1601, 12, 'Prata', false, -7.7010543, -37.1091883);
INSERT INTO cities VALUES (1602, 12, 'Princesa Isabel', false, -7.7367888000000002, -37.987853100000002);
INSERT INTO cities VALUES (1603, 12, 'Puxinanã', false, -7.1981017999999999, -35.926306699999998);
INSERT INTO cities VALUES (1604, 12, 'Queimadas', false, -7.5333329999999998, -38.100000000000001);
INSERT INTO cities VALUES (1605, 12, 'Quixabá', false, -7.0645550000000004, -37.158986200000001);
INSERT INTO cities VALUES (1606, 12, 'Remígio', false, -6.8915557999999999, -35.830899700000003);
INSERT INTO cities VALUES (1607, 12, 'Riachão', false, -7.5999999999999996, -38.316667000000002);
INSERT INTO cities VALUES (1608, 12, 'Riachão do Bacamarte', false, -7.2593864000000004, -35.666952700000003);
INSERT INTO cities VALUES (1609, 12, 'Riachão do Poço', false, -7.1811232, -35.299824800000003);
INSERT INTO cities VALUES (1610, 12, 'Riacho de Santo Antônio', false, -7.6874450000000003, -36.159155900000002);
INSERT INTO cities VALUES (1611, 12, 'Riacho dos Cavalos', false, -6.4356173999999999, -37.6480885);
INSERT INTO cities VALUES (1612, 12, 'Rio Tinto', false, -6.8059386999999996, -35.075679700000002);
INSERT INTO cities VALUES (1613, 12, 'Salgadinho', false, -7.7999999999999998, -36.583333000000003);
INSERT INTO cities VALUES (1614, 12, 'Salgado de São Félix', false, -7.3651992999999996, -35.439284999999998);
INSERT INTO cities VALUES (1615, 12, 'Santa Cecília', false, -7.7420505999999998, -35.876176700000002);
INSERT INTO cities VALUES (1616, 12, 'Santa Cruz', false, -6.5259676999999998, -38.056531700000001);
INSERT INTO cities VALUES (1617, 12, 'Santa Helena', false, -6.7681820000000004, -38.5601567);
INSERT INTO cities VALUES (1618, 12, 'Santa Inês', false, -7.6274756000000004, -38.548189200000003);
INSERT INTO cities VALUES (1619, 12, 'Santa Luzia', false, -7.1333330000000004, -38.633333);
INSERT INTO cities VALUES (1620, 12, 'Santa Rita', false, -6.6666670000000003, -36.183332999999998);
INSERT INTO cities VALUES (1621, 12, 'Santa Teresinha', false, -7.0886288999999998, -37.456436500000002);
INSERT INTO cities VALUES (1622, 12, 'Santana de Mangueira', false, -7.5506162999999997, -38.319384399999997);
INSERT INTO cities VALUES (1623, 12, 'Santana dos Garrotes', false, -7.3872974999999999, -37.972087700000003);
INSERT INTO cities VALUES (1624, 12, 'Santarém', false, -6.4700100999999997, -38.478904800000002);
INSERT INTO cities VALUES (1625, 12, 'Santo André', false, -7.2118864, -36.6294422);
INSERT INTO cities VALUES (1626, 12, 'São Bentinho', false, -6.9006185000000002, -37.7305055);
INSERT INTO cities VALUES (1627, 12, 'São Bento', false, -7.2833329999999998, -37.5);
INSERT INTO cities VALUES (1628, 12, 'São Domingos de Pombal', false, -6.8344728999999997, -37.885751599999999);
INSERT INTO cities VALUES (1629, 12, 'São Domingos do Cariri', false, -7.6433904000000004, -36.441031099999996);
INSERT INTO cities VALUES (1630, 12, 'São Francisco', false, -7.5499999999999998, -37.700000000000003);
INSERT INTO cities VALUES (1631, 12, 'São João do Cariri', false, -7.3908607000000002, -36.533772599999999);
INSERT INTO cities VALUES (1632, 12, 'São João do Rio do Peixe', false, -6.7312208, -38.448113800000002);
INSERT INTO cities VALUES (1633, 12, 'São João do Tigre', false, -8.0810130000000004, -36.849011599999997);
INSERT INTO cities VALUES (1634, 12, 'São José da Lagoa Tapada', false, -6.9342784000000002, -38.160775800000003);
INSERT INTO cities VALUES (1635, 12, 'São José de Caiana', false, -7.2531853999999996, -38.304455099999998);
INSERT INTO cities VALUES (1636, 12, 'São José de Espinharas', false, -6.8414894000000004, -37.319368300000001);
INSERT INTO cities VALUES (1637, 12, 'São José de Piranhas', false, -7.1180852999999997, -38.501545499999999);
INSERT INTO cities VALUES (1638, 12, 'São José de Princesa', false, -7.5892878000000001, -38.094753799999999);
INSERT INTO cities VALUES (1639, 12, 'São José do Bonfim', false, -7.1651476000000001, -37.307258400000002);
INSERT INTO cities VALUES (1640, 12, 'São José do Brejo do Cruz', false, -6.2089790999999996, -37.351747099999997);
INSERT INTO cities VALUES (1641, 12, 'São José do Sabugi', false, -6.7794439999999998, -36.796388999999998);
INSERT INTO cities VALUES (1642, 12, 'São José dos Cordeiros', false, -7.3905295000000004, -36.808356699999997);
INSERT INTO cities VALUES (1643, 12, 'São José dos Ramos', false, -7.2451284999999999, -35.372135399999998);
INSERT INTO cities VALUES (1644, 12, 'São Mamede', false, -6.9266221000000003, -37.0962356);
INSERT INTO cities VALUES (1645, 12, 'São Miguel de Taipu', false, -7.2337575999999997, -35.231311300000002);
INSERT INTO cities VALUES (1646, 12, 'São Sebastião de Lagoa de Roça', false, -7.0861660999999998, -35.849744000000001);
INSERT INTO cities VALUES (1647, 12, 'São Sebastião do Umbuzeiro', false, -8.1537533999999994, -37.015771000000001);
INSERT INTO cities VALUES (1648, 12, 'Sapé', false, -7.0942116000000004, -35.232715200000001);
INSERT INTO cities VALUES (1649, 12, 'Seridó', false, -6.4236110000000002, -36.288055999999997);
INSERT INTO cities VALUES (1650, 12, 'Serra Branca', false, -7.4873561999999998, -36.664238699999999);
INSERT INTO cities VALUES (1651, 12, 'Serra da Raiz', false, -6.6857486000000002, -35.432452499999997);
INSERT INTO cities VALUES (1652, 12, 'Serra Grande', false, -7.2106849999999998, -38.365655500000003);
INSERT INTO cities VALUES (1653, 12, 'Serra Redonda', false, -6.4333330000000002, -37.616667);
INSERT INTO cities VALUES (1654, 12, 'Serraria', false, -6.8172363999999996, -35.6320111);
INSERT INTO cities VALUES (1655, 12, 'Sertãozinho', false, -6.7312139000000002, -35.433127499999998);
INSERT INTO cities VALUES (1656, 12, 'Sobrado', false, -7.1718871000000002, -35.224231199999998);
INSERT INTO cities VALUES (1657, 12, 'Solânea', false, -6.7660400000000003, -35.717392799999999);
INSERT INTO cities VALUES (1658, 12, 'Soledade', false, -6.9166670000000003, -38.766666999999998);
INSERT INTO cities VALUES (1659, 12, 'Sossêgo', false, -6.7656736000000004, -36.245238899999997);
INSERT INTO cities VALUES (1660, 12, 'Sousa', false, -6.7678222000000003, -38.209918000000002);
INSERT INTO cities VALUES (1661, 12, 'Sumé', false, -7.6716223000000001, -36.881676499999998);
INSERT INTO cities VALUES (1662, 12, 'Taperoá', false, -7.2079142000000003, -36.826079700000001);
INSERT INTO cities VALUES (1663, 12, 'Tavares', false, -6.8166669999999998, -34.966667000000001);
INSERT INTO cities VALUES (1664, 12, 'Teixeira', false, -7.2239190000000004, -37.253059999999998);
INSERT INTO cities VALUES (1665, 12, 'Tenório', false, -7.0105550000000001, -36.678472399999997);
INSERT INTO cities VALUES (1666, 12, 'Triunfo', false, -6.4000000000000004, -37.466667000000001);
INSERT INTO cities VALUES (1667, 12, 'Uiraúna', false, -6.5174344, -38.407898299999999);
INSERT INTO cities VALUES (1668, 12, 'Umbuzeiro', false, -7.6956053999999998, -35.655307899999997);
INSERT INTO cities VALUES (1669, 12, 'Várzea', false, -6.7687751, -36.983824599999998);
INSERT INTO cities VALUES (1670, 12, 'Vieirópolis', false, -6.5073805, -38.256354199999997);
INSERT INTO cities VALUES (1671, 12, 'Vista Serrana', false, -6.7384985000000004, -37.566862100000002);
INSERT INTO cities VALUES (1672, 12, 'Zabelê', false, -8.0725718000000004, -37.095847499999998);
INSERT INTO cities VALUES (1673, 12, 'João Pessoa', true, -7.1152439999999997, -34.890775699999999);
INSERT INTO cities VALUES (1674, 13, 'Água Branca', false, -8.8666669999999996, -36.100000000000001);
INSERT INTO cities VALUES (1675, 13, 'Aguiar', false, -8.1109487999999992, -34.891564199999998);
INSERT INTO cities VALUES (1676, 13, 'Alagoa Grande', false, -8.0370133999999993, -34.883434100000002);
INSERT INTO cities VALUES (1677, 13, 'Alagoa Nova', false, -8.9666669999999993, -37.75);
INSERT INTO cities VALUES (1678, 13, 'Alagoinha', false, -8.4582536000000008, -36.782289400000003);
INSERT INTO cities VALUES (1679, 13, 'Alcantil', false, -7.7345943000000004, -36.075672300000001);
INSERT INTO cities VALUES (1680, 13, 'Algodão de Jandaíra', false, -8.4333329999999993, -39.299999999999997);
INSERT INTO cities VALUES (1681, 13, 'Alhandra', false, -7.4393251999999999, -34.913572899999998);
INSERT INTO cities VALUES (1682, 13, 'Amparo', false, -7.5683685000000001, -37.052445800000001);
INSERT INTO cities VALUES (1683, 13, 'Aparecida', false, -8.0829736000000008, -34.913584399999998);
INSERT INTO cities VALUES (1684, 13, 'Araçagi', false, -8.0087381000000004, -34.920184399999997);
INSERT INTO cities VALUES (1685, 13, 'Arara', false, -8.3833330000000004, -36.166666999999997);
INSERT INTO cities VALUES (1686, 13, 'Araruna', false, -8.2292635999999995, -34.944279700000003);
INSERT INTO cities VALUES (1687, 13, 'Areia', false, -8.0294582999999999, -34.902149199999997);
INSERT INTO cities VALUES (1688, 13, 'Areia de Baraúnas', false, -7.1086343999999997, -36.950002599999998);
INSERT INTO cities VALUES (1689, 13, 'Areial', false, -9.1577990000000007, -37.351748999999998);
INSERT INTO cities VALUES (1690, 13, 'Aroeiras', false, -7.5481043999999997, -35.718084300000001);
INSERT INTO cities VALUES (1691, 13, 'Assunção', false, -8.2874640999999993, -35.987858000000003);
INSERT INTO cities VALUES (1692, 13, 'Baía da Traição', false, -12.677663000000001, -43.230027999999997);
INSERT INTO cities VALUES (1693, 13, 'Bananeiras', false, -22.758838900000001, -43.5129077);
INSERT INTO cities VALUES (1694, 13, 'Baraúna', false, -9.3166670000000007, -40.016666999999998);
INSERT INTO cities VALUES (1695, 13, 'Barra de Santa Rosa', false, -8.2139345000000006, -34.937194699999999);
INSERT INTO cities VALUES (1696, 13, 'Barra de Santana', false, -8.0888393999999995, -35.268101199999997);
INSERT INTO cities VALUES (1697, 13, 'Barra de São Miguel', false, -7.7486861999999999, -36.319459199999997);
INSERT INTO cities VALUES (1698, 13, 'Bayeux', false, -7.1604771999999999, -34.983034199999999);
INSERT INTO cities VALUES (1699, 13, 'Belém', false, -8.2833330000000007, -38.5);
INSERT INTO cities VALUES (1700, 13, 'Belém do Brejo do Cruz', false, -8.2833330000000007, -38.5);
INSERT INTO cities VALUES (1701, 13, 'Bernardino Batista', false, -23.6681037, -46.648888700000001);
INSERT INTO cities VALUES (1702, 13, 'Boa Ventura', false, -7.7833329999999998, -37.533332999999999);
INSERT INTO cities VALUES (1703, 13, 'Boa Vista', false, -8.4666669999999993, -36.016666999999998);
INSERT INTO cities VALUES (1704, 13, 'Bom Jesus', false, -9.2166669999999993, -37.466667000000001);
INSERT INTO cities VALUES (1705, 13, 'Bom Sucesso', false, -8.5, -36.716667000000001);
INSERT INTO cities VALUES (1706, 13, 'Bonito de Santa Fé', false, -8.0216931999999996, -34.924249400000001);
INSERT INTO cities VALUES (1707, 13, 'Boqueirão', false, -8.516667, -36.833333000000003);
INSERT INTO cities VALUES (1708, 13, 'Borborema', false, -7.9808402999999997, -38.3001024);
INSERT INTO cities VALUES (1709, 13, 'Brejo do Cruz', false, -8.1274038999999991, -34.941489599999997);
INSERT INTO cities VALUES (1710, 13, 'Brejo dos Santos', false, -7.9973780999999997, -34.901799199999999);
INSERT INTO cities VALUES (1711, 13, 'Caaporã', false, -7.5157717000000002, -34.9081969);
INSERT INTO cities VALUES (1712, 13, 'Cabaceiras', false, NULL, NULL);
INSERT INTO cities VALUES (1713, 13, 'Cabedelo', false, -7.9421277000000003, -34.828338600000002);
INSERT INTO cities VALUES (1714, 13, 'Cachoeira dos Índios', false, -20.447455399999999, -54.595604799999997);
INSERT INTO cities VALUES (1715, 13, 'Cacimba de Areia', false, -7.0989861999999997, -37.165245300000002);
INSERT INTO cities VALUES (1716, 13, 'Cacimba de Dentro', false, -8.9000000000000004, -36.983333000000002);
INSERT INTO cities VALUES (1717, 13, 'Cacimbas', false, -7.2194861000000001, -37.125146000000001);
INSERT INTO cities VALUES (1718, 13, 'Caiçara', false, -7.7833329999999998, -37.850000000000001);
INSERT INTO cities VALUES (1719, 13, 'Cajazeiras', false, -7.7436413999999996, -34.8312235);
INSERT INTO cities VALUES (1720, 13, 'Cajazeirinhas', false, NULL, NULL);
INSERT INTO cities VALUES (1721, 13, 'Caldas Brandão', false, -8.0139881000000006, -35.0111901);
INSERT INTO cities VALUES (1722, 13, 'Camalaú', false, NULL, NULL);
INSERT INTO cities VALUES (1723, 13, 'Campina Grande', false, -8.0041730999999992, -34.873193999999998);
INSERT INTO cities VALUES (1724, 13, 'Campo de Santana', false, -8.0932280999999993, -35.002670700000003);
INSERT INTO cities VALUES (1725, 13, 'Capim', false, -8.4666669999999993, -38.25);
INSERT INTO cities VALUES (1726, 13, 'Caraúbas', false, -7.7275479999999996, -36.493834499999998);
INSERT INTO cities VALUES (1727, 13, 'Carrapateira', false, -8.1086638000000004, -34.937339600000001);
INSERT INTO cities VALUES (1728, 13, 'Casserengue', false, NULL, NULL);
INSERT INTO cities VALUES (1729, 13, 'Catingueira', false, NULL, NULL);
INSERT INTO cities VALUES (1730, 13, 'Catolé do Rocha', false, -8.1311938999999995, -34.943134700000002);
INSERT INTO cities VALUES (1731, 13, 'Caturité', false, -8.0741335999999997, -34.925724500000001);
INSERT INTO cities VALUES (1732, 13, 'Conceição', false, -7.8833330000000004, -34.833333000000003);
INSERT INTO cities VALUES (1733, 13, 'Condado', false, -7.5927901000000002, -35.103160500000001);
INSERT INTO cities VALUES (1734, 13, 'Conde', false, -7.2606950000000001, -34.908311699999999);
INSERT INTO cities VALUES (1735, 13, 'Congo', false, -9.3435766000000005, -40.473603300000001);
INSERT INTO cities VALUES (1736, 13, 'Coremas', false, -8.0250132999999995, -34.904324299999999);
INSERT INTO cities VALUES (1737, 13, 'Coxixola', false, NULL, NULL);
INSERT INTO cities VALUES (1738, 13, 'Cruz do Espírito Santo', false, -7.8472020000000002, -34.909269199999997);
INSERT INTO cities VALUES (1739, 13, 'Cubati', false, -23.928600299999999, -46.408123799999998);
INSERT INTO cities VALUES (1740, 13, 'Cuité', false, -8.0307183000000002, -34.942029599999998);
INSERT INTO cities VALUES (1741, 13, 'Cuité de Mamanguape', false, -6.8386889000000002, -35.136530200000003);
INSERT INTO cities VALUES (1742, 13, 'Cuitegi', false, -8.0301682999999997, -34.9420146);
INSERT INTO cities VALUES (1743, 13, 'Curral de Cima', false, NULL, NULL);
INSERT INTO cities VALUES (1744, 13, 'Curral Velho', false, -8.266667, -36.783332999999999);
INSERT INTO cities VALUES (1745, 13, 'Damião', false, -8.2836241000000008, -36.001578199999997);
INSERT INTO cities VALUES (1746, 13, 'Desterro', false, -7.8898659000000002, -34.914823599999998);
INSERT INTO cities VALUES (1747, 13, 'Diamante', false, -9.3543567000000003, -40.499002500000003);
INSERT INTO cities VALUES (1748, 13, 'Dona Inês', false, -8.0317083, -34.953744700000001);
INSERT INTO cities VALUES (1749, 13, 'Duas Estradas', false, NULL, NULL);
INSERT INTO cities VALUES (1750, 13, 'Emas', false, -15.951064300000001, -48.267758399999998);
INSERT INTO cities VALUES (1751, 13, 'Esperança', false, -7.8666669999999996, -39.799999999999997);
INSERT INTO cities VALUES (1752, 13, 'Fagundes', false, -8.0029740999999994, -34.926564399999997);
INSERT INTO cities VALUES (1753, 13, 'Frei Martinho', false, -8.0972887, -34.9440186);
INSERT INTO cities VALUES (1754, 13, 'Gado Bravo', false, -8.4732859999999999, -36.335011000000002);
INSERT INTO cities VALUES (1755, 13, 'Guarabira', false, -8.1149389000000003, -34.908069400000002);
INSERT INTO cities VALUES (1756, 13, 'Gurinhém', false, NULL, NULL);
INSERT INTO cities VALUES (1757, 13, 'Gurjão', false, -8.0150740999999996, -35.014200099999996);
INSERT INTO cities VALUES (1758, 13, 'Ibiara', false, -7.5022649000000001, -38.403976999999998);
INSERT INTO cities VALUES (1759, 13, 'Igaracy', false, NULL, NULL);
INSERT INTO cities VALUES (1760, 13, 'Imaculada', false, -7.3914979000000001, -37.506806099999999);
INSERT INTO cities VALUES (1761, 13, 'Ingá', false, -7.8333329999999997, -39.266666999999998);
INSERT INTO cities VALUES (1762, 13, 'Itabaiana', false, -7.3293891000000002, -35.333333099999997);
INSERT INTO cities VALUES (1763, 13, 'Itaporanga', false, -8.0675484999999991, -34.928849499999998);
INSERT INTO cities VALUES (1764, 13, 'Itapororoca', false, NULL, NULL);
INSERT INTO cities VALUES (1765, 13, 'Itatuba', false, -8.1924094000000007, -34.954499800000001);
INSERT INTO cities VALUES (1766, 13, 'Jacaraú', false, -8.0722825999999994, -34.898524299999998);
INSERT INTO cities VALUES (1767, 13, 'Jericó', false, -8.0837085999999996, -34.942844600000001);
INSERT INTO cities VALUES (1768, 13, 'Juarez Távora', false, -7.1722579, -35.567104899999997);
INSERT INTO cities VALUES (1769, 13, 'Juazeirinho', false, -8.8240029999999994, -38.694721000000001);
INSERT INTO cities VALUES (1770, 13, 'Junco do Seridó', false, -7.8833330000000004, -35.916666999999997);
INSERT INTO cities VALUES (1771, 13, 'Juripiranga', false, -7.3765004999999997, -35.2349484);
INSERT INTO cities VALUES (1772, 13, 'Juru', false, -7.5415397000000004, -37.8124836);
INSERT INTO cities VALUES (1773, 13, 'Lagoa', false, -9.2166669999999993, -38.149999999999999);
INSERT INTO cities VALUES (1774, 13, 'Lagoa de Dentro', false, -7.6666670000000003, -40.516666999999998);
INSERT INTO cities VALUES (1775, 13, 'Lagoa Seca', false, -8.0381433999999992, -34.882049100000003);
INSERT INTO cities VALUES (1776, 13, 'Lastro', false, NULL, NULL);
INSERT INTO cities VALUES (1777, 13, 'Livramento', false, -7.3739292000000001, -36.946877800000003);
INSERT INTO cities VALUES (1778, 13, 'Logradouro', false, -8.4333329999999993, -36.399999999999999);
INSERT INTO cities VALUES (1779, 13, 'Lucena', false, -7.9836992000000002, -38.288827599999998);
INSERT INTO cities VALUES (1780, 13, 'Mãe d`Água', false, -8.5666670000000007, -38.5);
INSERT INTO cities VALUES (1781, 13, 'Malta', false, -8.2959542000000006, -35.9606578);
INSERT INTO cities VALUES (1782, 13, 'Mamanguape', false, -8.1159089000000009, -34.897269299999998);
INSERT INTO cities VALUES (1783, 13, 'Manaíra', false, -7.6979183999999998, -38.148684299999999);
INSERT INTO cities VALUES (1784, 13, 'Marcação', false, NULL, NULL);
INSERT INTO cities VALUES (1785, 13, 'Mari', false, -9.2166669999999993, -38.316667000000002);
INSERT INTO cities VALUES (1786, 13, 'Marizópolis', false, NULL, NULL);
INSERT INTO cities VALUES (1787, 13, 'Massaranduba', false, -8.0201232000000005, -34.9302305);
INSERT INTO cities VALUES (1788, 13, 'Mataraca', false, NULL, NULL);
INSERT INTO cities VALUES (1789, 13, 'Matinhas', false, NULL, NULL);
INSERT INTO cities VALUES (1790, 13, 'Mato Grosso', false, -7.5999999999999996, -37.799999999999997);
INSERT INTO cities VALUES (1791, 13, 'Maturéia', false, -7.2664841999999998, -37.349189799999998);
INSERT INTO cities VALUES (1792, 13, 'Mogeiro', false, -7.2979447999999998, -35.478008199999998);
INSERT INTO cities VALUES (1793, 13, 'Montadas', false, NULL, NULL);
INSERT INTO cities VALUES (1794, 13, 'Monte Horebe', false, -9.3873069000000005, -40.521053700000003);
INSERT INTO cities VALUES (1795, 13, 'Monteiro', false, -8.0255650000000003, -34.929988100000003);
INSERT INTO cities VALUES (1796, 13, 'Mulungu', false, -7.5, -37.183332999999998);
INSERT INTO cities VALUES (1797, 13, 'Natuba', false, -7.6438889999999997, -35.552115000000001);
INSERT INTO cities VALUES (1798, 13, 'Nazarezinho', false, NULL, NULL);
INSERT INTO cities VALUES (1799, 13, 'Nova Floresta', false, -8.1128087999999998, -34.926859499999999);
INSERT INTO cities VALUES (1800, 13, 'Nova Olinda', false, -8.8333329999999997, -39.916666999999997);
INSERT INTO cities VALUES (1801, 13, 'Nova Palmeira', false, -8.0141130999999994, -35.0055701);
INSERT INTO cities VALUES (1802, 13, 'Olho d`Água', false, -8.3000000000000007, -36.399999999999999);
INSERT INTO cities VALUES (1803, 13, 'Olivedos', false, -8.0147230999999994, -35.005785099999997);
INSERT INTO cities VALUES (1804, 13, 'Ouro Velho', false, -7.6214177000000003, -37.1527916);
INSERT INTO cities VALUES (1805, 13, 'Parari', false, -7.8447480000000001, -36.372250000000001);
INSERT INTO cities VALUES (1806, 13, 'Passagem', false, -8.266667, -36.716667000000001);
INSERT INTO cities VALUES (1807, 13, 'Patos', false, -7.0255646, -37.277932100000001);
INSERT INTO cities VALUES (1808, 13, 'Paulista', false, -7.9400877000000003, -34.872333900000001);
INSERT INTO cities VALUES (1809, 13, 'Pedra Branca', false, -7.8666669999999996, -36.333333000000003);
INSERT INTO cities VALUES (1810, 13, 'Pedra Lavrada', false, -8.766667, -38.833333000000003);
INSERT INTO cities VALUES (1811, 13, 'Pedras de Fogo', false, -7.4062489999999999, -35.110734999999998);
INSERT INTO cities VALUES (1812, 13, 'Pedro Régis', false, NULL, NULL);
INSERT INTO cities VALUES (1813, 13, 'Piancó', false, -8.1346740000000004, -34.938984599999998);
INSERT INTO cities VALUES (1814, 13, 'Picuí', false, -8.0159982000000003, -34.914524299999997);
INSERT INTO cities VALUES (1815, 13, 'Pilar', false, -7.2704507999999999, -35.254332499999997);
INSERT INTO cities VALUES (1816, 13, 'Pilões', false, -7.8666669999999996, -39.049999999999997);
INSERT INTO cities VALUES (1817, 13, 'Pilõezinhos', false, NULL, NULL);
INSERT INTO cities VALUES (1818, 13, 'Pirpirituba', false, -8.1166788000000007, -34.954324700000001);
INSERT INTO cities VALUES (1819, 13, 'Pitimbu', false, -7.4714725, -34.812289100000001);
INSERT INTO cities VALUES (1820, 13, 'Pocinhos', false, -7.516667, -37.083333000000003);
INSERT INTO cities VALUES (1821, 13, 'Poço Dantas', false, -8.0153581999999997, -34.926539400000003);
INSERT INTO cities VALUES (1822, 13, 'Poço de José de Moura', false, -8.0347833000000008, -34.922549400000001);
INSERT INTO cities VALUES (1823, 13, 'Pombal', false, -8.0858608000000007, -35.202997199999999);
INSERT INTO cities VALUES (1824, 13, 'Prata', false, -7.7010543, -37.1091883);
INSERT INTO cities VALUES (1825, 13, 'Princesa Isabel', false, -7.7367888000000002, -37.987853100000002);
INSERT INTO cities VALUES (1826, 13, 'Puxinanã', false, -8.0575934999999994, -34.934154499999998);
INSERT INTO cities VALUES (1827, 13, 'Queimadas', false, -7.6500000000000004, -39.466667000000001);
INSERT INTO cities VALUES (1828, 13, 'Quixabá', false, -9.016667, -37.283332999999999);
INSERT INTO cities VALUES (1829, 13, 'Remígio', false, -7.8166669999999998, -38.166666999999997);
INSERT INTO cities VALUES (1830, 13, 'Riachão', false, -8.5666670000000007, -37.066667000000002);
INSERT INTO cities VALUES (1831, 13, 'Riachão do Bacamarte', false, -8.5666670000000007, -37.066667000000002);
INSERT INTO cities VALUES (1832, 13, 'Riachão do Poço', false, -8.0470184000000007, -34.916204399999998);
INSERT INTO cities VALUES (1833, 13, 'Riacho de Santo Antônio', false, -8.8909176999999993, -36.494462599999999);
INSERT INTO cities VALUES (1834, 13, 'Riacho dos Cavalos', false, -9.016667, -40.033332999999999);
INSERT INTO cities VALUES (1835, 13, 'Rio Tinto', false, -8.0090731000000002, -34.989724899999999);
INSERT INTO cities VALUES (1836, 13, 'Salgadinho', false, -8.1666670000000003, -37.533332999999999);
INSERT INTO cities VALUES (1837, 13, 'Salgado de São Félix', false, -7.3651992999999996, -35.439284999999998);
INSERT INTO cities VALUES (1838, 13, 'Santa Cecília', false, -7.7420505999999998, -35.876176700000002);
INSERT INTO cities VALUES (1839, 13, 'Santa Cruz', false, -8.244586, -40.333780099999998);
INSERT INTO cities VALUES (1840, 13, 'Santa Helena', false, -8.1783043000000006, -34.932989599999999);
INSERT INTO cities VALUES (1841, 13, 'Santa Inês', false, -7.8666669999999996, -37.916666999999997);
INSERT INTO cities VALUES (1842, 13, 'Santa Luzia', false, -7.8499999999999996, -38.049999999999997);
INSERT INTO cities VALUES (1843, 13, 'Santa Rita', false, -7.7656790000000004, -37.217018000000003);
INSERT INTO cities VALUES (1844, 13, 'Santa Teresinha', false, -7.3784787999999999, -37.4810339);
INSERT INTO cities VALUES (1845, 13, 'Santana de Mangueira', false, -7.5506162999999997, -38.319384399999997);
INSERT INTO cities VALUES (1846, 13, 'Santana dos Garrotes', false, -8.3499999999999996, -37.450000000000003);
INSERT INTO cities VALUES (1847, 13, 'Santarém', false, -8.1204949000000006, -34.955499699999997);
INSERT INTO cities VALUES (1848, 13, 'Santo André', false, -7.8166669999999998, -38.983333000000002);
INSERT INTO cities VALUES (1849, 13, 'São Bentinho', false, NULL, NULL);
INSERT INTO cities VALUES (1850, 13, 'São Bento', false, -8.0500000000000007, -35.183332999999998);
INSERT INTO cities VALUES (1851, 13, 'São Domingos de Pombal', false, -7.8833330000000004, -37.633333);
INSERT INTO cities VALUES (1852, 13, 'São Domingos do Cariri', false, -23.667774600000001, -46.666018800000003);
INSERT INTO cities VALUES (1853, 13, 'São Francisco', false, -8.5, -39.633333);
INSERT INTO cities VALUES (1854, 13, 'São João do Cariri', false, -23.6869838, -46.631828599999999);
INSERT INTO cities VALUES (1855, 13, 'São João do Rio do Peixe', false, -23.687073699999999, -46.659388800000002);
INSERT INTO cities VALUES (1856, 13, 'São João do Tigre', false, -8.0810130000000004, -36.849011599999997);
INSERT INTO cities VALUES (1857, 13, 'São José da Lagoa Tapada', false, -8.4660899999999994, -36.773769000000001);
INSERT INTO cities VALUES (1858, 13, 'São José de Caiana', false, -8.4660899999999994, -36.773769000000001);
INSERT INTO cities VALUES (1859, 13, 'São José de Espinharas', false, -8.4660899999999994, -36.773769000000001);
INSERT INTO cities VALUES (1860, 13, 'São José de Piranhas', false, -8.4660899999999994, -36.773769000000001);
INSERT INTO cities VALUES (1861, 13, 'São José de Princesa', false, -7.5892878000000001, -38.094753799999999);
INSERT INTO cities VALUES (1862, 13, 'São José do Bonfim', false, -7.1651476000000001, -37.307258400000002);
INSERT INTO cities VALUES (1863, 13, 'São José do Brejo do Cruz', false, -8.4660899999999994, -36.773769000000001);
INSERT INTO cities VALUES (1864, 13, 'São José do Sabugi', false, -8.4660899999999994, -36.773769000000001);
INSERT INTO cities VALUES (1865, 13, 'São José dos Cordeiros', false, -8.0519434000000008, -34.937864599999997);
INSERT INTO cities VALUES (1866, 13, 'São José dos Ramos', false, -7.2451284999999999, -35.372135399999998);
INSERT INTO cities VALUES (1867, 13, 'São Mamede', false, NULL, NULL);
INSERT INTO cities VALUES (1868, 13, 'São Miguel de Taipu', false, -7.2337575999999997, -35.231311300000002);
INSERT INTO cities VALUES (1869, 13, 'São Sebastião de Lagoa de Roça', false, -7.0861660999999998, -35.849744000000001);
INSERT INTO cities VALUES (1870, 13, 'São Sebastião do Umbuzeiro', false, -8.1537533999999994, -37.015771000000001);
INSERT INTO cities VALUES (1871, 13, 'Sapé', false, -7.9760429000000004, -34.902694199999999);
INSERT INTO cities VALUES (1872, 13, 'Seridó', false, -8.0325281999999998, -35.004790100000001);
INSERT INTO cities VALUES (1873, 13, 'Serra Branca', false, -8.6500000000000004, -38.316667000000002);
INSERT INTO cities VALUES (1874, 13, 'Serra da Raiz', false, NULL, NULL);
INSERT INTO cities VALUES (1875, 13, 'Serra Grande', false, -8.1999999999999993, -35.350000000000001);
INSERT INTO cities VALUES (1876, 13, 'Serra Redonda', false, -8.6999999999999993, -36.883333299999997);
INSERT INTO cities VALUES (1877, 13, 'Serraria', false, -8.1141585000000003, -35.352992899999997);
INSERT INTO cities VALUES (1878, 13, 'Sertãozinho', false, -8.2188146, -34.932604599999998);
INSERT INTO cities VALUES (1879, 13, 'Sobrado', false, -8.983333, -38.466667000000001);
INSERT INTO cities VALUES (1880, 13, 'Solânea', false, NULL, NULL);
INSERT INTO cities VALUES (1881, 13, 'Soledade', false, -8.0564885000000004, -34.890692799999997);
INSERT INTO cities VALUES (1882, 13, 'Sossêgo', false, -8.0514033999999999, -34.882389099999997);
INSERT INTO cities VALUES (1883, 13, 'Sousa', false, -7.5765047000000001, -40.494879699999998);
INSERT INTO cities VALUES (1884, 13, 'Sumé', false, -8.0190382000000007, -34.917300400000002);
INSERT INTO cities VALUES (1885, 13, 'Taperoá', false, -8.0551334000000008, -34.933885500000002);
INSERT INTO cities VALUES (1886, 13, 'Tavares', false, -7.6412782999999997, -37.871811100000002);
INSERT INTO cities VALUES (1887, 13, 'Teixeira', false, -7.2239190000000004, -37.253059999999998);
INSERT INTO cities VALUES (1888, 13, 'Tenório', false, -8.0500000000000007, -37.950000000000003);
INSERT INTO cities VALUES (1889, 13, 'Triunfo', false, -7.8405003999999998, -38.100154000000003);
INSERT INTO cities VALUES (1890, 13, 'Uiraúna', false, -8.1313939000000008, -34.943629700000002);
INSERT INTO cities VALUES (1891, 13, 'Umbuzeiro', false, -8.7166669999999993, -37.700000000000003);
INSERT INTO cities VALUES (1892, 13, 'Várzea', false, -8.0520467, -34.978220499999999);
INSERT INTO cities VALUES (1893, 13, 'Vieirópolis', false, NULL, NULL);
INSERT INTO cities VALUES (1894, 13, 'Vista Serrana', false, -21.196627100000001, -47.596672400000003);
INSERT INTO cities VALUES (1895, 13, 'Zabelê', false, -8.0725718000000004, -37.095847499999998);
INSERT INTO cities VALUES (1896, 13, 'Recife', true, -22.8838355, -43.126500200000002);
INSERT INTO cities VALUES (1897, 14, 'Acauã', false, -8.2119771000000004, -41.074149499999997);
INSERT INTO cities VALUES (1898, 14, 'Agricolândia', false, -5.8002707999999998, -42.668289999999999);
INSERT INTO cities VALUES (1899, 14, 'Água Branca', false, -7.233333, -41.216667000000001);
INSERT INTO cities VALUES (1900, 14, 'Alagoinha do Piauí', false, -7.0104267, -40.9401625);
INSERT INTO cities VALUES (1901, 14, 'Alegrete do Piauí', false, -7.2477882999999999, -40.852904100000003);
INSERT INTO cities VALUES (1902, 14, 'Alto Longá', false, -5.2513496999999996, -42.209143400000002);
INSERT INTO cities VALUES (1903, 14, 'Altos', false, -8.9853570000000005, -45.075851);
INSERT INTO cities VALUES (1904, 14, 'Alvorada do Gurguéia', false, -8.3749704000000005, -43.846824499999997);
INSERT INTO cities VALUES (1905, 14, 'Amarante', false, -6.2391654000000001, -42.850957600000001);
INSERT INTO cities VALUES (1906, 14, 'Angical do Piauí', false, -6.0859256000000004, -42.739491700000002);
INSERT INTO cities VALUES (1907, 14, 'Anísio de Abreu', false, -9.1914230000000003, -43.0489508);
INSERT INTO cities VALUES (1908, 14, 'Antônio Almeida', false, -7.2052991999999998, -44.214529900000002);
INSERT INTO cities VALUES (1909, 14, 'Aroazes', false, -6.1154364000000001, -41.793142000000003);
INSERT INTO cities VALUES (1910, 14, 'Aroeiras do Itaim', false, -6.9061111000000004, -41.262500000000003);
INSERT INTO cities VALUES (1911, 14, 'Arraial', false, -6.6500371999999999, -42.5316987);
INSERT INTO cities VALUES (1912, 14, 'Assunção do Piauí', false, -5.8671053999999998, -41.048657499999997);
INSERT INTO cities VALUES (1913, 14, 'Avelino Lopes', false, -10.1354244, -43.945337199999997);
INSERT INTO cities VALUES (1914, 14, 'Baixa Grande do Ribeiro', false, -7.8501529999999997, -45.2134924);
INSERT INTO cities VALUES (1915, 14, 'Barra d`Alcântara', false, -6.5226638000000001, -42.103680500000003);
INSERT INTO cities VALUES (1916, 14, 'Barras', false, -6.4666670000000002, -41.316667000000002);
INSERT INTO cities VALUES (1917, 14, 'Barreiras do Piauí', false, -9.9165942999999999, -45.475409499999998);
INSERT INTO cities VALUES (1918, 14, 'Barro Duro', false, -5.8160780000000001, -42.511552899999998);
INSERT INTO cities VALUES (1919, 14, 'Batalha', false, -7.516667, -43.033332999999999);
INSERT INTO cities VALUES (1920, 14, 'Bela Vista do Piauí', false, -7.9827690000000002, -41.877757199999998);
INSERT INTO cities VALUES (1921, 14, 'Belém do Piauí', false, -7.3713639999999998, -40.972375100000001);
INSERT INTO cities VALUES (1922, 14, 'Beneditinos', false, -5.4553748999999998, -42.360376600000002);
INSERT INTO cities VALUES (1923, 14, 'Bertolínia', false, -7.641229, -43.949904500000002);
INSERT INTO cities VALUES (1924, 14, 'Betânia do Piauí', false, -8.1483889999999999, -40.7940744);
INSERT INTO cities VALUES (1925, 14, 'Boa Hora', false, -4.4113642999999998, -42.086381099999997);
INSERT INTO cities VALUES (1926, 14, 'Bocaina', false, -6.9403280000000001, -41.320613199999997);
INSERT INTO cities VALUES (1927, 14, 'Bom Jesus', false, -6.5333329999999998, -42.216667000000001);
INSERT INTO cities VALUES (1928, 14, 'Bom Princípio do Piauí', false, -3.1917805000000001, -41.645185400000003);
INSERT INTO cities VALUES (1929, 14, 'Bonfim do Piauí', false, -9.1664549999999991, -42.874204499999998);
INSERT INTO cities VALUES (1930, 14, 'Boqueirão do Piauí', false, -4.4873637999999998, -42.074381000000002);
INSERT INTO cities VALUES (1931, 14, 'Brasileira', false, -4.1313366, -41.781787799999996);
INSERT INTO cities VALUES (1932, 14, 'Brejo do Piauí', false, -8.1995944000000005, -42.832383200000002);
INSERT INTO cities VALUES (1933, 14, 'Buriti dos Lopes', false, -3.1793562999999998, -41.869979000000001);
INSERT INTO cities VALUES (1934, 14, 'Buriti dos Montes', false, -5.3092397, -41.097671499999997);
INSERT INTO cities VALUES (1935, 14, 'Cabeceiras do Piauí', false, -4.4765556000000002, -42.310192700000002);
INSERT INTO cities VALUES (1936, 14, 'Cajazeiras do Piauí', false, -6.7923032000000001, -42.401221900000003);
INSERT INTO cities VALUES (1937, 14, 'Cajueiro da Praia', false, -2.9416549000000001, -41.350035200000001);
INSERT INTO cities VALUES (1938, 14, 'Caldeirão Grande do Piauí', false, -7.3304390000000001, -40.632788499999997);
INSERT INTO cities VALUES (1939, 14, 'Campinas do Piauí', false, -7.6614190000000004, -41.864233800000001);
INSERT INTO cities VALUES (1940, 14, 'Campo Alegre do Fidalgo', false, -8.3810274000000007, -41.835520199999998);
INSERT INTO cities VALUES (1941, 14, 'Campo Grande do Piauí', false, -7.1310663999999999, -41.036242299999998);
INSERT INTO cities VALUES (1942, 14, 'Campo Largo do Piauí', false, -3.8134032000000002, -42.6305257);
INSERT INTO cities VALUES (1943, 14, 'Campo Maior', false, -4.8282749999999997, -42.169477899999997);
INSERT INTO cities VALUES (1944, 14, 'Canavieira', false, -7.0666669999999998, -41.883333);
INSERT INTO cities VALUES (1945, 14, 'Canto do Buriti', false, -8.1113736999999997, -42.9465869);
INSERT INTO cities VALUES (1946, 14, 'Capitão de Campos', false, -4.4591997000000001, -41.940133099999997);
INSERT INTO cities VALUES (1947, 14, 'Capitão Gervásio Oliveira', false, -8.4900850999999999, -41.8180762);
INSERT INTO cities VALUES (1948, 14, 'Caracol', false, -9.5666670000000007, -45.466667000000001);
INSERT INTO cities VALUES (1949, 14, 'Caraúbas do Piauí', false, -3.4760333000000001, -41.843480900000003);
INSERT INTO cities VALUES (1950, 14, 'Caridade do Piauí', false, -7.7249612000000001, -40.990227500000003);
INSERT INTO cities VALUES (1951, 14, 'Castelo do Piauí', false, -5.3216735000000002, -41.553147799999998);
INSERT INTO cities VALUES (1952, 14, 'Caxingó', false, -10.50032, -45.225558999999997);
INSERT INTO cities VALUES (1953, 14, 'Cocal', false, -6.516667, -42.350000000000001);
INSERT INTO cities VALUES (1954, 14, 'Cocal de Telha', false, -4.5597232999999999, -41.971331300000003);
INSERT INTO cities VALUES (1955, 14, 'Cocal dos Alves', false, -3.6750598000000001, -41.401870799999998);
INSERT INTO cities VALUES (1956, 14, 'Coivaras', false, -5.0957376999999999, -42.2013453);
INSERT INTO cities VALUES (1957, 14, 'Colônia do Gurguéia', false, -8.1824052999999992, -43.7922449);
INSERT INTO cities VALUES (1958, 14, 'Colônia do Piauí', false, -7.2258110999999996, -42.177710599999997);
INSERT INTO cities VALUES (1959, 14, 'Conceição do Canindé', false, -7.8881527, -41.585070000000002);
INSERT INTO cities VALUES (1960, 14, 'Coronel José Dias', false, -8.8363464999999994, -42.496720400000001);
INSERT INTO cities VALUES (1961, 14, 'Corrente', false, -6.766667, -42.299999999999997);
INSERT INTO cities VALUES (1962, 14, 'Cristalândia do Piauí', false, -10.654777599999999, -45.181515400000002);
INSERT INTO cities VALUES (1963, 14, 'Cristino Castro', false, -8.8177275999999996, -44.225743600000001);
INSERT INTO cities VALUES (1964, 14, 'Curimatá', false, -7.266667, -40.833333000000003);
INSERT INTO cities VALUES (1965, 14, 'Currais', false, -9.0066904000000001, -44.410701099999997);
INSERT INTO cities VALUES (1966, 14, 'Curral Novo do Piauí', false, -7.8250868999999996, -40.894674899999998);
INSERT INTO cities VALUES (1967, 14, 'Curralinhos', false, -5.6121815000000002, -42.837987099999999);
INSERT INTO cities VALUES (1968, 14, 'Demerval Lobão', false, -5.3581139999999996, -42.675533799999997);
INSERT INTO cities VALUES (1969, 14, 'Dirceu Arcoverde', false, -9.3375444999999999, -42.430363499999999);
INSERT INTO cities VALUES (1970, 14, 'Dom Expedito Lopes', false, -6.9594218000000003, -41.642258599999998);
INSERT INTO cities VALUES (1971, 14, 'Dom Inocêncio', false, -9.0024660000000001, -41.975066900000002);
INSERT INTO cities VALUES (1972, 14, 'Domingos Mourão', false, -4.2526596999999997, -41.272852200000003);
INSERT INTO cities VALUES (1973, 14, 'Elesbão Veloso', false, -6.2054527000000004, -42.132907500000002);
INSERT INTO cities VALUES (1974, 14, 'Eliseu Martins', false, -8.0907029000000001, -43.661578900000002);
INSERT INTO cities VALUES (1975, 14, 'Esperantina', false, -3.9035369000000002, -42.233907899999998);
INSERT INTO cities VALUES (1976, 14, 'Fartura do Piauí', false, -9.4819420000000001, -42.791306200000001);
INSERT INTO cities VALUES (1977, 14, 'Flores do Piauí', false, -7.7820288, -42.927719500000002);
INSERT INTO cities VALUES (1978, 14, 'Floresta do Piauí', false, -7.4729929000000004, -41.7959891);
INSERT INTO cities VALUES (1979, 14, 'Floriano', false, -6.7672536000000001, -43.025694299999998);
INSERT INTO cities VALUES (1980, 14, 'Francinópolis', false, -6.3994968999999999, -42.258613599999997);
INSERT INTO cities VALUES (1981, 14, 'Francisco Ayres', false, -6.6227169000000004, -42.693233800000002);
INSERT INTO cities VALUES (1982, 14, 'Francisco Macedo', false, -7.3263347999999997, -40.789295699999997);
INSERT INTO cities VALUES (1983, 14, 'Francisco Santos', false, -7.0030345000000001, -41.138136000000003);
INSERT INTO cities VALUES (1984, 14, 'Fronteiras', false, -7.0909095000000004, -40.614952199999998);
INSERT INTO cities VALUES (1985, 14, 'Geminiano', false, -7.1530883000000003, -41.356796699999997);
INSERT INTO cities VALUES (1986, 14, 'Gilbués', false, -9.8251018999999999, -45.3439044);
INSERT INTO cities VALUES (1987, 14, 'Guadalupe', false, -6.7876202000000001, -43.5662971);
INSERT INTO cities VALUES (1988, 14, 'Guaribas', false, -9.3166670000000007, -45.483333000000002);
INSERT INTO cities VALUES (1989, 14, 'Hugo Napoleão', false, -5.982081, -42.559578399999999);
INSERT INTO cities VALUES (1990, 14, 'Ilha Grande', false, -2.8657431999999998, -41.811798500000002);
INSERT INTO cities VALUES (1991, 14, 'Inhuma', false, -7.8499999999999996, -41);
INSERT INTO cities VALUES (1992, 14, 'Ipiranga do Piauí', false, -6.8298509999999997, -41.741511199999998);
INSERT INTO cities VALUES (1993, 14, 'Isaías Coelho', false, -7.7378866000000004, -41.679280499999997);
INSERT INTO cities VALUES (1994, 14, 'Itainópolis', false, -7.4531611, -41.469470700000002);
INSERT INTO cities VALUES (1995, 14, 'Itaueira', false, -7.6028526000000003, -43.027738999999997);
INSERT INTO cities VALUES (1996, 14, 'Jacobina do Piauí', false, -7.9342933000000002, -41.205637199999998);
INSERT INTO cities VALUES (1997, 14, 'Jaicós', false, -7.3580437999999999, -41.1332472);
INSERT INTO cities VALUES (1998, 14, 'Jardim do Mulato', false, -6.0902216999999998, -42.636732000000002);
INSERT INTO cities VALUES (1999, 14, 'Jatobá do Piauí', false, -4.7723807999999996, -41.812081300000003);
INSERT INTO cities VALUES (2000, 14, 'Jerumenha', false, -7.0857611, -43.517099999999999);
INSERT INTO cities VALUES (2001, 14, 'João Costa', false, -8.5104735999999992, -42.420257599999999);
INSERT INTO cities VALUES (2002, 14, 'Joaquim Pires', false, -3.5074383999999998, -42.185711400000002);
INSERT INTO cities VALUES (2003, 14, 'Joca Marques', false, -3.5334584000000002, -42.401382900000002);
INSERT INTO cities VALUES (2004, 14, 'José de Freitas', false, -4.7530872999999998, -42.576676800000001);
INSERT INTO cities VALUES (2005, 14, 'Juazeiro do Piauí', false, -5.1737634999999997, -41.703766799999997);
INSERT INTO cities VALUES (2006, 14, 'Júlio Borges', false, -10.314527999999999, -44.2368764);
INSERT INTO cities VALUES (2007, 14, 'Jurema', false, -9.2298010999999995, -43.124766299999997);
INSERT INTO cities VALUES (2008, 14, 'Lagoa Alegre', false, -4.4413802999999996, -42.595127699999999);
INSERT INTO cities VALUES (2009, 14, 'Lagoa de São Francisco', false, -4.3852663999999999, -41.601241600000002);
INSERT INTO cities VALUES (2010, 14, 'Lagoa do Barro do Piauí', false, -8.4738282999999992, -41.520899999999997);
INSERT INTO cities VALUES (2011, 14, 'Lagoa do Piauí', false, -5.4147064, -42.642273600000003);
INSERT INTO cities VALUES (2012, 14, 'Lagoa do Sítio', false, -6.5078490999999996, -41.581339800000002);
INSERT INTO cities VALUES (2013, 14, 'Lagoinha do Piauí', false, -5.8310250999999997, -42.625673800000001);
INSERT INTO cities VALUES (2014, 14, 'Landri Sales', false, -7.2451806999999997, -43.930396000000002);
INSERT INTO cities VALUES (2015, 14, 'Luís Correia', false, -2.8963625, -41.659063400000001);
INSERT INTO cities VALUES (2016, 14, 'Luzilândia', false, -3.4611260000000001, -42.371670700000003);
INSERT INTO cities VALUES (2017, 14, 'Madeiro', false, -3.4833580999999998, -42.504383599999997);
INSERT INTO cities VALUES (2018, 14, 'Manoel Emídio', false, -8.0082152000000004, -43.864446299999997);
INSERT INTO cities VALUES (2019, 14, 'Marcolândia', false, -7.4453117000000004, -40.658257800000001);
INSERT INTO cities VALUES (2020, 14, 'Marcos Parente', false, -7.1227070000000001, -43.891827599999999);
INSERT INTO cities VALUES (2021, 14, 'Massapê do Piauí', false, -7.4619014000000004, -41.121665200000002);
INSERT INTO cities VALUES (2022, 14, 'Matias Olímpio', false, -3.7164046000000002, -42.556450099999999);
INSERT INTO cities VALUES (2023, 14, 'Miguel Alves', false, -4.1669292999999996, -42.893388700000003);
INSERT INTO cities VALUES (2024, 14, 'Miguel Leão', false, -5.6785560000000004, -42.738621500000001);
INSERT INTO cities VALUES (2025, 14, 'Milton Brandão', false, -4.6855073999999997, -41.436964600000003);
INSERT INTO cities VALUES (2026, 14, 'Monsenhor Gil', false, -5.5629634000000001, -42.616834500000003);
INSERT INTO cities VALUES (2027, 14, 'Monsenhor Hipólito', false, -7.0015495999999997, -41.029373200000002);
INSERT INTO cities VALUES (2028, 14, 'Monte Alegre do Piauí', false, -9.7555905999999997, -45.306342100000002);
INSERT INTO cities VALUES (2029, 14, 'Morro Cabeça no Tempo', false, -9.7300670999999994, -43.908701399999998);
INSERT INTO cities VALUES (2030, 14, 'Morro do Chapéu do Piauí', false, -3.7435339000000001, -42.312714399999997);
INSERT INTO cities VALUES (2031, 14, 'Murici dos Portelas', false, -3.3360503000000001, -42.095492700000001);
INSERT INTO cities VALUES (2032, 14, 'Nazaré do Piauí', false, -6.9697201, -42.669721899999999);
INSERT INTO cities VALUES (2033, 14, 'Nossa Senhora de Nazaré', false, -4.6295986999999998, -42.169499799999997);
INSERT INTO cities VALUES (2034, 14, 'Nossa Senhora dos Remédios', false, -3.9774531999999998, -42.618646699999999);
INSERT INTO cities VALUES (2035, 14, 'Nova Santa Rita', false, -8.0873904000000003, -42.0523715);
INSERT INTO cities VALUES (2036, 14, 'Novo Oriente do Piauí', false, -6.4488184000000004, -41.939202299999998);
INSERT INTO cities VALUES (2037, 14, 'Novo Santo Antônio', false, -5.2911600999999999, -41.933651500000003);
INSERT INTO cities VALUES (2038, 14, 'Oeiras', false, -7.0204187999999998, -42.131713099999999);
INSERT INTO cities VALUES (2039, 14, 'Olho d`Água do Piauí', false, -5.8475732000000002, -42.575385400000002);
INSERT INTO cities VALUES (2040, 14, 'Padre Marcos', false, -7.3568739000000001, -40.904154499999997);
INSERT INTO cities VALUES (2041, 14, 'Paes Landim', false, -7.7771884, -42.255544700000002);
INSERT INTO cities VALUES (2042, 14, 'Pajeú do Piauí', false, -7.8568173000000003, -42.821610800000002);
INSERT INTO cities VALUES (2043, 14, 'Palmeira do Piauí', false, -8.7280809999999995, -44.236769600000002);
INSERT INTO cities VALUES (2044, 14, 'Palmeirais', false, -5.9697136000000004, -43.053726900000001);
INSERT INTO cities VALUES (2045, 14, 'Paquetá', false, -7.1105536999999996, -41.697338100000003);
INSERT INTO cities VALUES (2046, 14, 'Parnaguá', false, -10.229765, -44.633989100000001);
INSERT INTO cities VALUES (2047, 14, 'Parnaíba', false, -2.9039285000000001, -41.7762612);
INSERT INTO cities VALUES (2048, 14, 'Passagem Franca do Piauí', false, -5.8567393000000001, -42.438755499999999);
INSERT INTO cities VALUES (2049, 14, 'Patos do Piauí', false, -7.6666505999999996, -41.236084200000001);
INSERT INTO cities VALUES (2050, 14, 'Pau d`Arco do Piauí', false, -5.2730946999999997, -42.404611799999998);
INSERT INTO cities VALUES (2051, 14, 'Paulistana', false, -8.1553886999999996, -41.153983099999998);
INSERT INTO cities VALUES (2052, 14, 'Pavussu', false, -7.9485644999999998, -43.1973585);
INSERT INTO cities VALUES (2053, 14, 'Pedro II', false, -4.4230247, -41.459541600000001);
INSERT INTO cities VALUES (2054, 14, 'Pedro Laurentino', false, -8.0679310999999991, -42.287768200000002);
INSERT INTO cities VALUES (2055, 14, 'Picos', false, -5.3666669999999996, -41.366667);
INSERT INTO cities VALUES (2056, 14, 'Pimenteiras', false, -6.2389764999999997, -41.4186774);
INSERT INTO cities VALUES (2057, 14, 'Pio IX', false, -6.8477300000000003, -40.583612799999997);
INSERT INTO cities VALUES (2058, 14, 'Piracuruca', false, -3.9281643000000002, -41.711725199999997);
INSERT INTO cities VALUES (2059, 14, 'Piripiri', false, -9.766667, -45.166666999999997);
INSERT INTO cities VALUES (2060, 14, 'Porto', false, -6.7833329999999998, -44.049999999999997);
INSERT INTO cities VALUES (2061, 14, 'Porto Alegre do Piauí', false, -6.9657738, -44.181174499999997);
INSERT INTO cities VALUES (2062, 14, 'Prata do Piauí', false, -5.6655723, -42.206110700000004);
INSERT INTO cities VALUES (2063, 14, 'Queimada Nova', false, -8.5700409999999998, -41.420839399999998);
INSERT INTO cities VALUES (2064, 14, 'Redenção do Gurguéia', false, -9.4862350000000006, -44.587527899999998);
INSERT INTO cities VALUES (2065, 14, 'Regeneração', false, -6.2351714999999999, -42.685988500000001);
INSERT INTO cities VALUES (2066, 14, 'Riacho Frio', false, -10.125703100000001, -44.952069100000003);
INSERT INTO cities VALUES (2067, 14, 'Ribeira do Piauí', false, -7.6945575000000002, -42.711773899999997);
INSERT INTO cities VALUES (2068, 14, 'Ribeiro Gonçalves', false, -7.5608883000000002, -45.241275299999998);
INSERT INTO cities VALUES (2069, 14, 'Rio Grande do Piauí', false, -7.7764595999999999, -43.140881);
INSERT INTO cities VALUES (2070, 14, 'Santa Cruz do Piauí', false, -7.1853702000000004, -41.768456700000002);
INSERT INTO cities VALUES (2071, 14, 'Santa Cruz dos Milagres', false, -5.8061704000000001, -41.954521);
INSERT INTO cities VALUES (2072, 14, 'Santa Filomena', false, -9.1120143999999996, -45.9172005);
INSERT INTO cities VALUES (2073, 14, 'Santa Luz', false, -8.9541795000000004, -44.130061099999999);
INSERT INTO cities VALUES (2074, 14, 'Santa Rosa do Piauí', false, -6.7993563000000004, -42.288370100000002);
INSERT INTO cities VALUES (2075, 14, 'Santana do Piauí', false, -6.8805804000000004, -41.591379099999997);
INSERT INTO cities VALUES (2076, 14, 'Santo Antônio de Lisboa', false, -6.9803873000000003, -41.2292226);
INSERT INTO cities VALUES (2077, 14, 'Santo Antônio dos Milagres', false, -6.0473743000000004, -42.711786500000002);
INSERT INTO cities VALUES (2078, 14, 'Santo Inácio do Piauí', false, -7.4288974999999997, -41.909633900000003);
INSERT INTO cities VALUES (2079, 14, 'São Braz do Piauí', false, -9.2202780000000004, -43);
INSERT INTO cities VALUES (2080, 14, 'São Félix do Piauí', false, -5.933459, -42.1144982);
INSERT INTO cities VALUES (2081, 14, 'São Francisco de Assis do Piauí', false, -8.2346257000000005, -41.690933999999999);
INSERT INTO cities VALUES (2082, 14, 'São Francisco do Piauí', false, -7.2330857999999996, -42.546000300000003);
INSERT INTO cities VALUES (2083, 14, 'São Gonçalo do Gurguéia', false, -10.026235099999999, -45.295899400000003);
INSERT INTO cities VALUES (2084, 14, 'São Gonçalo do Piauí', false, -5.985474, -42.704586399999997);
INSERT INTO cities VALUES (2085, 14, 'São João da Canabrava', false, -6.8199021999999996, -41.346343300000001);
INSERT INTO cities VALUES (2086, 14, 'São João da Fronteira', false, -3.9486367000000002, -41.262968999999998);
INSERT INTO cities VALUES (2087, 14, 'São João da Serra', false, -5.5138425, -41.897835399999998);
INSERT INTO cities VALUES (2088, 14, 'São João da Varjota', false, -6.9440106000000004, -41.889700300000001);
INSERT INTO cities VALUES (2089, 14, 'São João do Arraial', false, -3.8215343000000002, -42.449117399999999);
INSERT INTO cities VALUES (2090, 14, 'São João do Piauí', false, -8.3607628999999992, -42.250985200000002);
INSERT INTO cities VALUES (2091, 14, 'São José do Divino', false, -3.8077605000000001, -41.830978999999999);
INSERT INTO cities VALUES (2092, 14, 'São José do Peixe', false, -7.4955644000000001, -42.566008600000004);
INSERT INTO cities VALUES (2093, 14, 'São José do Piauí', false, -6.8767125, -41.472329299999998);
INSERT INTO cities VALUES (2094, 14, 'São Julião', false, -7.0833383000000003, -40.823454699999999);
INSERT INTO cities VALUES (2095, 14, 'São Lourenço do Piauí', false, -9.1715934000000008, -42.548388199999998);
INSERT INTO cities VALUES (2096, 14, 'São Luis do Piauí', false, -6.8251983000000003, -41.324573200000003);
INSERT INTO cities VALUES (2097, 14, 'São Miguel da Baixa Grande', false, -5.8636815999999996, -42.186107700000001);
INSERT INTO cities VALUES (2098, 14, 'São Miguel do Fidalgo', false, -7.5928791000000002, -42.372785399999998);
INSERT INTO cities VALUES (2099, 14, 'São Miguel do Tapuio', false, -5.4960747999999997, -41.312834100000003);
INSERT INTO cities VALUES (2100, 14, 'São Pedro do Piauí', false, -5.9288476000000001, -42.722260499999997);
INSERT INTO cities VALUES (2101, 14, 'São Raimundo Nonato', false, -9.0150643000000006, -42.697273099999997);
INSERT INTO cities VALUES (2102, 14, 'Sebastião Barros', false, -10.81729, -44.834546199999998);
INSERT INTO cities VALUES (2103, 14, 'Sebastião Leal', false, -7.5664555, -44.0643642);
INSERT INTO cities VALUES (2104, 14, 'Sigefredo Pacheco', false, -4.9149978000000001, -41.732047799999997);
INSERT INTO cities VALUES (2105, 14, 'Simões', false, -7.6166669999999996, -41.566667000000002);
INSERT INTO cities VALUES (2106, 14, 'Simplício Mendes', false, -7.8592921999999996, -41.893287200000003);
INSERT INTO cities VALUES (2107, 14, 'Socorro do Piauí', false, -7.8665656999999998, -42.488830399999998);
INSERT INTO cities VALUES (2108, 14, 'Sussuapara', false, -7.0388145, -41.388268799999999);
INSERT INTO cities VALUES (2109, 14, 'Tamboril do Piauí', false, -8.3776284000000008, -42.883969700000002);
INSERT INTO cities VALUES (2110, 14, 'Tanque do Piauí', false, -6.5973750999999998, -42.281033899999997);
INSERT INTO cities VALUES (2111, 14, 'União', false, -4.5900800999999998, -42.860195699999998);
INSERT INTO cities VALUES (2112, 14, 'Uruçuí', false, -7.2338901, -44.554042299999999);
INSERT INTO cities VALUES (2113, 14, 'Valença do Piauí', false, -6.4075322999999997, -41.748103899999997);
INSERT INTO cities VALUES (2114, 14, 'Várzea Branca', false, -9.2341923000000001, -42.9700962);
INSERT INTO cities VALUES (2115, 14, 'Várzea Grande', false, -6.5442948000000003, -42.246402600000003);
INSERT INTO cities VALUES (2116, 14, 'Vera Mendes', false, -7.6049030000000002, -41.475158899999997);
INSERT INTO cities VALUES (2117, 14, 'Vila Nova do Piauí', false, -7.1430046000000003, -40.9419866);
INSERT INTO cities VALUES (2118, 14, 'Wall Ferraz', false, -7.2404783999999998, -41.911800700000001);
INSERT INTO cities VALUES (2119, 14, 'Teresina', true, -5.0892122999999998, -42.801627500000002);
INSERT INTO cities VALUES (2120, 15, 'Acari', false, -6.4599823000000001, -36.641013800000003);
INSERT INTO cities VALUES (2121, 15, 'Açu', false, -5.5772789999999999, -36.908402299999999);
INSERT INTO cities VALUES (2122, 15, 'Afonso Bezerra', false, -5.4985007000000001, -36.500105099999999);
INSERT INTO cities VALUES (2123, 15, 'Água Nova', false, -6.1989483999999999, -38.298809300000002);
INSERT INTO cities VALUES (2124, 15, 'Alexandria', false, -6.4042598999999996, -38.009785200000003);
INSERT INTO cities VALUES (2125, 15, 'Almino Afonso', false, -6.1445983999999996, -37.766500200000003);
INSERT INTO cities VALUES (2126, 15, 'Alto do Rodrigues', false, -5.2891541000000002, -36.757985900000001);
INSERT INTO cities VALUES (2127, 15, 'Angicos', false, -5.6716528000000004, -36.604607999999999);
INSERT INTO cities VALUES (2128, 15, 'Antônio Martins', false, -6.2271447999999996, -37.893610199999998);
INSERT INTO cities VALUES (2129, 15, 'Apodi', false, -5.6495300000000004, -37.795812099999999);
INSERT INTO cities VALUES (2130, 15, 'Areia Branca', false, -4.9477114999999996, -37.1243646);
INSERT INTO cities VALUES (2131, 15, 'Arês', false, -6.1949623999999996, -35.160198000000001);
INSERT INTO cities VALUES (2132, 15, 'Augusto Severo', false, -5.8626389999999997, -37.310710999999998);
INSERT INTO cities VALUES (2133, 15, 'Baía Formosa', false, -6.3730117000000002, -35.009448900000002);
INSERT INTO cities VALUES (2134, 15, 'Baraúna', false, -5.0705761000000003, -37.617348399999997);
INSERT INTO cities VALUES (2135, 15, 'Barcelona', false, -5.9510671999999998, -35.920642800000003);
INSERT INTO cities VALUES (2136, 15, 'Bento Fernandes', false, -5.6950444999999998, -35.816460800000002);
INSERT INTO cities VALUES (2137, 15, 'Bodó', false, -5.9827031000000002, -36.409322600000003);
INSERT INTO cities VALUES (2138, 15, 'Bom Jesus', false, -5.4333330000000002, -36.649999999999999);
INSERT INTO cities VALUES (2139, 15, 'Brejinho', false, -6.1911942, -35.357826500000002);
INSERT INTO cities VALUES (2140, 15, 'Caiçara do Norte', false, -5.0799880000000002, -36.068528499999999);
INSERT INTO cities VALUES (2141, 15, 'Caiçara do Rio do Vento', false, -5.7603267999999996, -35.998542299999997);
INSERT INTO cities VALUES (2142, 15, 'Caicó', false, -6.4598108999999999, -37.099006299999999);
INSERT INTO cities VALUES (2143, 15, 'Campo Redondo', false, -6.2434471, -36.180537000000001);
INSERT INTO cities VALUES (2144, 15, 'Canguaretama', false, -6.3828537000000001, -35.124856800000003);
INSERT INTO cities VALUES (2145, 15, 'Caraúbas', false, -5.7959071, -37.553066399999999);
INSERT INTO cities VALUES (2146, 15, 'Carnaúba dos Dantas', false, -6.5488429000000004, -36.593421399999997);
INSERT INTO cities VALUES (2147, 15, 'Carnaubais', false, -5.3388314000000001, -36.837655599999998);
INSERT INTO cities VALUES (2148, 15, 'Ceará-Mirim', false, -5.6351772999999996, -35.420239700000003);
INSERT INTO cities VALUES (2149, 15, 'Cerro Corá', false, -6.0454976, -36.347824199999998);
INSERT INTO cities VALUES (2150, 15, 'Coronel Ezequiel', false, -6.3833450000000003, -36.213000399999999);
INSERT INTO cities VALUES (2151, 15, 'Coronel João Pessoa', false, -6.2719427999999997, -38.432553300000002);
INSERT INTO cities VALUES (2152, 15, 'Cruzeta', false, -6.4129088000000003, -36.782303800000001);
INSERT INTO cities VALUES (2153, 15, 'Currais Novos', false, -6.2629429999999999, -36.517695699999997);
INSERT INTO cities VALUES (2154, 15, 'Doutor Severiano', false, -6.0938986000000002, -38.373493799999999);
INSERT INTO cities VALUES (2155, 15, 'Encanto', false, -6.1100237999999996, -38.306675300000002);
INSERT INTO cities VALUES (2156, 15, 'Equador', false, -6.9466545000000002, -36.715367700000002);
INSERT INTO cities VALUES (2157, 15, 'Espírito Santo', false, -6.3344842999999997, -35.309271299999999);
INSERT INTO cities VALUES (2158, 15, 'Extremoz', false, -5.7060208000000001, -35.306679899999999);
INSERT INTO cities VALUES (2159, 15, 'Felipe Guerra', false, -5.5913475999999998, -37.685643200000001);
INSERT INTO cities VALUES (2160, 15, 'Fernando Pedroza', false, -5.7188762000000004, -36.467889900000003);
INSERT INTO cities VALUES (2161, 15, 'Florânia', false, -6.1234697999999996, -36.819714900000001);
INSERT INTO cities VALUES (2162, 15, 'Francisco Dantas', false, -6.0814857, -38.119856900000002);
INSERT INTO cities VALUES (2163, 15, 'Frutuoso Gomes', false, -6.1566764000000003, -37.838330800000001);
INSERT INTO cities VALUES (2164, 15, 'Galinhos', false, -5.1147720999999997, -36.2796381);
INSERT INTO cities VALUES (2165, 15, 'Goianinha', false, -6.2689158999999997, -35.209031400000001);
INSERT INTO cities VALUES (2166, 15, 'Governador Dix-Sept Rosado', false, -5.4593547999999998, -37.521236899999998);
INSERT INTO cities VALUES (2167, 15, 'Grossos', false, -4.9803746999999996, -37.155352800000003);
INSERT INTO cities VALUES (2168, 15, 'Guamaré', false, -5.095002, -36.324828500000002);
INSERT INTO cities VALUES (2169, 15, 'Ielmo Marinho', false, -5.8110913999999996, -35.552697799999997);
INSERT INTO cities VALUES (2170, 15, 'Ipanguaçu', false, -5.4988745000000003, -36.852838800000001);
INSERT INTO cities VALUES (2171, 15, 'Ipueira', false, -6.4666670000000002, -37.383333);
INSERT INTO cities VALUES (2172, 15, 'Itajá', false, -5.6336404, -36.849726799999999);
INSERT INTO cities VALUES (2173, 15, 'Itaú', false, -5.8410571999999998, -37.994239700000001);
INSERT INTO cities VALUES (2174, 15, 'Jaçanã', false, -6.4259293, -36.2018573);
INSERT INTO cities VALUES (2175, 15, 'Jandaíra', false, -5.3570108999999997, -36.1255351);
INSERT INTO cities VALUES (2176, 15, 'Janduís', false, -6.0171036999999998, -37.408982399999999);
INSERT INTO cities VALUES (2177, 15, 'Januário Cicco', false, -6.1557898, -35.601293400000003);
INSERT INTO cities VALUES (2178, 15, 'Japi', false, -6.4610927, -35.940087300000002);
INSERT INTO cities VALUES (2179, 15, 'Jardim de Angicos', false, -5.6561260999999998, -35.968688);
INSERT INTO cities VALUES (2180, 15, 'Jardim de Piranhas', false, -6.3789981999999998, -37.350699200000001);
INSERT INTO cities VALUES (2181, 15, 'Jardim do Seridó', false, -6.5906171000000002, -36.776625899999999);
INSERT INTO cities VALUES (2182, 15, 'João Câmara', false, -5.5438704000000003, -35.8145387);
INSERT INTO cities VALUES (2183, 15, 'João Dias', false, -6.2703612, -37.795902499999997);
INSERT INTO cities VALUES (2184, 15, 'José da Penha', false, -6.3182651999999999, -38.278899199999998);
INSERT INTO cities VALUES (2185, 15, 'Jucurutu', false, -6.0341211000000001, -37.020657399999997);
INSERT INTO cities VALUES (2186, 15, 'Jundiá', false, -6.2766808000000003, -35.361251600000003);
INSERT INTO cities VALUES (2187, 15, 'Lagoa d`Anta', false, -6.3906964999999998, -35.597502599999999);
INSERT INTO cities VALUES (2188, 15, 'Lagoa de Pedras', false, -6.1536498999999996, -35.431792100000003);
INSERT INTO cities VALUES (2189, 15, 'Lagoa de Velhos', false, -6.0071175999999999, -35.857785399999997);
INSERT INTO cities VALUES (2190, 15, 'Lagoa Nova', false, -5.766667, -35.816667000000002);
INSERT INTO cities VALUES (2191, 15, 'Lagoa Salgada', false, -6.1281257, -35.497630600000001);
INSERT INTO cities VALUES (2192, 15, 'Lajes', false, -6.0499999999999998, -37.633333);
INSERT INTO cities VALUES (2193, 15, 'Lajes Pintadas', false, -6.1506854999999998, -36.106243399999997);
INSERT INTO cities VALUES (2194, 15, 'Lucrécia', false, -6.0941179999999999, -37.8106455);
INSERT INTO cities VALUES (2195, 15, 'Luís Gomes', false, -6.4110956999999997, -38.384464100000002);
INSERT INTO cities VALUES (2196, 15, 'Macaíba', false, -5.8600618999999998, -35.349830300000001);
INSERT INTO cities VALUES (2197, 15, 'Macau', false, -5.1112669000000004, -36.626139799999997);
INSERT INTO cities VALUES (2198, 15, 'Major Sales', false, -6.4099608000000003, -38.318031599999998);
INSERT INTO cities VALUES (2199, 15, 'Marcelino Vieira', false, -6.2939961000000002, -38.167666400000002);
INSERT INTO cities VALUES (2200, 15, 'Martins', false, -6.0866619000000002, -37.912562299999998);
INSERT INTO cities VALUES (2201, 15, 'Maxaranguape', false, -5.5163795000000002, -35.2624274);
INSERT INTO cities VALUES (2202, 15, 'Messias Targino', false, -6.0798201000000001, -37.511814200000003);
INSERT INTO cities VALUES (2203, 15, 'Montanhas', false, -6.4853113000000002, -35.286388199999998);
INSERT INTO cities VALUES (2204, 15, 'Monte Alegre', false, -5.8833330000000004, -36.299999999999997);
INSERT INTO cities VALUES (2205, 15, 'Monte das Gameleiras', false, -6.4391056999999998, -35.782027999999997);
INSERT INTO cities VALUES (2206, 15, 'Mossoró', false, -5.1880360999999997, -37.344134400000002);
INSERT INTO cities VALUES (2207, 15, 'Nísia Floresta', false, -6.0935886000000004, -35.210363299999997);
INSERT INTO cities VALUES (2208, 15, 'Nova Cruz', false, -6.4792582000000003, -35.4348393);
INSERT INTO cities VALUES (2209, 15, 'Olho-d`Água do Borges', false, -5.9561890999999996, -37.7051576);
INSERT INTO cities VALUES (2210, 15, 'Ouro Branco', false, -6.6969997000000001, -36.9438393);
INSERT INTO cities VALUES (2211, 15, 'Paraná', false, -6.4690702, -38.304204499999997);
INSERT INTO cities VALUES (2212, 15, 'Paraú', false, -5.7742411999999996, -37.100760899999997);
INSERT INTO cities VALUES (2213, 15, 'Parazinho', false, -5.2191730999999999, -35.838934799999997);
INSERT INTO cities VALUES (2214, 15, 'Parelhas', false, -6.6883868, -36.657978);
INSERT INTO cities VALUES (2215, 15, 'Parnamirim', false, -5.9060642999999997, -35.260442599999998);
INSERT INTO cities VALUES (2216, 15, 'Passa e Fica', false, -6.4362567999999998, -35.642919900000003);
INSERT INTO cities VALUES (2217, 15, 'Passagem', false, -6.0333329999999998, -37.666666999999997);
INSERT INTO cities VALUES (2218, 15, 'Patu', false, -6.1058671999999996, -37.641709200000001);
INSERT INTO cities VALUES (2219, 15, 'Pau dos Ferros', false, -6.1024897999999999, -38.209221499999998);
INSERT INTO cities VALUES (2220, 15, 'Pedra Grande', false, -5.1518626000000003, -35.878450000000001);
INSERT INTO cities VALUES (2221, 15, 'Pedra Preta', false, -5.5777384999999997, -36.104902000000003);
INSERT INTO cities VALUES (2222, 15, 'Pedro Avelino', false, -5.5224178999999998, -36.387295199999997);
INSERT INTO cities VALUES (2223, 15, 'Pedro Velho', false, -6.4396940000000003, -35.221901600000002);
INSERT INTO cities VALUES (2224, 15, 'Pendências', false, -5.2577379000000004, -36.723859699999998);
INSERT INTO cities VALUES (2225, 15, 'Pilões', false, -6.2682929999999999, -38.045169399999999);
INSERT INTO cities VALUES (2226, 15, 'Poço Branco', false, -5.6248760999999998, -35.661533599999999);
INSERT INTO cities VALUES (2227, 15, 'Portalegre', false, -6.0245693999999999, -37.984468800000002);
INSERT INTO cities VALUES (2228, 15, 'Porto do Mangue', false, -5.0633714999999997, -36.792372100000001);
INSERT INTO cities VALUES (2229, 15, 'Presidente Juscelino', false, -6.1029264000000003, -35.704493200000002);
INSERT INTO cities VALUES (2230, 15, 'Pureza', false, -5.4668580000000002, -35.557279700000002);
INSERT INTO cities VALUES (2231, 15, 'Rafael Fernandes', false, -6.1936144000000004, -38.226189699999999);
INSERT INTO cities VALUES (2232, 15, 'Rafael Godeiro', false, -6.0771049000000001, -37.715988799999998);
INSERT INTO cities VALUES (2233, 15, 'Riacho da Cruz', false, -5.9166670000000003, -35.683332999999998);
INSERT INTO cities VALUES (2234, 15, 'Riacho de Santana', false, -6.2613548000000003, -38.317315499999999);
INSERT INTO cities VALUES (2235, 15, 'Riachuelo', false, -5.8122562999999996, -35.823003999999997);
INSERT INTO cities VALUES (2236, 15, 'Rio do Fogo', false, -5.2766726999999998, -35.379149200000001);
INSERT INTO cities VALUES (2237, 15, 'Rodolfo Fernandes', false, -5.7700256000000003, -38.050632100000001);
INSERT INTO cities VALUES (2238, 15, 'Ruy Barbosa', false, -5.8822616999999999, -35.936496900000002);
INSERT INTO cities VALUES (2239, 15, 'Santa Cruz', false, -6.2294071000000004, -36.023307799999998);
INSERT INTO cities VALUES (2240, 15, 'Santa Maria', false, -29.691424399999999, -53.800756);
INSERT INTO cities VALUES (2241, 15, 'Santana do Matos', false, -5.9571237999999997, -36.653329499999998);
INSERT INTO cities VALUES (2242, 15, 'Santana do Seridó', false, -6.7659823000000001, -36.733405699999999);
INSERT INTO cities VALUES (2243, 15, 'Santo Antônio', false, -5.89778, -37.506568999999999);
INSERT INTO cities VALUES (2244, 15, 'São Bento do Norte', false, -5.1119763000000003, -35.967356700000003);
INSERT INTO cities VALUES (2245, 15, 'São Bento do Trairí', false, -6.3445508000000004, -36.0822973);
INSERT INTO cities VALUES (2246, 15, 'São Fernando', false, -6.3790282999999999, -37.183160899999997);
INSERT INTO cities VALUES (2247, 15, 'São Francisco do Oeste', false, -5.9925771000000001, -38.172853199999999);
INSERT INTO cities VALUES (2248, 15, 'São Gonçalo do Amarante', false, -5.7934083999999997, -35.328792100000001);
INSERT INTO cities VALUES (2249, 15, 'São João do Sabugi', false, -6.7184546000000003, -37.202246299999999);
INSERT INTO cities VALUES (2250, 15, 'São José de Mipibu', false, -6.0726944999999999, -35.235058500000001);
INSERT INTO cities VALUES (2251, 15, 'São José do Campestre', false, -6.3123588000000002, -35.715140400000003);
INSERT INTO cities VALUES (2252, 15, 'São José do Seridó', false, -6.4543870999999999, -36.874579599999997);
INSERT INTO cities VALUES (2253, 15, 'São Miguel', false, -6.2148113, -38.496835799999999);
INSERT INTO cities VALUES (2254, 15, 'São Miguel do Gostoso', false, -5.1299216000000003, -35.639756200000001);
INSERT INTO cities VALUES (2255, 15, 'São Paulo do Potengi', false, -5.8956729000000001, -35.758016499999997);
INSERT INTO cities VALUES (2256, 15, 'São Pedro', false, -5.5499999999999998, -36.066667000000002);
INSERT INTO cities VALUES (2257, 15, 'São Rafael', false, -5.7907365000000004, -36.8785132);
INSERT INTO cities VALUES (2258, 15, 'São Tomé', false, -5.9705662000000004, -36.074486);
INSERT INTO cities VALUES (2259, 15, 'São Vicente', false, -5.8499999999999996, -36.516666999999998);
INSERT INTO cities VALUES (2260, 15, 'Senador Elói de Souza', false, -6.0363889000000004, -35.693332099999999);
INSERT INTO cities VALUES (2261, 15, 'Senador Georgino Avelino', false, -6.1620302000000002, -35.126359700000002);
INSERT INTO cities VALUES (2262, 15, 'Serra de São Bento', false, -6.4215596000000001, -35.705030399999998);
INSERT INTO cities VALUES (2263, 15, 'Serra do Mel', false, -5.2105994000000004, -37.032907000000002);
INSERT INTO cities VALUES (2264, 15, 'Serra Negra do Norte', false, -6.6630580999999998, -37.400443799999998);
INSERT INTO cities VALUES (2265, 15, 'Serrinha', false, -6.2784696999999996, -35.499487700000003);
INSERT INTO cities VALUES (2266, 15, 'Serrinha dos Pintos', false, -6.1961776000000004, -37.987841899999999);
INSERT INTO cities VALUES (2267, 15, 'Severiano Melo', false, -5.7896758000000004, -37.955051400000002);
INSERT INTO cities VALUES (2268, 15, 'Sítio Novo', false, -6.1056172999999996, -35.910074799999997);
INSERT INTO cities VALUES (2269, 15, 'Taboleiro Grande', false, -5.9287806999999999, -38.046336199999999);
INSERT INTO cities VALUES (2270, 15, 'Taipu', false, -5.6221671000000004, -35.595272100000003);
INSERT INTO cities VALUES (2271, 15, 'Tangará', false, -6.1997439999999999, -35.801245999999999);
INSERT INTO cities VALUES (2272, 15, 'Tenente Ananias', false, -6.4649071999999999, -38.177451499999997);
INSERT INTO cities VALUES (2273, 15, 'Tenente Laurentino Cruz', false, -6.1359190000000003, -36.713702099999999);
INSERT INTO cities VALUES (2274, 15, 'Tibau', false, -4.8351936000000002, -37.266556600000001);
INSERT INTO cities VALUES (2275, 15, 'Tibau do Sul', false, -6.1896804000000003, -35.091519400000003);
INSERT INTO cities VALUES (2276, 15, 'Timbaúba dos Batistas', false, -6.4644218999999996, -37.274472600000003);
INSERT INTO cities VALUES (2277, 15, 'Touros', false, -5.1991830999999999, -35.461011800000001);
INSERT INTO cities VALUES (2278, 15, 'Triunfo Potiguar', false, -5.8551928000000002, -37.188168599999997);
INSERT INTO cities VALUES (2279, 15, 'Umarizal', false, -5.9970882999999997, -37.807271399999998);
INSERT INTO cities VALUES (2280, 15, 'Upanema', false, -5.6422822000000004, -37.257469);
INSERT INTO cities VALUES (2281, 15, 'Várzea', false, -6.3499999999999996, -38.083333000000003);
INSERT INTO cities VALUES (2282, 15, 'Venha-Ver', false, -6.3263781000000003, -38.484428800000003);
INSERT INTO cities VALUES (2283, 15, 'Vera Cruz', false, -6.0441450999999997, -35.428325999999998);
INSERT INTO cities VALUES (2284, 15, 'Viçosa', false, -5.9945722000000004, -37.942138399999997);
INSERT INTO cities VALUES (2285, 15, 'Vila Flor', false, -6.3087812000000003, -35.069429300000003);
INSERT INTO cities VALUES (2286, 15, 'Natal', true, -5.7803186999999996, -35.206085399999999);
INSERT INTO cities VALUES (2287, 16, 'Água Branca', false, -21.786892699999999, -48.154453099999998);
INSERT INTO cities VALUES (2288, 16, 'Aguiar', false, -10.9234302, -37.068374200000001);
INSERT INTO cities VALUES (2289, 16, 'Alagoa Grande', false, -10.4272907, -36.470120899999998);
INSERT INTO cities VALUES (2290, 16, 'Alagoa Nova', false, NULL, NULL);
INSERT INTO cities VALUES (2291, 16, 'Alagoinha', false, NULL, NULL);
INSERT INTO cities VALUES (2292, 16, 'Alcantil', false, NULL, NULL);
INSERT INTO cities VALUES (2293, 16, 'Algodão de Jandaíra', false, NULL, NULL);
INSERT INTO cities VALUES (2294, 16, 'Alhandra', false, NULL, NULL);
INSERT INTO cities VALUES (2295, 16, 'Amparo', false, -22.7089389, -46.751450200000001);
INSERT INTO cities VALUES (2296, 16, 'Aparecida', false, -10.4501367, -37.473971800000001);
INSERT INTO cities VALUES (2297, 16, 'Araçagi', false, NULL, NULL);
INSERT INTO cities VALUES (2298, 16, 'Arara', false, -22.373387000000001, -47.387643599999997);
INSERT INTO cities VALUES (2299, 16, 'Araruna', false, -22.322102099999999, -49.052759899999998);
INSERT INTO cities VALUES (2300, 16, 'Areia', false, -10.7607339, -37.317468900000001);
INSERT INTO cities VALUES (2301, 16, 'Areia de Baraúnas', false, NULL, NULL);
INSERT INTO cities VALUES (2302, 16, 'Areial', false, -22.2315079, -43.092487900000002);
INSERT INTO cities VALUES (2303, 16, 'Aroeiras', false, -22.918924799999999, -47.078559200000001);
INSERT INTO cities VALUES (2304, 16, 'Assunção', false, -10.9703763, -37.2333195);
INSERT INTO cities VALUES (2305, 16, 'Baía da Traição', false, NULL, NULL);
INSERT INTO cities VALUES (2306, 16, 'Bananeiras', false, NULL, NULL);
INSERT INTO cities VALUES (2307, 16, 'Baraúna', false, NULL, NULL);
INSERT INTO cities VALUES (2308, 16, 'Barra de Santa Rosa', false, -10.908125099999999, -37.049579000000001);
INSERT INTO cities VALUES (2309, 16, 'Barra de Santana', false, -10.9289702, -37.045544999999997);
INSERT INTO cities VALUES (2310, 16, 'Barra de São Miguel', false, -10.9083401, -37.0599791);
INSERT INTO cities VALUES (2311, 16, 'Bayeux', false, -7.1373571, -34.980429200000003);
INSERT INTO cities VALUES (2312, 16, 'Belém', false, -1.3176087000000001, -48.457669899999999);
INSERT INTO cities VALUES (2313, 16, 'Belém do Brejo do Cruz', false, NULL, NULL);
INSERT INTO cities VALUES (2314, 16, 'Bernardino Batista', false, NULL, NULL);
INSERT INTO cities VALUES (2315, 16, 'Boa Ventura', false, -22.302631900000002, -49.089661100000001);
INSERT INTO cities VALUES (2316, 16, 'Boa Vista', false, -10.433332999999999, -37.133333);
INSERT INTO cities VALUES (2317, 16, 'Bom Jesus', false, -10.9463892, -37.134830700000002);
INSERT INTO cities VALUES (2318, 16, 'Bom Sucesso', false, -22.4240636, -43.1263638);
INSERT INTO cities VALUES (2319, 16, 'Bonito de Santa Fé', false, 35.681621999999997, -105.938067);
INSERT INTO cities VALUES (2320, 16, 'Boqueirão', false, -25.471601499999998, -49.273833699999997);
INSERT INTO cities VALUES (2321, 16, 'Borborema', false, NULL, NULL);
INSERT INTO cities VALUES (2322, 16, 'Brejo do Cruz', false, NULL, NULL);
INSERT INTO cities VALUES (2323, 16, 'Brejo dos Santos', false, NULL, NULL);
INSERT INTO cities VALUES (2324, 16, 'Caaporã', false, NULL, NULL);
INSERT INTO cities VALUES (2325, 16, 'Cabaceiras', false, NULL, NULL);
INSERT INTO cities VALUES (2326, 16, 'Cabedelo', false, -7.1119120000000002, -34.855403199999998);
INSERT INTO cities VALUES (2327, 16, 'Cachoeira dos Índios', false, -20.452075399999998, -54.594749899999997);
INSERT INTO cities VALUES (2328, 16, 'Cacimba de Areia', false, NULL, NULL);
INSERT INTO cities VALUES (2329, 16, 'Cacimba de Dentro', false, NULL, NULL);
INSERT INTO cities VALUES (2330, 16, 'Cacimbas', false, NULL, NULL);
INSERT INTO cities VALUES (2331, 16, 'Caiçara', false, -22.884298399999999, -42.022431699999999);
INSERT INTO cities VALUES (2332, 16, 'Cajazeiras', false, -12.934971600000001, -38.432832400000002);
INSERT INTO cities VALUES (2333, 16, 'Cajazeirinhas', false, NULL, NULL);
INSERT INTO cities VALUES (2334, 16, 'Caldas Brandão', false, NULL, NULL);
INSERT INTO cities VALUES (2335, 16, 'Camalaú', false, NULL, NULL);
INSERT INTO cities VALUES (2336, 16, 'Campina Grande', false, -7.2427671, -35.889856399999999);
INSERT INTO cities VALUES (2337, 16, 'Campo de Santana', false, -22.854235800000001, -43.7771173);
INSERT INTO cities VALUES (2338, 16, 'Capim', false, -19.548046100000001, -44.086430900000003);
INSERT INTO cities VALUES (2339, 16, 'Caraúbas', false, NULL, NULL);
INSERT INTO cities VALUES (2340, 16, 'Carrapateira', false, NULL, NULL);
INSERT INTO cities VALUES (2341, 16, 'Casserengue', false, NULL, NULL);
INSERT INTO cities VALUES (2342, 16, 'Catingueira', false, NULL, NULL);
INSERT INTO cities VALUES (2343, 16, 'Catolé do Rocha', false, NULL, NULL);
INSERT INTO cities VALUES (2344, 16, 'Caturité', false, NULL, NULL);
INSERT INTO cities VALUES (2345, 16, 'Conceição', false, -11.2777429, -37.435114400000003);
INSERT INTO cities VALUES (2346, 16, 'Condado', false, NULL, NULL);
INSERT INTO cities VALUES (2347, 16, 'Conde', false, -10.945545299999999, -37.060059099999997);
INSERT INTO cities VALUES (2348, 16, 'Congo', false, NULL, NULL);
INSERT INTO cities VALUES (2349, 16, 'Coremas', false, NULL, NULL);
INSERT INTO cities VALUES (2350, 16, 'Coxixola', false, NULL, NULL);
INSERT INTO cities VALUES (2351, 16, 'Cruz do Espírito Santo', false, -20.361931299999998, -40.370101900000002);
INSERT INTO cities VALUES (2352, 16, 'Cubati', false, -23.892260100000001, -46.429437900000003);
INSERT INTO cities VALUES (2353, 16, 'Cuité', false, NULL, NULL);
INSERT INTO cities VALUES (2354, 16, 'Cuité de Mamanguape', false, -6.8386889000000002, -35.136530200000003);
INSERT INTO cities VALUES (2355, 16, 'Cuitegi', false, NULL, NULL);
INSERT INTO cities VALUES (2356, 16, 'Curral de Cima', false, NULL, NULL);
INSERT INTO cities VALUES (2357, 16, 'Curral Velho', false, NULL, NULL);
INSERT INTO cities VALUES (2358, 16, 'Damião', false, -11.2301977, -37.415920200000002);
INSERT INTO cities VALUES (2359, 16, 'Desterro', false, NULL, NULL);
INSERT INTO cities VALUES (2360, 16, 'Diamante', false, -10.937201200000001, -37.072329199999999);
INSERT INTO cities VALUES (2361, 16, 'Dona Inês', false, NULL, NULL);
INSERT INTO cities VALUES (2362, 16, 'Duas Estradas', false, NULL, NULL);
INSERT INTO cities VALUES (2363, 16, 'Emas', false, -23.191905200000001, -45.868568500000002);
INSERT INTO cities VALUES (2364, 16, 'Esperança', false, -10.9013569, -37.146242700000002);
INSERT INTO cities VALUES (2365, 16, 'Fagundes', false, -23.5123164, -46.367111600000001);
INSERT INTO cities VALUES (2366, 16, 'Frei Martinho', false, NULL, NULL);
INSERT INTO cities VALUES (2367, 16, 'Gado Bravo', false, -10.516667, -37.283332999999999);
INSERT INTO cities VALUES (2368, 16, 'Guarabira', false, -10.986075599999999, -37.054144100000002);
INSERT INTO cities VALUES (2369, 16, 'Gurinhém', false, NULL, NULL);
INSERT INTO cities VALUES (2370, 16, 'Gurjão', false, NULL, NULL);
INSERT INTO cities VALUES (2371, 16, 'Ibiara', false, NULL, NULL);
INSERT INTO cities VALUES (2372, 16, 'Igaracy', false, NULL, NULL);
INSERT INTO cities VALUES (2373, 16, 'Imaculada', false, NULL, NULL);
INSERT INTO cities VALUES (2374, 16, 'Ingá', false, -23.054483600000001, -50.225773699999998);
INSERT INTO cities VALUES (2375, 16, 'Itabaiana', false, -10.6858763, -37.424700700000002);
INSERT INTO cities VALUES (2376, 16, 'Itaporanga', false, -10.233333, -36.566667000000002);
INSERT INTO cities VALUES (2377, 16, 'Itapororoca', false, NULL, NULL);
INSERT INTO cities VALUES (2378, 16, 'Itatuba', false, NULL, NULL);
INSERT INTO cities VALUES (2379, 16, 'Jacaraú', false, NULL, NULL);
INSERT INTO cities VALUES (2380, 16, 'Jericó', false, -10.850802699999999, -37.0627);
INSERT INTO cities VALUES (2381, 16, 'Juarez Távora', false, NULL, NULL);
INSERT INTO cities VALUES (2382, 16, 'Juazeirinho', false, NULL, NULL);
INSERT INTO cities VALUES (2383, 16, 'Junco do Seridó', false, -10.921110000000001, -38.191650000000003);
INSERT INTO cities VALUES (2384, 16, 'Juripiranga', false, NULL, NULL);
INSERT INTO cities VALUES (2385, 16, 'Juru', false, NULL, NULL);
INSERT INTO cities VALUES (2386, 16, 'Lagoa', false, -10.9631302, -37.222820400000003);
INSERT INTO cities VALUES (2387, 16, 'Lagoa de Dentro', false, NULL, NULL);
INSERT INTO cities VALUES (2388, 16, 'Lagoa Seca', false, NULL, NULL);
INSERT INTO cities VALUES (2389, 16, 'Lastro', false, NULL, NULL);
INSERT INTO cities VALUES (2390, 16, 'Livramento', false, -23.444858100000001, -46.553657200000004);
INSERT INTO cities VALUES (2391, 16, 'Logradouro', false, -10.268459999999999, -37.314079);
INSERT INTO cities VALUES (2392, 16, 'Lucena', false, NULL, NULL);
INSERT INTO cities VALUES (2393, 16, 'Mãe d`Água', false, NULL, NULL);
INSERT INTO cities VALUES (2394, 16, 'Malta', false, -22.329811100000001, -49.073571100000002);
INSERT INTO cities VALUES (2395, 16, 'Mamanguape', false, -6.8386889000000002, -35.136530200000003);
INSERT INTO cities VALUES (2396, 16, 'Manaíra', false, -7.1119120000000002, -34.855403199999998);
INSERT INTO cities VALUES (2397, 16, 'Marcação', false, -9.6666670000000003, -37.516666999999998);
INSERT INTO cities VALUES (2398, 16, 'Mari', false, -23.080864999999999, -47.197410599999998);
INSERT INTO cities VALUES (2399, 16, 'Marizópolis', false, NULL, NULL);
INSERT INTO cities VALUES (2400, 16, 'Massaranduba', false, -10.9362242, -37.074714200000003);
INSERT INTO cities VALUES (2401, 16, 'Mataraca', false, NULL, NULL);
INSERT INTO cities VALUES (2402, 16, 'Matinhas', false, -25.821649900000001, -48.539079999999998);
INSERT INTO cities VALUES (2403, 16, 'Mato Grosso', false, -9.6999999999999993, -37.399999999999999);
INSERT INTO cities VALUES (2404, 16, 'Maturéia', false, NULL, NULL);
INSERT INTO cities VALUES (2405, 16, 'Mogeiro', false, NULL, NULL);
INSERT INTO cities VALUES (2406, 16, 'Montadas', false, NULL, NULL);
INSERT INTO cities VALUES (2407, 16, 'Monte Horebe', false, NULL, NULL);
INSERT INTO cities VALUES (2408, 16, 'Monteiro', false, -10.6982873, -37.426921700000001);
INSERT INTO cities VALUES (2409, 16, 'Mulungu', false, -10.199999999999999, -37.066667000000002);
INSERT INTO cities VALUES (2410, 16, 'Natuba', false, NULL, NULL);
INSERT INTO cities VALUES (2411, 16, 'Nazarezinho', false, NULL, NULL);
INSERT INTO cities VALUES (2412, 16, 'Nova Floresta', false, -19.9283006, -43.935633299999999);
INSERT INTO cities VALUES (2413, 16, 'Nova Olinda', false, -16.7789608, -49.240377600000002);
INSERT INTO cities VALUES (2414, 16, 'Nova Palmeira', false, -23.258182399999999, -47.2857238);
INSERT INTO cities VALUES (2415, 16, 'Olho d`Água', false, -9.4967802999999993, -37.828443499999999);
INSERT INTO cities VALUES (2416, 16, 'Olivedos', false, NULL, NULL);
INSERT INTO cities VALUES (2417, 16, 'Ouro Velho', false, -15.6192124, -56.085473499999999);
INSERT INTO cities VALUES (2418, 16, 'Parari', false, NULL, NULL);
INSERT INTO cities VALUES (2419, 16, 'Passagem', false, -1.3979832000000001, -48.391052500000001);
INSERT INTO cities VALUES (2420, 16, 'Patos', false, -9.75, -37.483333000000002);
INSERT INTO cities VALUES (2421, 16, 'Paulista', false, -7.8923024000000002, -34.827928499999999);
INSERT INTO cities VALUES (2422, 16, 'Pedra Branca', false, -30.107665900000001, -51.326158700000001);
INSERT INTO cities VALUES (2423, 16, 'Pedra Lavrada', false, NULL, NULL);
INSERT INTO cities VALUES (2424, 16, 'Pedras de Fogo', false, -10.483333, -37.116667);
INSERT INTO cities VALUES (2425, 16, 'Pedro Régis', false, NULL, NULL);
INSERT INTO cities VALUES (2426, 16, 'Piancó', false, NULL, NULL);
INSERT INTO cities VALUES (2427, 16, 'Picuí', false, NULL, NULL);
INSERT INTO cities VALUES (2428, 16, 'Pilar', false, -23.6719592, -46.483317499999998);
INSERT INTO cities VALUES (2429, 16, 'Pilões', false, NULL, NULL);
INSERT INTO cities VALUES (2430, 16, 'Pilõezinhos', false, NULL, NULL);
INSERT INTO cities VALUES (2431, 16, 'Pirpirituba', false, NULL, NULL);
INSERT INTO cities VALUES (2432, 16, 'Pitimbu', false, -5.8558450000000004, -35.206355100000003);
INSERT INTO cities VALUES (2433, 16, 'Pocinhos', false, NULL, NULL);
INSERT INTO cities VALUES (2434, 16, 'Poço Dantas', false, -10.891974899999999, -37.093854299999997);
INSERT INTO cities VALUES (2435, 16, 'Poço de José de Moura', false, NULL, NULL);
INSERT INTO cities VALUES (2436, 16, 'Pombal', false, NULL, NULL);
INSERT INTO cities VALUES (2437, 16, 'Prata', false, -19.299670500000001, -48.922054899999999);
INSERT INTO cities VALUES (2438, 16, 'Princesa Isabel', false, -11.2739779, -37.442336500000003);
INSERT INTO cities VALUES (2439, 16, 'Puxinanã', false, NULL, NULL);
INSERT INTO cities VALUES (2440, 16, 'Queimadas', false, -10.6661541, -37.454374899999998);
INSERT INTO cities VALUES (2441, 16, 'Quixabá', false, NULL, NULL);
INSERT INTO cities VALUES (2442, 16, 'Remígio', false, NULL, NULL);
INSERT INTO cities VALUES (2443, 16, 'Riachão', false, -11.073025299999999, -37.729569499999997);
INSERT INTO cities VALUES (2444, 16, 'Riachão do Bacamarte', false, NULL, NULL);
INSERT INTO cities VALUES (2445, 16, 'Riachão do Poço', false, NULL, NULL);
INSERT INTO cities VALUES (2446, 16, 'Riacho de Santo Antônio', false, -10.901394, -37.105538000000003);
INSERT INTO cities VALUES (2447, 16, 'Riacho dos Cavalos', false, NULL, NULL);
INSERT INTO cities VALUES (2448, 16, 'Rio Tinto', false, NULL, NULL);
INSERT INTO cities VALUES (2449, 16, 'Salgadinho', false, -9.9666669999999993, -37.783332999999999);
INSERT INTO cities VALUES (2450, 16, 'Salgado de São Félix', false, -11.032800399999999, -37.482417499999997);
INSERT INTO cities VALUES (2451, 16, 'Santa Cecília', false, -11.0186096, -37.208661399999997);
INSERT INTO cities VALUES (2452, 16, 'Santa Cruz', false, -10.25, -36.75);
INSERT INTO cities VALUES (2453, 16, 'Santa Helena', false, -24.851664100000001, -54.330644100000001);
INSERT INTO cities VALUES (2454, 16, 'Santa Inês', false, -3.6752981, -45.388086600000001);
INSERT INTO cities VALUES (2455, 16, 'Santa Luzia', false, -11.3486274, -37.445660599999997);
INSERT INTO cities VALUES (2456, 16, 'Santa Rita', false, -7.1373571, -34.980429200000003);
INSERT INTO cities VALUES (2457, 16, 'Santa Teresinha', false, -25.453100299999999, -54.402580999999998);
INSERT INTO cities VALUES (2458, 16, 'Santana de Mangueira', false, -23.258182399999999, -47.2857238);
INSERT INTO cities VALUES (2459, 16, 'Santana dos Garrotes', false, NULL, NULL);
INSERT INTO cities VALUES (2460, 16, 'Santarém', false, NULL, NULL);
INSERT INTO cities VALUES (2461, 16, 'Santo André', false, -23.6719592, -46.483317499999998);
INSERT INTO cities VALUES (2462, 16, 'São Bentinho', false, NULL, NULL);
INSERT INTO cities VALUES (2463, 16, 'São Bento', false, -11.0213106, -37.206280399999997);
INSERT INTO cities VALUES (2464, 16, 'São Domingos de Pombal', false, -10.7912968, -37.569389899999997);
INSERT INTO cities VALUES (2465, 16, 'São Domingos do Cariri', false, -10.7912968, -37.569389899999997);
INSERT INTO cities VALUES (2466, 16, 'São Francisco', false, -10.3368257, -36.886226100000002);
INSERT INTO cities VALUES (2467, 16, 'São João do Cariri', false, NULL, NULL);
INSERT INTO cities VALUES (2468, 16, 'São João do Rio do Peixe', false, -6.7312208, -38.448113800000002);
INSERT INTO cities VALUES (2469, 16, 'São João do Tigre', false, NULL, NULL);
INSERT INTO cities VALUES (2470, 16, 'São José da Lagoa Tapada', false, -10.733333, -38.100000000000001);
INSERT INTO cities VALUES (2471, 16, 'São José de Caiana', false, -10.733333, -38.100000000000001);
INSERT INTO cities VALUES (2472, 16, 'São José de Espinharas', false, -10.733333, -38.100000000000001);
INSERT INTO cities VALUES (2473, 16, 'São José de Piranhas', false, -10.733333, -38.100000000000001);
INSERT INTO cities VALUES (2474, 16, 'São José de Princesa', false, -10.733333, -38.100000000000001);
INSERT INTO cities VALUES (2475, 16, 'São José do Bonfim', false, -10.903700000000001, -37.0705642);
INSERT INTO cities VALUES (2476, 16, 'São José do Brejo do Cruz', false, -10.733333, -38.100000000000001);
INSERT INTO cities VALUES (2477, 16, 'São José do Sabugi', false, -10.733333, -38.100000000000001);
INSERT INTO cities VALUES (2478, 16, 'São José dos Cordeiros', false, -10.733333, -38.100000000000001);
INSERT INTO cities VALUES (2479, 16, 'São José dos Ramos', false, -10.932650199999999, -37.071539199999997);
INSERT INTO cities VALUES (2480, 16, 'São Mamede', false, NULL, NULL);
INSERT INTO cities VALUES (2481, 16, 'São Miguel de Taipu', false, -22.212739200000001, -49.9423715);
INSERT INTO cities VALUES (2482, 16, 'São Sebastião de Lagoa de Roça', false, -7.0861660999999998, -35.849744000000001);
INSERT INTO cities VALUES (2483, 16, 'São Sebastião do Umbuzeiro', false, NULL, NULL);
INSERT INTO cities VALUES (2484, 16, 'Sapé', false, -10.966666999999999, -37.383333);
INSERT INTO cities VALUES (2485, 16, 'Seridó', false, NULL, NULL);
INSERT INTO cities VALUES (2486, 16, 'Serra Branca', false, NULL, NULL);
INSERT INTO cities VALUES (2487, 16, 'Serra da Raiz', false, NULL, NULL);
INSERT INTO cities VALUES (2488, 16, 'Serra Grande', false, -9.5666667000000007, -37.983333299999998);
INSERT INTO cities VALUES (2489, 16, 'Serra Redonda', false, NULL, NULL);
INSERT INTO cities VALUES (2490, 16, 'Serraria', false, -23.6771338, -46.597568299999999);
INSERT INTO cities VALUES (2491, 16, 'Sertãozinho', false, NULL, NULL);
INSERT INTO cities VALUES (2492, 16, 'Sobrado', false, -10.906985000000001, -37.113538499999997);
INSERT INTO cities VALUES (2493, 16, 'Solânea', false, NULL, NULL);
INSERT INTO cities VALUES (2494, 16, 'Soledade', false, NULL, NULL);
INSERT INTO cities VALUES (2495, 16, 'Sossêgo', false, NULL, NULL);
INSERT INTO cities VALUES (2496, 16, 'Sousa', false, -22.212739200000001, -49.9423715);
INSERT INTO cities VALUES (2497, 16, 'Sumé', false, NULL, NULL);
INSERT INTO cities VALUES (2498, 16, 'Taperoá', false, NULL, NULL);
INSERT INTO cities VALUES (2499, 16, 'Tavares', false, -10.9130751, -37.064539099999998);
INSERT INTO cities VALUES (2500, 16, 'Teixeira', false, -10.9102151, -37.054924);
INSERT INTO cities VALUES (2501, 16, 'Tenório', false, NULL, NULL);
INSERT INTO cities VALUES (2502, 16, 'Triunfo', false, -10.699999999999999, -37.116667);
INSERT INTO cities VALUES (2503, 16, 'Uiraúna', false, NULL, NULL);
INSERT INTO cities VALUES (2504, 16, 'Umbuzeiro', false, NULL, NULL);
INSERT INTO cities VALUES (2505, 16, 'Várzea', false, -10.9880406, -37.056304099999998);
INSERT INTO cities VALUES (2506, 16, 'Vieirópolis', false, NULL, NULL);
INSERT INTO cities VALUES (2507, 16, 'Vista Serrana', false, -21.2056571, -47.5976024);
INSERT INTO cities VALUES (2508, 16, 'Zabelê', false, NULL, NULL);
INSERT INTO cities VALUES (2509, 16, 'Aracaju', true, -10.909542099999999, -37.074773200000003);
INSERT INTO cities VALUES (2510, 17, 'Acorizal', false, -16.183333000000001, -55.883333);
INSERT INTO cities VALUES (2511, 17, 'Água Boa', false, -14.055335599999999, -52.159236999999997);
INSERT INTO cities VALUES (2512, 17, 'Alta Floresta', false, -9.9000000000000004, -55.899999999999999);
INSERT INTO cities VALUES (2513, 17, 'Alto Araguaia', false, -17.3140678, -53.215335699999997);
INSERT INTO cities VALUES (2514, 17, 'Alto Boa Vista', false, -11.6681217, -51.389043999999998);
INSERT INTO cities VALUES (2515, 17, 'Alto Garças', false, -16.940305800000001, -53.520470600000003);
INSERT INTO cities VALUES (2516, 17, 'Alto Paraguai', false, -14.5034598, -56.4831717);
INSERT INTO cities VALUES (2517, 17, 'Alto Taquari', false, -17.8251344, -53.279838400000003);
INSERT INTO cities VALUES (2518, 17, 'Apiacás', false, -9.5444379000000001, -57.451062899999997);
INSERT INTO cities VALUES (2519, 17, 'Araguaiana', false, -15.729827999999999, -51.823851500000004);
INSERT INTO cities VALUES (2520, 17, 'Araguainha', false, -16.856476600000001, -53.029728499999997);
INSERT INTO cities VALUES (2521, 17, 'Araputanga', false, -15.467628899999999, -58.356047699999998);
INSERT INTO cities VALUES (2522, 17, 'Arenápolis', false, -14.4505868, -56.835822399999998);
INSERT INTO cities VALUES (2523, 17, 'Aripuanã', false, -9.1793110000000002, -60.630629999999996);
INSERT INTO cities VALUES (2524, 17, 'Barão de Melgaço', false, -16.182073599999999, -55.960505699999999);
INSERT INTO cities VALUES (2525, 17, 'Barra do Bugres', false, -15.073805200000001, -57.174122599999997);
INSERT INTO cities VALUES (2526, 17, 'Barra do Garças', false, -15.893001699999999, -52.259918499999998);
INSERT INTO cities VALUES (2527, 17, 'Bom Jesus do Araguaia', false, -12.148816399999999, -51.689002700000003);
INSERT INTO cities VALUES (2528, 17, 'Brasnorte', false, -12.1538377, -57.984989900000002);
INSERT INTO cities VALUES (2529, 17, 'Cáceres', false, -16.074491299999998, -57.6598386);
INSERT INTO cities VALUES (2530, 17, 'Campinápolis', false, -14.507569999999999, -52.889445299999998);
INSERT INTO cities VALUES (2531, 17, 'Campo Novo do Parecis', false, -13.6756891, -57.887217300000003);
INSERT INTO cities VALUES (2532, 17, 'Campo Verde', false, -15.5455462, -55.166268700000003);
INSERT INTO cities VALUES (2533, 17, 'Campos de Júlio', false, -13.9496593, -59.240897799999999);
INSERT INTO cities VALUES (2534, 17, 'Canabrava do Norte', false, -11.0392353, -51.8314977);
INSERT INTO cities VALUES (2535, 17, 'Canarana', false, -13.5392455, -52.163589000000002);
INSERT INTO cities VALUES (2536, 17, 'Carlinda', false, -9.9638728000000008, -55.831809999999997);
INSERT INTO cities VALUES (2537, 17, 'Castanheira', false, -11.12767, -58.609895299999998);
INSERT INTO cities VALUES (2538, 17, 'Chapada dos Guimarães', false, -15.452848599999999, -55.739170700000003);
INSERT INTO cities VALUES (2539, 17, 'Cláudia', false, -11.494100400000001, -54.885984100000002);
INSERT INTO cities VALUES (2540, 17, 'Cocalinho', false, -14.377304199999999, -50.989346500000003);
INSERT INTO cities VALUES (2541, 17, 'Colíder', false, -10.813408799999999, -55.455427200000003);
INSERT INTO cities VALUES (2542, 17, 'Colniza', false, -9.4003440999999999, -59.032589700000003);
INSERT INTO cities VALUES (2543, 17, 'Comodoro', false, -13.6640833, -59.7921209);
INSERT INTO cities VALUES (2544, 17, 'Confresa', false, -10.644467799999999, -51.567893599999998);
INSERT INTO cities VALUES (2545, 17, 'Conquista d`Oeste', false, -14.543233499999999, -59.541775600000001);
INSERT INTO cities VALUES (2546, 17, 'Cotriguaçu', false, -9.8584636999999997, -58.4124883);
INSERT INTO cities VALUES (2547, 17, 'Curvelândia', false, -15.5980813, -57.907997700000003);
INSERT INTO cities VALUES (2548, 17, 'Denise', false, -14.7396104, -57.0552402);
INSERT INTO cities VALUES (2549, 17, 'Diamantino', false, -14.4030655, -56.4270171);
INSERT INTO cities VALUES (2550, 17, 'Dom Aquino', false, -15.8099966, -54.919139899999998);
INSERT INTO cities VALUES (2551, 17, 'Feliz Natal', false, -12.376821899999999, -54.918671799999998);
INSERT INTO cities VALUES (2552, 17, 'Figueirópolis d`Oeste', false, -15.428360899999999, -58.733222599999998);
INSERT INTO cities VALUES (2553, 17, 'Gaúcha do Norte', false, -13.2474376, -53.087312900000001);
INSERT INTO cities VALUES (2554, 17, 'General Carneiro', false, -15.710035, -52.7536731);
INSERT INTO cities VALUES (2555, 17, 'Glória d`Oeste', false, -15.770675799999999, -58.331030300000002);
INSERT INTO cities VALUES (2556, 17, 'Guarantã do Norte', false, -9.7859643999999992, -54.907973599999998);
INSERT INTO cities VALUES (2557, 17, 'Guiratinga', false, -16.3374241, -53.764754500000002);
INSERT INTO cities VALUES (2558, 17, 'Indiavaí', false, -15.491463400000001, -58.571322899999998);
INSERT INTO cities VALUES (2559, 17, 'Ipiranga do Norte', false, -15.587222199999999, -56.097499999999997);
INSERT INTO cities VALUES (2560, 17, 'Itanhangá', false, -20.468480700000001, -54.602641400000003);
INSERT INTO cities VALUES (2561, 17, 'Itaúba', false, -11.0618081, -55.277321600000001);
INSERT INTO cities VALUES (2562, 17, 'Itiquira', false, -17.083333, -54.933332999999998);
INSERT INTO cities VALUES (2563, 17, 'Jaciara', false, -15.956094, -54.963161499999998);
INSERT INTO cities VALUES (2564, 17, 'Jangada', false, -15.2413293, -56.486412299999998);
INSERT INTO cities VALUES (2565, 17, 'Jauru', false, -15.339249300000001, -58.862389);
INSERT INTO cities VALUES (2566, 17, 'Juara', false, -11.255346299999999, -57.520382900000001);
INSERT INTO cities VALUES (2567, 17, 'Juína', false, -11.3810827, -58.739025300000002);
INSERT INTO cities VALUES (2568, 17, 'Juruena', false, -12.84723, -58.926898999999999);
INSERT INTO cities VALUES (2569, 17, 'Juscimeira', false, -16.050834500000001, -54.880651299999997);
INSERT INTO cities VALUES (2570, 17, 'Lambari d`Oeste', false, -15.315348200000001, -57.990754500000001);
INSERT INTO cities VALUES (2571, 17, 'Lucas do Rio Verde', false, -13.0633667, -55.921031599999999);
INSERT INTO cities VALUES (2572, 17, 'Luciára', false, -11.2218558, -50.671480000000003);
INSERT INTO cities VALUES (2573, 17, 'Marcelândia', false, -11.119752399999999, -54.601930899999999);
INSERT INTO cities VALUES (2574, 17, 'Matupá', false, -10.0582095, -54.907249999999998);
INSERT INTO cities VALUES (2575, 17, 'Mirassol d`Oeste', false, -15.669177100000001, -58.0853228);
INSERT INTO cities VALUES (2576, 17, 'Nobres', false, -14.720430800000001, -56.329106299999999);
INSERT INTO cities VALUES (2577, 17, 'Nortelândia', false, -14.440148900000001, -56.800531200000002);
INSERT INTO cities VALUES (2578, 17, 'Nossa Senhora do Livramento', false, -15.769092300000001, -56.351664800000002);
INSERT INTO cities VALUES (2579, 17, 'Nova Bandeirantes', false, -9.9554489000000004, -57.866413600000001);
INSERT INTO cities VALUES (2580, 17, 'Nova Brasilândia', false, -14.9587775, -54.966527300000003);
INSERT INTO cities VALUES (2581, 17, 'Nova Canaã do Norte', false, -10.559167, -55.965833000000003);
INSERT INTO cities VALUES (2582, 17, 'Nova Guarita', false, -10.308410800000001, -55.404613099999999);
INSERT INTO cities VALUES (2583, 17, 'Nova Lacerda', false, -14.467459099999999, -59.592646700000003);
INSERT INTO cities VALUES (2584, 17, 'Nova Marilândia', false, -14.3648743, -56.963346899999998);
INSERT INTO cities VALUES (2585, 17, 'Nova Maringá', false, -13.0172104, -57.068752699999997);
INSERT INTO cities VALUES (2586, 17, 'Nova Monte Verde', false, -9.9732173999999993, -57.535272999999997);
INSERT INTO cities VALUES (2587, 17, 'Nova Mutum', false, -13.8384932, -56.080801100000002);
INSERT INTO cities VALUES (2588, 17, 'Nova Nazaré', false, -13.9854191, -51.773536499999999);
INSERT INTO cities VALUES (2589, 17, 'Nova Olímpia', false, -14.783922, -57.296459599999999);
INSERT INTO cities VALUES (2590, 17, 'Nova Santa Helena', false, -10.8294853, -55.184800699999997);
INSERT INTO cities VALUES (2591, 17, 'Nova Ubiratã', false, -13.0146277, -55.263754900000002);
INSERT INTO cities VALUES (2592, 17, 'Nova Xavantina', false, -14.6668067, -52.345946400000003);
INSERT INTO cities VALUES (2593, 17, 'Novo Horizonte do Norte', false, -11.4105331, -57.359177299999999);
INSERT INTO cities VALUES (2594, 17, 'Novo Mundo', false, -9.9641417000000008, -55.1983605);
INSERT INTO cities VALUES (2595, 17, 'Novo Santo Antônio', false, -12.2903982, -50.968448500000001);
INSERT INTO cities VALUES (2596, 17, 'Novo São Joaquim', false, -14.907191299999999, -53.020599900000001);
INSERT INTO cities VALUES (2597, 17, 'Paranaíta', false, -9.6729657000000007, -56.480632);
INSERT INTO cities VALUES (2598, 17, 'Paranatinga', false, -14.4346444, -54.051550900000002);
INSERT INTO cities VALUES (2599, 17, 'Pedra Preta', false, -16.6113894, -54.459545300000002);
INSERT INTO cities VALUES (2600, 17, 'Peixoto de Azevedo', false, -10.226607100000001, -54.986142700000002);
INSERT INTO cities VALUES (2601, 17, 'Planalto da Serra', false, -10.440556000000001, -55.271110999999998);
INSERT INTO cities VALUES (2602, 17, 'Poconé', false, -16.257052300000002, -56.624649499999997);
INSERT INTO cities VALUES (2603, 17, 'Pontal do Araguaia', false, -15.844086000000001, -52.003622);
INSERT INTO cities VALUES (2604, 17, 'Ponte Branca', false, -16.7482127, -52.827168999999998);
INSERT INTO cities VALUES (2605, 17, 'Pontes e Lacerda', false, -15.234325999999999, -59.3311311);
INSERT INTO cities VALUES (2606, 17, 'Porto Alegre do Norte', false, -10.8798108, -51.637533300000001);
INSERT INTO cities VALUES (2607, 17, 'Porto dos Gaúchos', false, -11.5251804, -57.413758799999997);
INSERT INTO cities VALUES (2608, 17, 'Porto Esperidião', false, -15.839396600000001, -58.526348499999997);
INSERT INTO cities VALUES (2609, 17, 'Porto Estrela', false, -15.324810899999999, -57.219207400000002);
INSERT INTO cities VALUES (2610, 17, 'Poxoréo', false, -15.8409029, -54.394126999999997);
INSERT INTO cities VALUES (2611, 17, 'Primavera do Leste', false, -15.559738100000001, -54.297201800000003);
INSERT INTO cities VALUES (2612, 17, 'Querência', false, -12.570002300000001, -52.213226499999998);
INSERT INTO cities VALUES (2613, 17, 'Reserva do Cabaçal', false, -15.0850615, -58.4388723);
INSERT INTO cities VALUES (2614, 17, 'Ribeirão Cascalheira', false, -12.925758500000001, -51.829903899999998);
INSERT INTO cities VALUES (2615, 17, 'Ribeirãozinho', false, -16.474012999999999, -52.693211499999997);
INSERT INTO cities VALUES (2616, 17, 'Rio Branco', false, -15.2417427, -58.117241999999997);
INSERT INTO cities VALUES (2617, 17, 'Rondolândia', false, -10.881111000000001, -61.508333);
INSERT INTO cities VALUES (2618, 17, 'Rondonópolis', false, -16.471292600000002, -54.637101899999998);
INSERT INTO cities VALUES (2619, 17, 'Rosário Oeste', false, -14.834550999999999, -56.429895100000003);
INSERT INTO cities VALUES (2620, 17, 'Salto do Céu', false, -15.1300913, -58.126388800000001);
INSERT INTO cities VALUES (2621, 17, 'Santa Carmem', false, -11.9309595, -55.279754099999998);
INSERT INTO cities VALUES (2622, 17, 'Santa Cruz do Xingu', false, -10.2414579, -52.372101800000003);
INSERT INTO cities VALUES (2623, 17, 'Santa Rita do Trivelato', false, -13.8120437, -55.263930500000001);
INSERT INTO cities VALUES (2624, 17, 'Santa Terezinha', false, -10.460810499999999, -50.512912900000003);
INSERT INTO cities VALUES (2625, 17, 'Santo Afonso', false, -14.491005599999999, -57.008063399999998);
INSERT INTO cities VALUES (2626, 17, 'Santo Antônio do Leste', false, -14.8338248, -53.629710299999999);
INSERT INTO cities VALUES (2627, 17, 'Santo Antônio do Leverger', false, -15.8548042, -56.070423499999997);
INSERT INTO cities VALUES (2628, 17, 'São Félix do Araguaia', false, -11.6137286, -50.671563599999999);
INSERT INTO cities VALUES (2629, 17, 'São José do Povo', false, -16.466018399999999, -54.252143699999998);
INSERT INTO cities VALUES (2630, 17, 'São José do Rio Claro', false, -13.431674599999999, -56.7138797);
INSERT INTO cities VALUES (2631, 17, 'São José do Xingu', false, -10.8000808, -52.743577799999997);
INSERT INTO cities VALUES (2632, 17, 'São José dos Quatro Marcos', false, -15.619439699999999, -58.176689199999998);
INSERT INTO cities VALUES (2633, 17, 'São Pedro da Cipa', false, -15.9946693, -54.912991300000002);
INSERT INTO cities VALUES (2634, 17, 'Sapezal', false, -12.9893871, -58.764493399999999);
INSERT INTO cities VALUES (2635, 17, 'Serra Nova Dourada', false, -11.978118800000001, -51.582469699999997);
INSERT INTO cities VALUES (2636, 17, 'Sinop', false, -11.873043900000001, -55.498178199999998);
INSERT INTO cities VALUES (2637, 17, 'Sorriso', false, -12.5586682, -55.7141296);
INSERT INTO cities VALUES (2638, 17, 'Tabaporã', false, -10.807383, -56.620478499999997);
INSERT INTO cities VALUES (2639, 17, 'Tangará da Serra', false, -14.627922999999999, -57.507016399999998);
INSERT INTO cities VALUES (2640, 17, 'Tapurah', false, -12.735892399999999, -56.500237200000001);
INSERT INTO cities VALUES (2641, 17, 'Terra Nova do Norte', false, -10.518343, -55.232204500000002);
INSERT INTO cities VALUES (2642, 17, 'Tesouro', false, -16.078569600000002, -53.556249700000002);
INSERT INTO cities VALUES (2643, 17, 'Torixoréu', false, -16.189583200000001, -52.560738000000001);
INSERT INTO cities VALUES (2644, 17, 'União do Sul', false, -11.5284154, -54.360049199999999);
INSERT INTO cities VALUES (2645, 17, 'Vale de São Domingos', false, -15.284630699999999, -59.078605000000003);
INSERT INTO cities VALUES (2646, 17, 'Várzea Grande', false, -15.6477954, -56.133186299999998);
INSERT INTO cities VALUES (2647, 17, 'Vera', false, -12.314412000000001, -55.317538900000002);
INSERT INTO cities VALUES (2648, 17, 'Vila Bela da Santíssima Trindade', false, -15.004190899999999, -59.947886599999997);
INSERT INTO cities VALUES (2649, 17, 'Vila Rica', false, -10.0118095, -51.113638899999998);
INSERT INTO cities VALUES (2650, 17, 'Cuiabá', true, -15.5989173, -56.094893999999996);
INSERT INTO cities VALUES (2651, 18, 'Água Clara', false, -21.885981000000001, -54.155880000000003);
INSERT INTO cities VALUES (2652, 18, 'Alcinópolis', false, -18.318131099999999, -53.702628300000001);
INSERT INTO cities VALUES (2653, 18, 'Amambaí', false, -23.102914800000001, -55.220939700000002);
INSERT INTO cities VALUES (2654, 18, 'Anastácio', false, -20.498973100000001, -55.8181321);
INSERT INTO cities VALUES (2655, 18, 'Anaurilândia', false, -22.169330899999999, -52.727012199999997);
INSERT INTO cities VALUES (2656, 18, 'Angélica', false, -22.151851799999999, -53.773362599999999);
INSERT INTO cities VALUES (2657, 18, 'Antônio João', false, -23.25, -55.516666999999998);
INSERT INTO cities VALUES (2658, 18, 'Aparecida do Taboado', false, -20.0889758, -51.102976400000003);
INSERT INTO cities VALUES (2659, 18, 'Aquidauana', false, -20.4749181, -55.786274800000001);
INSERT INTO cities VALUES (2660, 18, 'Aral Moreira', false, -22.928524100000001, -55.626044399999998);
INSERT INTO cities VALUES (2661, 18, 'Bandeirantes', false, -19.9187695, -54.367926900000001);
INSERT INTO cities VALUES (2662, 18, 'Bataguassu', false, -21.712443400000002, -52.428015799999997);
INSERT INTO cities VALUES (2663, 18, 'Bataiporã', false, -22.289720599999999, -53.280259100000002);
INSERT INTO cities VALUES (2664, 18, 'Bela Vista', false, -21.633333, -54.616667);
INSERT INTO cities VALUES (2665, 18, 'Bodoquena', false, -20.518984499999998, -56.721702200000003);
INSERT INTO cities VALUES (2666, 18, 'Bonito', false, -21.1312979, -56.480140900000002);
INSERT INTO cities VALUES (2667, 18, 'Brasilândia', false, -21.256391099999998, -52.0415159);
INSERT INTO cities VALUES (2668, 18, 'Caarapó', false, -22.629786800000002, -54.825267599999997);
INSERT INTO cities VALUES (2669, 18, 'Camapuã', false, -19.527110100000002, -54.042074800000002);
INSERT INTO cities VALUES (2670, 18, 'Caracol', false, -22.216667000000001, -56.816667000000002);
INSERT INTO cities VALUES (2671, 18, 'Cassilândia', false, -19.119066799999999, -51.737694599999998);
INSERT INTO cities VALUES (2672, 18, 'Chapadão do Sul', false, -18.7788884, -52.616501999999997);
INSERT INTO cities VALUES (2673, 18, 'Corguinho', false, -19.8325399, -54.829309299999998);
INSERT INTO cities VALUES (2674, 18, 'Coronel Sapucaia', false, -23.2528063, -55.517964999999997);
INSERT INTO cities VALUES (2675, 18, 'Corumbá', false, -19.0098229, -57.654744600000001);
INSERT INTO cities VALUES (2676, 18, 'Costa Rica', false, -23.416667, -54.649999999999999);
INSERT INTO cities VALUES (2677, 18, 'Coxim', false, -18.489121000000001, -54.753727900000001);
INSERT INTO cities VALUES (2678, 18, 'Deodápolis', false, -22.277620899999999, -54.165929400000003);
INSERT INTO cities VALUES (2679, 18, 'Dois Irmãos do Buriti', false, -20.680100100000001, -55.285107600000003);
INSERT INTO cities VALUES (2680, 18, 'Douradina', false, -22.036829900000001, -54.611687199999999);
INSERT INTO cities VALUES (2681, 18, 'Dourados', false, -22.221815800000002, -54.806415000000001);
INSERT INTO cities VALUES (2682, 18, 'Eldorado', false, -23.787981599999998, -54.282855599999998);
INSERT INTO cities VALUES (2683, 18, 'Fátima do Sul', false, -22.374357100000001, -54.514438800000001);
INSERT INTO cities VALUES (2684, 18, 'Figueirão', false, -18.681850000000001, -53.642738000000001);
INSERT INTO cities VALUES (2685, 18, 'Glória de Dourados', false, -22.416491099999998, -54.2376863);
INSERT INTO cities VALUES (2686, 18, 'Guia Lopes da Laguna', false, -21.4488308, -56.104504900000002);
INSERT INTO cities VALUES (2687, 18, 'Iguatemi', false, -23.800000000000001, -55.299999999999997);
INSERT INTO cities VALUES (2688, 18, 'Inocência', false, -19.717922399999999, -51.920910399999997);
INSERT INTO cities VALUES (2689, 18, 'Itaporã', false, -22.082076499999999, -54.788940400000001);
INSERT INTO cities VALUES (2690, 18, 'Itaquiraí', false, -23.475515099999999, -54.189286899999999);
INSERT INTO cities VALUES (2691, 18, 'Ivinhema', false, -22.313898099999999, -53.817616399999999);
INSERT INTO cities VALUES (2692, 18, 'Japorã', false, -23.842420199999999, -54.431470699999998);
INSERT INTO cities VALUES (2693, 18, 'Jaraguari', false, -20.134934900000001, -54.444850000000002);
INSERT INTO cities VALUES (2694, 18, 'Jardim', false, -21.475517799999999, -56.149482200000001);
INSERT INTO cities VALUES (2695, 18, 'Jateí', false, -22.546277700000001, -54.154264300000001);
INSERT INTO cities VALUES (2696, 18, 'Juti', false, -22.859612200000001, -54.601541099999999);
INSERT INTO cities VALUES (2697, 18, 'Ladário', false, -19.005666000000002, -57.601508299999999);
INSERT INTO cities VALUES (2698, 18, 'Laguna Carapã', false, -22.542256600000002, -55.156927199999998);
INSERT INTO cities VALUES (2699, 18, 'Maracaju', false, -21.618877099999999, -55.167327999999998);
INSERT INTO cities VALUES (2700, 18, 'Miranda', false, -20.242856799999998, -56.363984299999998);
INSERT INTO cities VALUES (2701, 18, 'Mundo Novo', false, -23.941202000000001, -54.273634199999996);
INSERT INTO cities VALUES (2702, 18, 'Naviraí', false, -23.065178, -54.190625400000002);
INSERT INTO cities VALUES (2703, 18, 'Nioaque', false, -21.127031800000001, -55.832099200000002);
INSERT INTO cities VALUES (2704, 18, 'Nova Alvorada do Sul', false, -21.464327999999998, -54.3842079);
INSERT INTO cities VALUES (2705, 18, 'Nova Andradina', false, -22.235088300000001, -53.331707199999997);
INSERT INTO cities VALUES (2706, 18, 'Novo Horizonte do Sul', false, -22.614049000000001, -53.806203400000001);
INSERT INTO cities VALUES (2707, 18, 'Paranaíba', false, -19.672488099999999, -51.195836700000001);
INSERT INTO cities VALUES (2708, 18, 'Paranhos', false, -23.875437099999999, -55.426506799999999);
INSERT INTO cities VALUES (2709, 18, 'Pedro Gomes', false, -18.1000412, -54.547951599999998);
INSERT INTO cities VALUES (2710, 18, 'Ponta Porã', false, -22.536542799999999, -55.726657500000002);
INSERT INTO cities VALUES (2711, 18, 'Porto Murtinho', false, -21.671883999999999, -57.881422499999999);
INSERT INTO cities VALUES (2712, 18, 'Ribas do Rio Pardo', false, -20.443317700000001, -53.760005900000003);
INSERT INTO cities VALUES (2713, 18, 'Rio Brilhante', false, -21.802274499999999, -54.543601000000002);
INSERT INTO cities VALUES (2714, 18, 'Rio Negro', false, -19.448579299999999, -54.989362100000001);
INSERT INTO cities VALUES (2715, 18, 'Rio Verde de Mato Grosso', false, -18.920356099999999, -54.843664699999998);
INSERT INTO cities VALUES (2716, 18, 'Rochedo', false, -19.948698100000001, -54.8802789);
INSERT INTO cities VALUES (2717, 18, 'Santa Rita do Pardo', false, -21.303811, -52.832275000000003);
INSERT INTO cities VALUES (2718, 18, 'São Gabriel do Oeste', false, -19.3936183, -54.563496399999998);
INSERT INTO cities VALUES (2719, 18, 'Selvíria', false, -20.369580899999999, -51.419119199999997);
INSERT INTO cities VALUES (2720, 18, 'Sete Quedas', false, -23.960835599999999, -55.0379778);
INSERT INTO cities VALUES (2721, 18, 'Sidrolândia', false, -20.931552700000001, -54.9695046);
INSERT INTO cities VALUES (2722, 18, 'Sonora', false, -17.576111000000001, -54.762500000000003);
INSERT INTO cities VALUES (2723, 18, 'Tacuru', false, -23.623962800000001, -55.020423399999999);
INSERT INTO cities VALUES (2724, 18, 'Taquarussu', false, -22.488551999999999, -53.351894199999997);
INSERT INTO cities VALUES (2725, 18, 'Terenos', false, -20.438325599999999, -54.856801300000001);
INSERT INTO cities VALUES (2726, 18, 'Três Lagoas', false, -20.759840499999999, -51.695092199999998);
INSERT INTO cities VALUES (2727, 18, 'Vicentina', false, -22.4072025, -54.4356115);
INSERT INTO cities VALUES (2728, 18, 'Campo Grande', true, -20.443505300000002, -54.647759100000002);
INSERT INTO cities VALUES (2729, 19, 'Abadia de Goiás', false, -16.758926200000001, -49.437908899999996);
INSERT INTO cities VALUES (2730, 19, 'Abadiânia', false, -16.194118499999998, -48.700131800000001);
INSERT INTO cities VALUES (2731, 19, 'Acreúna', false, -17.378793600000002, -50.388491500000001);
INSERT INTO cities VALUES (2732, 19, 'Adelândia', false, -16.394256200000001, -50.168019700000002);
INSERT INTO cities VALUES (2733, 19, 'Água Fria de Goiás', false, -14.986560000000001, -47.785382200000001);
INSERT INTO cities VALUES (2734, 19, 'Água Limpa', false, -17.100000000000001, -50.116667);
INSERT INTO cities VALUES (2735, 19, 'Águas Lindas de Goiás', false, -15.7713745, -48.248810900000002);
INSERT INTO cities VALUES (2736, 19, 'Alexânia', false, -16.078333300000001, -48.5096493);
INSERT INTO cities VALUES (2737, 19, 'Aloândia', false, -17.716314000000001, -49.484210500000003);
INSERT INTO cities VALUES (2738, 19, 'Alto Horizonte', false, -14.185475500000001, -49.331916700000001);
INSERT INTO cities VALUES (2739, 19, 'Alto Paraíso de Goiás', false, -14.1335555, -47.521516800000001);
INSERT INTO cities VALUES (2740, 19, 'Alvorada do Norte', false, -14.479746, -46.4941715);
INSERT INTO cities VALUES (2741, 19, 'Amaralina', false, -13.915958399999999, -49.292560899999998);
INSERT INTO cities VALUES (2742, 19, 'Americano do Brasil', false, -16.252576000000001, -49.992489300000003);
INSERT INTO cities VALUES (2743, 19, 'Amorinópolis', false, -16.6181451, -51.088569999999997);
INSERT INTO cities VALUES (2744, 19, 'Anápolis', false, -16.3287035, -48.953397699999996);
INSERT INTO cities VALUES (2745, 19, 'Anhanguera', false, -18.332951399999999, -48.222981699999998);
INSERT INTO cities VALUES (2746, 19, 'Anicuns', false, -16.458332899999998, -49.970018600000003);
INSERT INTO cities VALUES (2747, 19, 'Aparecida de Goiânia', false, -16.8229629, -49.242183699999998);
INSERT INTO cities VALUES (2748, 19, 'Aparecida do Rio Doce', false, -18.295535300000001, -51.138400599999997);
INSERT INTO cities VALUES (2749, 19, 'Aporé', false, -18.948988799999999, -51.908812099999999);
INSERT INTO cities VALUES (2750, 19, 'Araçu', false, -16.356394099999999, -49.687898500000003);
INSERT INTO cities VALUES (2751, 19, 'Aragarças', false, -15.897294799999999, -52.230079400000001);
INSERT INTO cities VALUES (2752, 19, 'Aragoiânia', false, -16.907533900000001, -49.433515200000002);
INSERT INTO cities VALUES (2753, 19, 'Araguapaz', false, -15.0808258, -50.632959700000001);
INSERT INTO cities VALUES (2754, 19, 'Arenópolis', false, -16.379106100000001, -51.568852399999997);
INSERT INTO cities VALUES (2755, 19, 'Aruanã', false, -14.9242673, -51.077055199999997);
INSERT INTO cities VALUES (2756, 19, 'Aurilândia', false, -16.678993699999999, -50.456016200000001);
INSERT INTO cities VALUES (2757, 19, 'Avelinópolis', false, -16.456497299999999, -49.764972299999997);
INSERT INTO cities VALUES (2758, 19, 'Baliza', false, -16.181015200000001, -52.542874900000001);
INSERT INTO cities VALUES (2759, 19, 'Barro Alto', false, -14.968449700000001, -48.9201446);
INSERT INTO cities VALUES (2760, 19, 'Bela Vista de Goiás', false, -16.973239199999998, -48.959625299999999);
INSERT INTO cities VALUES (2761, 19, 'Bom Jardim de Goiás', false, -16.186717999999999, -52.170452699999998);
INSERT INTO cities VALUES (2762, 19, 'Bom Jesus de Goiás', false, -18.203029300000001, -49.734053299999999);
INSERT INTO cities VALUES (2763, 19, 'Bonfinópolis', false, -16.617329699999999, -48.959923400000001);
INSERT INTO cities VALUES (2764, 19, 'Bonópolis', false, -13.615266099999999, -49.807273600000002);
INSERT INTO cities VALUES (2765, 19, 'Brazabrantes', false, -16.429622999999999, -49.3869908);
INSERT INTO cities VALUES (2766, 19, 'Britânia', false, -15.2414834, -51.161355399999998);
INSERT INTO cities VALUES (2767, 19, 'Buriti Alegre', false, -18.151613699999999, -49.043446699999997);
INSERT INTO cities VALUES (2768, 19, 'Buriti de Goiás', false, -16.162337699999998, -50.436839900000003);
INSERT INTO cities VALUES (2769, 19, 'Buritinópolis', false, -14.4748661, -46.415106000000002);
INSERT INTO cities VALUES (2770, 19, 'Cabeceiras', false, -15.7960853, -46.926954100000003);
INSERT INTO cities VALUES (2771, 19, 'Cachoeira Alta', false, -18.751386499999999, -50.922895400000002);
INSERT INTO cities VALUES (2772, 19, 'Cachoeira de Goiás', false, -16.6425372, -50.635365200000003);
INSERT INTO cities VALUES (2773, 19, 'Cachoeira Dourada', false, -18.476807000000001, -49.493107500000001);
INSERT INTO cities VALUES (2774, 19, 'Caçu', false, -18.5552703, -51.135041200000003);
INSERT INTO cities VALUES (2775, 19, 'Caiapônia', false, -16.953941700000001, -51.815929300000001);
INSERT INTO cities VALUES (2776, 19, 'Caldas Novas', false, -17.7451911, -48.625262900000003);
INSERT INTO cities VALUES (2777, 19, 'Caldazinha', false, -16.704715, -48.995377900000001);
INSERT INTO cities VALUES (2778, 19, 'Campestre de Goiás', false, -16.7380906, -49.696607499999999);
INSERT INTO cities VALUES (2779, 19, 'Campinaçu', false, -13.779412000000001, -48.574801999999998);
INSERT INTO cities VALUES (2780, 19, 'Campinorte', false, -14.3158484, -49.147391800000001);
INSERT INTO cities VALUES (2781, 19, 'Campo Alegre de Goiás', false, -17.636695499999998, -47.777163000000002);
INSERT INTO cities VALUES (2782, 19, 'Campo Limpo de Goiás', false, -16.291329099999999, -49.082234499999998);
INSERT INTO cities VALUES (2783, 19, 'Campos Belos', false, -13.025218499999999, -46.765082700000001);
INSERT INTO cities VALUES (2784, 19, 'Campos Verdes', false, -14.258680200000001, -49.656692900000003);
INSERT INTO cities VALUES (2785, 19, 'Carmo do Rio Verde', false, -15.357169900000001, -49.699401399999999);
INSERT INTO cities VALUES (2786, 19, 'Castelândia', false, -18.064513699999999, -50.203845999999999);
INSERT INTO cities VALUES (2787, 19, 'Catalão', false, -18.172114400000002, -47.941506400000002);
INSERT INTO cities VALUES (2788, 19, 'Caturaí', false, -16.425858699999999, -49.499187499999998);
INSERT INTO cities VALUES (2789, 19, 'Cavalcante', false, -13.797611099999999, -47.4554987);
INSERT INTO cities VALUES (2790, 19, 'Ceres', false, -15.313619900000001, -49.603268700000001);
INSERT INTO cities VALUES (2791, 19, 'Cezarina', false, -17.0034025, -49.771263599999997);
INSERT INTO cities VALUES (2792, 19, 'Chapadão do Céu', false, -18.421767299999999, -52.552872700000002);
INSERT INTO cities VALUES (2793, 19, 'Cidade Ocidental', false, -16.1053216, -47.9499876);
INSERT INTO cities VALUES (2794, 19, 'Cocalzinho de Goiás', false, -15.7945996, -48.776131399999997);
INSERT INTO cities VALUES (2795, 19, 'Colinas do Sul', false, -14.1464616, -48.0718934);
INSERT INTO cities VALUES (2796, 19, 'Córrego do Ouro', false, -16.272362900000001, -50.552942899999998);
INSERT INTO cities VALUES (2797, 19, 'Corumbá de Goiás', false, -15.9241651, -48.808794900000002);
INSERT INTO cities VALUES (2798, 19, 'Corumbaíba', false, -18.1433198, -48.558985499999999);
INSERT INTO cities VALUES (2799, 19, 'Cristalina', false, -16.767929200000001, -47.6131058);
INSERT INTO cities VALUES (2800, 19, 'Cristianópolis', false, -17.199496700000001, -48.704278100000003);
INSERT INTO cities VALUES (2801, 19, 'Crixás', false, -14.548682899999999, -49.964682400000001);
INSERT INTO cities VALUES (2802, 19, 'Cromínia', false, -17.289315500000001, -49.380341799999997);
INSERT INTO cities VALUES (2803, 19, 'Cumari', false, -18.263934299999999, -48.148470000000003);
INSERT INTO cities VALUES (2804, 19, 'Damianópolis', false, -14.563432000000001, -46.180096499999998);
INSERT INTO cities VALUES (2805, 19, 'Damolândia', false, -16.238748300000001, -49.357666100000003);
INSERT INTO cities VALUES (2806, 19, 'Davinópolis', false, -18.140277099999999, -47.548011700000004);
INSERT INTO cities VALUES (2807, 19, 'Diorama', false, -16.230649199999998, -51.244848099999999);
INSERT INTO cities VALUES (2808, 19, 'Divinópolis de Goiás', false, -13.2755504, -46.391570600000001);
INSERT INTO cities VALUES (2809, 19, 'Doverlândia', false, -16.6986536, -52.318925800000002);
INSERT INTO cities VALUES (2810, 19, 'Edealina', false, -17.4071903, -49.669146900000001);
INSERT INTO cities VALUES (2811, 19, 'Edéia', false, -17.326241499999998, -49.9226223);
INSERT INTO cities VALUES (2812, 19, 'Estrela do Norte', false, -13.8763766, -49.066856399999999);
INSERT INTO cities VALUES (2813, 19, 'Faina', false, -15.4409679, -50.354191800000002);
INSERT INTO cities VALUES (2814, 19, 'Fazenda Nova', false, -16.186395000000001, -50.775576100000002);
INSERT INTO cities VALUES (2815, 19, 'Firminópolis', false, -16.582496599999999, -50.302368000000001);
INSERT INTO cities VALUES (2816, 19, 'Flores de Goiás', false, -14.438314800000001, -47.048747200000001);
INSERT INTO cities VALUES (2817, 19, 'Formosa', false, -15.5369723, -47.335727300000002);
INSERT INTO cities VALUES (2818, 19, 'Formoso', false, -13.646059899999999, -48.887138800000002);
INSERT INTO cities VALUES (2819, 19, 'Gameleira de Goiás', false, -16.463222699999999, -48.645426);
INSERT INTO cities VALUES (2820, 19, 'Goianápolis', false, -16.5076921, -49.022196600000001);
INSERT INTO cities VALUES (2821, 19, 'Goiandira', false, -18.135145900000001, -48.084702299999996);
INSERT INTO cities VALUES (2822, 19, 'Goianésia', false, -15.325911899999999, -49.117287599999997);
INSERT INTO cities VALUES (2823, 19, 'Goianira', false, -16.505634199999999, -49.4202072);
INSERT INTO cities VALUES (2824, 19, 'Goiás', false, -15.9224663, -50.137902400000002);
INSERT INTO cities VALUES (2825, 19, 'Goiatuba', false, -18.010991400000002, -49.369509499999999);
INSERT INTO cities VALUES (2826, 19, 'Gouvelândia', false, -18.450015499999999, -50.066706099999998);
INSERT INTO cities VALUES (2827, 19, 'Guapó', false, -16.832346300000001, -49.538179700000001);
INSERT INTO cities VALUES (2828, 19, 'Guaraíta', false, -15.7542049, -50.010279300000001);
INSERT INTO cities VALUES (2829, 19, 'Guarani de Goiás', false, -13.929459400000001, -46.477194400000002);
INSERT INTO cities VALUES (2830, 19, 'Guarinos', false, -14.7124021, -49.7004351);
INSERT INTO cities VALUES (2831, 19, 'Heitoraí', false, -15.7185401, -49.815080899999998);
INSERT INTO cities VALUES (2832, 19, 'Hidrolândia', false, -16.968018499999999, -49.231667000000002);
INSERT INTO cities VALUES (2833, 19, 'Hidrolina', false, -14.722905600000001, -49.467028599999999);
INSERT INTO cities VALUES (2834, 19, 'Iaciara', false, -14.092203899999999, -46.633489699999998);
INSERT INTO cities VALUES (2835, 19, 'Inaciolândia', false, -18.470185699999998, -49.987045700000003);
INSERT INTO cities VALUES (2836, 19, 'Indiara', false, -17.1405806, -49.981043300000003);
INSERT INTO cities VALUES (2837, 19, 'Inhumas', false, -16.3552915, -49.493058300000001);
INSERT INTO cities VALUES (2838, 19, 'Ipameri', false, -17.724737000000001, -48.159751800000002);
INSERT INTO cities VALUES (2839, 19, 'Ipiranga de Goiás', false, -15.1668631, -49.671304800000001);
INSERT INTO cities VALUES (2840, 19, 'Iporá', false, -16.441303300000001, -51.119563800000002);
INSERT INTO cities VALUES (2841, 19, 'Israelândia', false, -16.301091199999998, -50.9196612);
INSERT INTO cities VALUES (2842, 19, 'Itaberaí', false, -16.008412400000001, -49.796178500000003);
INSERT INTO cities VALUES (2843, 19, 'Itaguari', false, -15.919281399999999, -49.599229999999999);
INSERT INTO cities VALUES (2844, 19, 'Itaguaru', false, -15.758277700000001, -49.632700900000003);
INSERT INTO cities VALUES (2845, 19, 'Itajá', false, -19.067148100000001, -51.547931200000001);
INSERT INTO cities VALUES (2846, 19, 'Itapaci', false, -14.9517264, -49.548574600000002);
INSERT INTO cities VALUES (2847, 19, 'Itapirapuã', false, -15.825028, -50.601516199999999);
INSERT INTO cities VALUES (2848, 19, 'Itapuranga', false, -15.5382041, -49.934848299999999);
INSERT INTO cities VALUES (2849, 19, 'Itarumã', false, -18.764726499999998, -51.357556199999998);
INSERT INTO cities VALUES (2850, 19, 'Itauçu', false, -16.194720499999999, -49.614501699999998);
INSERT INTO cities VALUES (2851, 19, 'Itumbiara', false, -18.421614399999999, -49.215521500000001);
INSERT INTO cities VALUES (2852, 19, 'Ivolândia', false, -16.5479564, -50.813851100000001);
INSERT INTO cities VALUES (2853, 19, 'Jandaia', false, -17.030483799999999, -50.134346999999998);
INSERT INTO cities VALUES (2854, 19, 'Jaraguá', false, -15.742008200000001, -49.334933900000003);
INSERT INTO cities VALUES (2855, 19, 'Jataí', false, -17.875903399999999, -51.721443100000002);
INSERT INTO cities VALUES (2856, 19, 'Jaupaci', false, -16.1781297, -50.937128100000002);
INSERT INTO cities VALUES (2857, 19, 'Jesúpolis', false, -15.938000000000001, -49.380537599999997);
INSERT INTO cities VALUES (2858, 19, 'Joviânia', false, -17.805537999999999, -49.614884500000002);
INSERT INTO cities VALUES (2859, 19, 'Jussara', false, -15.858636499999999, -50.869143899999997);
INSERT INTO cities VALUES (2860, 19, 'Lagoa Santa', false, -19.1597148, -51.393924499999997);
INSERT INTO cities VALUES (2861, 19, 'Leopoldo de Bulhões', false, -16.614705099999998, -48.740437999999997);
INSERT INTO cities VALUES (2862, 19, 'Luziânia', false, -16.2344972, -47.916694700000001);
INSERT INTO cities VALUES (2863, 19, 'Mairipotaba', false, -17.281080200000002, -49.4930655);
INSERT INTO cities VALUES (2864, 19, 'Mambaí', false, -14.4859597, -46.104508899999999);
INSERT INTO cities VALUES (2865, 19, 'Mara Rosa', false, -14.017366000000001, -49.1749394);
INSERT INTO cities VALUES (2866, 19, 'Marzagão', false, -17.97578, -48.646188600000002);
INSERT INTO cities VALUES (2867, 19, 'Matrinchã', false, -15.4351451, -50.733952100000003);
INSERT INTO cities VALUES (2868, 19, 'Maurilândia', false, -18.0013732, -50.314051599999999);
INSERT INTO cities VALUES (2869, 19, 'Mimoso de Goiás', false, -15.0579576, -48.159078800000003);
INSERT INTO cities VALUES (2870, 19, 'Minaçu', false, -13.5636326, -48.222118299999998);
INSERT INTO cities VALUES (2871, 19, 'Mineiros', false, -17.578652300000002, -52.542390400000002);
INSERT INTO cities VALUES (2872, 19, 'Moiporá', false, -16.546259500000001, -50.745085699999997);
INSERT INTO cities VALUES (2873, 19, 'Monte Alegre de Goiás', false, -13.243869999999999, -47.157840999999998);
INSERT INTO cities VALUES (2874, 19, 'Montes Claros de Goiás', false, -16.008330000000001, -51.390079499999999);
INSERT INTO cities VALUES (2875, 19, 'Montividiu', false, -17.4446151, -51.173712600000002);
INSERT INTO cities VALUES (2876, 19, 'Montividiu do Norte', false, -13.1133919, -48.607444999999998);
INSERT INTO cities VALUES (2877, 19, 'Morrinhos', false, -17.7211499, -49.108088000000002);
INSERT INTO cities VALUES (2878, 19, 'Morro Agudo de Goiás', false, -15.316424, -50.045648499999999);
INSERT INTO cities VALUES (2879, 19, 'Mossâmedes', false, -16.110520900000001, -50.2227994);
INSERT INTO cities VALUES (2880, 19, 'Mozarlândia', false, -14.7387686, -50.540035400000001);
INSERT INTO cities VALUES (2881, 19, 'Mundo Novo', false, -13.7524788, -50.283391899999998);
INSERT INTO cities VALUES (2882, 19, 'Mutunópolis', false, -13.7328306, -49.278837500000002);
INSERT INTO cities VALUES (2883, 19, 'Nazário', false, -16.586291599999999, -49.892466400000004);
INSERT INTO cities VALUES (2884, 19, 'Nerópolis', false, -16.406321299999998, -49.218744600000001);
INSERT INTO cities VALUES (2885, 19, 'Niquelândia', false, -14.457750300000001, -48.466261600000003);
INSERT INTO cities VALUES (2886, 19, 'Nova América', false, -15.009605000000001, -49.900562999999998);
INSERT INTO cities VALUES (2887, 19, 'Nova Aurora', false, -18.0577942, -48.255133200000003);
INSERT INTO cities VALUES (2888, 19, 'Nova Crixás', false, -14.1047893, -50.339737900000003);
INSERT INTO cities VALUES (2889, 19, 'Nova Glória', false, -15.139575199999999, -49.575271200000003);
INSERT INTO cities VALUES (2890, 19, 'Nova Iguaçu de Goiás', false, -14.2787848, -49.378621199999998);
INSERT INTO cities VALUES (2891, 19, 'Nova Roma', false, -13.740296799999999, -46.881194800000003);
INSERT INTO cities VALUES (2892, 19, 'Nova Veneza', false, -16.3788339, -49.326789300000002);
INSERT INTO cities VALUES (2893, 19, 'Novo Brasil', false, -16.035353600000001, -50.705795299999998);
INSERT INTO cities VALUES (2894, 19, 'Novo Gama', false, -16.053766199999998, -48.029719999999998);
INSERT INTO cities VALUES (2895, 19, 'Novo Planalto', false, -13.221507799999999, -49.506717000000002);
INSERT INTO cities VALUES (2896, 19, 'Orizona', false, -17.030411900000001, -48.290726999999997);
INSERT INTO cities VALUES (2897, 19, 'Ouro Verde de Goiás', false, -16.209383500000001, -49.185139999999997);
INSERT INTO cities VALUES (2898, 19, 'Ouvidor', false, -18.236554900000002, -47.842627899999997);
INSERT INTO cities VALUES (2899, 19, 'Padre Bernardo', false, -15.354520000000001, -48.510632000000001);
INSERT INTO cities VALUES (2900, 19, 'Palestina de Goiás', false, -16.732969499999999, -51.533990099999997);
INSERT INTO cities VALUES (2901, 19, 'Palmeiras de Goiás', false, -16.789518300000001, -49.932654100000001);
INSERT INTO cities VALUES (2902, 19, 'Palmelo', false, -17.324716800000001, -48.425446600000001);
INSERT INTO cities VALUES (2903, 19, 'Palminópolis', false, -16.7964688, -50.162588599999999);
INSERT INTO cities VALUES (2904, 19, 'Panamá', false, -18.164676199999999, -49.288139299999997);
INSERT INTO cities VALUES (2905, 19, 'Paranaiguara', false, -18.908827800000001, -50.646452099999998);
INSERT INTO cities VALUES (2906, 19, 'Paraúna', false, -16.9483347, -50.464225900000002);
INSERT INTO cities VALUES (2907, 19, 'Perolândia', false, -17.5242273, -52.049108199999999);
INSERT INTO cities VALUES (2908, 19, 'Petrolina de Goiás', false, -16.095531699999999, -49.336770700000002);
INSERT INTO cities VALUES (2909, 19, 'Pilar de Goiás', false, -14.761323600000001, -49.570004300000001);
INSERT INTO cities VALUES (2910, 19, 'Piracanjuba', false, -17.2964044, -49.010527400000001);
INSERT INTO cities VALUES (2911, 19, 'Piranhas', false, -16.4165177, -51.810532000000002);
INSERT INTO cities VALUES (2912, 19, 'Pirenópolis', false, -15.8538035, -48.958553700000003);
INSERT INTO cities VALUES (2913, 19, 'Pires do Rio', false, -17.300594, -48.283581599999998);
INSERT INTO cities VALUES (2914, 19, 'Planaltina', false, -15.4839345, -47.639318199999998);
INSERT INTO cities VALUES (2915, 19, 'Pontalina', false, -17.520164300000001, -49.444174699999998);
INSERT INTO cities VALUES (2916, 19, 'Porangatu', false, -13.4311694, -49.142810099999998);
INSERT INTO cities VALUES (2917, 19, 'Porteirão', false, -17.8154088, -50.164934100000004);
INSERT INTO cities VALUES (2918, 19, 'Portelândia', false, -17.357545200000001, -52.674420599999998);
INSERT INTO cities VALUES (2919, 19, 'Posse', false, -14.0821153, -46.377813000000003);
INSERT INTO cities VALUES (2920, 19, 'Professor Jamil', false, -17.2512717, -49.236567700000002);
INSERT INTO cities VALUES (2921, 19, 'Quirinópolis', false, -18.448215600000001, -50.4466386);
INSERT INTO cities VALUES (2922, 19, 'Rialma', false, -15.320054900000001, -49.575424499999997);
INSERT INTO cities VALUES (2923, 19, 'Rianápolis', false, -15.4466366, -49.506007400000001);
INSERT INTO cities VALUES (2924, 19, 'Rio Quente', false, -17.779555899999998, -48.768135899999997);
INSERT INTO cities VALUES (2925, 19, 'Rio Verde', false, -17.797198999999999, -50.900009799999999);
INSERT INTO cities VALUES (2926, 19, 'Rubiataba', false, -15.164037799999999, -49.799277600000003);
INSERT INTO cities VALUES (2927, 19, 'Sanclerlândia', false, -16.200693099999999, -50.312360200000001);
INSERT INTO cities VALUES (2928, 19, 'Santa Bárbara de Goiás', false, -16.568412899999998, -49.6919611);
INSERT INTO cities VALUES (2929, 19, 'Santa Cruz de Goiás', false, -17.316968599999999, -48.480891900000003);
INSERT INTO cities VALUES (2930, 19, 'Santa Fé de Goiás', false, -15.7537226, -51.0989261);
INSERT INTO cities VALUES (2931, 19, 'Santa Helena de Goiás', false, -17.822995899999999, -50.588347800000001);
INSERT INTO cities VALUES (2932, 19, 'Santa Isabel', false, -15.289294099999999, -49.420194500000001);
INSERT INTO cities VALUES (2933, 19, 'Santa Rita do Araguaia', false, -17.329880899999999, -53.202902700000003);
INSERT INTO cities VALUES (2934, 19, 'Santa Rita do Novo Destino', false, -15.1360311, -49.114671199999997);
INSERT INTO cities VALUES (2935, 19, 'Santa Rosa de Goiás', false, -16.068041300000001, -49.484915600000001);
INSERT INTO cities VALUES (2936, 19, 'Santa Tereza de Goiás', false, -13.7131139, -49.0192178);
INSERT INTO cities VALUES (2937, 19, 'Santa Terezinha de Goiás', false, -14.4324189, -49.714634599999997);
INSERT INTO cities VALUES (2938, 19, 'Santo Antônio da Barra', false, -17.540715599999999, -50.641977500000003);
INSERT INTO cities VALUES (2939, 19, 'Santo Antônio de Goiás', false, -16.485536400000001, -49.308945399999999);
INSERT INTO cities VALUES (2940, 19, 'Santo Antônio do Descoberto', false, -15.943715299999999, -48.259569300000003);
INSERT INTO cities VALUES (2941, 19, 'São Domingos', false, -13.26141, -46.733231000000004);
INSERT INTO cities VALUES (2942, 19, 'São Francisco de Goiás', false, -15.9309432, -49.2560158);
INSERT INTO cities VALUES (2943, 19, 'São João d`Aliança', false, -14.7086092, -47.521392900000002);
INSERT INTO cities VALUES (2944, 19, 'São João da Paraúna', false, -16.815442300000001, -50.410705200000002);
INSERT INTO cities VALUES (2945, 19, 'São Luís de Montes Belos', false, -16.522159200000001, -50.380107299999999);
INSERT INTO cities VALUES (2946, 19, 'São Luíz do Norte', false, -14.863495500000001, -49.329296999999997);
INSERT INTO cities VALUES (2947, 19, 'São Miguel do Araguaia', false, -13.266015899999999, -50.154759200000001);
INSERT INTO cities VALUES (2948, 19, 'São Miguel do Passa Quatro', false, -17.057019199999999, -48.657325499999999);
INSERT INTO cities VALUES (2949, 19, 'São Patrício', false, -15.3368865, -49.818028099999999);
INSERT INTO cities VALUES (2950, 19, 'São Simão', false, -18.989451299999999, -50.542939599999997);
INSERT INTO cities VALUES (2951, 19, 'Senador Canedo', false, -16.710600800000002, -49.0866495);
INSERT INTO cities VALUES (2952, 19, 'Serranópolis', false, -18.293838300000001, -51.969503699999997);
INSERT INTO cities VALUES (2953, 19, 'Silvânia', false, -16.6430416, -48.604142099999997);
INSERT INTO cities VALUES (2954, 19, 'Simolândia', false, -14.471583000000001, -46.486427399999997);
INSERT INTO cities VALUES (2955, 19, 'Sítio d`Abadia', false, -14.807435, -46.250915499999998);
INSERT INTO cities VALUES (2956, 19, 'Taquaral de Goiás', false, -16.053093000000001, -49.612396400000002);
INSERT INTO cities VALUES (2957, 19, 'Teresina de Goiás', false, -13.779535299999999, -47.258012399999998);
INSERT INTO cities VALUES (2958, 19, 'Terezópolis de Goiás', false, -16.473505800000002, -49.079703899999998);
INSERT INTO cities VALUES (2959, 19, 'Três Ranchos', false, -18.348626500000002, -47.775516699999997);
INSERT INTO cities VALUES (2960, 19, 'Trindade', false, -16.6477787, -49.498077000000002);
INSERT INTO cities VALUES (2961, 19, 'Trombas', false, -13.508200499999999, -48.742084599999998);
INSERT INTO cities VALUES (2962, 19, 'Turvânia', false, -16.6080951, -50.123559899999997);
INSERT INTO cities VALUES (2963, 19, 'Turvelândia', false, -17.827184500000001, -50.305128000000003);
INSERT INTO cities VALUES (2964, 19, 'Uirapuru', false, -14.284534799999999, -49.917589599999999);
INSERT INTO cities VALUES (2965, 19, 'Uruaçu', false, -14.5258083, -49.1572982);
INSERT INTO cities VALUES (2966, 19, 'Uruana', false, -15.493646500000001, -49.689604600000003);
INSERT INTO cities VALUES (2967, 19, 'Urutaí', false, -17.464396900000001, -48.203474399999998);
INSERT INTO cities VALUES (2968, 19, 'Valparaíso de Goiás', false, -16.050833000000001, -47.982778000000003);
INSERT INTO cities VALUES (2969, 19, 'Varjão', false, -17.050007000000001, -49.619541699999999);
INSERT INTO cities VALUES (2970, 19, 'Vianópolis', false, -16.743434199999999, -48.514417799999997);
INSERT INTO cities VALUES (2971, 19, 'Vicentinópolis', false, -17.721818299999999, -49.791026500000001);
INSERT INTO cities VALUES (2972, 19, 'Vila Boa', false, -15.0395466, -47.057665399999998);
INSERT INTO cities VALUES (2973, 19, 'Vila Propício', false, -15.458559899999999, -48.885688399999999);
INSERT INTO cities VALUES (2974, 19, 'Goiânia', true, -16.679920299999999, -49.255031500000001);
INSERT INTO cities VALUES (2975, 20, 'Brasília', true, -15.780148199999999, -47.929169799999997);
INSERT INTO cities VALUES (2976, 21, 'Abadia dos Dourados', false, -18.486214, -47.384397399999997);
INSERT INTO cities VALUES (2977, 21, 'Abaeté', false, -19.159187299999999, -45.447704700000003);
INSERT INTO cities VALUES (2978, 21, 'Abre Campo', false, -20.299451099999999, -42.475783900000003);
INSERT INTO cities VALUES (2979, 21, 'Acaiaca', false, -20.364935899999999, -43.136718999999999);
INSERT INTO cities VALUES (2980, 21, 'Açucena', false, -19.0568554, -42.5441553);
INSERT INTO cities VALUES (2981, 21, 'Água Boa', false, -16.966667000000001, -44.283332999999999);
INSERT INTO cities VALUES (2982, 21, 'Água Comprida', false, -21.899999999999999, -45.666666999999997);
INSERT INTO cities VALUES (2983, 21, 'Aguanil', false, -20.975453999999999, -45.3713251);
INSERT INTO cities VALUES (2984, 21, 'Águas Formosas', false, -17.082062100000002, -40.9341607);
INSERT INTO cities VALUES (2985, 21, 'Águas Vermelhas', false, -15.747478299999999, -41.460935999999997);
INSERT INTO cities VALUES (2986, 21, 'Aimorés', false, -19.4927326, -41.066462199999997);
INSERT INTO cities VALUES (2987, 21, 'Aiuruoca', false, -21.929375799999999, -44.6019383);
INSERT INTO cities VALUES (2988, 21, 'Alagoa', false, -22.167808600000001, -44.6353212);
INSERT INTO cities VALUES (2989, 21, 'Albertina', false, -22.1994775, -46.614264599999998);
INSERT INTO cities VALUES (2990, 21, 'Além Paraíba', false, -21.8637044, -42.6688677);
INSERT INTO cities VALUES (2991, 21, 'Alfenas', false, -21.429435300000002, -45.947122499999999);
INSERT INTO cities VALUES (2992, 21, 'Alfredo Vasconcelos', false, -21.1378457, -43.764446800000002);
INSERT INTO cities VALUES (2993, 21, 'Almenara', false, -16.188682, -40.687973100000001);
INSERT INTO cities VALUES (2994, 21, 'Alpercata', false, -18.977128199999999, -41.983041900000003);
INSERT INTO cities VALUES (2995, 21, 'Alpinópolis', false, -20.856148900000001, -46.382410900000004);
INSERT INTO cities VALUES (2996, 21, 'Alterosa', false, -21.249392100000001, -46.139770400000003);
INSERT INTO cities VALUES (2997, 21, 'Alto Caparaó', false, -20.433066100000001, -41.874665700000001);
INSERT INTO cities VALUES (2998, 21, 'Alto Jequitibá', false, -20.420853900000001, -41.958629299999998);
INSERT INTO cities VALUES (2999, 21, 'Alto Rio Doce', false, -21.026138100000001, -43.410466900000003);
INSERT INTO cities VALUES (3000, 21, 'Alvarenga', false, -19.4176538, -41.727620000000002);
INSERT INTO cities VALUES (3001, 21, 'Alvinópolis', false, -20.095487899999998, -43.044261599999999);
INSERT INTO cities VALUES (3002, 21, 'Alvorada de Minas', false, -18.718720000000001, -43.368139599999999);
INSERT INTO cities VALUES (3003, 21, 'Amparo do Serra', false, -20.495737200000001, -42.803568900000002);
INSERT INTO cities VALUES (3004, 21, 'Andradas', false, -22.067748099999999, -46.569960899999998);
INSERT INTO cities VALUES (3005, 21, 'Andrelândia', false, -21.717948700000001, -44.312310500000002);
INSERT INTO cities VALUES (3006, 21, 'Angelândia', false, -17.730032699999999, -42.252009000000001);
INSERT INTO cities VALUES (3007, 21, 'Antônio Carlos', false, -21.314550400000002, -43.751780199999999);
INSERT INTO cities VALUES (3008, 21, 'Antônio Dias', false, -16.516667000000002, -41.883333);
INSERT INTO cities VALUES (3009, 21, 'Antônio Prado de Minas', false, -21.016667000000002, -42.100000000000001);
INSERT INTO cities VALUES (3010, 21, 'Araçaí', false, -19.2051962, -44.240788100000003);
INSERT INTO cities VALUES (3011, 21, 'Aracitaba', false, -21.327279399999998, -43.3770065);
INSERT INTO cities VALUES (3012, 21, 'Araçuaí', false, -16.848585799999999, -42.065856699999998);
INSERT INTO cities VALUES (3013, 21, 'Araguari', false, -18.6509857, -48.185420299999997);
INSERT INTO cities VALUES (3014, 21, 'Arantina', false, -21.908810599999999, -44.253288599999998);
INSERT INTO cities VALUES (3015, 21, 'Araponga', false, -20.670617700000001, -42.5130962);
INSERT INTO cities VALUES (3016, 21, 'Araporã', false, -18.439746499999998, -49.187782400000003);
INSERT INTO cities VALUES (3017, 21, 'Arapuá', false, -19.0541552, -46.136182300000002);
INSERT INTO cities VALUES (3018, 21, 'Araújos', false, -20.350000000000001, -45.649999999999999);
INSERT INTO cities VALUES (3019, 21, 'Araxá', false, -19.5933855, -46.940817299999999);
INSERT INTO cities VALUES (3020, 21, 'Arceburgo', false, -21.363512400000001, -46.947468399999998);
INSERT INTO cities VALUES (3021, 21, 'Arcos', false, -20.298077800000002, -45.545732399999999);
INSERT INTO cities VALUES (3022, 21, 'Areado', false, -21.359690499999999, -46.1531138);
INSERT INTO cities VALUES (3023, 21, 'Argirita', false, -21.628625100000001, -42.830951200000001);
INSERT INTO cities VALUES (3024, 21, 'Aricanduva', false, -17.867967799999999, -42.555835600000002);
INSERT INTO cities VALUES (3025, 21, 'Arinos', false, -15.9053764, -46.108767700000001);
INSERT INTO cities VALUES (3026, 21, 'Astolfo Dutra', false, -21.3108796, -42.861850500000003);
INSERT INTO cities VALUES (3027, 21, 'Ataléia', false, -18.040979, -41.112338999999999);
INSERT INTO cities VALUES (3028, 21, 'Augusto de Lima', false, -18.111648299999999, -44.267198700000002);
INSERT INTO cities VALUES (3029, 21, 'Baependi', false, -21.959641099999999, -44.891368499999999);
INSERT INTO cities VALUES (3030, 21, 'Baldim', false, -19.271478200000001, -43.956599199999999);
INSERT INTO cities VALUES (3031, 21, 'Bambuí', false, -20.021444599999999, -45.960793600000002);
INSERT INTO cities VALUES (3032, 21, 'Bandeira', false, -15.8830686, -40.568842600000004);
INSERT INTO cities VALUES (3033, 21, 'Bandeira do Sul', false, -21.736312300000002, -46.379565499999998);
INSERT INTO cities VALUES (3034, 21, 'Barão de Cocais', false, -19.936897200000001, -43.472184400000003);
INSERT INTO cities VALUES (3035, 21, 'Barão de Monte Alto', false, -21.2385959, -42.232398600000003);
INSERT INTO cities VALUES (3036, 21, 'Barbacena', false, -21.226447, -43.7741951);
INSERT INTO cities VALUES (3037, 21, 'Barra Longa', false, -20.275894699999998, -43.041764100000002);
INSERT INTO cities VALUES (3038, 21, 'Barroso', false, -20.199999999999999, -42.516666999999998);
INSERT INTO cities VALUES (3039, 21, 'Bela Vista de Minas', false, -19.829270600000001, -43.091704300000004);
INSERT INTO cities VALUES (3040, 21, 'Belmiro Braga', false, -21.9229968, -43.402699400000003);
INSERT INTO cities VALUES (3041, 21, 'Belo Oriente', false, -19.190197099999999, -42.495354200000001);
INSERT INTO cities VALUES (3042, 21, 'Belo Vale', false, -20.407995, -44.0181817);
INSERT INTO cities VALUES (3043, 21, 'Berilo', false, -16.951802499999999, -42.4682569);
INSERT INTO cities VALUES (3044, 21, 'Berizal', false, -15.613878100000001, -41.749255900000001);
INSERT INTO cities VALUES (3045, 21, 'Bertópolis', false, -17.059754699999999, -40.570427899999999);
INSERT INTO cities VALUES (3046, 21, 'Betim', false, -19.967565700000002, -44.199142799999997);
INSERT INTO cities VALUES (3047, 21, 'Bias Fortes', false, -21.605859599999999, -43.757172099999998);
INSERT INTO cities VALUES (3048, 21, 'Bicas', false, -21.729072899999998, -43.0673143);
INSERT INTO cities VALUES (3049, 21, 'Biquinhas', false, -18.765968399999998, -45.5110241);
INSERT INTO cities VALUES (3050, 21, 'Boa Esperança', false, -21.094071899999999, -45.574571900000002);
INSERT INTO cities VALUES (3051, 21, 'Bocaina de Minas', false, -22.165582300000001, -44.393370500000003);
INSERT INTO cities VALUES (3052, 21, 'Bocaiúva', false, -17.1151546, -43.821224200000003);
INSERT INTO cities VALUES (3053, 21, 'Bom Despacho', false, -19.7371582, -45.252413799999999);
INSERT INTO cities VALUES (3054, 21, 'Bom Jardim de Minas', false, -21.947915900000002, -44.1846733);
INSERT INTO cities VALUES (3055, 21, 'Bom Jesus da Penha', false, -21.0157642, -46.523729400000001);
INSERT INTO cities VALUES (3056, 21, 'Bom Jesus do Amparo', false, -19.7004342, -43.478191799999998);
INSERT INTO cities VALUES (3057, 21, 'Bom Jesus do Galho', false, -19.829462400000001, -42.316651499999999);
INSERT INTO cities VALUES (3058, 21, 'Bom Repouso', false, -22.472269699999998, -46.146264100000003);
INSERT INTO cities VALUES (3059, 21, 'Bom Sucesso', false, -20.383333, -46.133333);
INSERT INTO cities VALUES (3060, 21, 'Bonfim', false, -20.666667, -41.833333000000003);
INSERT INTO cities VALUES (3061, 21, 'Bonfinópolis de Minas', false, -16.5673827, -45.982954300000003);
INSERT INTO cities VALUES (3062, 21, 'Bonito de Minas', false, -15.3189952, -44.767584200000002);
INSERT INTO cities VALUES (3063, 21, 'Borda da Mata', false, -22.274165, -46.165520700000002);
INSERT INTO cities VALUES (3064, 21, 'Botelhos', false, -21.641215899999999, -46.395586299999998);
INSERT INTO cities VALUES (3065, 21, 'Botumirim', false, -16.852184000000001, -43.005534699999998);
INSERT INTO cities VALUES (3066, 21, 'Brás Pires', false, -20.907067999999999, -43.2118641);
INSERT INTO cities VALUES (3067, 21, 'Brasilândia de Minas', false, -17.0193677, -46.015226499999997);
INSERT INTO cities VALUES (3068, 21, 'Brasília de Minas', false, -16.208369099999999, -44.426472599999997);
INSERT INTO cities VALUES (3069, 21, 'Brasópolis', false, -22.474475200000001, -45.610943300000002);
INSERT INTO cities VALUES (3070, 21, 'Braúnas', false, -19.056277999999999, -42.7176616);
INSERT INTO cities VALUES (3071, 21, 'Brumadinho', false, -20.118182300000001, -44.200950200000001);
INSERT INTO cities VALUES (3072, 21, 'Bueno Brandão', false, -22.440874099999998, -46.351549499999997);
INSERT INTO cities VALUES (3073, 21, 'Buenópolis', false, -17.8697774, -44.172827400000003);
INSERT INTO cities VALUES (3074, 21, 'Bugre', false, -19.407880599999999, -42.266578099999997);
INSERT INTO cities VALUES (3075, 21, 'Buritis', false, -15.621893500000001, -46.425154300000003);
INSERT INTO cities VALUES (3076, 21, 'Buritizeiro', false, -17.398052499999999, -44.999850199999997);
INSERT INTO cities VALUES (3077, 21, 'Cabeceira Grande', false, -16.030381999999999, -47.080001600000003);
INSERT INTO cities VALUES (3078, 21, 'Cabo Verde', false, -21.472084299999999, -46.3817387);
INSERT INTO cities VALUES (3079, 21, 'Cachoeira da Prata', false, -19.525235200000001, -44.4477555);
INSERT INTO cities VALUES (3080, 21, 'Cachoeira de Minas', false, -22.352443300000001, -45.7696811);
INSERT INTO cities VALUES (3081, 21, 'Cachoeira de Pajeú', false, -15.963766400000001, -41.494845699999999);
INSERT INTO cities VALUES (3082, 21, 'Cachoeira Dourada', false, -18.514882100000001, -49.5040257);
INSERT INTO cities VALUES (3083, 21, 'Caetanópolis', false, -19.2902582, -44.424494699999997);
INSERT INTO cities VALUES (3084, 21, 'Caeté', false, -19.8806665, -43.669803700000003);
INSERT INTO cities VALUES (3085, 21, 'Caiana', false, -20.695234200000002, -41.930604799999998);
INSERT INTO cities VALUES (3086, 21, 'Cajuri', false, -20.778474500000002, -42.797436599999997);
INSERT INTO cities VALUES (3087, 21, 'Caldas', false, -21.922981, -46.387417200000002);
INSERT INTO cities VALUES (3088, 21, 'Camacho', false, -20.621842999999998, -45.168658600000001);
INSERT INTO cities VALUES (3089, 21, 'Camanducaia', false, -22.755305799999999, -46.145522999999997);
INSERT INTO cities VALUES (3090, 21, 'Cambuí', false, -22.610129499999999, -46.058414999999997);
INSERT INTO cities VALUES (3091, 21, 'Cambuquira', false, -21.870152699999998, -45.317423300000002);
INSERT INTO cities VALUES (3092, 21, 'Campanário', false, -18.2384962, -41.7485584);
INSERT INTO cities VALUES (3093, 21, 'Campanha', false, -21.831700300000001, -45.407716899999997);
INSERT INTO cities VALUES (3094, 21, 'Campestre', false, -21.416667, -46.583333000000003);
INSERT INTO cities VALUES (3095, 21, 'Campina Verde', false, -19.536301000000002, -49.486817299999998);
INSERT INTO cities VALUES (3096, 21, 'Campo Azul', false, -16.491036699999999, -44.798791799999996);
INSERT INTO cities VALUES (3097, 21, 'Campo Belo', false, -20.865838799999999, -45.273201100000001);
INSERT INTO cities VALUES (3098, 21, 'Campo do Meio', false, -20.266667000000002, -46.383333);
INSERT INTO cities VALUES (3099, 21, 'Campo Florido', false, -19.766070200000001, -48.571709900000002);
INSERT INTO cities VALUES (3100, 21, 'Campos Altos', false, -19.697439800000001, -46.169052200000003);
INSERT INTO cities VALUES (3101, 21, 'Campos Gerais', false, -21.235353, -45.753238600000003);
INSERT INTO cities VALUES (3102, 21, 'Cana Verde', false, -21.014935600000001, -45.181123800000002);
INSERT INTO cities VALUES (3103, 21, 'Canaã', false, -20.677346499999999, -42.618296000000001);
INSERT INTO cities VALUES (3104, 21, 'Canápolis', false, -18.7236647, -49.170577999999999);
INSERT INTO cities VALUES (3105, 21, 'Candeias', false, -20.7534983, -45.281353799999998);
INSERT INTO cities VALUES (3106, 21, 'Cantagalo', false, -18.513790700000001, -42.622181599999998);
INSERT INTO cities VALUES (3107, 21, 'Caparaó', false, -20.521348499999998, -41.907085199999997);
INSERT INTO cities VALUES (3108, 21, 'Capela Nova', false, -20.920679100000001, -43.611456099999998);
INSERT INTO cities VALUES (3109, 21, 'Capelinha', false, -17.691509, -42.5160889);
INSERT INTO cities VALUES (3110, 21, 'Capetinga', false, -20.618397300000002, -47.058968);
INSERT INTO cities VALUES (3111, 21, 'Capim Branco', false, -16.266667000000002, -40.799999999999997);
INSERT INTO cities VALUES (3112, 21, 'Capinópolis', false, -18.679994600000001, -49.565965499999997);
INSERT INTO cities VALUES (3113, 21, 'Capitão Andrade', false, -19.070246900000001, -41.863470200000002);
INSERT INTO cities VALUES (3114, 21, 'Capitão Enéas', false, -16.315460000000002, -43.708702700000003);
INSERT INTO cities VALUES (3115, 21, 'Capitólio', false, -20.604664700000001, -46.071874999999999);
INSERT INTO cities VALUES (3116, 21, 'Caputira', false, -20.172568099999999, -42.271284000000001);
INSERT INTO cities VALUES (3117, 21, 'Caraí', false, -17.187268199999998, -41.695305699999999);
INSERT INTO cities VALUES (3118, 21, 'Caranaíba', false, -20.851640499999998, -43.736378799999997);
INSERT INTO cities VALUES (3119, 21, 'Carandaí', false, -20.9543398, -43.791396499999998);
INSERT INTO cities VALUES (3120, 21, 'Carangola', false, -20.735004100000001, -42.0311807);
INSERT INTO cities VALUES (3121, 21, 'Caratinga', false, -19.790427600000001, -42.1392861);
INSERT INTO cities VALUES (3122, 21, 'Carbonita', false, -17.537098199999999, -43.024070299999998);
INSERT INTO cities VALUES (3123, 21, 'Careaçu', false, -22.044957400000001, -45.691270500000002);
INSERT INTO cities VALUES (3124, 21, 'Carlos Chagas', false, -17.703466599999999, -40.765055799999999);
INSERT INTO cities VALUES (3125, 21, 'Carmésia', false, -19.082004099999999, -43.149589800000001);
INSERT INTO cities VALUES (3126, 21, 'Carmo da Cachoeira', false, -21.4837034, -45.205106299999997);
INSERT INTO cities VALUES (3127, 21, 'Carmo da Mata', false, -20.555913499999999, -44.862520199999999);
INSERT INTO cities VALUES (3128, 21, 'Carmo de Minas', false, -22.105501, -45.145418800000002);
INSERT INTO cities VALUES (3129, 21, 'Carmo do Cajuru', false, -20.165156100000001, -44.768823500000003);
INSERT INTO cities VALUES (3130, 21, 'Carmo do Paranaíba', false, -19.0063478, -46.246454900000003);
INSERT INTO cities VALUES (3131, 21, 'Carmo do Rio Claro', false, -20.971515, -46.132596499999998);
INSERT INTO cities VALUES (3132, 21, 'Carmópolis de Minas', false, -20.546251999999999, -44.6551027);
INSERT INTO cities VALUES (3133, 21, 'Carneirinho', false, -19.688508500000001, -50.695702599999997);
INSERT INTO cities VALUES (3134, 21, 'Carrancas', false, -21.469720800000001, -44.635372199999999);
INSERT INTO cities VALUES (3135, 21, 'Carvalhópolis', false, -21.770814900000001, -45.829038699999998);
INSERT INTO cities VALUES (3136, 21, 'Carvalhos', false, -21.9925484, -44.471657499999999);
INSERT INTO cities VALUES (3137, 21, 'Casa Grande', false, -20.797805799999999, -43.9300991);
INSERT INTO cities VALUES (3138, 21, 'Cascalho Rico', false, -18.5797612, -47.876761999999999);
INSERT INTO cities VALUES (3139, 21, 'Cássia', false, -20.591085499999998, -46.923546000000002);
INSERT INTO cities VALUES (3140, 21, 'Cataguases', false, -21.3880184, -42.699076499999997);
INSERT INTO cities VALUES (3141, 21, 'Catas Altas', false, -20.073971, -43.398571199999999);
INSERT INTO cities VALUES (3142, 21, 'Catas Altas da Noruega', false, -20.677685400000001, -43.496184499999998);
INSERT INTO cities VALUES (3143, 21, 'Catuji', false, -17.3147962, -41.523234700000003);
INSERT INTO cities VALUES (3144, 21, 'Catuti', false, -15.356470699999999, -42.962700400000003);
INSERT INTO cities VALUES (3145, 21, 'Caxambu', false, -21.969545100000001, -44.925005800000001);
INSERT INTO cities VALUES (3146, 21, 'Cedro do Abaeté', false, -19.147842600000001, -45.717133599999997);
INSERT INTO cities VALUES (3147, 21, 'Central de Minas', false, -18.761101, -41.304630000000003);
INSERT INTO cities VALUES (3148, 21, 'Centralina', false, -18.590588100000002, -49.193690799999999);
INSERT INTO cities VALUES (3149, 21, 'Chácara', false, -15.739319999999999, -42.341639999999998);
INSERT INTO cities VALUES (3150, 21, 'Chalé', false, -20.0448138, -41.688339300000003);
INSERT INTO cities VALUES (3151, 21, 'Chapada do Norte', false, -17.080200000000001, -42.548115799999998);
INSERT INTO cities VALUES (3152, 21, 'Chapada Gaúcha', false, -15.4684227, -45.418258000000002);
INSERT INTO cities VALUES (3153, 21, 'Chiador', false, -22.007746999999998, -43.065196100000001);
INSERT INTO cities VALUES (3154, 21, 'Cipotânea', false, -20.906254700000002, -43.360312200000003);
INSERT INTO cities VALUES (3155, 21, 'Claraval', false, -20.393585900000001, -47.259835699999996);
INSERT INTO cities VALUES (3156, 21, 'Claro dos Poções', false, -16.973383999999999, -44.267199099999999);
INSERT INTO cities VALUES (3157, 21, 'Cláudio', false, -20.4412223, -44.758429100000001);
INSERT INTO cities VALUES (3158, 21, 'Coimbra', false, -20.8495138, -42.790950700000003);
INSERT INTO cities VALUES (3159, 21, 'Coluna', false, -18.2302009, -42.832345500000002);
INSERT INTO cities VALUES (3160, 21, 'Comendador Gomes', false, -19.731938799999998, -49.065436099999999);
INSERT INTO cities VALUES (3161, 21, 'Comercinho', false, -16.3000866, -41.795615599999998);
INSERT INTO cities VALUES (3162, 21, 'Conceição da Aparecida', false, -21.073248199999998, -46.201890300000002);
INSERT INTO cities VALUES (3163, 21, 'Conceição da Barra de Minas', false, -21.202742199999999, -44.463664100000003);
INSERT INTO cities VALUES (3164, 21, 'Conceição das Alagoas', false, -19.9141592, -48.386420100000002);
INSERT INTO cities VALUES (3165, 21, 'Conceição das Pedras', false, -22.168133399999999, -45.475359400000002);
INSERT INTO cities VALUES (3166, 21, 'Conceição de Ipanema', false, -19.9286803, -41.697444099999998);
INSERT INTO cities VALUES (3167, 21, 'Conceição do Mato Dentro', false, -19.042033400000001, -43.417677699999999);
INSERT INTO cities VALUES (3168, 21, 'Conceição do Pará', false, -19.758332100000001, -44.894342299999998);
INSERT INTO cities VALUES (3169, 21, 'Conceição do Rio Verde', false, -21.880452300000002, -45.088770699999998);
INSERT INTO cities VALUES (3170, 21, 'Conceição dos Ouros', false, -22.411585500000001, -45.7900524);
INSERT INTO cities VALUES (3171, 21, 'Cônego Marinho', false, -15.2859006, -44.428125700000002);
INSERT INTO cities VALUES (3172, 21, 'Confins', false, -19.6309617, -43.990175399999998);
INSERT INTO cities VALUES (3173, 21, 'Congonhal', false, -22.1311617, -46.0435023);
INSERT INTO cities VALUES (3174, 21, 'Congonhas', false, -20.484808699999999, -43.839118599999999);
INSERT INTO cities VALUES (3175, 21, 'Congonhas do Norte', false, -18.806818700000001, -43.682059099999996);
INSERT INTO cities VALUES (3176, 21, 'Conquista', false, -19.9389574, -47.543803400000002);
INSERT INTO cities VALUES (3177, 21, 'Conselheiro Lafaiete', false, -20.659659600000001, -43.785500599999999);
INSERT INTO cities VALUES (3178, 21, 'Conselheiro Pena', false, -19.171768199999999, -41.472057499999998);
INSERT INTO cities VALUES (3179, 21, 'Consolação', false, -22.5527017, -45.9235738);
INSERT INTO cities VALUES (3180, 21, 'Contagem', false, -19.938559900000001, -44.052937700000001);
INSERT INTO cities VALUES (3181, 21, 'Coqueiral', false, -21.186147600000002, -45.444042199999998);
INSERT INTO cities VALUES (3182, 21, 'Coração de Jesus', false, -16.692952500000001, -44.3587591);
INSERT INTO cities VALUES (3183, 21, 'Cordisburgo', false, -19.125406699999999, -44.3223895);
INSERT INTO cities VALUES (3184, 21, 'Cordislândia', false, -21.7902144, -45.692821799999997);
INSERT INTO cities VALUES (3185, 21, 'Corinto', false, -18.4038152, -44.458772699999997);
INSERT INTO cities VALUES (3186, 21, 'Coroaci', false, -18.609000900000002, -42.2816823);
INSERT INTO cities VALUES (3187, 21, 'Coromandel', false, -18.4719433, -47.192763100000001);
INSERT INTO cities VALUES (3188, 21, 'Coronel Fabriciano', false, -19.520212300000001, -42.628758099999999);
INSERT INTO cities VALUES (3189, 21, 'Coronel Murta', false, -16.619350399999998, -42.1827191);
INSERT INTO cities VALUES (3190, 21, 'Coronel Pacheco', false, -21.635764900000002, -43.319207900000002);
INSERT INTO cities VALUES (3191, 21, 'Coronel Xavier Chaves', false, -21.023047200000001, -44.166219400000003);
INSERT INTO cities VALUES (3192, 21, 'Córrego Danta', false, -19.830462000000001, -45.919929799999998);
INSERT INTO cities VALUES (3193, 21, 'Córrego do Bom Jesus', false, -22.629770700000002, -46.019735699999998);
INSERT INTO cities VALUES (3194, 21, 'Córrego Fundo', false, -20.462186500000001, -45.532514800000001);
INSERT INTO cities VALUES (3195, 21, 'Córrego Novo', false, -19.830235200000001, -42.401316100000003);
INSERT INTO cities VALUES (3196, 21, 'Couto de Magalhães de Minas', false, -18.073539799999999, -43.471076799999999);
INSERT INTO cities VALUES (3197, 21, 'Crisólita', false, -17.243262999999999, -40.9138679);
INSERT INTO cities VALUES (3198, 21, 'Cristais', false, -20.8551462, -45.504031699999999);
INSERT INTO cities VALUES (3199, 21, 'Cristália', false, -16.754726699999999, -42.908174799999998);
INSERT INTO cities VALUES (3200, 21, 'Cristiano Otoni', false, -20.831772300000001, -43.806331299999997);
INSERT INTO cities VALUES (3201, 21, 'Cristina', false, -22.209178099999999, -45.271985000000001);
INSERT INTO cities VALUES (3202, 21, 'Crucilândia', false, -20.371516, -44.339701900000001);
INSERT INTO cities VALUES (3203, 21, 'Cruzeiro da Fortaleza', false, -18.9456065, -46.673481700000004);
INSERT INTO cities VALUES (3204, 21, 'Cruzília', false, -21.839474899999999, -44.812519600000002);
INSERT INTO cities VALUES (3205, 21, 'Cuparaque', false, -18.9695511, -41.099103200000002);
INSERT INTO cities VALUES (3206, 21, 'Curral de Dentro', false, -15.9463907, -41.848147300000001);
INSERT INTO cities VALUES (3207, 21, 'Curvelo', false, -18.7491658, -44.446755500000002);
INSERT INTO cities VALUES (3208, 21, 'Datas', false, -18.445701100000001, -43.655956000000003);
INSERT INTO cities VALUES (3209, 21, 'Delfim Moreira', false, -22.508570200000001, -45.280785000000002);
INSERT INTO cities VALUES (3210, 21, 'Delfinópolis', false, -20.352066799999999, -46.844083699999999);
INSERT INTO cities VALUES (3211, 21, 'Delta', false, -19.925066699999999, -47.817697199999998);
INSERT INTO cities VALUES (3212, 21, 'Descoberto', false, -21.463830999999999, -42.961370700000003);
INSERT INTO cities VALUES (3213, 21, 'Desterro de Entre Rios', false, -20.636778199999998, -44.3389016);
INSERT INTO cities VALUES (3214, 21, 'Desterro do Melo', false, -21.139942300000001, -43.525776999999998);
INSERT INTO cities VALUES (3215, 21, 'Diamantina', false, -18.2380733, -43.611013200000002);
INSERT INTO cities VALUES (3216, 21, 'Diogo de Vasconcelos', false, -20.472420199999998, -43.190403699999997);
INSERT INTO cities VALUES (3217, 21, 'Dionísio', false, -19.8331564, -42.777256000000001);
INSERT INTO cities VALUES (3218, 21, 'Divinésia', false, -20.9936969, -42.996256700000004);
INSERT INTO cities VALUES (3219, 21, 'Divino', false, -19.966667000000001, -41.399999999999999);
INSERT INTO cities VALUES (3220, 21, 'Divino das Laranjeiras', false, -18.7720463, -41.4740666);
INSERT INTO cities VALUES (3221, 21, 'Divinolândia de Minas', false, -18.790741000000001, -42.597662999999997);
INSERT INTO cities VALUES (3222, 21, 'Divinópolis', false, -20.139434699999999, -44.887185299999999);
INSERT INTO cities VALUES (3223, 21, 'Divisa Alegre', false, -15.7261045, -41.338533099999999);
INSERT INTO cities VALUES (3224, 21, 'Divisa Nova', false, -21.511638999999999, -46.196353500000001);
INSERT INTO cities VALUES (3225, 21, 'Divisópolis', false, -15.726286099999999, -41.000283600000003);
INSERT INTO cities VALUES (3226, 21, 'Dom Bosco', false, -16.616667, -41.916666999999997);
INSERT INTO cities VALUES (3227, 21, 'Dom Cavati', false, -19.3810848, -42.111689800000001);
INSERT INTO cities VALUES (3228, 21, 'Dom Joaquim', false, -18.9461233, -43.252310299999998);
INSERT INTO cities VALUES (3229, 21, 'Dom Silvério', false, -20.147769400000001, -42.9543611);
INSERT INTO cities VALUES (3230, 21, 'Dom Viçoso', false, -20.766667000000002, -42.516666999999998);
INSERT INTO cities VALUES (3231, 21, 'Dona Eusébia', false, -21.312424799999999, -42.811725199999998);
INSERT INTO cities VALUES (3232, 21, 'Dores de Campos', false, -21.119112999999999, -44.017903599999997);
INSERT INTO cities VALUES (3233, 21, 'Dores de Guanhães', false, -19.040824499999999, -42.924251099999999);
INSERT INTO cities VALUES (3234, 21, 'Dores do Indaiá', false, -19.464223199999999, -45.600685599999998);
INSERT INTO cities VALUES (3235, 21, 'Dores do Turvo', false, -20.961528300000001, -43.189894000000002);
INSERT INTO cities VALUES (3236, 21, 'Doresópolis', false, -20.288692900000001, -45.902032900000002);
INSERT INTO cities VALUES (3237, 21, 'Douradoquara', false, -18.433170199999999, -47.598459800000001);
INSERT INTO cities VALUES (3238, 21, 'Durandé', false, -20.203302300000001, -41.798325499999997);
INSERT INTO cities VALUES (3239, 21, 'Elói Mendes', false, -21.610448999999999, -45.5688344);
INSERT INTO cities VALUES (3240, 21, 'Engenheiro Caldas', false, -19.2078782, -42.051780000000001);
INSERT INTO cities VALUES (3241, 21, 'Engenheiro Navarro', false, -17.295227199999999, -43.9348624);
INSERT INTO cities VALUES (3242, 21, 'Entre Folhas', false, -19.6256287, -42.231602299999999);
INSERT INTO cities VALUES (3243, 21, 'Entre Rios de Minas', false, -20.673202, -44.056394699999998);
INSERT INTO cities VALUES (3244, 21, 'Ervália', false, -20.8403341, -42.652165699999998);
INSERT INTO cities VALUES (3245, 21, 'Esmeraldas', false, -19.762845500000001, -44.313123099999999);
INSERT INTO cities VALUES (3246, 21, 'Espera Feliz', false, -20.648782000000001, -41.910159499999999);
INSERT INTO cities VALUES (3247, 21, 'Espinosa', false, -14.9060656, -42.8112104);
INSERT INTO cities VALUES (3248, 21, 'Espírito Santo do Dourado', false, -22.037861700000001, -45.943517300000003);
INSERT INTO cities VALUES (3249, 21, 'Estiva', false, -15.09651, -45.682110000000002);
INSERT INTO cities VALUES (3250, 21, 'Estrela Dalva', false, -21.738820400000002, -42.464420799999999);
INSERT INTO cities VALUES (3251, 21, 'Estrela do Indaiá', false, -19.522551, -45.788991000000003);
INSERT INTO cities VALUES (3252, 21, 'Estrela do Sul', false, -18.7461223, -47.692586200000001);
INSERT INTO cities VALUES (3253, 21, 'Eugenópolis', false, -21.101769399999998, -42.183090800000002);
INSERT INTO cities VALUES (3254, 21, 'Ewbank da Câmara', false, -21.548802999999999, -43.507640100000003);
INSERT INTO cities VALUES (3255, 21, 'Extrema', false, -22.8545847, -46.319057600000001);
INSERT INTO cities VALUES (3256, 21, 'Fama', false, -21.4311677, -45.794875400000002);
INSERT INTO cities VALUES (3257, 21, 'Faria Lemos', false, -20.811496500000001, -42.030200899999997);
INSERT INTO cities VALUES (3258, 21, 'Felício dos Santos', false, -18.0610593, -43.240818099999998);
INSERT INTO cities VALUES (3259, 21, 'Felisburgo', false, -16.6404502, -40.7728386);
INSERT INTO cities VALUES (3260, 21, 'Felixlândia', false, -18.731002700000001, -44.875910500000003);
INSERT INTO cities VALUES (3261, 21, 'Fernandes Tourinho', false, -19.153966799999999, -42.080461999999997);
INSERT INTO cities VALUES (3262, 21, 'Ferros', false, -19.232113099999999, -43.017874200000001);
INSERT INTO cities VALUES (3263, 21, 'Fervedouro', false, -20.726888500000001, -42.279574599999997);
INSERT INTO cities VALUES (3264, 21, 'Florestal', false, -19.886622800000001, -44.432132299999999);
INSERT INTO cities VALUES (3265, 21, 'Formiga', false, -20.461634700000001, -45.432835099999998);
INSERT INTO cities VALUES (3266, 21, 'Formoso', false, -14.9505257, -46.234781599999998);
INSERT INTO cities VALUES (3267, 21, 'Fortaleza de Minas', false, -20.840723000000001, -46.723480299999999);
INSERT INTO cities VALUES (3268, 21, 'Fortuna de Minas', false, -19.520922899999999, -44.534891100000003);
INSERT INTO cities VALUES (3269, 21, 'Francisco Badaró', false, -16.985878899999999, -42.350759099999998);
INSERT INTO cities VALUES (3270, 21, 'Francisco Dumont', false, -17.294583599999999, -44.2421936);
INSERT INTO cities VALUES (3271, 21, 'Francisco Sá', false, -16.468870200000001, -43.485152399999997);
INSERT INTO cities VALUES (3272, 21, 'Franciscópolis', false, -17.9578673, -42.0079457);
INSERT INTO cities VALUES (3273, 21, 'Frei Gaspar', false, -18.065639999999998, -41.4299386);
INSERT INTO cities VALUES (3274, 21, 'Frei Inocêncio', false, -18.5623644, -41.905689299999999);
INSERT INTO cities VALUES (3275, 21, 'Frei Lagonegro', false, -18.1609987, -42.774641899999999);
INSERT INTO cities VALUES (3276, 21, 'Fronteira', false, -20.2860665, -49.198511600000003);
INSERT INTO cities VALUES (3277, 21, 'Fronteira dos Vales', false, -16.8920782, -40.9249893);
INSERT INTO cities VALUES (3278, 21, 'Fruta de Leite', false, -16.125033299999998, -42.541186799999998);
INSERT INTO cities VALUES (3279, 21, 'Frutal', false, -20.019713200000002, -48.9194429);
INSERT INTO cities VALUES (3280, 21, 'Funilândia', false, -19.350820299999999, -44.0723913);
INSERT INTO cities VALUES (3281, 21, 'Galiléia', false, -18.996289300000001, -41.5347565);
INSERT INTO cities VALUES (3282, 21, 'Gameleiras', false, -15.078253999999999, -43.122267000000001);
INSERT INTO cities VALUES (3283, 21, 'Glaucilândia', false, -16.842532599999998, -43.683708600000003);
INSERT INTO cities VALUES (3284, 21, 'Goiabeira', false, -18.971113800000001, -41.213876999999997);
INSERT INTO cities VALUES (3285, 21, 'Goianá', false, -21.5406078, -43.1983137);
INSERT INTO cities VALUES (3286, 21, 'Gonçalves', false, -22.658987199999999, -45.8542196);
INSERT INTO cities VALUES (3287, 21, 'Gonzaga', false, -18.8242154, -42.478530200000002);
INSERT INTO cities VALUES (3288, 21, 'Gouveia', false, -18.447590000000002, -43.739168599999999);
INSERT INTO cities VALUES (3289, 21, 'Governador Valadares', false, -18.8505097, -41.948077300000001);
INSERT INTO cities VALUES (3290, 21, 'Grão Mogol', false, -16.5574668, -42.893887200000002);
INSERT INTO cities VALUES (3291, 21, 'Grupiara', false, -18.495025200000001, -47.725139800000001);
INSERT INTO cities VALUES (3292, 21, 'Guanhães', false, -18.7710002, -42.931888499999999);
INSERT INTO cities VALUES (3293, 21, 'Guapé', false, -20.7480267, -45.9027192);
INSERT INTO cities VALUES (3294, 21, 'Guaraciaba', false, -20.557711000000001, -43.0059726);
INSERT INTO cities VALUES (3295, 21, 'Guaraciama', false, -16.997510299999998, -43.683391899999997);
INSERT INTO cities VALUES (3296, 21, 'Guaranésia', false, -21.293737499999999, -46.802669199999997);
INSERT INTO cities VALUES (3297, 21, 'Guarani', false, -16.316666999999999, -40.816667000000002);
INSERT INTO cities VALUES (3298, 21, 'Guarará', false, -21.722668899999999, -43.037554999999998);
INSERT INTO cities VALUES (3299, 21, 'Guarda-Mor', false, -17.754592500000001, -47.102873700000004);
INSERT INTO cities VALUES (3300, 21, 'Guaxupé', false, -21.303584799999999, -46.708546499999997);
INSERT INTO cities VALUES (3301, 21, 'Guidoval', false, -21.152549100000002, -42.790014599999999);
INSERT INTO cities VALUES (3302, 21, 'Guimarânia', false, -18.834494800000002, -46.763055100000003);
INSERT INTO cities VALUES (3303, 21, 'Guiricema', false, -21.007185700000001, -42.717569599999997);
INSERT INTO cities VALUES (3304, 21, 'Gurinhatã', false, -19.213479, -49.782747399999998);
INSERT INTO cities VALUES (3305, 21, 'Heliodora', false, -22.0375227, -45.551226499999999);
INSERT INTO cities VALUES (3306, 21, 'Iapu', false, -19.433220800000001, -42.217012799999999);
INSERT INTO cities VALUES (3307, 21, 'Ibertioga', false, -21.419718400000001, -43.954295000000002);
INSERT INTO cities VALUES (3308, 21, 'Ibiá', false, -19.484438000000001, -46.5475353);
INSERT INTO cities VALUES (3309, 21, 'Ibiaí', false, -16.834090100000001, -44.904717300000002);
INSERT INTO cities VALUES (3310, 21, 'Ibiracatu', false, -15.659861899999999, -44.175281699999999);
INSERT INTO cities VALUES (3311, 21, 'Ibiraci', false, -20.4649565, -47.123896000000002);
INSERT INTO cities VALUES (3312, 21, 'Ibirité', false, -20.019434199999999, -44.056066899999998);
INSERT INTO cities VALUES (3313, 21, 'Ibitiúra de Minas', false, -22.057772400000001, -46.431483900000003);
INSERT INTO cities VALUES (3314, 21, 'Ibituruna', false, -21.143219299999998, -44.739986999999999);
INSERT INTO cities VALUES (3315, 21, 'Icaraí de Minas', false, -16.196027099999998, -44.899835899999999);
INSERT INTO cities VALUES (3316, 21, 'Igarapé', false, -20.072106900000001, -44.303212799999997);
INSERT INTO cities VALUES (3317, 21, 'Igaratinga', false, -19.9504804, -44.704322400000002);
INSERT INTO cities VALUES (3318, 21, 'Iguatama', false, -20.1740189, -45.7153353);
INSERT INTO cities VALUES (3319, 21, 'Ijaci', false, -21.156634799999999, -44.926019400000001);
INSERT INTO cities VALUES (3320, 21, 'Ilicínea', false, -20.936143699999999, -45.828116199999997);
INSERT INTO cities VALUES (3321, 21, 'Imbé de Minas', false, -19.5983871, -41.9690583);
INSERT INTO cities VALUES (3322, 21, 'Inconfidentes', false, -22.317112699999999, -46.328386999999999);
INSERT INTO cities VALUES (3323, 21, 'Indaiabira', false, -15.4771886, -42.202471000000003);
INSERT INTO cities VALUES (3324, 21, 'Indianópolis', false, -19.042391899999998, -47.916993499999997);
INSERT INTO cities VALUES (3325, 21, 'Ingaí', false, -21.406734799999999, -44.941789200000002);
INSERT INTO cities VALUES (3326, 21, 'Inhapim', false, -19.553087600000001, -42.124361399999998);
INSERT INTO cities VALUES (3327, 21, 'Inhaúma', false, -19.491374100000002, -44.390977999999997);
INSERT INTO cities VALUES (3328, 21, 'Inimutaba', false, -18.732204899999999, -44.359380799999997);
INSERT INTO cities VALUES (3329, 21, 'Ipaba', false, -19.441547400000001, -42.409875200000002);
INSERT INTO cities VALUES (3330, 21, 'Ipanema', false, -19.801255600000001, -41.713839900000004);
INSERT INTO cities VALUES (3331, 21, 'Ipatinga', false, -19.468952300000002, -42.536685200000001);
INSERT INTO cities VALUES (3332, 21, 'Ipiaçu', false, -18.685836699999999, -49.942494000000003);
INSERT INTO cities VALUES (3333, 21, 'Ipuiúna', false, -22.099137299999999, -46.176915200000003);
INSERT INTO cities VALUES (3334, 21, 'Iraí de Minas', false, -18.9895958, -47.475862399999997);
INSERT INTO cities VALUES (3335, 21, 'Itabira', false, -19.665677599999999, -43.212088799999997);
INSERT INTO cities VALUES (3336, 21, 'Itabirinha de Mantena', false, -18.5675919, -41.231323199999999);
INSERT INTO cities VALUES (3337, 21, 'Itabirito', false, -20.2534478, -43.809073699999999);
INSERT INTO cities VALUES (3338, 21, 'Itacambira', false, -17.064031400000001, -43.311560399999998);
INSERT INTO cities VALUES (3339, 21, 'Itacarambi', false, -15.0998713, -44.093691999999997);
INSERT INTO cities VALUES (3340, 21, 'Itaguara', false, -20.402919700000002, -44.515211299999997);
INSERT INTO cities VALUES (3341, 21, 'Itaipé', false, -17.4025113, -41.672172000000003);
INSERT INTO cities VALUES (3342, 21, 'Itajubá', false, -22.426897499999999, -45.452990999999997);
INSERT INTO cities VALUES (3343, 21, 'Itamarandiba', false, -17.8566331, -42.860965800000002);
INSERT INTO cities VALUES (3344, 21, 'Itamarati de Minas', false, -21.406095199999999, -42.808848400000002);
INSERT INTO cities VALUES (3345, 21, 'Itambacuri', false, -18.044528499999998, -41.661250299999999);
INSERT INTO cities VALUES (3346, 21, 'Itambé do Mato Dentro', false, -19.417090300000002, -43.316874900000002);
INSERT INTO cities VALUES (3347, 21, 'Itamogi', false, -21.0792471, -47.048727300000003);
INSERT INTO cities VALUES (3348, 21, 'Itamonte', false, -22.289006499999999, -44.868013300000001);
INSERT INTO cities VALUES (3349, 21, 'Itanhandu', false, -22.297761399999999, -44.926721800000003);
INSERT INTO cities VALUES (3350, 21, 'Itanhomi', false, -19.172787400000001, -41.865190499999997);
INSERT INTO cities VALUES (3351, 21, 'Itaobim', false, -16.576158499999998, -41.504009000000003);
INSERT INTO cities VALUES (3352, 21, 'Itapagipe', false, -19.890804599999999, -49.370554599999998);
INSERT INTO cities VALUES (3353, 21, 'Itapecerica', false, -20.4733795, -45.126622900000001);
INSERT INTO cities VALUES (3354, 21, 'Itapeva', false, -22.766886599999999, -46.222938599999999);
INSERT INTO cities VALUES (3355, 21, 'Itatiaiuçu', false, -20.2092332, -44.3909138);
INSERT INTO cities VALUES (3356, 21, 'Itaú de Minas', false, -20.7605346, -46.761610300000001);
INSERT INTO cities VALUES (3357, 21, 'Itaúna', false, -20.073895199999999, -44.5734128);
INSERT INTO cities VALUES (3358, 21, 'Itaverava', false, -20.660988, -43.603360299999999);
INSERT INTO cities VALUES (3359, 21, 'Itinga', false, -16.617872200000001, -41.765106000000003);
INSERT INTO cities VALUES (3360, 21, 'Itueta', false, -19.3719179, -41.163197599999997);
INSERT INTO cities VALUES (3361, 21, 'Ituiutaba', false, -18.965283899999999, -49.463638600000003);
INSERT INTO cities VALUES (3362, 21, 'Itumirim', false, -21.265918500000002, -44.846961100000001);
INSERT INTO cities VALUES (3363, 21, 'Iturama', false, -19.722273900000001, -50.193710500000002);
INSERT INTO cities VALUES (3364, 21, 'Itutinga', false, -21.2983121, -44.660033800000001);
INSERT INTO cities VALUES (3365, 21, 'Jaboticatubas', false, -19.513999699999999, -43.746102299999997);
INSERT INTO cities VALUES (3366, 21, 'Jacinto', false, -16.1734507, -40.273133899999998);
INSERT INTO cities VALUES (3367, 21, 'Jacuí', false, -21.013678599999999, -46.743865900000003);
INSERT INTO cities VALUES (3368, 21, 'Jacutinga', false, -22.286479799999999, -46.612325900000002);
INSERT INTO cities VALUES (3369, 21, 'Jaguaraçu', false, -19.618592400000001, -42.764988299999999);
INSERT INTO cities VALUES (3370, 21, 'Jaíba', false, -15.3372043, -43.685772499999999);
INSERT INTO cities VALUES (3371, 21, 'Jampruca', false, -18.460334199999998, -41.803858300000002);
INSERT INTO cities VALUES (3372, 21, 'Janaúba', false, -15.8036932, -43.317365799999997);
INSERT INTO cities VALUES (3373, 21, 'Januária', false, -15.495639799999999, -44.362591700000003);
INSERT INTO cities VALUES (3374, 21, 'Japaraíba', false, -21.633333, -43.016666999999998);
INSERT INTO cities VALUES (3375, 21, 'Japonvar', false, -15.997316400000001, -44.273077999999998);
INSERT INTO cities VALUES (3376, 21, 'Jeceaba', false, -20.5372485, -44.005324899999998);
INSERT INTO cities VALUES (3377, 21, 'Jenipapo de Minas', false, -17.0775766, -42.257068599999997);
INSERT INTO cities VALUES (3378, 21, 'Jequeri', false, -20.4568844, -42.6602757);
INSERT INTO cities VALUES (3379, 21, 'Jequitaí', false, -17.2322539, -44.4359058);
INSERT INTO cities VALUES (3380, 21, 'Jequitibá', false, -19.2282428, -44.038066700000002);
INSERT INTO cities VALUES (3381, 21, 'Jequitinhonha', false, -16.4354537, -41.003298899999997);
INSERT INTO cities VALUES (3382, 21, 'Jesuânia', false, -21.999914199999999, -45.289117500000003);
INSERT INTO cities VALUES (3383, 21, 'Joaíma', false, -16.645273700000001, -41.032412600000001);
INSERT INTO cities VALUES (3384, 21, 'Joanésia', false, -19.171584599999999, -42.680579600000002);
INSERT INTO cities VALUES (3385, 21, 'João Monlevade', false, -19.809327400000001, -43.173851800000001);
INSERT INTO cities VALUES (3386, 21, 'João Pinheiro', false, -17.745838500000001, -46.178820299999998);
INSERT INTO cities VALUES (3387, 21, 'Joaquim Felício', false, -17.779655000000002, -44.146349000000001);
INSERT INTO cities VALUES (3388, 21, 'Jordânia', false, -15.8965464, -40.193283800000003);
INSERT INTO cities VALUES (3389, 21, 'José Gonçalves de Minas', false, -16.895695, -42.599721799999998);
INSERT INTO cities VALUES (3390, 21, 'José Raydan', false, -18.213624500000002, -42.503774);
INSERT INTO cities VALUES (3391, 21, 'Josenópolis', false, -16.536206400000001, -42.515332399999998);
INSERT INTO cities VALUES (3392, 21, 'Juatuba', false, -19.952222299999999, -44.336731800000003);
INSERT INTO cities VALUES (3393, 21, 'Juiz de Fora', false, -21.764210299999998, -43.349570499999999);
INSERT INTO cities VALUES (3394, 21, 'Juramento', false, -16.845167799999999, -43.583277899999999);
INSERT INTO cities VALUES (3395, 21, 'Juruaia', false, -21.253086, -46.576590500000002);
INSERT INTO cities VALUES (3396, 21, 'Juvenília', false, -14.2715791, -44.167527);
INSERT INTO cities VALUES (3397, 21, 'Ladainha', false, -17.6275823, -41.740236000000003);
INSERT INTO cities VALUES (3398, 21, 'Lagamar', false, -18.1408308, -46.812078700000001);
INSERT INTO cities VALUES (3399, 21, 'Lagoa da Prata', false, -19.978847600000002, -45.488303100000003);
INSERT INTO cities VALUES (3400, 21, 'Lagoa dos Patos', false, -16.982785400000001, -44.589192400000002);
INSERT INTO cities VALUES (3401, 21, 'Lagoa Dourada', false, -20.8865759, -44.068050300000003);
INSERT INTO cities VALUES (3402, 21, 'Lagoa Formosa', false, -18.7764554, -46.405265399999998);
INSERT INTO cities VALUES (3403, 21, 'Lagoa Grande', false, -15.71424, -41.818409000000003);
INSERT INTO cities VALUES (3404, 21, 'Lagoa Santa', false, -19.629074899999999, -43.889746700000003);
INSERT INTO cities VALUES (3405, 21, 'Lajinha', false, -20.151900399999999, -41.623153100000003);
INSERT INTO cities VALUES (3406, 21, 'Lambari', false, -21.967141999999999, -45.346605799999999);
INSERT INTO cities VALUES (3407, 21, 'Lamim', false, -20.7883979, -43.466782600000002);
INSERT INTO cities VALUES (3408, 21, 'Laranjal', false, -21.361691799999999, -42.471663700000001);
INSERT INTO cities VALUES (3409, 21, 'Lassance', false, -17.887232600000001, -44.581497400000003);
INSERT INTO cities VALUES (3410, 21, 'Lavras', false, -21.245736999999998, -44.999779199999999);
INSERT INTO cities VALUES (3411, 21, 'Leandro Ferreira', false, -19.718506600000001, -45.018432099999998);
INSERT INTO cities VALUES (3412, 21, 'Leme do Prado', false, -17.065050599999999, -42.716968000000001);
INSERT INTO cities VALUES (3413, 21, 'Leopoldina', false, -21.519960099999999, -42.645416500000003);
INSERT INTO cities VALUES (3414, 21, 'Liberdade', false, -22.028252899999998, -44.316336499999998);
INSERT INTO cities VALUES (3415, 21, 'Lima Duarte', false, -21.8483515, -43.807533200000002);
INSERT INTO cities VALUES (3416, 21, 'Limeira do Oeste', false, -19.552316300000001, -50.577317399999998);
INSERT INTO cities VALUES (3417, 21, 'Lontra', false, -21.266667000000002, -43.383333);
INSERT INTO cities VALUES (3418, 21, 'Luisburgo', false, -20.438324600000001, -42.097925400000001);
INSERT INTO cities VALUES (3419, 21, 'Luislândia', false, -16.099890299999998, -44.567950400000001);
INSERT INTO cities VALUES (3420, 21, 'Luminárias', false, -21.526080400000001, -44.881539099999998);
INSERT INTO cities VALUES (3421, 21, 'Luz', false, -19.7834313, -45.681423000000002);
INSERT INTO cities VALUES (3422, 21, 'Machacalis', false, -17.073254500000001, -40.711449000000002);
INSERT INTO cities VALUES (3423, 21, 'Machado', false, -17.116667, -42.216667000000001);
INSERT INTO cities VALUES (3424, 21, 'Madre de Deus de Minas', false, -21.4839527, -44.332934000000002);
INSERT INTO cities VALUES (3425, 21, 'Malacacheta', false, -17.842405599999999, -42.072716900000003);
INSERT INTO cities VALUES (3426, 21, 'Mamonas', false, -15.1130254, -42.968699899999997);
INSERT INTO cities VALUES (3427, 21, 'Manga', false, -14.756891899999999, -43.941944300000003);
INSERT INTO cities VALUES (3428, 21, 'Manhuaçu', false, -20.266952, -42.036564499999997);
INSERT INTO cities VALUES (3429, 21, 'Manhumirim', false, -20.358453600000001, -41.958390100000003);
INSERT INTO cities VALUES (3430, 21, 'Mantena', false, -18.767735399999999, -40.975225700000003);
INSERT INTO cities VALUES (3431, 21, 'Mar de Espanha', false, -21.868581599999999, -43.009314199999999);
INSERT INTO cities VALUES (3432, 21, 'Maravilhas', false, -19.5199696, -44.681200099999998);
INSERT INTO cities VALUES (3433, 21, 'Maria da Fé', false, -22.296066100000001, -45.384620099999999);
INSERT INTO cities VALUES (3434, 21, 'Mariana', false, -16.683333000000001, -45.033332999999999);
INSERT INTO cities VALUES (3435, 21, 'Marilac', false, -18.4734436, -42.097000600000001);
INSERT INTO cities VALUES (3436, 21, 'Mário Campos', false, -20.0614311, -44.159831799999999);
INSERT INTO cities VALUES (3437, 21, 'Maripá de Minas', false, -21.685789, -42.953174300000001);
INSERT INTO cities VALUES (3438, 21, 'Marliéria', false, -19.713347899999999, -42.732027299999999);
INSERT INTO cities VALUES (3439, 21, 'Marmelópolis', false, -22.450463299999999, -45.164892000000002);
INSERT INTO cities VALUES (3440, 21, 'Martinho Campos', false, -19.322751400000001, -45.246244699999998);
INSERT INTO cities VALUES (3441, 21, 'Martins Soares', false, -20.260484399999999, -41.877372299999998);
INSERT INTO cities VALUES (3442, 21, 'Mata Verde', false, -15.686877300000001, -40.730540400000002);
INSERT INTO cities VALUES (3443, 21, 'Materlândia', false, -18.456260499999999, -43.054667600000002);
INSERT INTO cities VALUES (3444, 21, 'Mateus Leme', false, -19.9895742, -44.422587499999999);
INSERT INTO cities VALUES (3445, 21, 'Mathias Lobato', false, -18.588585500000001, -41.924654500000003);
INSERT INTO cities VALUES (3446, 21, 'Matias Barbosa', false, -21.872705799999999, -43.321058600000001);
INSERT INTO cities VALUES (3447, 21, 'Matias Cardoso', false, -14.8556224, -43.914015300000003);
INSERT INTO cities VALUES (3448, 21, 'Matipó', false, -20.280655400000001, -42.339525799999997);
INSERT INTO cities VALUES (3449, 21, 'Mato Verde', false, -16.083333, -40.933332999999998);
INSERT INTO cities VALUES (3450, 21, 'Matozinhos', false, -19.5639082, -44.060794700000002);
INSERT INTO cities VALUES (3451, 21, 'Matutina', false, -19.200978200000002, -45.961490400000002);
INSERT INTO cities VALUES (3452, 21, 'Medeiros', false, -19.9731098, -46.2219093);
INSERT INTO cities VALUES (3453, 21, 'Medina', false, -16.2243128, -41.477708100000001);
INSERT INTO cities VALUES (3454, 21, 'Mendes Pimentel', false, -18.656460899999999, -41.406449799999997);
INSERT INTO cities VALUES (3455, 21, 'Mercês', false, -21.194322, -43.3416438);
INSERT INTO cities VALUES (3456, 21, 'Mesquita', false, -19.220075999999999, -42.6093002);
INSERT INTO cities VALUES (3457, 21, 'Minas Novas', false, -17.201656499999999, -42.601816499999998);
INSERT INTO cities VALUES (3458, 21, 'Minduri', false, -21.6625817, -44.614773599999999);
INSERT INTO cities VALUES (3459, 21, 'Mirabela', false, -16.288957, -44.150602800000001);
INSERT INTO cities VALUES (3460, 21, 'Miradouro', false, -20.893056099999999, -42.351329499999999);
INSERT INTO cities VALUES (3461, 21, 'Miraí', false, -21.195782699999999, -42.614143400000003);
INSERT INTO cities VALUES (3462, 21, 'Miravânia', false, -14.731824899999999, -44.418359600000002);
INSERT INTO cities VALUES (3463, 21, 'Moeda', false, -20.3177406, -44.029346500000003);
INSERT INTO cities VALUES (3464, 21, 'Moema', false, -19.851414299999998, -45.412557200000002);
INSERT INTO cities VALUES (3465, 21, 'Monjolos', false, -18.313865499999999, -44.118025099999997);
INSERT INTO cities VALUES (3466, 21, 'Monsenhor Paulo', false, -21.758107599999999, -45.540753600000002);
INSERT INTO cities VALUES (3467, 21, 'Montalvânia', false, -14.419748500000001, -44.371911699999998);
INSERT INTO cities VALUES (3468, 21, 'Monte Alegre de Minas', false, -18.870204999999999, -48.875154500000001);
INSERT INTO cities VALUES (3469, 21, 'Monte Azul', false, -15.1470778, -42.866485300000001);
INSERT INTO cities VALUES (3470, 21, 'Monte Belo', false, -16.716667000000001, -41.866667);
INSERT INTO cities VALUES (3471, 21, 'Monte Carmelo', false, -18.734811700000002, -47.496325800000001);
INSERT INTO cities VALUES (3472, 21, 'Monte Formoso', false, -16.885337499999999, -41.263190799999997);
INSERT INTO cities VALUES (3473, 21, 'Monte Santo de Minas', false, -21.195480700000001, -46.962781999999997);
INSERT INTO cities VALUES (3474, 21, 'Monte Sião', false, -22.433287400000001, -46.572259099999997);
INSERT INTO cities VALUES (3475, 21, 'Montes Claros', false, -16.7370147, -43.864739700000001);
INSERT INTO cities VALUES (3476, 21, 'Montezuma', false, -15.1407074, -42.516770700000002);
INSERT INTO cities VALUES (3477, 21, 'Morada Nova de Minas', false, -18.5962371, -45.346519499999999);
INSERT INTO cities VALUES (3478, 21, 'Morro da Garça', false, -18.541525499999999, -44.594788999999999);
INSERT INTO cities VALUES (3479, 21, 'Morro do Pilar', false, -19.213644200000001, -43.385661900000002);
INSERT INTO cities VALUES (3480, 21, 'Munhoz', false, -22.614640699999999, -46.360218099999997);
INSERT INTO cities VALUES (3481, 21, 'Muriaé', false, -21.130315100000001, -42.367389299999999);
INSERT INTO cities VALUES (3482, 21, 'Mutum', false, -19.814521299999999, -41.439388800000003);
INSERT INTO cities VALUES (3483, 21, 'Muzambinho', false, -21.3684276, -46.519065400000002);
INSERT INTO cities VALUES (3484, 21, 'Nacip Raydan', false, -18.454432199999999, -42.249618599999998);
INSERT INTO cities VALUES (3485, 21, 'Nanuque', false, -17.819019000000001, -40.341923800000004);
INSERT INTO cities VALUES (3486, 21, 'Naque', false, -19.2297136, -42.3274361);
INSERT INTO cities VALUES (3487, 21, 'Natalândia', false, -16.564710699999999, -46.4692346);
INSERT INTO cities VALUES (3488, 21, 'Natércia', false, -22.097470999999999, -45.509748399999999);
INSERT INTO cities VALUES (3489, 21, 'Nazareno', false, -21.2126649, -44.598390199999997);
INSERT INTO cities VALUES (3490, 21, 'Nepomuceno', false, -21.211038299999998, -45.229490699999999);
INSERT INTO cities VALUES (3491, 21, 'Ninheira', false, -15.319130599999999, -41.753384400000002);
INSERT INTO cities VALUES (3492, 21, 'Nova Belém', false, -18.474443999999998, -41.016944000000002);
INSERT INTO cities VALUES (3493, 21, 'Nova Era', false, -19.753053399999999, -43.026988600000003);
INSERT INTO cities VALUES (3494, 21, 'Nova Lima', false, -19.9875936, -43.846311300000004);
INSERT INTO cities VALUES (3495, 21, 'Nova Módica', false, -18.4331937, -41.495719899999997);
INSERT INTO cities VALUES (3496, 21, 'Nova Ponte', false, -19.162934, -47.678183199999999);
INSERT INTO cities VALUES (3497, 21, 'Nova Porteirinha', false, -15.8040523, -43.300020699999997);
INSERT INTO cities VALUES (3498, 21, 'Nova Resende', false, -21.132630899999999, -46.415908000000002);
INSERT INTO cities VALUES (3499, 21, 'Nova Serrana', false, -19.8784694, -44.984425299999998);
INSERT INTO cities VALUES (3500, 21, 'Nova União', false, -19.688754899999999, -43.586829600000002);
INSERT INTO cities VALUES (3501, 21, 'Novo Cruzeiro', false, -17.4591292, -41.875620599999998);
INSERT INTO cities VALUES (3502, 21, 'Novo Oriente de Minas', false, -17.4144933, -41.216998599999997);
INSERT INTO cities VALUES (3503, 21, 'Novorizonte', false, -15.996230799999999, -42.451292899999999);
INSERT INTO cities VALUES (3504, 21, 'Olaria', false, -21.876677300000001, -43.936279200000001);
INSERT INTO cities VALUES (3505, 21, 'Olhos-d`Água', false, -17.396609399999999, -43.575420000000001);
INSERT INTO cities VALUES (3506, 21, 'Olímpio Noronha', false, -22.0558905, -45.2582004);
INSERT INTO cities VALUES (3507, 21, 'Oliveira', false, -20.697051200000001, -44.8278094);
INSERT INTO cities VALUES (3508, 21, 'Oliveira Fortes', false, -21.3430453, -43.455369099999999);
INSERT INTO cities VALUES (3509, 21, 'Onça de Pitangui', false, -19.743418299999998, -44.806473599999997);
INSERT INTO cities VALUES (3510, 21, 'Oratórios', false, -20.418120900000002, -42.7911006);
INSERT INTO cities VALUES (3511, 21, 'Orizânia', false, -20.542180900000002, -42.207991499999999);
INSERT INTO cities VALUES (3512, 21, 'Ouro Branco', false, -20.5170882, -43.700047599999998);
INSERT INTO cities VALUES (3513, 21, 'Ouro Fino', false, -18.949999999999999, -43.616667);
INSERT INTO cities VALUES (3514, 21, 'Ouro Preto', false, -20.3856161, -43.503493800000001);
INSERT INTO cities VALUES (3515, 21, 'Ouro Verde de Minas', false, -18.067778000000001, -41.271110999999998);
INSERT INTO cities VALUES (3516, 21, 'Padre Carvalho', false, -16.3618375, -42.516048099999999);
INSERT INTO cities VALUES (3517, 21, 'Padre Paraíso', false, -17.067969000000002, -41.482035799999998);
INSERT INTO cities VALUES (3518, 21, 'Pai Pedro', false, -15.492088300000001, -42.959486599999998);
INSERT INTO cities VALUES (3519, 21, 'Paineiras', false, -18.907084000000001, -45.537450700000001);
INSERT INTO cities VALUES (3520, 21, 'Pains', false, -20.3703368, -45.6570714);
INSERT INTO cities VALUES (3521, 21, 'Paiva', false, -21.293062200000001, -43.410184600000001);
INSERT INTO cities VALUES (3522, 21, 'Palma', false, -21.360736200000002, -42.314409499999996);
INSERT INTO cities VALUES (3523, 21, 'Palmópolis', false, -16.7425104, -40.4152281);
INSERT INTO cities VALUES (3524, 21, 'Papagaios', false, -19.449915099999998, -44.744873400000003);
INSERT INTO cities VALUES (3525, 21, 'Pará de Minas', false, -19.860138200000002, -44.607658499999999);
INSERT INTO cities VALUES (3526, 21, 'Paracatu', false, -17.222505699999999, -46.875245900000003);
INSERT INTO cities VALUES (3527, 21, 'Paraguaçu', false, -21.556011300000002, -45.739538400000001);
INSERT INTO cities VALUES (3528, 21, 'Paraisópolis', false, -22.551352000000001, -45.779161799999997);
INSERT INTO cities VALUES (3529, 21, 'Paraopeba', false, -19.281693199999999, -44.408991499999999);
INSERT INTO cities VALUES (3530, 21, 'Passa Quatro', false, -22.388578599999999, -44.963087299999998);
INSERT INTO cities VALUES (3531, 21, 'Passa Tempo', false, -20.649027799999999, -44.501263899999998);
INSERT INTO cities VALUES (3532, 21, 'Passa-Vinte', false, -22.202769799999999, -44.232217400000003);
INSERT INTO cities VALUES (3533, 21, 'Passabém', false, -19.3364054, -43.124120300000001);
INSERT INTO cities VALUES (3534, 21, 'Passos', false, -20.720357799999999, -46.610090100000001);
INSERT INTO cities VALUES (3535, 21, 'Patis', false, -16.088336200000001, -44.088009900000003);
INSERT INTO cities VALUES (3536, 21, 'Patos de Minas', false, -18.579434299999999, -46.518432699999998);
INSERT INTO cities VALUES (3537, 21, 'Patrocínio', false, -18.944059800000002, -46.992406899999999);
INSERT INTO cities VALUES (3538, 21, 'Patrocínio do Muriaé', false, -21.157112600000001, -42.208565200000002);
INSERT INTO cities VALUES (3539, 21, 'Paula Cândido', false, -20.8748255, -42.969842200000002);
INSERT INTO cities VALUES (3540, 21, 'Paulistas', false, -18.421250700000002, -42.873690199999999);
INSERT INTO cities VALUES (3541, 21, 'Pavão', false, -17.426770699999999, -41.00564);
INSERT INTO cities VALUES (3542, 21, 'Peçanha', false, -18.539916999999999, -42.551211100000003);
INSERT INTO cities VALUES (3543, 21, 'Pedra Azul', false, -16.011861, -41.288613300000002);
INSERT INTO cities VALUES (3544, 21, 'Pedra Bonita', false, -20.512711400000001, -42.326222299999998);
INSERT INTO cities VALUES (3545, 21, 'Pedra do Anta', false, -20.595778899999999, -42.718658499999997);
INSERT INTO cities VALUES (3546, 21, 'Pedra do Indaiá', false, -20.260140400000001, -45.213396899999999);
INSERT INTO cities VALUES (3547, 21, 'Pedra Dourada', false, -20.8294903, -42.154140900000002);
INSERT INTO cities VALUES (3548, 21, 'Pedralva', false, -22.246262699999999, -45.470030600000001);
INSERT INTO cities VALUES (3549, 21, 'Pedras de Maria da Cruz', false, -15.624640400000001, -44.375346);
INSERT INTO cities VALUES (3550, 21, 'Pedrinópolis', false, -19.229180800000002, -47.463388899999998);
INSERT INTO cities VALUES (3551, 21, 'Pedro Leopoldo', false, -19.620109500000002, -44.043767799999998);
INSERT INTO cities VALUES (3552, 21, 'Pedro Teixeira', false, -21.688644, -43.744311199999999);
INSERT INTO cities VALUES (3553, 21, 'Pequeri', false, -21.8344852, -43.121263999999996);
INSERT INTO cities VALUES (3554, 21, 'Pequi', false, -15.933332999999999, -42.433332999999998);
INSERT INTO cities VALUES (3555, 21, 'Perdigão', false, -19.953104499999998, -45.078285100000002);
INSERT INTO cities VALUES (3556, 21, 'Perdizes', false, -19.3551587, -47.282772999999999);
INSERT INTO cities VALUES (3557, 21, 'Perdões', false, -21.101104200000002, -45.089117399999999);
INSERT INTO cities VALUES (3558, 21, 'Periquito', false, -19.145111499999999, -42.229499099999998);
INSERT INTO cities VALUES (3559, 21, 'Pescador', false, -18.354282099999999, -41.598332499999998);
INSERT INTO cities VALUES (3560, 21, 'Piau', false, -21.5007783, -43.3263946);
INSERT INTO cities VALUES (3561, 21, 'Piedade de Caratinga', false, -19.759464600000001, -42.076395499999997);
INSERT INTO cities VALUES (3562, 21, 'Piedade de Ponte Nova', false, -20.241463299999999, -42.739177699999999);
INSERT INTO cities VALUES (3563, 21, 'Piedade do Rio Grande', false, -21.450349899999999, -44.193483899999997);
INSERT INTO cities VALUES (3564, 21, 'Piedade dos Gerais', false, -20.468488700000002, -44.215586299999998);
INSERT INTO cities VALUES (3565, 21, 'Pimenta', false, -20.4697399, -45.8023667);
INSERT INTO cities VALUES (3566, 21, 'Pingo-d`Água', false, -19.751918799999999, -42.436756199999998);
INSERT INTO cities VALUES (3567, 21, 'Pintópolis', false, -16.054085000000001, -45.156965399999997);
INSERT INTO cities VALUES (3568, 21, 'Piracema', false, -20.484674200000001, -44.464245099999999);
INSERT INTO cities VALUES (3569, 21, 'Pirajuba', false, -19.908994400000001, -48.702536199999997);
INSERT INTO cities VALUES (3570, 21, 'Piranga', false, -20.665286800000001, -43.299447999999998);
INSERT INTO cities VALUES (3571, 21, 'Piranguçu', false, -22.528324699999999, -45.496898600000002);
INSERT INTO cities VALUES (3572, 21, 'Piranguinho', false, -22.4009301, -45.534918500000003);
INSERT INTO cities VALUES (3573, 21, 'Pirapetinga', false, -20.133333, -42.299999999999997);
INSERT INTO cities VALUES (3574, 21, 'Pirapora', false, -17.335670400000001, -44.8980994);
INSERT INTO cities VALUES (3575, 21, 'Piraúba', false, -21.2691661, -43.020465600000001);
INSERT INTO cities VALUES (3576, 21, 'Pitangui', false, -19.691975800000002, -44.896094099999999);
INSERT INTO cities VALUES (3577, 21, 'Piumhi', false, -20.461842499999999, -45.945703700000003);
INSERT INTO cities VALUES (3578, 21, 'Planura', false, -20.138205200000002, -48.699088799999998);
INSERT INTO cities VALUES (3579, 21, 'Poço Fundo', false, -21.783011699999999, -45.953619600000003);
INSERT INTO cities VALUES (3580, 21, 'Poços de Caldas', false, -21.7882681, -46.562514999999998);
INSERT INTO cities VALUES (3581, 21, 'Pocrane', false, -19.615269999999999, -41.635320800000002);
INSERT INTO cities VALUES (3582, 21, 'Pompéu', false, -19.2068607, -44.937223199999998);
INSERT INTO cities VALUES (3583, 21, 'Ponte Nova', false, -20.411740699999999, -42.896996399999999);
INSERT INTO cities VALUES (3584, 21, 'Ponto Chique', false, -16.6332439, -45.0507919);
INSERT INTO cities VALUES (3585, 21, 'Ponto dos Volantes', false, -16.760866499999999, -41.493194299999999);
INSERT INTO cities VALUES (3586, 21, 'Porteirinha', false, -15.7437725, -43.024585600000002);
INSERT INTO cities VALUES (3587, 21, 'Porto Firme', false, -20.648381199999999, -43.088277400000003);
INSERT INTO cities VALUES (3588, 21, 'Poté', false, -17.806514100000001, -41.787021699999997);
INSERT INTO cities VALUES (3589, 21, 'Pouso Alegre', false, -22.234110399999999, -45.933238899999999);
INSERT INTO cities VALUES (3590, 21, 'Pouso Alto', false, -22.197510900000001, -44.972555800000002);
INSERT INTO cities VALUES (3591, 21, 'Prados', false, -21.053452499999999, -44.090131);
INSERT INTO cities VALUES (3592, 21, 'Prata', false, -20.116667, -41.799999999999997);
INSERT INTO cities VALUES (3593, 21, 'Pratápolis', false, -20.744929299999999, -46.864820999999999);
INSERT INTO cities VALUES (3594, 21, 'Pratinha', false, -19.753804500000001, -46.3759728);
INSERT INTO cities VALUES (3595, 21, 'Presidente Bernardes', false, -20.765781499999999, -43.194663499999997);
INSERT INTO cities VALUES (3596, 21, 'Presidente Juscelino', false, -18.650150199999999, -44.057643400000003);
INSERT INTO cities VALUES (3597, 21, 'Presidente Kubitschek', false, -18.577022899999999, -43.587119800000004);
INSERT INTO cities VALUES (3598, 21, 'Presidente Olegário', false, -18.415614900000001, -46.421488600000004);
INSERT INTO cities VALUES (3599, 21, 'Prudente de Morais', false, -19.478300600000001, -44.157549199999998);
INSERT INTO cities VALUES (3600, 21, 'Quartel Geral', false, -19.2701335, -45.544787700000001);
INSERT INTO cities VALUES (3601, 21, 'Queluzito', false, -20.7354497, -43.876690500000002);
INSERT INTO cities VALUES (3602, 21, 'Raposos', false, -19.966050599999999, -43.804242899999998);
INSERT INTO cities VALUES (3603, 21, 'Raul Soares', false, -20.0853903, -42.439588100000002);
INSERT INTO cities VALUES (3604, 21, 'Recreio', false, -20.983332999999998, -45.783332999999999);
INSERT INTO cities VALUES (3605, 21, 'Reduto', false, -20.247610099999999, -41.982256999999997);
INSERT INTO cities VALUES (3606, 21, 'Resende Costa', false, -20.898249499999999, -44.243122700000001);
INSERT INTO cities VALUES (3607, 21, 'Resplendor', false, -19.327128399999999, -41.257588200000001);
INSERT INTO cities VALUES (3608, 21, 'Ressaquinha', false, -21.063172399999999, -43.762728600000003);
INSERT INTO cities VALUES (3609, 21, 'Riachinho', false, -16.236614100000001, -46.008188699999998);
INSERT INTO cities VALUES (3610, 21, 'Riacho dos Machados', false, -16.006366799999999, -43.0373862);
INSERT INTO cities VALUES (3611, 21, 'Ribeirão das Neves', false, -19.765937999999998, -44.087022500000003);
INSERT INTO cities VALUES (3612, 21, 'Ribeirão Vermelho', false, -21.191529599999999, -45.062482500000002);
INSERT INTO cities VALUES (3613, 21, 'Rio Acima', false, -20.085518100000002, -43.789766100000001);
INSERT INTO cities VALUES (3614, 21, 'Rio Casca', false, -20.211560299999999, -42.659118100000001);
INSERT INTO cities VALUES (3615, 21, 'Rio do Prado', false, -16.5958164, -40.554252900000002);
INSERT INTO cities VALUES (3616, 21, 'Rio Doce', false, -20.253074999999999, -42.894615899999998);
INSERT INTO cities VALUES (3617, 21, 'Rio Espera', false, -20.8471242, -43.474135799999999);
INSERT INTO cities VALUES (3618, 21, 'Rio Manso', false, -20.262321700000001, -44.308073399999998);
INSERT INTO cities VALUES (3619, 21, 'Rio Novo', false, -21.465087700000002, -43.116558900000001);
INSERT INTO cities VALUES (3620, 21, 'Rio Paranaíba', false, -19.1941655, -46.2436814);
INSERT INTO cities VALUES (3621, 21, 'Rio Pardo de Minas', false, -15.6008736, -42.544364799999997);
INSERT INTO cities VALUES (3622, 21, 'Rio Piracicaba', false, -19.926312899999999, -43.169470099999998);
INSERT INTO cities VALUES (3623, 21, 'Rio Pomba', false, -21.279313699999999, -43.175085799999998);
INSERT INTO cities VALUES (3624, 21, 'Rio Preto', false, -22.800000000000001, -45.766666999999998);
INSERT INTO cities VALUES (3625, 21, 'Rio Vermelho', false, -18.277981799999999, -43.007955899999999);
INSERT INTO cities VALUES (3626, 21, 'Ritápolis', false, -21.022220799999999, -44.315193499999999);
INSERT INTO cities VALUES (3627, 21, 'Rochedo de Minas', false, -21.620250500000001, -43.031670699999999);
INSERT INTO cities VALUES (3628, 21, 'Rodeiro', false, -21.196674099999999, -42.874983299999997);
INSERT INTO cities VALUES (3629, 21, 'Romaria', false, -18.883781200000001, -47.563783700000002);
INSERT INTO cities VALUES (3630, 21, 'Rosário da Limeira', false, -20.9767291, -42.505197899999999);
INSERT INTO cities VALUES (3631, 21, 'Rubelita', false, -16.408848299999999, -42.252553200000001);
INSERT INTO cities VALUES (3632, 21, 'Rubim', false, -16.369487199999998, -40.535033300000002);
INSERT INTO cities VALUES (3633, 21, 'Sabará', false, -19.889179200000001, -43.804813699999997);
INSERT INTO cities VALUES (3634, 21, 'Sabinópolis', false, -18.6633684, -43.081062299999999);
INSERT INTO cities VALUES (3635, 21, 'Sacramento', false, -19.858386299999999, -47.452503499999999);
INSERT INTO cities VALUES (3636, 21, 'Salinas', false, -15.4, -43.166666999999997);
INSERT INTO cities VALUES (3637, 21, 'Salto da Divisa', false, -16.015991400000001, -39.9481021);
INSERT INTO cities VALUES (3638, 21, 'Santa Bárbara', false, -17.533332999999999, -42.100000000000001);
INSERT INTO cities VALUES (3639, 21, 'Santa Bárbara do Leste', false, -19.9767495, -42.1388125);
INSERT INTO cities VALUES (3640, 21, 'Santa Bárbara do Monte Verde', false, -21.948852200000001, -43.706993699999998);
INSERT INTO cities VALUES (3641, 21, 'Santa Bárbara do Tugúrio', false, -21.247193599999999, -43.556048599999997);
INSERT INTO cities VALUES (3642, 21, 'Santa Cruz de Minas', false, -21.121681500000001, -44.223489100000002);
INSERT INTO cities VALUES (3643, 21, 'Santa Cruz de Salinas', false, -16.095056599999999, -41.756591899999997);
INSERT INTO cities VALUES (3644, 21, 'Santa Cruz do Escalvado', false, -20.235333099999998, -42.816898299999998);
INSERT INTO cities VALUES (3645, 21, 'Santa Efigênia de Minas', false, -18.824901499999999, -42.438017899999998);
INSERT INTO cities VALUES (3646, 21, 'Santa Fé de Minas', false, -16.691520400000002, -45.413088600000002);
INSERT INTO cities VALUES (3647, 21, 'Santa Helena de Minas', false, -16.987793199999999, -40.678661599999998);
INSERT INTO cities VALUES (3648, 21, 'Santa Juliana', false, -19.311225, -47.531462599999998);
INSERT INTO cities VALUES (3649, 21, 'Santa Luzia', false, -17.300000000000001, -41.133333);
INSERT INTO cities VALUES (3650, 21, 'Santa Margarida', false, -20.373362, -42.254216399999997);
INSERT INTO cities VALUES (3651, 21, 'Santa Maria de Itabira', false, -19.4503089, -43.100130399999998);
INSERT INTO cities VALUES (3652, 21, 'Santa Maria do Salto', false, -16.2343762, -40.145040999999999);
INSERT INTO cities VALUES (3653, 21, 'Santa Maria do Suaçuí', false, -18.180577599999999, -42.414943200000003);
INSERT INTO cities VALUES (3654, 21, 'Santa Rita de Caldas', false, -22.0203925, -46.3451302);
INSERT INTO cities VALUES (3655, 21, 'Santa Rita de Ibitipoca', false, -21.559922, -43.923259199999997);
INSERT INTO cities VALUES (3656, 21, 'Santa Rita de Jacutinga', false, -22.1389499, -44.101896199999999);
INSERT INTO cities VALUES (3657, 21, 'Santa Rita de Minas', false, -19.879890100000001, -42.130014199999998);
INSERT INTO cities VALUES (3658, 21, 'Santa Rita do Itueto', false, -19.344549199999999, -41.393592300000002);
INSERT INTO cities VALUES (3659, 21, 'Santa Rita do Sapucaí', false, -22.2498681, -45.719797399999997);
INSERT INTO cities VALUES (3660, 21, 'Santa Rosa da Serra', false, -19.5260116, -45.953097200000002);
INSERT INTO cities VALUES (3661, 21, 'Santa Vitória', false, -18.853494900000001, -50.124833600000002);
INSERT INTO cities VALUES (3662, 21, 'Santana da Vargem', false, -21.248645700000001, -45.509254900000002);
INSERT INTO cities VALUES (3663, 21, 'Santana de Cataguases', false, -21.2830403, -42.558571200000003);
INSERT INTO cities VALUES (3664, 21, 'Santana de Pirapama', false, -18.9968577, -44.0530762);
INSERT INTO cities VALUES (3665, 21, 'Santana do Deserto', false, -21.943588500000001, -43.166289599999999);
INSERT INTO cities VALUES (3666, 21, 'Santana do Garambéu', false, -21.574992699999999, -44.080203400000002);
INSERT INTO cities VALUES (3667, 21, 'Santana do Jacaré', false, -20.900781299999998, -45.128424099999997);
INSERT INTO cities VALUES (3668, 21, 'Santana do Manhuaçu', false, -20.1051216, -41.9238432);
INSERT INTO cities VALUES (3669, 21, 'Santana do Paraíso', false, -19.365576799999999, -42.5474301);
INSERT INTO cities VALUES (3670, 21, 'Santana do Riacho', false, -19.1170431, -43.680258799999997);
INSERT INTO cities VALUES (3671, 21, 'Santana dos Montes', false, -20.791879399999999, -43.6869893);
INSERT INTO cities VALUES (3672, 21, 'Santo Antônio do Amparo', false, -20.955162000000001, -44.916712699999998);
INSERT INTO cities VALUES (3673, 21, 'Santo Antônio do Aventureiro', false, -21.7602847, -42.810900400000001);
INSERT INTO cities VALUES (3674, 21, 'Santo Antônio do Grama', false, -20.3127709, -42.598318900000002);
INSERT INTO cities VALUES (3675, 21, 'Santo Antônio do Itambé', false, -18.467013999999999, -43.304602500000001);
INSERT INTO cities VALUES (3676, 21, 'Santo Antônio do Jacinto', false, -16.524058700000001, -40.172517800000001);
INSERT INTO cities VALUES (3677, 21, 'Santo Antônio do Monte', false, -20.078909500000002, -45.298668999999997);
INSERT INTO cities VALUES (3678, 21, 'Santo Antônio do Retiro', false, -15.3394262, -42.623846899999997);
INSERT INTO cities VALUES (3679, 21, 'Santo Antônio do Rio Abaixo', false, -19.223546500000001, -43.259746999999997);
INSERT INTO cities VALUES (3680, 21, 'Santo Hipólito', false, -18.2826232, -44.217116699999998);
INSERT INTO cities VALUES (3681, 21, 'Santos Dumont', false, -21.457921500000001, -43.5528051);
INSERT INTO cities VALUES (3682, 21, 'São Bento Abade', false, -21.568588099999999, -45.086306700000002);
INSERT INTO cities VALUES (3683, 21, 'São Brás do Suaçuí', false, -20.6232431, -43.941196699999999);
INSERT INTO cities VALUES (3684, 21, 'São Domingos das Dores', false, -19.536378800000001, -42.006397399999997);
INSERT INTO cities VALUES (3685, 21, 'São Domingos do Prata', false, -19.860790099999999, -42.964029400000001);
INSERT INTO cities VALUES (3686, 21, 'São Félix de Minas', false, -18.5903615, -41.484704200000003);
INSERT INTO cities VALUES (3687, 21, 'São Francisco', false, -19.083333, -42.466667000000001);
INSERT INTO cities VALUES (3688, 21, 'São Francisco de Paula', false, -20.716588900000001, -44.9831985);
INSERT INTO cities VALUES (3689, 21, 'São Francisco de Sales', false, -19.854939399999999, -49.771050099999997);
INSERT INTO cities VALUES (3690, 21, 'São Francisco do Glória', false, -20.773064699999999, -42.299487800000001);
INSERT INTO cities VALUES (3691, 21, 'São Geraldo', false, -16.683333000000001, -44.549999999999997);
INSERT INTO cities VALUES (3692, 21, 'São Geraldo da Piedade', false, -18.865034999999999, -42.287822900000002);
INSERT INTO cities VALUES (3693, 21, 'São Geraldo do Baixio', false, -18.9124312, -41.364906099999999);
INSERT INTO cities VALUES (3694, 21, 'São Gonçalo do Abaeté', false, -18.315101800000001, -45.814655100000003);
INSERT INTO cities VALUES (3695, 21, 'São Gonçalo do Pará', false, -19.968157099999999, -44.842504499999997);
INSERT INTO cities VALUES (3696, 21, 'São Gonçalo do Rio Abaixo', false, -19.828068999999999, -43.3819844);
INSERT INTO cities VALUES (3697, 21, 'São Gonçalo do Rio Preto', false, -18.006591700000001, -43.395201100000001);
INSERT INTO cities VALUES (3698, 21, 'São Gonçalo do Sapucaí', false, -21.888967000000001, -45.590040299999998);
INSERT INTO cities VALUES (3699, 21, 'São Gotardo', false, -19.3074385, -46.056076400000002);
INSERT INTO cities VALUES (3700, 21, 'São João Batista do Glória', false, -20.6232647, -46.523194199999999);
INSERT INTO cities VALUES (3701, 21, 'São João da Lagoa', false, -16.778400999999999, -44.306772899999999);
INSERT INTO cities VALUES (3702, 21, 'São João da Mata', false, -21.922558299999999, -45.9156598);
INSERT INTO cities VALUES (3703, 21, 'São João da Ponte', false, -15.924898499999999, -44.013255000000001);
INSERT INTO cities VALUES (3704, 21, 'São João das Missões', false, -14.885122300000001, -44.077384500000001);
INSERT INTO cities VALUES (3705, 21, 'São João del Rei', false, -21.1365154, -44.261850500000001);
INSERT INTO cities VALUES (3706, 21, 'São João do Manhuaçu', false, -20.375496299999998, -42.147395600000003);
INSERT INTO cities VALUES (3707, 21, 'São João do Manteninha', false, -18.720781800000001, -41.159610999999998);
INSERT INTO cities VALUES (3708, 21, 'São João do Oriente', false, -19.3372025, -42.161503099999997);
INSERT INTO cities VALUES (3709, 21, 'São João do Pacuí', false, -16.520429400000001, -44.510913799999997);
INSERT INTO cities VALUES (3710, 21, 'São João do Paraíso', false, -15.314933099999999, -42.014371300000001);
INSERT INTO cities VALUES (3711, 21, 'São João Evangelista', false, -18.546073499999999, -42.759768700000002);
INSERT INTO cities VALUES (3712, 21, 'São João Nepomuceno', false, -21.538835200000001, -43.008921299999997);
INSERT INTO cities VALUES (3713, 21, 'São Joaquim de Bicas', false, -20.045962800000002, -44.268783499999998);
INSERT INTO cities VALUES (3714, 21, 'São José da Barra', false, -20.726843599999999, -46.308683000000002);
INSERT INTO cities VALUES (3715, 21, 'São José da Lapa', false, -19.701515100000002, -43.961697399999998);
INSERT INTO cities VALUES (3716, 21, 'São José da Safira', false, -18.3025427, -42.153950600000002);
INSERT INTO cities VALUES (3717, 21, 'São José da Varginha', false, -19.708565700000001, -44.559792700000003);
INSERT INTO cities VALUES (3718, 21, 'São José do Alegre', false, -22.3315789, -45.528567299999999);
INSERT INTO cities VALUES (3719, 21, 'São José do Divino', false, -18.4713101, -41.386716200000002);
INSERT INTO cities VALUES (3720, 21, 'São José do Goiabal', false, -19.928643999999998, -42.701007599999997);
INSERT INTO cities VALUES (3721, 21, 'São José do Jacuri', false, -18.2749095, -42.674411399999997);
INSERT INTO cities VALUES (3722, 21, 'São José do Mantimento', false, -20.009028499999999, -41.737826599999998);
INSERT INTO cities VALUES (3723, 21, 'São Lourenço', false, -22.117548299999999, -45.0516991);
INSERT INTO cities VALUES (3724, 21, 'São Miguel do Anta', false, -20.697138299999999, -42.7248558);
INSERT INTO cities VALUES (3725, 21, 'São Pedro da União', false, -21.127659399999999, -46.6159654);
INSERT INTO cities VALUES (3726, 21, 'São Pedro do Suaçuí', false, -18.364491999999998, -42.612393099999998);
INSERT INTO cities VALUES (3727, 21, 'São Pedro dos Ferros', false, -20.160233399999999, -42.522132900000003);
INSERT INTO cities VALUES (3728, 21, 'São Romão', false, -16.363127599999999, -45.0740075);
INSERT INTO cities VALUES (3729, 21, 'São Roque de Minas', false, -20.2327765, -46.367075999999997);
INSERT INTO cities VALUES (3730, 21, 'São Sebastião da Bela Vista', false, -22.1867357, -45.765584500000003);
INSERT INTO cities VALUES (3731, 21, 'São Sebastião da Vargem Alegre', false, -21.070217100000001, -42.637247199999997);
INSERT INTO cities VALUES (3732, 21, 'São Sebastião do Anta', false, -19.547696899999998, -41.9552421);
INSERT INTO cities VALUES (3733, 21, 'São Sebastião do Maranhão', false, -18.080676799999999, -42.5722612);
INSERT INTO cities VALUES (3734, 21, 'São Sebastião do Oeste', false, -20.204350699999999, -45.018904399999997);
INSERT INTO cities VALUES (3735, 21, 'São Sebastião do Paraíso', false, -20.917318600000002, -46.991410399999999);
INSERT INTO cities VALUES (3736, 21, 'São Sebastião do Rio Preto', false, -19.283892999999999, -43.166990499999997);
INSERT INTO cities VALUES (3737, 21, 'São Sebastião do Rio Verde', false, -22.215670899999999, -44.9826999);
INSERT INTO cities VALUES (3738, 21, 'São Thomé das Letras', false, -21.723579999999998, -44.981530399999997);
INSERT INTO cities VALUES (3739, 21, 'São Tiago', false, -20.902178899999999, -44.500984600000002);
INSERT INTO cities VALUES (3740, 21, 'São Tomás de Aquino', false, -20.781516799999999, -47.093771699999998);
INSERT INTO cities VALUES (3741, 21, 'São Vicente de Minas', false, -21.679827199999998, -44.4386163);
INSERT INTO cities VALUES (3742, 21, 'Sapucaí-Mirim', false, -22.746982899999999, -45.742255100000001);
INSERT INTO cities VALUES (3743, 21, 'Sardoá', false, -18.7821575, -42.362830299999999);
INSERT INTO cities VALUES (3744, 21, 'Sarzedo', false, -20.021561999999999, -44.147252600000002);
INSERT INTO cities VALUES (3745, 21, 'Sem-Peixe', false, -20.100400400000002, -42.853008199999998);
INSERT INTO cities VALUES (3746, 21, 'Senador Amaral', false, -22.585752100000001, -46.173546700000003);
INSERT INTO cities VALUES (3747, 21, 'Senador Cortes', false, -21.7956015, -42.947051600000002);
INSERT INTO cities VALUES (3748, 21, 'Senador Firmino', false, -20.909141300000002, -43.099861199999999);
INSERT INTO cities VALUES (3749, 21, 'Senador José Bento', false, -22.162399499999999, -46.180687399999997);
INSERT INTO cities VALUES (3750, 21, 'Senador Modestino Gonçalves', false, -17.938046700000001, -43.2256067);
INSERT INTO cities VALUES (3751, 21, 'Senhora de Oliveira', false, -20.792847299999998, -43.324635600000001);
INSERT INTO cities VALUES (3752, 21, 'Senhora do Porto', false, -18.8893874, -43.077146800000001);
INSERT INTO cities VALUES (3753, 21, 'Senhora dos Remédios', false, -21.0282947, -43.582160100000003);
INSERT INTO cities VALUES (3754, 21, 'Sericita', false, -20.4787389, -42.475550400000003);
INSERT INTO cities VALUES (3755, 21, 'Seritinga', false, -21.930578000000001, -44.525034699999999);
INSERT INTO cities VALUES (3756, 21, 'Serra Azul de Minas', false, -18.3432757, -43.1749942);
INSERT INTO cities VALUES (3757, 21, 'Serra da Saudade', false, -19.4278896, -45.783219799999998);
INSERT INTO cities VALUES (3758, 21, 'Serra do Salitre', false, -19.097156099999999, -46.673720099999997);
INSERT INTO cities VALUES (3759, 21, 'Serra dos Aimorés', false, -17.7733329, -40.254292);
INSERT INTO cities VALUES (3760, 21, 'Serrania', false, -21.5450765, -46.0317115);
INSERT INTO cities VALUES (3761, 21, 'Serranópolis de Minas', false, -15.8126371, -42.869562600000002);
INSERT INTO cities VALUES (3762, 21, 'Serranos', false, -21.890388900000001, -44.509413500000001);
INSERT INTO cities VALUES (3763, 21, 'Serro', false, -18.6058615, -43.386962400000002);
INSERT INTO cities VALUES (3764, 21, 'Sete Lagoas', false, -19.467908399999999, -44.247650899999996);
INSERT INTO cities VALUES (3765, 21, 'Setubinha', false, -17.587829200000002, -42.1690191);
INSERT INTO cities VALUES (3766, 21, 'Silveirânia', false, -21.158531100000001, -43.216560800000003);
INSERT INTO cities VALUES (3767, 21, 'Silvianópolis', false, -22.029558900000001, -45.8352425);
INSERT INTO cities VALUES (3768, 21, 'Simão Pereira', false, -21.957378200000001, -43.299510699999999);
INSERT INTO cities VALUES (3769, 21, 'Simonésia', false, -20.1262425, -42.000309899999998);
INSERT INTO cities VALUES (3770, 21, 'Sobrália', false, -19.2450872, -42.122482599999998);
INSERT INTO cities VALUES (3771, 21, 'Soledade de Minas', false, -22.058122099999999, -45.038644900000001);
INSERT INTO cities VALUES (3772, 21, 'Tabuleiro', false, -21.3591829, -43.248780600000003);
INSERT INTO cities VALUES (3773, 21, 'Taiobeiras', false, -15.8036222, -42.241646899999999);
INSERT INTO cities VALUES (3774, 21, 'Taparuba', false, -19.762885700000002, -41.613255000000002);
INSERT INTO cities VALUES (3775, 21, 'Tapira', false, -19.915232100000001, -46.820062299999996);
INSERT INTO cities VALUES (3776, 21, 'Tapiraí', false, -19.8874639, -46.019689700000001);
INSERT INTO cities VALUES (3777, 21, 'Taquaraçu de Minas', false, -19.663579500000001, -43.691342300000002);
INSERT INTO cities VALUES (3778, 21, 'Tarumirim', false, -19.279798599999999, -42.005430799999999);
INSERT INTO cities VALUES (3779, 21, 'Teixeiras', false, -20.652117799999999, -42.858667699999998);
INSERT INTO cities VALUES (3780, 21, 'Teófilo Otoni', false, -17.8588059, -41.509039700000002);
INSERT INTO cities VALUES (3781, 21, 'Timóteo', false, -19.584461600000001, -42.644428300000001);
INSERT INTO cities VALUES (3782, 21, 'Tiradentes', false, -21.1113076, -44.168508699999997);
INSERT INTO cities VALUES (3783, 21, 'Tiros', false, -18.998130400000001, -45.969757999999999);
INSERT INTO cities VALUES (3784, 21, 'Tocantins', false, -21.173894600000001, -43.030421400000002);
INSERT INTO cities VALUES (3785, 21, 'Tocos do Moji', false, -22.370960499999999, -46.098525500000001);
INSERT INTO cities VALUES (3786, 21, 'Toledo', false, -20.166667, -41.816667000000002);
INSERT INTO cities VALUES (3787, 21, 'Tombos', false, -20.903225899999999, -42.022041100000003);
INSERT INTO cities VALUES (3788, 21, 'Três Corações', false, -21.708146200000002, -45.269535500000003);
INSERT INTO cities VALUES (3789, 21, 'Três Marias', false, -18.205032599999999, -45.232622800000001);
INSERT INTO cities VALUES (3790, 21, 'Três Pontas', false, -21.3711962, -45.511649200000001);
INSERT INTO cities VALUES (3791, 21, 'Tumiritinga', false, -18.978797, -41.640368299999999);
INSERT INTO cities VALUES (3792, 21, 'Tupaciguara', false, -18.6032914, -48.690181500000001);
INSERT INTO cities VALUES (3793, 21, 'Turmalina', false, -17.2829546, -42.735390600000002);
INSERT INTO cities VALUES (3794, 21, 'Turvolândia', false, -21.853666400000002, -45.780672600000003);
INSERT INTO cities VALUES (3795, 21, 'Ubá', false, -21.120848599999999, -42.943018600000002);
INSERT INTO cities VALUES (3796, 21, 'Ubaí', false, -16.2781877, -44.7841953);
INSERT INTO cities VALUES (3797, 21, 'Ubaporanga', false, -19.635821, -42.104886399999998);
INSERT INTO cities VALUES (3798, 21, 'Uberaba', false, -16.449999999999999, -40.583333000000003);
INSERT INTO cities VALUES (3799, 21, 'Uberlândia', false, -18.919036599999998, -48.277983599999999);
INSERT INTO cities VALUES (3800, 21, 'Umburatiba', false, -17.247490599999999, -40.594111499999997);
INSERT INTO cities VALUES (3801, 21, 'Unaí', false, -16.351786799999999, -46.911969200000001);
INSERT INTO cities VALUES (3802, 21, 'União de Minas', false, -19.5295758, -50.333893799999998);
INSERT INTO cities VALUES (3803, 21, 'Uruana de Minas', false, -16.134910999999999, -46.338780800000002);
INSERT INTO cities VALUES (3804, 21, 'Urucânia', false, -20.323998599999999, -42.748038999999999);
INSERT INTO cities VALUES (3805, 21, 'Urucuia', false, -16.115420199999999, -45.689757299999997);
INSERT INTO cities VALUES (3806, 21, 'Vargem Alegre', false, -19.5968494, -42.291308700000002);
INSERT INTO cities VALUES (3807, 21, 'Vargem Bonita', false, -19.25, -44.100000000000001);
INSERT INTO cities VALUES (3808, 21, 'Vargem Grande do Rio Pardo', false, -15.259527500000001, -42.218794699999997);
INSERT INTO cities VALUES (3809, 21, 'Varginha', false, -22.133333, -45.533332999999999);
INSERT INTO cities VALUES (3810, 21, 'Varjão de Minas', false, -18.376843600000001, -46.032499799999997);
INSERT INTO cities VALUES (3811, 21, 'Várzea da Palma', false, -17.594574000000001, -44.724467699999998);
INSERT INTO cities VALUES (3812, 21, 'Varzelândia', false, -15.700234399999999, -44.030086699999998);
INSERT INTO cities VALUES (3813, 21, 'Vazante', false, -17.989763, -46.899830899999998);
INSERT INTO cities VALUES (3814, 21, 'Verdelândia', false, -15.5894537, -43.6048434);
INSERT INTO cities VALUES (3815, 21, 'Veredinha', false, -15.62063, -42.099670000000003);
INSERT INTO cities VALUES (3816, 21, 'Veríssimo', false, -19.664465400000001, -48.308210799999998);
INSERT INTO cities VALUES (3817, 21, 'Vermelho Novo', false, -20.0346984, -42.272091699999997);
INSERT INTO cities VALUES (3818, 21, 'Vespasiano', false, -19.693391099999999, -43.913722);
INSERT INTO cities VALUES (3819, 21, 'Viçosa', false, -20.754590199999999, -42.882524199999999);
INSERT INTO cities VALUES (3820, 21, 'Vieiras', false, -20.858189200000002, -42.249172700000003);
INSERT INTO cities VALUES (3821, 21, 'Virgem da Lapa', false, -16.806013100000001, -42.3420597);
INSERT INTO cities VALUES (3822, 21, 'Virgínia', false, -22.333749099999999, -45.091340099999996);
INSERT INTO cities VALUES (3823, 21, 'Virginópolis', false, -18.818034900000001, -42.696024800000004);
INSERT INTO cities VALUES (3824, 21, 'Virgolândia', false, -18.4546621, -42.303966099999997);
INSERT INTO cities VALUES (3825, 21, 'Visconde do Rio Branco', false, -21.017253400000001, -42.837832599999999);
INSERT INTO cities VALUES (3826, 21, 'Volta Grande', false, -21.770786399999999, -42.540548399999999);
INSERT INTO cities VALUES (3827, 21, 'Wenceslau Braz', false, -22.513024999999999, -45.386259799999998);
INSERT INTO cities VALUES (3828, 21, 'Belo Horizonte', true, -17.598615599999999, -41.492553999999998);
INSERT INTO cities VALUES (3829, 22, 'Afonso Cláudio', false, -20.0730182, -41.119737000000001);
INSERT INTO cities VALUES (3830, 22, 'Água Doce do Norte', false, -18.547955300000002, -40.981559300000001);
INSERT INTO cities VALUES (3831, 22, 'Águia Branca', false, -18.9794789, -40.733248400000001);
INSERT INTO cities VALUES (3832, 22, 'Alegre', false, -20.763259399999999, -41.533864000000001);
INSERT INTO cities VALUES (3833, 22, 'Alfredo Chaves', false, -20.635711700000002, -40.749309599999997);
INSERT INTO cities VALUES (3834, 22, 'Alto Rio Novo', false, -19.046698599999999, -41.010171700000001);
INSERT INTO cities VALUES (3835, 22, 'Anchieta', false, -20.721474000000001, -40.781406099999998);
INSERT INTO cities VALUES (3836, 22, 'Apiacá', false, -21.146910099999999, -41.563663200000001);
INSERT INTO cities VALUES (3837, 22, 'Aracruz', false, -19.819577899999999, -40.274340799999997);
INSERT INTO cities VALUES (3838, 22, 'Atilio Vivacqua', false, -20.913768900000001, -41.1920687);
INSERT INTO cities VALUES (3839, 22, 'Baixo Guandu', false, -19.5156189, -41.012287800000003);
INSERT INTO cities VALUES (3840, 22, 'Barra de São Francisco', false, -18.7524935, -40.893030099999997);
INSERT INTO cities VALUES (3841, 22, 'Boa Esperança', false, -18.540367700000001, -40.289417);
INSERT INTO cities VALUES (3842, 22, 'Bom Jesus do Norte', false, -21.1158827, -41.673020999999999);
INSERT INTO cities VALUES (3843, 22, 'Brejetuba', false, -20.144316199999999, -41.298123599999997);
INSERT INTO cities VALUES (3844, 22, 'Cachoeiro de Itapemirim', false, -20.8493678, -41.113221000000003);
INSERT INTO cities VALUES (3845, 22, 'Cariacica', false, -20.265518700000001, -40.420328099999999);
INSERT INTO cities VALUES (3846, 22, 'Castelo', false, -20.607594500000001, -41.186611900000003);
INSERT INTO cities VALUES (3847, 22, 'Colatina', false, -19.5381608, -40.632435899999997);
INSERT INTO cities VALUES (3848, 22, 'Conceição da Barra', false, -18.592569099999999, -39.734652799999999);
INSERT INTO cities VALUES (3849, 22, 'Conceição do Castelo', false, -20.3638163, -41.249152700000003);
INSERT INTO cities VALUES (3850, 22, 'Divino de São Lourenço', false, -20.619859399999999, -41.686889800000003);
INSERT INTO cities VALUES (3851, 22, 'Domingos Martins', false, -20.363852600000001, -40.6597972);
INSERT INTO cities VALUES (3852, 22, 'Dores do Rio Preto', false, -20.693244400000001, -41.841764099999999);
INSERT INTO cities VALUES (3853, 22, 'Ecoporanga', false, -18.371603799999999, -40.829601699999998);
INSERT INTO cities VALUES (3854, 22, 'Fundão', false, -19.935202199999999, -40.412844200000002);
INSERT INTO cities VALUES (3855, 22, 'Governador Lindenberg', false, -19.252978800000001, -40.463118899999998);
INSERT INTO cities VALUES (3856, 22, 'Guaçuí', false, -20.7761931, -41.6759111);
INSERT INTO cities VALUES (3857, 22, 'Guarapari', false, -20.651072299999999, -40.506688699999998);
INSERT INTO cities VALUES (3858, 22, 'Ibatiba', false, -20.240350100000001, -41.5060644);
INSERT INTO cities VALUES (3859, 22, 'Ibiraçu', false, -19.829737699999999, -40.374661600000003);
INSERT INTO cities VALUES (3860, 22, 'Ibitirama', false, -20.537046100000001, -41.6672054);
INSERT INTO cities VALUES (3861, 22, 'Iconha', false, -20.788567199999999, -40.814398500000003);
INSERT INTO cities VALUES (3862, 22, 'Irupi', false, -20.3465083, -41.641929699999999);
INSERT INTO cities VALUES (3863, 22, 'Itaguaçu', false, -19.8020456, -40.856523299999999);
INSERT INTO cities VALUES (3864, 22, 'Itapemirim', false, -21.0118182, -40.834010200000002);
INSERT INTO cities VALUES (3865, 22, 'Itarana', false, -19.873611799999999, -40.8840547);
INSERT INTO cities VALUES (3866, 22, 'Iúna', false, -20.3517276, -41.532803899999998);
INSERT INTO cities VALUES (3867, 22, 'Jaguaré', false, -18.905135900000001, -40.088667200000003);
INSERT INTO cities VALUES (3868, 22, 'Jerônimo Monteiro', false, -20.785569800000001, -41.397939999999998);
INSERT INTO cities VALUES (3869, 22, 'João Neiva', false, -19.7583144, -40.376424499999999);
INSERT INTO cities VALUES (3870, 22, 'Laranja da Terra', false, -19.893888499999999, -41.061764099999998);
INSERT INTO cities VALUES (3871, 22, 'Linhares', false, -19.3909153, -40.071503200000002);
INSERT INTO cities VALUES (3872, 22, 'Mantenópolis', false, -18.8595595, -41.119986099999998);
INSERT INTO cities VALUES (3873, 22, 'Marataízes', false, -21.043579300000001, -40.824356199999997);
INSERT INTO cities VALUES (3874, 22, 'Marechal Floriano', false, -20.413504799999998, -40.6768565);
INSERT INTO cities VALUES (3875, 22, 'Marilândia', false, -19.414801400000002, -40.535938899999998);
INSERT INTO cities VALUES (3876, 22, 'Mimoso do Sul', false, -21.066062200000001, -41.367891499999999);
INSERT INTO cities VALUES (3877, 22, 'Montanha', false, -18.126255499999999, -40.366190600000003);
INSERT INTO cities VALUES (3878, 22, 'Mucurici', false, -18.092245999999999, -40.525829799999997);
INSERT INTO cities VALUES (3879, 22, 'Muniz Freire', false, -20.462361300000001, -41.415166300000003);
INSERT INTO cities VALUES (3880, 22, 'Muqui', false, -20.950489699999999, -41.342519000000003);
INSERT INTO cities VALUES (3881, 22, 'Nova Venécia', false, -18.7055963, -40.398248199999998);
INSERT INTO cities VALUES (3882, 22, 'Pancas', false, -19.224273799999999, -40.8512159);
INSERT INTO cities VALUES (3883, 22, 'Pedro Canário', false, -18.302281199999999, -39.955470900000002);
INSERT INTO cities VALUES (3884, 22, 'Pinheiros', false, -18.407391199999999, -40.224757199999999);
INSERT INTO cities VALUES (3885, 22, 'Piúma', false, -20.835242600000001, -40.728259899999998);
INSERT INTO cities VALUES (3886, 22, 'Ponto Belo', false, -18.126036200000001, -40.533478899999999);
INSERT INTO cities VALUES (3887, 22, 'Presidente Kennedy', false, -21.0942711, -41.039850999999999);
INSERT INTO cities VALUES (3888, 22, 'Rio Bananal', false, -19.266245099999999, -40.333170000000003);
INSERT INTO cities VALUES (3889, 22, 'Rio Novo do Sul', false, -20.863694299999999, -40.936145600000003);
INSERT INTO cities VALUES (3890, 22, 'Santa Leopoldina', false, -20.1025147, -40.529282500000001);
INSERT INTO cities VALUES (3891, 22, 'Santa Maria de Jetibá', false, -20.0263089, -40.740940999999999);
INSERT INTO cities VALUES (3892, 22, 'Santa Teresa', false, -19.931463699999998, -40.595242599999999);
INSERT INTO cities VALUES (4137, 24, 'Conchas', false, -23.0134875, -48.005715000000002);
INSERT INTO cities VALUES (3893, 22, 'São Domingos do Norte', false, -19.144470900000002, -40.624460900000003);
INSERT INTO cities VALUES (3894, 22, 'São Gabriel da Palha', false, -19.017689499999999, -40.535580000000003);
INSERT INTO cities VALUES (3895, 22, 'São José do Calçado', false, -21.0252743, -41.655578599999998);
INSERT INTO cities VALUES (3896, 22, 'São Mateus', false, -18.716712399999999, -39.859389);
INSERT INTO cities VALUES (3897, 22, 'São Roque do Canaã', false, -19.7386637, -40.658948600000002);
INSERT INTO cities VALUES (3898, 22, 'Serra', false, -20.1294383, -40.308032900000001);
INSERT INTO cities VALUES (3899, 22, 'Sooretama', false, -19.197936299999999, -40.091287899999998);
INSERT INTO cities VALUES (3900, 22, 'Vargem Alta', false, -20.671104199999998, -41.0074027);
INSERT INTO cities VALUES (3901, 22, 'Venda Nova do Imigrante', false, -20.334941400000002, -41.130432800000001);
INSERT INTO cities VALUES (3902, 22, 'Viana', false, -20.389251099999999, -40.494768000000001);
INSERT INTO cities VALUES (3903, 22, 'Vila Pavão', false, -18.625870500000001, -40.603945600000003);
INSERT INTO cities VALUES (3904, 22, 'Vila Valério', false, -18.9979227, -40.389954799999998);
INSERT INTO cities VALUES (3905, 22, 'Vila Velha', false, -20.330467299999999, -40.292161200000002);
INSERT INTO cities VALUES (3906, 22, 'Vitória', true, -22.756829199999999, -43.417847000000002);
INSERT INTO cities VALUES (3907, 23, 'Angra dos Reis', false, -23.0100488, -44.318384500000001);
INSERT INTO cities VALUES (3908, 23, 'Aperibé', false, -21.621589799999999, -42.1033197);
INSERT INTO cities VALUES (3909, 23, 'Araruama', false, -22.876305500000001, -42.3393321);
INSERT INTO cities VALUES (3910, 23, 'Areal', false, -22.232991899999998, -43.110495100000001);
INSERT INTO cities VALUES (3911, 23, 'Armação dos Búzios', false, -22.748077200000001, -41.881315200000003);
INSERT INTO cities VALUES (3912, 23, 'Arraial do Cabo', false, -22.9659887, -42.028832000000001);
INSERT INTO cities VALUES (3913, 23, 'Barra do Piraí', false, -22.470458000000001, -43.826838199999997);
INSERT INTO cities VALUES (3914, 23, 'Barra Mansa', false, -22.545351400000001, -44.169848000000002);
INSERT INTO cities VALUES (3915, 23, 'Belford Roxo', false, -22.764235299999999, -43.399161900000003);
INSERT INTO cities VALUES (3916, 23, 'Bom Jardim', false, -22.1520063, -42.421885600000003);
INSERT INTO cities VALUES (3917, 23, 'Bom Jesus do Itabapoana', false, -21.139722800000001, -41.663294);
INSERT INTO cities VALUES (3918, 23, 'Cabo Frio', false, -22.878683299999999, -42.0198757);
INSERT INTO cities VALUES (3919, 23, 'Cachoeiras de Macacu', false, -22.463787, -42.652750300000001);
INSERT INTO cities VALUES (3920, 23, 'Cambuci', false, -21.572697099999999, -41.909557);
INSERT INTO cities VALUES (3921, 23, 'Campos dos Goytacazes', false, -21.754468299999999, -41.324407000000001);
INSERT INTO cities VALUES (3922, 23, 'Cantagalo', false, -21.9820387, -42.367881699999998);
INSERT INTO cities VALUES (3923, 23, 'Carapebus', false, -22.2033114, -41.662507900000001);
INSERT INTO cities VALUES (3924, 23, 'Cardoso Moreira', false, -21.493758400000001, -41.6195156);
INSERT INTO cities VALUES (3925, 23, 'Carmo', false, -21.9239088, -42.614883399999997);
INSERT INTO cities VALUES (3926, 23, 'Casimiro de Abreu', false, -22.484904199999999, -42.2013289);
INSERT INTO cities VALUES (3927, 23, 'Comendador Levy Gasparian', false, -22.042724799999998, -43.208294299999999);
INSERT INTO cities VALUES (3928, 23, 'Conceição de Macabu', false, -22.0843594, -41.868495199999998);
INSERT INTO cities VALUES (3929, 23, 'Cordeiro', false, -22.018136899999998, -42.369413799999997);
INSERT INTO cities VALUES (3930, 23, 'Duas Barras', false, -22.050741599999998, -42.524894099999997);
INSERT INTO cities VALUES (3931, 23, 'Duque de Caxias', false, -22.786824599999999, -43.313106300000001);
INSERT INTO cities VALUES (3932, 23, 'Engenheiro Paulo de Frontin', false, -22.553684700000002, -43.684780400000001);
INSERT INTO cities VALUES (3933, 23, 'Guapimirim', false, -22.532560400000001, -42.989982099999999);
INSERT INTO cities VALUES (3934, 23, 'Iguaba Grande', false, -22.8409017, -42.223803099999998);
INSERT INTO cities VALUES (3935, 23, 'Itaboraí', false, -22.747186599999999, -42.858478699999999);
INSERT INTO cities VALUES (3936, 23, 'Itaguaí', false, -22.8665387, -43.777223999999997);
INSERT INTO cities VALUES (3937, 23, 'Italva', false, -21.431253000000002, -41.692304999999998);
INSERT INTO cities VALUES (3938, 23, 'Itaocara', false, -21.675688099999999, -42.081813699999998);
INSERT INTO cities VALUES (3939, 23, 'Itaperuna', false, -21.206529499999998, -41.8895689);
INSERT INTO cities VALUES (3940, 23, 'Itatiaia', false, -22.495877100000001, -44.561778699999998);
INSERT INTO cities VALUES (3941, 23, 'Japeri', false, -22.643124100000001, -43.653952400000001);
INSERT INTO cities VALUES (3942, 23, 'Laje do Muriaé', false, -21.206675000000001, -42.132607700000001);
INSERT INTO cities VALUES (3943, 23, 'Macaé', false, -22.3717218, -41.785728400000004);
INSERT INTO cities VALUES (3944, 23, 'Macuco', false, -21.977609999999999, -42.246034799999997);
INSERT INTO cities VALUES (3945, 23, 'Magé', false, -22.656703799999999, -43.039802799999997);
INSERT INTO cities VALUES (3946, 23, 'Mangaratiba', false, -22.959717300000001, -44.0411243);
INSERT INTO cities VALUES (3947, 23, 'Maricá', false, -22.9190924, -42.818284900000002);
INSERT INTO cities VALUES (3948, 23, 'Mendes', false, -22.526342400000001, -43.727652599999999);
INSERT INTO cities VALUES (3949, 23, 'Mesquita', false, -22.782445299999999, -43.429388099999997);
INSERT INTO cities VALUES (3950, 23, 'Miguel Pereira', false, -22.4650529, -43.4654594);
INSERT INTO cities VALUES (3951, 23, 'Miracema', false, -21.4146237, -42.192466799999998);
INSERT INTO cities VALUES (3952, 23, 'Natividade', false, -21.044336600000001, -41.974817100000003);
INSERT INTO cities VALUES (3953, 23, 'Nilópolis', false, -22.808541399999999, -43.414540100000004);
INSERT INTO cities VALUES (3954, 23, 'Niterói', false, -22.880765499999999, -43.104334999999999);
INSERT INTO cities VALUES (3955, 23, 'Nova Friburgo', false, -22.287135599999999, -42.5336979);
INSERT INTO cities VALUES (3956, 23, 'Nova Iguaçu', false, -22.759763100000001, -43.451554199999997);
INSERT INTO cities VALUES (3957, 23, 'Paracambi', false, -22.611393799999998, -43.709488700000001);
INSERT INTO cities VALUES (3958, 23, 'Paraíba do Sul', false, -22.162906100000001, -43.293236200000003);
INSERT INTO cities VALUES (3959, 23, 'Parati', false, -23.216707499999998, -44.717938099999998);
INSERT INTO cities VALUES (3960, 23, 'Paty do Alferes', false, -22.4193538, -43.422575000000002);
INSERT INTO cities VALUES (3961, 23, 'Petrópolis', false, -22.504638799999999, -43.1823294);
INSERT INTO cities VALUES (3962, 23, 'Pinheiral', false, -22.5200307, -43.996807599999997);
INSERT INTO cities VALUES (3963, 23, 'Piraí', false, -22.633486399999999, -43.904602300000001);
INSERT INTO cities VALUES (3964, 23, 'Porciúncula', false, -20.963649100000001, -42.042758399999997);
INSERT INTO cities VALUES (3965, 23, 'Porto Real', false, -22.433395600000001, -44.291403500000001);
INSERT INTO cities VALUES (3966, 23, 'Quatis', false, -22.408367599999998, -44.260435200000003);
INSERT INTO cities VALUES (3967, 23, 'Queimados', false, -22.716459700000001, -43.555419899999997);
INSERT INTO cities VALUES (3968, 23, 'Quissamã', false, -22.103168499999999, -41.456918100000003);
INSERT INTO cities VALUES (3969, 23, 'Resende', false, -22.462652299999998, -44.4555528);
INSERT INTO cities VALUES (3970, 23, 'Rio Bonito', false, -22.708366099999999, -42.6259698);
INSERT INTO cities VALUES (3971, 23, 'Rio Claro', false, -22.7238522, -44.1277112);
INSERT INTO cities VALUES (3972, 23, 'Rio das Flores', false, -22.159026300000001, -43.580964399999999);
INSERT INTO cities VALUES (3973, 23, 'Rio das Ostras', false, -22.527277099999999, -41.945590099999997);
INSERT INTO cities VALUES (3974, 23, 'Santa Maria Madalena', false, -21.9700846, -41.999239899999999);
INSERT INTO cities VALUES (3975, 23, 'Santo Antônio de Pádua', false, -21.539687300000001, -42.181030999999997);
INSERT INTO cities VALUES (3976, 23, 'São Fidélis', false, -21.643121799999999, -41.757816099999999);
INSERT INTO cities VALUES (3977, 23, 'São Francisco de Itabapoana', false, -21.473724600000001, -41.120170700000003);
INSERT INTO cities VALUES (3978, 23, 'São Gonçalo', false, -22.827099400000002, -43.054379400000002);
INSERT INTO cities VALUES (3979, 23, 'São João da Barra', false, -21.648754499999999, -41.0526026);
INSERT INTO cities VALUES (3980, 23, 'São João de Meriti', false, -22.8038095, -43.372654799999999);
INSERT INTO cities VALUES (3981, 23, 'São José de Ubá', false, -21.3659821, -41.934580699999998);
INSERT INTO cities VALUES (3982, 23, 'São José do Vale do Rio Preto', false, -22.153047999999998, -42.925326400000003);
INSERT INTO cities VALUES (3983, 23, 'São Pedro da Aldeia', false, -22.836222899999999, -42.1037222);
INSERT INTO cities VALUES (3984, 23, 'São Sebastião do Alto', false, -21.9571842, -42.139449900000002);
INSERT INTO cities VALUES (3985, 23, 'Sapucaia', false, -21.993518399999999, -42.900993800000002);
INSERT INTO cities VALUES (3986, 23, 'Saquarema', false, -22.931002299999999, -42.496440499999999);
INSERT INTO cities VALUES (3987, 23, 'Seropédica', false, -22.741391400000001, -43.7052531);
INSERT INTO cities VALUES (3988, 23, 'Silva Jardim', false, -22.659513499999999, -42.382432799999997);
INSERT INTO cities VALUES (3989, 23, 'Sumidouro', false, -22.0452452, -42.673403200000003);
INSERT INTO cities VALUES (3990, 23, 'Tanguá', false, -22.732113900000002, -42.712471600000001);
INSERT INTO cities VALUES (3991, 23, 'Teresópolis', false, -22.412324000000002, -42.966432500000003);
INSERT INTO cities VALUES (3992, 23, 'Trajano de Morais', false, -22.0717918, -42.065803699999996);
INSERT INTO cities VALUES (3993, 23, 'Três Rios', false, -22.1182771, -43.209538500000001);
INSERT INTO cities VALUES (3994, 23, 'Valença', false, -22.245953400000001, -43.703134599999998);
INSERT INTO cities VALUES (3995, 23, 'Varre-Sai', false, -20.931130400000001, -41.868988000000002);
INSERT INTO cities VALUES (3996, 23, 'Vassouras', false, -22.4044451, -43.6632867);
INSERT INTO cities VALUES (3997, 23, 'Volta Redonda', false, -22.525151399999999, -44.103779400000001);
INSERT INTO cities VALUES (3998, 23, 'Rio de Janeiro', true, -22.91, -43.175555600000003);
INSERT INTO cities VALUES (3999, 24, 'Adamantina', false, -21.6755742, -51.062956999999997);
INSERT INTO cities VALUES (4000, 24, 'Adolfo', false, -21.2375367, -49.642726400000001);
INSERT INTO cities VALUES (4001, 24, 'Aguaí', false, -22.069168999999999, -46.980954799999999);
INSERT INTO cities VALUES (4002, 24, 'Águas da Prata', false, -21.938332200000001, -46.715107500000002);
INSERT INTO cities VALUES (4003, 24, 'Águas de Lindóia', false, -22.476699400000001, -46.633384599999999);
INSERT INTO cities VALUES (4004, 24, 'Águas de Santa Bárbara', false, -22.881190400000001, -49.239061999999997);
INSERT INTO cities VALUES (4005, 24, 'Águas de São Pedro', false, -22.6000564, -47.875273700000001);
INSERT INTO cities VALUES (4006, 24, 'Agudos', false, -22.4691428, -48.989530899999998);
INSERT INTO cities VALUES (4007, 24, 'Alambari', false, -23.551238600000001, -47.900642099999999);
INSERT INTO cities VALUES (4008, 24, 'Alfredo Marcondes', false, -21.955994100000002, -51.410825199999998);
INSERT INTO cities VALUES (4009, 24, 'Altair', false, -20.520425700000001, -49.053365300000003);
INSERT INTO cities VALUES (4010, 24, 'Altinópolis', false, -21.023927, -47.372695299999997);
INSERT INTO cities VALUES (4011, 24, 'Alto Alegre', false, -21.5894455, -50.1687309);
INSERT INTO cities VALUES (4012, 24, 'Alumínio', false, -23.5350514, -47.261052599999999);
INSERT INTO cities VALUES (4013, 24, 'Álvares Florence', false, -20.320237800000001, -49.911815400000002);
INSERT INTO cities VALUES (4014, 24, 'Álvares Machado', false, -22.096416399999999, -51.4753781);
INSERT INTO cities VALUES (4015, 24, 'Álvaro de Carvalho', false, -22.083704399999998, -49.715614600000002);
INSERT INTO cities VALUES (4016, 24, 'Alvinlândia', false, -22.441065500000001, -49.7633261);
INSERT INTO cities VALUES (4017, 24, 'Americana', false, -22.738788400000001, -47.331913399999998);
INSERT INTO cities VALUES (4018, 24, 'Américo Brasiliense', false, -21.7259937, -48.100956500000002);
INSERT INTO cities VALUES (4019, 24, 'Américo de Campos', false, -20.298048099999999, -49.735854099999997);
INSERT INTO cities VALUES (4020, 24, 'Amparo', false, -22.701509900000001, -46.764371300000001);
INSERT INTO cities VALUES (4021, 24, 'Analândia', false, -22.126675299999999, -47.663670699999997);
INSERT INTO cities VALUES (4022, 24, 'Andradina', false, -20.893895799999999, -51.3836516);
INSERT INTO cities VALUES (4023, 24, 'Angatuba', false, -23.488307899999999, -48.414040499999999);
INSERT INTO cities VALUES (4024, 24, 'Anhembi', false, -22.788651300000001, -48.127516100000001);
INSERT INTO cities VALUES (4025, 24, 'Anhumas', false, -22.5, -49.733333000000002);
INSERT INTO cities VALUES (4026, 24, 'Aparecida', false, -22.847954699999999, -45.2274107);
INSERT INTO cities VALUES (4027, 24, 'Aparecida d`Oeste', false, -20.456365600000002, -50.888302099999997);
INSERT INTO cities VALUES (4028, 24, 'Apiaí', false, -24.513740899999998, -48.843215100000002);
INSERT INTO cities VALUES (4029, 24, 'Araçariguama', false, -23.438966700000002, -47.062755799999998);
INSERT INTO cities VALUES (4030, 24, 'Araçatuba', false, -21.211544499999999, -50.426136399999997);
INSERT INTO cities VALUES (4031, 24, 'Araçoiaba da Serra', false, -23.504506299999999, -47.614474999999999);
INSERT INTO cities VALUES (4032, 24, 'Aramina', false, -20.091207399999998, -47.789355499999999);
INSERT INTO cities VALUES (4033, 24, 'Arandu', false, -23.135725799999999, -49.054560600000002);
INSERT INTO cities VALUES (4034, 24, 'Arapeí', false, -22.674766099999999, -44.444469400000003);
INSERT INTO cities VALUES (4035, 24, 'Araraquara', false, -21.083333, -47.316667000000002);
INSERT INTO cities VALUES (4036, 24, 'Araras', false, -22.357731900000001, -47.384945500000001);
INSERT INTO cities VALUES (4037, 24, 'Arco-Íris', false, -21.790731300000001, -50.470163599999999);
INSERT INTO cities VALUES (4038, 24, 'Arealva', false, -22.027321499999999, -48.910038999999998);
INSERT INTO cities VALUES (4039, 24, 'Areias', false, -21.516667000000002, -46.583333000000003);
INSERT INTO cities VALUES (4040, 24, 'Areiópolis', false, -22.669259400000001, -48.663314399999997);
INSERT INTO cities VALUES (4041, 24, 'Ariranha', false, -21.189465899999998, -48.788156499999999);
INSERT INTO cities VALUES (4042, 24, 'Artur Nogueira', false, -22.573533300000001, -47.173258799999999);
INSERT INTO cities VALUES (4043, 24, 'Arujá', false, -23.396451599999999, -46.321444399999997);
INSERT INTO cities VALUES (4044, 24, 'Aspásia', false, -20.152290000000001, -50.727210100000001);
INSERT INTO cities VALUES (4045, 24, 'Assis', false, -22.660969300000001, -50.399546000000001);
INSERT INTO cities VALUES (4046, 24, 'Atibaia', false, -23.117115999999999, -46.5502161);
INSERT INTO cities VALUES (4047, 24, 'Auriflama', false, -20.6859523, -50.555525600000003);
INSERT INTO cities VALUES (4048, 24, 'Avaí', false, -22.149152699999998, -49.322754099999997);
INSERT INTO cities VALUES (4049, 24, 'Avanhandava', false, -21.463756700000001, -49.949384100000003);
INSERT INTO cities VALUES (4050, 24, 'Avaré', false, -23.104485100000002, -48.939696699999999);
INSERT INTO cities VALUES (4051, 24, 'Bady Bassitt', false, -20.919791100000001, -49.446359100000002);
INSERT INTO cities VALUES (4052, 24, 'Balbinos', false, -21.904514800000001, -49.358561600000002);
INSERT INTO cities VALUES (4053, 24, 'Bálsamo', false, -20.300000000000001, -47.299999999999997);
INSERT INTO cities VALUES (4054, 24, 'Bananal', false, -22.680676500000001, -44.323662499999998);
INSERT INTO cities VALUES (4055, 24, 'Barão de Antonina', false, -23.627242899999999, -49.561298800000003);
INSERT INTO cities VALUES (4056, 24, 'Barbosa', false, -21.269010999999999, -49.947548500000003);
INSERT INTO cities VALUES (4057, 24, 'Bariri', false, -22.074382100000001, -48.740502999999997);
INSERT INTO cities VALUES (4058, 24, 'Barra Bonita', false, -22.499393099999999, -48.552294099999997);
INSERT INTO cities VALUES (4059, 24, 'Barra do Chapéu', false, -24.4735242, -49.016013100000002);
INSERT INTO cities VALUES (4060, 24, 'Barra do Turvo', false, -24.761890000000001, -48.504829000000001);
INSERT INTO cities VALUES (4061, 24, 'Barretos', false, -20.559217100000001, -48.568862099999997);
INSERT INTO cities VALUES (4062, 24, 'Barrinha', false, -21.1906736, -48.161879300000003);
INSERT INTO cities VALUES (4063, 24, 'Barueri', false, -23.511301499999998, -46.8767748);
INSERT INTO cities VALUES (4064, 24, 'Bastos', false, -21.921372999999999, -50.732054699999999);
INSERT INTO cities VALUES (4065, 24, 'Batatais', false, -20.891631, -47.585646400000002);
INSERT INTO cities VALUES (4066, 24, 'Bauru', false, -22.3154431, -49.061464899999997);
INSERT INTO cities VALUES (4067, 24, 'Bebedouro', false, -20.9495638, -48.478862700000001);
INSERT INTO cities VALUES (4068, 24, 'Bento de Abreu', false, -21.2684186, -50.811049099999998);
INSERT INTO cities VALUES (4069, 24, 'Bernardino de Campos', false, -23.630630499999999, -46.673241699999998);
INSERT INTO cities VALUES (4070, 24, 'Bertioga', false, -23.855283799999999, -46.139393699999999);
INSERT INTO cities VALUES (4071, 24, 'Bilac', false, -21.407415, -50.472432400000002);
INSERT INTO cities VALUES (4072, 24, 'Birigui', false, -21.289165000000001, -50.341126099999997);
INSERT INTO cities VALUES (4073, 24, 'Biritiba-Mirim', false, -23.573875099999999, -46.038643999999998);
INSERT INTO cities VALUES (4074, 24, 'Boa Esperança do Sul', false, -21.9948628, -48.391535300000001);
INSERT INTO cities VALUES (4075, 24, 'Bocaina', false, -22.134498000000001, -48.516066600000002);
INSERT INTO cities VALUES (4076, 24, 'Bofete', false, -23.098212, -48.258828100000002);
INSERT INTO cities VALUES (4077, 24, 'Boituva', false, -23.285429400000002, -47.674019600000001);
INSERT INTO cities VALUES (4078, 24, 'Bom Jesus dos Perdões', false, -23.135027300000001, -46.465580600000003);
INSERT INTO cities VALUES (4079, 24, 'Bom Sucesso de Itararé', false, -24.318916399999999, -49.144620500000002);
INSERT INTO cities VALUES (4080, 24, 'Borá', false, -22.2644576, -50.537200599999998);
INSERT INTO cities VALUES (4081, 24, 'Boracéia', false, -22.1923174, -48.781073599999999);
INSERT INTO cities VALUES (4082, 24, 'Borborema', false, -21.620537599999999, -49.074567799999997);
INSERT INTO cities VALUES (4083, 24, 'Borebi', false, -22.564383200000002, -48.968086100000001);
INSERT INTO cities VALUES (4084, 24, 'Botucatu', false, -22.890395699999999, -48.455308700000003);
INSERT INTO cities VALUES (4085, 24, 'Bragança Paulista', false, -22.9522914, -46.542455500000003);
INSERT INTO cities VALUES (4086, 24, 'Braúna', false, -21.498855800000001, -50.315556600000001);
INSERT INTO cities VALUES (4087, 24, 'Brejo Alegre', false, -21.166149999999998, -50.181894700000001);
INSERT INTO cities VALUES (4088, 24, 'Brodowski', false, -20.984154100000001, -47.659182199999996);
INSERT INTO cities VALUES (4089, 24, 'Brotas', false, -22.284432599999999, -48.127452499999997);
INSERT INTO cities VALUES (4090, 24, 'Buri', false, -23.799053399999998, -48.587431799999997);
INSERT INTO cities VALUES (4091, 24, 'Buritama', false, -21.0639997, -50.142454100000002);
INSERT INTO cities VALUES (4092, 24, 'Buritizal', false, -20.191282999999999, -47.705085199999999);
INSERT INTO cities VALUES (4093, 24, 'Cabrália Paulista', false, -22.457906699999999, -49.341033299999999);
INSERT INTO cities VALUES (4094, 24, 'Cabreúva', false, -23.3239251, -47.1314779);
INSERT INTO cities VALUES (4095, 24, 'Caçapava', false, -23.102035300000001, -45.706876000000001);
INSERT INTO cities VALUES (4096, 24, 'Cachoeira Paulista', false, -22.674379600000002, -44.997828499999997);
INSERT INTO cities VALUES (4097, 24, 'Caconde', false, -21.5323058, -46.649866799999998);
INSERT INTO cities VALUES (4098, 24, 'Cafelândia', false, -21.8001997, -49.614918000000003);
INSERT INTO cities VALUES (4099, 24, 'Caiabu', false, -22.013279799999999, -51.234754299999999);
INSERT INTO cities VALUES (4100, 24, 'Caieiras', false, -23.364522300000001, -46.7403233);
INSERT INTO cities VALUES (4101, 24, 'Caiuá', false, -21.832932100000001, -51.990143500000002);
INSERT INTO cities VALUES (4102, 24, 'Cajamar', false, -23.356511900000001, -46.876869200000002);
INSERT INTO cities VALUES (4103, 24, 'Cajati', false, -24.729932900000001, -48.102791799999999);
INSERT INTO cities VALUES (4104, 24, 'Cajobi', false, -20.880157700000002, -48.808429699999998);
INSERT INTO cities VALUES (4105, 24, 'Cajuru', false, -21.276023200000001, -47.300715599999997);
INSERT INTO cities VALUES (4106, 24, 'Campina do Monte Alegre', false, -23.585737999999999, -48.485036299999997);
INSERT INTO cities VALUES (4107, 24, 'Campinas', false, -22.906364799999999, -47.061574100000001);
INSERT INTO cities VALUES (4108, 24, 'Campo Limpo Paulista', false, -23.2066716, -46.784468099999998);
INSERT INTO cities VALUES (4109, 24, 'Campos do Jordão', false, -22.739553300000001, -45.591467999999999);
INSERT INTO cities VALUES (4110, 24, 'Campos Novos Paulista', false, -22.612270299999999, -49.997644200000003);
INSERT INTO cities VALUES (4111, 24, 'Cananéia', false, -25.024353300000001, -47.9322667);
INSERT INTO cities VALUES (4112, 24, 'Canas', false, -22.704419600000001, -45.055424000000002);
INSERT INTO cities VALUES (4113, 24, 'Cândido Mota', false, -22.746130600000001, -50.387473200000002);
INSERT INTO cities VALUES (4114, 24, 'Cândido Rodrigues', false, -21.325969799999999, -48.630904899999997);
INSERT INTO cities VALUES (4115, 24, 'Canitar', false, -23.0071063, -49.776338099999997);
INSERT INTO cities VALUES (4116, 24, 'Capão Bonito', false, -24.0039978, -48.3392658);
INSERT INTO cities VALUES (4117, 24, 'Capela do Alto', false, -23.4687898, -47.734365699999998);
INSERT INTO cities VALUES (4118, 24, 'Capivari', false, -22.994868799999999, -47.509542500000002);
INSERT INTO cities VALUES (4119, 24, 'Caraguatatuba', false, -23.622527999999999, -45.411900600000003);
INSERT INTO cities VALUES (4120, 24, 'Carapicuíba', false, -23.522652600000001, -46.8368045);
INSERT INTO cities VALUES (4121, 24, 'Cardoso', false, -20.080716899999999, -49.9143647);
INSERT INTO cities VALUES (4122, 24, 'Casa Branca', false, -21.770076599999999, -47.091875600000002);
INSERT INTO cities VALUES (4123, 24, 'Cássia dos Coqueiros', false, -21.280503499999998, -47.1720647);
INSERT INTO cities VALUES (4124, 24, 'Castilho', false, -20.8708004, -51.486932199999998);
INSERT INTO cities VALUES (4125, 24, 'Catanduva', false, -21.138258199999999, -48.973761600000003);
INSERT INTO cities VALUES (4126, 24, 'Catiguá', false, -21.050992600000001, -49.061751899999997);
INSERT INTO cities VALUES (4127, 24, 'Cedral', false, -20.903821600000001, -49.268250899999998);
INSERT INTO cities VALUES (4128, 24, 'Cerqueira César', false, -23.0458672, -49.1691371);
INSERT INTO cities VALUES (4129, 24, 'Cerquilho', false, -23.167484699999999, -47.7474317);
INSERT INTO cities VALUES (4130, 24, 'Cesário Lange', false, -23.228828400000001, -47.950471399999998);
INSERT INTO cities VALUES (4131, 24, 'Charqueada', false, -22.5108614, -47.777776799999998);
INSERT INTO cities VALUES (4132, 24, 'Chavantes', false, -23.041490599999999, -49.721763799999998);
INSERT INTO cities VALUES (4133, 24, 'Clementina', false, -21.5640906, -50.449372699999998);
INSERT INTO cities VALUES (4134, 24, 'Colina', false, -20.716217799999999, -48.5456924);
INSERT INTO cities VALUES (4135, 24, 'Colômbia', false, -20.1807154, -48.688916800000001);
INSERT INTO cities VALUES (4136, 24, 'Conchal', false, -22.329967400000001, -47.173127999999998);
INSERT INTO cities VALUES (4138, 24, 'Cordeirópolis', false, -22.4802322, -47.4557024);
INSERT INTO cities VALUES (4139, 24, 'Coroados', false, -21.358915400000001, -50.289351000000003);
INSERT INTO cities VALUES (4140, 24, 'Coronel Macedo', false, -23.638680699999998, -49.313505200000002);
INSERT INTO cities VALUES (4141, 24, 'Corumbataí', false, -22.220430799999999, -47.6255308);
INSERT INTO cities VALUES (4142, 24, 'Cosmópolis', false, -22.646226500000001, -47.1966842);
INSERT INTO cities VALUES (4143, 24, 'Cosmorama', false, -20.4766637, -49.774484899999997);
INSERT INTO cities VALUES (4144, 24, 'Cotia', false, -23.604126600000001, -46.9243004);
INSERT INTO cities VALUES (4145, 24, 'Cravinhos', false, -21.3400173, -47.729519799999998);
INSERT INTO cities VALUES (4146, 24, 'Cristais Paulista', false, -20.399009499999998, -47.427818899999998);
INSERT INTO cities VALUES (4147, 24, 'Cruzália', false, -22.742168400000001, -50.792663900000001);
INSERT INTO cities VALUES (4148, 24, 'Cruzeiro', false, -22.576454399999999, -44.963433899999998);
INSERT INTO cities VALUES (4149, 24, 'Cubatão', false, -23.895560100000001, -46.425632899999997);
INSERT INTO cities VALUES (4150, 24, 'Cunha', false, -23.085441299999999, -44.962959499999997);
INSERT INTO cities VALUES (4151, 24, 'Descalvado', false, -21.9039596, -47.619869700000002);
INSERT INTO cities VALUES (4152, 24, 'Diadema', false, -23.686456799999998, -46.623448600000003);
INSERT INTO cities VALUES (4153, 24, 'Dirce Reis', false, -20.464851400000001, -50.6064553);
INSERT INTO cities VALUES (4154, 24, 'Divinolândia', false, -21.656231099999999, -46.7410578);
INSERT INTO cities VALUES (4155, 24, 'Dobrada', false, -21.518791100000001, -48.396759899999999);
INSERT INTO cities VALUES (4156, 24, 'Dois Córregos', false, -22.3661742, -48.380096500000001);
INSERT INTO cities VALUES (4157, 24, 'Dolcinópolis', false, -20.1237405, -50.511368699999998);
INSERT INTO cities VALUES (4158, 24, 'Dourado', false, -22.1035434, -48.313935200000003);
INSERT INTO cities VALUES (4159, 24, 'Dracena', false, -21.483431299999999, -51.533477400000002);
INSERT INTO cities VALUES (4160, 24, 'Duartina', false, -22.414826399999999, -49.406758600000003);
INSERT INTO cities VALUES (4161, 24, 'Dumont', false, -21.2380812, -47.974620100000003);
INSERT INTO cities VALUES (4162, 24, 'Echaporã', false, -22.429436200000001, -50.201467899999997);
INSERT INTO cities VALUES (4163, 24, 'Eldorado', false, -24.502008199999999, -48.084920799999999);
INSERT INTO cities VALUES (4164, 24, 'Elias Fausto', false, -23.043469399999999, -47.374326699999997);
INSERT INTO cities VALUES (4165, 24, 'Elisiário', false, -21.169257900000002, -49.110232600000003);
INSERT INTO cities VALUES (4166, 24, 'Embaúba', false, -20.981892999999999, -48.836545200000003);
INSERT INTO cities VALUES (4167, 24, 'Embu', false, -23.649137, -46.852651100000003);
INSERT INTO cities VALUES (4168, 24, 'Embu-Guaçu', false, -23.830773799999999, -46.812170399999999);
INSERT INTO cities VALUES (4169, 24, 'Emilianópolis', false, -21.832708499999999, -51.482655200000004);
INSERT INTO cities VALUES (4170, 24, 'Engenheiro Coelho', false, -22.488237900000001, -47.215778800000002);
INSERT INTO cities VALUES (4171, 24, 'Espírito Santo do Pinhal', false, -22.183212999999999, -46.762398599999997);
INSERT INTO cities VALUES (4172, 24, 'Espírito Santo do Turvo', false, -22.694929299999998, -49.426338600000001);
INSERT INTO cities VALUES (4173, 24, 'Estiva Gerbi', false, -22.272423799999999, -46.946159199999997);
INSERT INTO cities VALUES (4174, 24, 'Estrela d`Oeste', false, -20.2833313, -50.3996134);
INSERT INTO cities VALUES (4175, 24, 'Estrela do Norte', false, -22.486495000000001, -51.663943600000003);
INSERT INTO cities VALUES (4176, 24, 'Euclides da Cunha Paulista', false, -22.558757499999999, -52.592329700000001);
INSERT INTO cities VALUES (4177, 24, 'Fartura', false, -23.393804299999999, -49.515221699999998);
INSERT INTO cities VALUES (4178, 24, 'Fernando Prestes', false, -21.264562399999999, -48.686969099999999);
INSERT INTO cities VALUES (4179, 24, 'Fernandópolis', false, -20.283446699999999, -50.246597399999999);
INSERT INTO cities VALUES (4180, 24, 'Fernão', false, -22.359136899999999, -49.522599200000002);
INSERT INTO cities VALUES (4181, 24, 'Ferraz de Vasconcelos', false, -23.542254, -46.368961200000001);
INSERT INTO cities VALUES (4182, 24, 'Flora Rica', false, -21.676478299999999, -51.379809100000003);
INSERT INTO cities VALUES (4183, 24, 'Floreal', false, -20.680108400000002, -50.147582999999997);
INSERT INTO cities VALUES (4184, 24, 'Florínia', false, -22.904164099999999, -50.738089100000003);
INSERT INTO cities VALUES (4185, 24, 'Flórida Paulista', false, -21.6281438, -51.173927599999999);
INSERT INTO cities VALUES (4186, 24, 'Franca', false, -20.5417731, -47.419711300000003);
INSERT INTO cities VALUES (4187, 24, 'Francisco Morato', false, -23.280097000000001, -46.743318000000002);
INSERT INTO cities VALUES (4188, 24, 'Franco da Rocha', false, -23.322827199999999, -46.725023100000001);
INSERT INTO cities VALUES (4189, 24, 'Gabriel Monteiro', false, -21.531470200000001, -50.558728299999999);
INSERT INTO cities VALUES (4190, 24, 'Gália', false, -22.291410599999999, -49.555939199999997);
INSERT INTO cities VALUES (4191, 24, 'Garça', false, -22.21274, -49.660369600000003);
INSERT INTO cities VALUES (4192, 24, 'Gastão Vidigal', false, -20.799918699999999, -50.186488599999997);
INSERT INTO cities VALUES (4193, 24, 'Gavião Peixoto', false, -21.840306999999999, -48.496066599999999);
INSERT INTO cities VALUES (4194, 24, 'General Salgado', false, -20.641667699999999, -50.361619300000001);
INSERT INTO cities VALUES (4195, 24, 'Getulina', false, -21.798987799999999, -49.929699999999997);
INSERT INTO cities VALUES (4196, 24, 'Glicério', false, -21.384745599999999, -50.215645600000002);
INSERT INTO cities VALUES (4197, 24, 'Guaiçara', false, -21.625787599999999, -49.797868600000001);
INSERT INTO cities VALUES (4198, 24, 'Guaimbê', false, -21.9108333, -49.897550199999998);
INSERT INTO cities VALUES (4199, 24, 'Guaíra', false, -20.318086900000001, -48.311824700000003);
INSERT INTO cities VALUES (4200, 24, 'Guapiaçu', false, -20.795761299999999, -49.220622200000001);
INSERT INTO cities VALUES (4201, 24, 'Guapiara', false, -24.1863198, -48.533388799999997);
INSERT INTO cities VALUES (4202, 24, 'Guará', false, -20.429059599999999, -47.8248447);
INSERT INTO cities VALUES (4203, 24, 'Guaraçaí', false, -21.0332297, -51.208761899999999);
INSERT INTO cities VALUES (4204, 24, 'Guaraci', false, -20.499970900000001, -48.945244500000001);
INSERT INTO cities VALUES (4205, 24, 'Guarani d`Oeste', false, -20.0734958, -50.336362399999999);
INSERT INTO cities VALUES (4206, 24, 'Guarantã', false, -21.8866871, -49.589119099999998);
INSERT INTO cities VALUES (4207, 24, 'Guararapes', false, -21.259373, -50.643867999999998);
INSERT INTO cities VALUES (4208, 24, 'Guararema', false, -23.412574500000002, -46.041053400000003);
INSERT INTO cities VALUES (4209, 24, 'Guaratinguetá', false, -22.816169599999998, -45.1934653);
INSERT INTO cities VALUES (4210, 24, 'Guareí', false, -23.374184199999998, -48.186732499999998);
INSERT INTO cities VALUES (4211, 24, 'Guariba', false, -21.360717999999999, -48.228248200000003);
INSERT INTO cities VALUES (4212, 24, 'Guarujá', false, -22.466667000000001, -51.616667);
INSERT INTO cities VALUES (4213, 24, 'Guarulhos', false, -23.4634523, -46.533450199999997);
INSERT INTO cities VALUES (4214, 24, 'Guatapará', false, -21.498013, -48.033581300000002);
INSERT INTO cities VALUES (4215, 24, 'Guzolândia', false, -20.640751900000001, -50.659701200000001);
INSERT INTO cities VALUES (4216, 24, 'Herculândia', false, -22.000052199999999, -50.395348800000001);
INSERT INTO cities VALUES (4217, 24, 'Holambra', false, -22.633288799999999, -47.056403099999997);
INSERT INTO cities VALUES (4218, 24, 'Hortolândia', false, -22.857737199999999, -47.220258999999999);
INSERT INTO cities VALUES (4219, 24, 'Iacanga', false, -21.893910699999999, -49.028514299999998);
INSERT INTO cities VALUES (4220, 24, 'Iacri', false, -21.8562409, -50.6917902);
INSERT INTO cities VALUES (4221, 24, 'Iaras', false, -22.871718600000001, -49.163783500000001);
INSERT INTO cities VALUES (4222, 24, 'Ibaté', false, -21.9547138, -47.9975825);
INSERT INTO cities VALUES (4223, 24, 'Ibirá', false, -21.0806273, -49.240312199999998);
INSERT INTO cities VALUES (4224, 24, 'Ibirarema', false, -22.817750799999999, -50.0742124);
INSERT INTO cities VALUES (4225, 24, 'Ibitinga', false, -21.758505799999998, -48.829402600000002);
INSERT INTO cities VALUES (4226, 24, 'Ibiúna', false, -23.656861899999999, -47.225733699999999);
INSERT INTO cities VALUES (4227, 24, 'Icém', false, -20.3403697, -49.198095700000003);
INSERT INTO cities VALUES (4228, 24, 'Iepê', false, -22.6415872, -51.110120600000002);
INSERT INTO cities VALUES (4229, 24, 'Igaraçu do Tietê', false, -22.510914199999998, -48.5542631);
INSERT INTO cities VALUES (4230, 24, 'Igarapava', false, -20.038247299999998, -47.747914100000003);
INSERT INTO cities VALUES (4231, 24, 'Igaratá', false, -23.2039884, -46.156468599999997);
INSERT INTO cities VALUES (4232, 24, 'Iguape', false, -24.6975354, -47.570976899999998);
INSERT INTO cities VALUES (4233, 24, 'Ilha Comprida', false, -24.7312966, -47.558921900000001);
INSERT INTO cities VALUES (4234, 24, 'Ilha Solteira', false, -20.430969300000001, -51.337964900000003);
INSERT INTO cities VALUES (4235, 24, 'Ilhabela', false, -23.778657800000001, -45.3583967);
INSERT INTO cities VALUES (4236, 24, 'Indaiatuba', false, -23.08821, -47.223443799999998);
INSERT INTO cities VALUES (4237, 24, 'Indiana', false, -22.1468752, -51.251249799999997);
INSERT INTO cities VALUES (4238, 24, 'Indiaporã', false, -19.981585500000001, -50.296611900000002);
INSERT INTO cities VALUES (4239, 24, 'Inúbia Paulista', false, -21.7703098, -50.961347699999997);
INSERT INTO cities VALUES (4240, 24, 'Ipaussu', false, -23.056570900000001, -49.620751200000001);
INSERT INTO cities VALUES (4241, 24, 'Iperó', false, -23.357912599999999, -47.693736000000001);
INSERT INTO cities VALUES (4242, 24, 'Ipeúna', false, -22.434971300000001, -47.717912099999999);
INSERT INTO cities VALUES (4243, 24, 'Ipiguá', false, -20.653045299999999, -49.3875429);
INSERT INTO cities VALUES (4244, 24, 'Iporanga', false, -23.439163700000002, -47.424531899999998);
INSERT INTO cities VALUES (4245, 24, 'Ipuã', false, -20.437928100000001, -48.013683);
INSERT INTO cities VALUES (4246, 24, 'Iracemápolis', false, -22.581268300000001, -47.519817199999999);
INSERT INTO cities VALUES (4247, 24, 'Irapuã', false, -21.283807500000002, -49.406399899999997);
INSERT INTO cities VALUES (4248, 24, 'Irapuru', false, -21.5713781, -51.3543746);
INSERT INTO cities VALUES (4249, 24, 'Itaberá', false, -23.855955900000001, -49.135800699999997);
INSERT INTO cities VALUES (4250, 24, 'Itaí', false, -23.4140306, -49.092671899999999);
INSERT INTO cities VALUES (4251, 24, 'Itajobi', false, -21.3160886, -49.056061700000001);
INSERT INTO cities VALUES (4252, 24, 'Itaju', false, -21.978706599999999, -48.805433100000002);
INSERT INTO cities VALUES (4253, 24, 'Itanhaém', false, -24.18346, -46.789458500000002);
INSERT INTO cities VALUES (4254, 24, 'Itaóca', false, -24.6439293, -48.834033499999997);
INSERT INTO cities VALUES (4255, 24, 'Itapecerica da Serra', false, -23.717459300000002, -46.849455300000002);
INSERT INTO cities VALUES (4256, 24, 'Itapetininga', false, -23.5944793, -48.053903300000002);
INSERT INTO cities VALUES (4257, 24, 'Itapeva', false, -23.967625999999999, -48.900993499999998);
INSERT INTO cities VALUES (4258, 24, 'Itapevi', false, -23.549202399999999, -46.937290300000001);
INSERT INTO cities VALUES (4259, 24, 'Itapira', false, -22.436304799999998, -46.822224800000001);
INSERT INTO cities VALUES (4260, 24, 'Itapirapuã Paulista', false, -24.576459100000001, -49.169904600000002);
INSERT INTO cities VALUES (4261, 24, 'Itápolis', false, -21.596130200000001, -48.813446900000002);
INSERT INTO cities VALUES (4262, 24, 'Itaporanga', false, -23.715547399999998, -49.490973599999997);
INSERT INTO cities VALUES (4263, 24, 'Itapuí', false, -22.2334417, -48.719458299999999);
INSERT INTO cities VALUES (4264, 24, 'Itapura', false, -20.648784599999999, -51.501966600000003);
INSERT INTO cities VALUES (4265, 24, 'Itaquaquecetuba', false, -23.486592900000002, -46.348890900000001);
INSERT INTO cities VALUES (4266, 24, 'Itararé', false, -23.133333, -49.716667000000001);
INSERT INTO cities VALUES (4267, 24, 'Itariri', false, -24.2946843, -47.173554600000003);
INSERT INTO cities VALUES (4268, 24, 'Itatiba', false, -23.006839800000002, -46.838987799999998);
INSERT INTO cities VALUES (4269, 24, 'Itatinga', false, -23.102471999999999, -48.615285499999999);
INSERT INTO cities VALUES (4270, 24, 'Itirapina', false, -22.253700299999998, -47.822932299999998);
INSERT INTO cities VALUES (4271, 24, 'Itirapuã', false, -20.640590899999999, -47.219653200000003);
INSERT INTO cities VALUES (4272, 24, 'Itobi', false, -21.734493799999999, -46.970669700000002);
INSERT INTO cities VALUES (4273, 24, 'Itu', false, -23.265697400000001, -47.299124900000002);
INSERT INTO cities VALUES (4274, 24, 'Itupeva', false, -23.152360699999999, -47.057764800000001);
INSERT INTO cities VALUES (4275, 24, 'Ituverava', false, -20.344953400000001, -47.786061199999999);
INSERT INTO cities VALUES (4276, 24, 'Jaborandi', false, -20.899999999999999, -47.266666999999998);
INSERT INTO cities VALUES (4277, 24, 'Jaboticabal', false, -21.2553904, -48.322417600000001);
INSERT INTO cities VALUES (4278, 24, 'Jacareí', false, -23.3055363, -45.966955599999999);
INSERT INTO cities VALUES (4279, 24, 'Jaci', false, -20.883710700000002, -49.570664800000003);
INSERT INTO cities VALUES (4280, 24, 'Jacupiranga', false, -24.685903100000001, -47.989912799999999);
INSERT INTO cities VALUES (4281, 24, 'Jaguariúna', false, -22.705771299999999, -46.986242900000001);
INSERT INTO cities VALUES (4282, 24, 'Jales', false, -20.268219899999998, -50.548854300000002);
INSERT INTO cities VALUES (4283, 24, 'Jambeiro', false, -23.254429900000002, -45.6935754);
INSERT INTO cities VALUES (4284, 24, 'Jandira', false, -23.528497399999999, -46.903289999999998);
INSERT INTO cities VALUES (4285, 24, 'Jardinópolis', false, -21.018035999999999, -47.764502999999998);
INSERT INTO cities VALUES (4286, 24, 'Jarinu', false, -23.102321400000001, -46.728207300000001);
INSERT INTO cities VALUES (4287, 24, 'Jaú', false, -22.296302399999998, -48.558671500000003);
INSERT INTO cities VALUES (4288, 24, 'Jeriquara', false, -20.311903699999998, -47.589719799999997);
INSERT INTO cities VALUES (4289, 24, 'Joanópolis', false, -22.9306521, -46.276383600000003);
INSERT INTO cities VALUES (4290, 24, 'João Ramalho', false, -22.2558659, -50.774247099999997);
INSERT INTO cities VALUES (4291, 24, 'José Bonifácio', false, -21.0395909, -49.691026100000002);
INSERT INTO cities VALUES (4292, 24, 'Júlio Mesquita', false, -22.006969000000002, -49.782744700000002);
INSERT INTO cities VALUES (4293, 24, 'Jumirim', false, -23.086703400000001, -47.779674700000001);
INSERT INTO cities VALUES (4294, 24, 'Jundiaí', false, -23.1864533, -46.884452699999997);
INSERT INTO cities VALUES (4295, 24, 'Junqueirópolis', false, -21.517742599999998, -51.439938900000001);
INSERT INTO cities VALUES (4296, 24, 'Juquiá', false, -24.321434, -47.637340999999999);
INSERT INTO cities VALUES (4297, 24, 'Juquitiba', false, -23.9326334, -47.066872600000004);
INSERT INTO cities VALUES (4298, 24, 'Lagoinha', false, -23.087885700000001, -45.1947112);
INSERT INTO cities VALUES (4299, 24, 'Laranjal Paulista', false, -23.048333100000001, -47.835569999999997);
INSERT INTO cities VALUES (4300, 24, 'Lavínia', false, -21.167519599999999, -51.0413073);
INSERT INTO cities VALUES (4301, 24, 'Lavrinhas', false, -22.563431399999999, -44.924482599999997);
INSERT INTO cities VALUES (4302, 24, 'Leme', false, -22.189237299999998, -47.3979991);
INSERT INTO cities VALUES (4303, 24, 'Lençóis Paulista', false, -22.595993700000001, -48.8112402);
INSERT INTO cities VALUES (4304, 24, 'Limeira', false, -22.564540600000001, -47.4004093);
INSERT INTO cities VALUES (4305, 24, 'Lindóia', false, -22.523404500000002, -46.6503449);
INSERT INTO cities VALUES (4306, 24, 'Lins', false, -21.679435000000002, -49.7434674);
INSERT INTO cities VALUES (4307, 24, 'Lorena', false, -22.721709499999999, -45.121779500000002);
INSERT INTO cities VALUES (4308, 24, 'Lourdes', false, -20.968099200000001, -50.225619399999999);
INSERT INTO cities VALUES (4309, 24, 'Louveira', false, -23.086710700000001, -46.949503900000003);
INSERT INTO cities VALUES (4310, 24, 'Lucélia', false, -21.708814499999999, -51.0165218);
INSERT INTO cities VALUES (4311, 24, 'Lucianópolis', false, -22.4361362, -49.519408400000003);
INSERT INTO cities VALUES (4312, 24, 'Luís Antônio', false, -21.5495181, -47.706674200000002);
INSERT INTO cities VALUES (4313, 24, 'Luiziânia', false, -21.672835299999999, -50.3241272);
INSERT INTO cities VALUES (4314, 24, 'Lupércio', false, -22.416310200000002, -49.815526300000002);
INSERT INTO cities VALUES (4315, 24, 'Lutécia', false, -22.351058399999999, -50.388369900000001);
INSERT INTO cities VALUES (4316, 24, 'Macatuba', false, -22.4994987, -48.717579200000003);
INSERT INTO cities VALUES (4317, 24, 'Macaubal', false, -20.806664300000001, -49.964192199999999);
INSERT INTO cities VALUES (4318, 24, 'Macedônia', false, -20.149981400000001, -50.189881700000001);
INSERT INTO cities VALUES (4319, 24, 'Magda', false, -20.642738099999999, -50.225648399999997);
INSERT INTO cities VALUES (4320, 24, 'Mairinque', false, -23.547146699999999, -47.184242099999999);
INSERT INTO cities VALUES (4321, 24, 'Mairiporã', false, -23.3183726, -46.587222099999998);
INSERT INTO cities VALUES (4322, 24, 'Manduri', false, -23.0027866, -49.324606000000003);
INSERT INTO cities VALUES (4323, 24, 'Marabá Paulista', false, -22.105063000000001, -51.961709200000001);
INSERT INTO cities VALUES (4324, 24, 'Maracaí', false, -22.6141884, -50.668735599999998);
INSERT INTO cities VALUES (4325, 24, 'Marapoama', false, -21.260403199999999, -49.127372999999999);
INSERT INTO cities VALUES (4326, 24, 'Mariápolis', false, -21.797823300000001, -51.181098200000001);
INSERT INTO cities VALUES (4327, 24, 'Marília', false, -22.220789199999999, -49.948631599999999);
INSERT INTO cities VALUES (4328, 24, 'Marinópolis', false, -20.440725799999999, -50.819601599999999);
INSERT INTO cities VALUES (4329, 24, 'Martinópolis', false, -22.1262753, -51.179964300000002);
INSERT INTO cities VALUES (4330, 24, 'Matão', false, -21.6034425, -48.366452899999999);
INSERT INTO cities VALUES (4331, 24, 'Mauá', false, -23.668744199999999, -46.461397300000002);
INSERT INTO cities VALUES (4332, 24, 'Mendonça', false, -21.1753067, -49.568530699999997);
INSERT INTO cities VALUES (4333, 24, 'Meridiano', false, -20.357122199999999, -50.172202200000001);
INSERT INTO cities VALUES (4334, 24, 'Mesópolis', false, -19.9629896, -50.635019);
INSERT INTO cities VALUES (4335, 24, 'Miguelópolis', false, -20.177682099999998, -48.033457400000003);
INSERT INTO cities VALUES (4336, 24, 'Mineiros do Tietê', false, -22.410504100000001, -48.447952100000002);
INSERT INTO cities VALUES (4337, 24, 'Mira Estrela', false, -19.9794959, -50.137790799999998);
INSERT INTO cities VALUES (4338, 24, 'Miracatu', false, -24.287268399999999, -47.460626599999998);
INSERT INTO cities VALUES (4339, 24, 'Mirandópolis', false, -21.134695300000001, -51.101865599999996);
INSERT INTO cities VALUES (4340, 24, 'Mirante do Paranapanema', false, -22.288613699999999, -51.905794499999999);
INSERT INTO cities VALUES (4341, 24, 'Mirassol', false, -20.822435599999999, -49.520244300000002);
INSERT INTO cities VALUES (4342, 24, 'Mirassolândia', false, -20.616589999999999, -49.4630133);
INSERT INTO cities VALUES (4343, 24, 'Mococa', false, -21.4708267, -47.0005691);
INSERT INTO cities VALUES (4344, 24, 'Mogi das Cruzes', false, -23.524753499999999, -46.187133899999999);
INSERT INTO cities VALUES (4345, 24, 'Mogi Guaçu', false, -22.370846199999999, -46.937843399999998);
INSERT INTO cities VALUES (4346, 24, 'Moji Mirim', false, -22.4319904, -46.9581558);
INSERT INTO cities VALUES (4347, 24, 'Mombuca', false, -22.9295644, -47.566887700000002);
INSERT INTO cities VALUES (4348, 24, 'Monções', false, -20.851019099999998, -50.092068099999999);
INSERT INTO cities VALUES (4349, 24, 'Mongaguá', false, -24.092015199999999, -46.6204599);
INSERT INTO cities VALUES (4350, 24, 'Monte Alegre do Sul', false, -22.682452999999999, -46.681445600000004);
INSERT INTO cities VALUES (4351, 24, 'Monte Alto', false, -21.261553899999999, -48.496572800000003);
INSERT INTO cities VALUES (4352, 24, 'Monte Aprazível', false, -20.773949900000002, -49.7112354);
INSERT INTO cities VALUES (4353, 24, 'Monte Azul Paulista', false, -23.440778699999999, -46.712525399999997);
INSERT INTO cities VALUES (4354, 24, 'Monte Castelo', false, -21.297786599999998, -51.570694099999997);
INSERT INTO cities VALUES (4355, 24, 'Monte Mor', false, -22.9471892, -47.316761);
INSERT INTO cities VALUES (4356, 24, 'Monteiro Lobato', false, -22.955203399999998, -45.840810500000003);
INSERT INTO cities VALUES (4357, 24, 'Morro Agudo', false, -20.727578099999999, -48.053884099999998);
INSERT INTO cities VALUES (4358, 24, 'Morungaba', false, -22.880430499999999, -46.792312099999997);
INSERT INTO cities VALUES (4359, 24, 'Motuca', false, -21.508296699999999, -48.153437199999999);
INSERT INTO cities VALUES (4360, 24, 'Murutinga do Sul', false, -21.002461499999999, -51.263226199999998);
INSERT INTO cities VALUES (4361, 24, 'Nantes', false, -22.614991700000001, -51.2392313);
INSERT INTO cities VALUES (4362, 24, 'Narandiba', false, -22.4104852, -51.521887399999997);
INSERT INTO cities VALUES (4363, 24, 'Natividade da Serra', false, -23.376560999999999, -45.447594000000002);
INSERT INTO cities VALUES (4364, 24, 'Nazaré Paulista', false, -23.1816277, -46.395300200000001);
INSERT INTO cities VALUES (4365, 24, 'Neves Paulista', false, -20.841635400000001, -49.633005099999998);
INSERT INTO cities VALUES (4366, 24, 'Nhandeara', false, -20.698108699999999, -50.042362300000001);
INSERT INTO cities VALUES (4367, 24, 'Nipoã', false, -20.915620199999999, -49.777856300000003);
INSERT INTO cities VALUES (4368, 24, 'Nova Aliança', false, -21.016941299999999, -49.496299700000002);
INSERT INTO cities VALUES (4369, 24, 'Nova Campina', false, -24.114683400000001, -48.910436099999998);
INSERT INTO cities VALUES (4370, 24, 'Nova Canaã Paulista', false, -20.387970200000002, -50.948742299999999);
INSERT INTO cities VALUES (4371, 24, 'Nova Castilho', false, -20.762628200000002, -50.344455500000002);
INSERT INTO cities VALUES (4372, 24, 'Nova Europa', false, -21.778296600000001, -48.559280800000003);
INSERT INTO cities VALUES (4373, 24, 'Nova Granada', false, -20.531469099999999, -49.310848);
INSERT INTO cities VALUES (4374, 24, 'Nova Guataporanga', false, -21.331986499999999, -51.645983700000002);
INSERT INTO cities VALUES (4375, 24, 'Nova Independência', false, -21.1053362, -51.490727900000003);
INSERT INTO cities VALUES (4376, 24, 'Nova Luzitânia', false, -20.856539699999999, -50.263834299999999);
INSERT INTO cities VALUES (4377, 24, 'Nova Odessa', false, -22.779921699999999, -47.296293300000002);
INSERT INTO cities VALUES (4378, 24, 'Novais', false, -20.996962799999999, -48.920125800000001);
INSERT INTO cities VALUES (4379, 24, 'Novo Horizonte', false, -21.466763700000001, -49.219499300000003);
INSERT INTO cities VALUES (4380, 24, 'Nuporanga', false, -20.730448899999999, -47.752833099999997);
INSERT INTO cities VALUES (4381, 24, 'Ocauçu', false, -22.442405000000001, -49.919122100000003);
INSERT INTO cities VALUES (4382, 24, 'Óleo', false, -22.943096300000001, -49.341474900000001);
INSERT INTO cities VALUES (4383, 24, 'Olímpia', false, -20.737421900000001, -48.915458000000001);
INSERT INTO cities VALUES (4384, 24, 'Onda Verde', false, -20.617605399999999, -49.300302199999997);
INSERT INTO cities VALUES (4385, 24, 'Oriente', false, -22.150743500000001, -50.096012299999998);
INSERT INTO cities VALUES (4386, 24, 'Orindiúva', false, -20.179473699999999, -49.348656200000001);
INSERT INTO cities VALUES (4387, 24, 'Orlândia', false, -20.720394500000001, -47.887597999999997);
INSERT INTO cities VALUES (4388, 24, 'Osasco', false, -23.531692799999998, -46.789923199999997);
INSERT INTO cities VALUES (4389, 24, 'Oscar Bressane', false, -22.320505600000001, -50.2807721);
INSERT INTO cities VALUES (4390, 24, 'Osvaldo Cruz', false, -21.793972100000001, -50.885455299999997);
INSERT INTO cities VALUES (4391, 24, 'Ourinhos', false, -22.983084000000002, -49.856920500000001);
INSERT INTO cities VALUES (4392, 24, 'Ouro Verde', false, -21.4882068, -51.699825500000003);
INSERT INTO cities VALUES (4393, 24, 'Ouroeste', false, -19.998640399999999, -50.369087399999998);
INSERT INTO cities VALUES (4394, 24, 'Pacaembu', false, -21.558483299999999, -51.261952899999997);
INSERT INTO cities VALUES (4395, 24, 'Palestina', false, -20.391644299999999, -49.432732399999999);
INSERT INTO cities VALUES (4396, 24, 'Palmares Paulista', false, -21.080478400000001, -48.804180299999999);
INSERT INTO cities VALUES (4397, 24, 'Palmeira d`Oeste', false, -20.417540800000001, -50.7609262);
INSERT INTO cities VALUES (4398, 24, 'Palmital', false, -22.791796300000001, -50.204956199999998);
INSERT INTO cities VALUES (4399, 24, 'Panorama', false, -21.356360899999999, -51.860648099999999);
INSERT INTO cities VALUES (4400, 24, 'Paraguaçu Paulista', false, -22.419333000000002, -50.592216499999999);
INSERT INTO cities VALUES (4401, 24, 'Paraibuna', false, -23.381359499999999, -45.662609600000003);
INSERT INTO cities VALUES (4402, 24, 'Paraíso', false, -21.0162683, -48.773939900000002);
INSERT INTO cities VALUES (4403, 24, 'Paranapanema', false, -23.387716600000001, -48.726632299999999);
INSERT INTO cities VALUES (4404, 24, 'Paranapuã', false, -21.779444000000002, -50.779443999999998);
INSERT INTO cities VALUES (4405, 24, 'Parapuã', false, -21.7795253, -50.790980599999997);
INSERT INTO cities VALUES (4406, 24, 'Pardinho', false, -23.0841016, -48.377163799999998);
INSERT INTO cities VALUES (4407, 24, 'Pariquera-Açu', false, -24.710219500000001, -47.883993099999998);
INSERT INTO cities VALUES (4408, 24, 'Parisi', false, -20.304517400000002, -50.013370999999999);
INSERT INTO cities VALUES (4409, 24, 'Patrocínio Paulista', false, -20.639070799999999, -47.282053599999998);
INSERT INTO cities VALUES (4410, 24, 'Paulicéia', false, -21.313915900000001, -51.832935800000001);
INSERT INTO cities VALUES (4411, 24, 'Paulínia', false, -22.761652999999999, -47.154074199999997);
INSERT INTO cities VALUES (4412, 24, 'Paulistânia', false, -22.580010999999999, -49.402658099999996);
INSERT INTO cities VALUES (4413, 24, 'Paulo de Faria', false, -20.0300881, -49.394881099999999);
INSERT INTO cities VALUES (4414, 24, 'Pederneiras', false, -22.352118000000001, -48.7752391);
INSERT INTO cities VALUES (4415, 24, 'Pedra Bela', false, -22.793461099999998, -46.443450300000002);
INSERT INTO cities VALUES (4416, 24, 'Pedranópolis', false, -20.246517000000001, -50.109386399999998);
INSERT INTO cities VALUES (4417, 24, 'Pedregulho', false, -20.257437800000002, -47.477444800000001);
INSERT INTO cities VALUES (4418, 24, 'Pedreira', false, -22.7418996, -46.901717400000003);
INSERT INTO cities VALUES (4419, 24, 'Pedrinhas Paulista', false, -22.813593699999998, -50.791099099999997);
INSERT INTO cities VALUES (4420, 24, 'Pedro de Toledo', false, -24.281524099999999, -47.230735000000003);
INSERT INTO cities VALUES (4421, 24, 'Penápolis', false, -21.420911100000001, -50.078044800000001);
INSERT INTO cities VALUES (4422, 24, 'Pereira Barreto', false, -20.638055699999999, -51.102545999999997);
INSERT INTO cities VALUES (4423, 24, 'Pereiras', false, -23.071997799999998, -47.975915999999998);
INSERT INTO cities VALUES (4424, 24, 'Peruíbe', false, -24.3173049, -46.995563400000002);
INSERT INTO cities VALUES (4425, 24, 'Piacatu', false, -21.5937603, -50.599473799999998);
INSERT INTO cities VALUES (4426, 24, 'Piedade', false, -23.711391599999999, -47.418759299999998);
INSERT INTO cities VALUES (4427, 24, 'Pilar do Sul', false, -23.810161999999998, -47.7134377);
INSERT INTO cities VALUES (4428, 24, 'Pindamonhangaba', false, -22.9239143, -45.462177599999997);
INSERT INTO cities VALUES (4429, 24, 'Pindorama', false, -21.186840499999999, -48.909543300000003);
INSERT INTO cities VALUES (4430, 24, 'Pinhalzinho', false, -22.779580599999999, -46.591430299999999);
INSERT INTO cities VALUES (4431, 24, 'Piquerobi', false, -21.868297900000002, -51.7303219);
INSERT INTO cities VALUES (4432, 24, 'Piquete', false, -22.614143899999998, -45.177409599999997);
INSERT INTO cities VALUES (4433, 24, 'Piracaia', false, -23.054311299999998, -46.358446499999999);
INSERT INTO cities VALUES (4434, 24, 'Piracicaba', false, -22.7249765, -47.647600599999997);
INSERT INTO cities VALUES (4435, 24, 'Piraju', false, -23.194210000000002, -49.384615099999998);
INSERT INTO cities VALUES (4436, 24, 'Pirajuí', false, -22.0001529, -49.451893499999997);
INSERT INTO cities VALUES (4437, 24, 'Pirangi', false, -21.091218900000001, -48.655564300000002);
INSERT INTO cities VALUES (4438, 24, 'Pirapora do Bom Jesus', false, -23.3974507, -47.0024503);
INSERT INTO cities VALUES (4439, 24, 'Pirapozinho', false, -22.281224900000002, -51.500366900000003);
INSERT INTO cities VALUES (4440, 24, 'Pirassununga', false, -21.995955500000001, -47.4268237);
INSERT INTO cities VALUES (4441, 24, 'Piratininga', false, -22.412422200000002, -49.136511800000001);
INSERT INTO cities VALUES (4442, 24, 'Pitangueiras', false, -20.998146699999999, -48.2154521);
INSERT INTO cities VALUES (4443, 24, 'Planalto', false, -21.0350602, -49.9299076);
INSERT INTO cities VALUES (4444, 24, 'Platina', false, -22.637869800000001, -50.199484599999998);
INSERT INTO cities VALUES (4445, 24, 'Poá', false, -23.526019000000002, -46.343975999999998);
INSERT INTO cities VALUES (4446, 24, 'Poloni', false, -20.789124699999999, -49.816631100000002);
INSERT INTO cities VALUES (4447, 24, 'Pompéia', false, -22.106453200000001, -50.174727699999998);
INSERT INTO cities VALUES (4448, 24, 'Pongaí', false, -21.734343200000001, -49.363187099999998);
INSERT INTO cities VALUES (4449, 24, 'Pontal', false, -21.0231353, -48.037704900000001);
INSERT INTO cities VALUES (4450, 24, 'Pontalinda', false, -20.440316599999999, -50.519994699999998);
INSERT INTO cities VALUES (4451, 24, 'Pontes Gestal', false, -20.1716528, -49.705884599999997);
INSERT INTO cities VALUES (4452, 24, 'Populina', false, -19.9437298, -50.5406233);
INSERT INTO cities VALUES (4453, 24, 'Porangaba', false, -23.178877700000001, -48.121032399999997);
INSERT INTO cities VALUES (4454, 24, 'Porto Feliz', false, -23.2151946, -47.523963299999998);
INSERT INTO cities VALUES (4455, 24, 'Porto Ferreira', false, -21.854889799999999, -47.479273599999999);
INSERT INTO cities VALUES (4456, 24, 'Potim', false, -22.842369600000001, -45.253785899999997);
INSERT INTO cities VALUES (4457, 24, 'Potirendaba', false, -21.046771799999998, -49.377403999999999);
INSERT INTO cities VALUES (4458, 24, 'Pracinha', false, -21.852574700000002, -51.086772799999999);
INSERT INTO cities VALUES (4459, 24, 'Pradópolis', false, -21.356511399999999, -48.063251100000002);
INSERT INTO cities VALUES (4460, 24, 'Praia Grande', false, -23.999139499999998, -46.413257100000003);
INSERT INTO cities VALUES (4461, 24, 'Pratânia', false, -22.809644899999999, -48.665839900000002);
INSERT INTO cities VALUES (4462, 24, 'Presidente Alves', false, -22.099145199999999, -49.438489799999999);
INSERT INTO cities VALUES (4463, 24, 'Presidente Bernardes', false, -22.0076839, -51.555791300000003);
INSERT INTO cities VALUES (4464, 24, 'Presidente Epitácio', false, -21.7825165, -52.146344300000003);
INSERT INTO cities VALUES (4465, 24, 'Presidente Prudente', false, -22.1275947, -51.385615600000001);
INSERT INTO cities VALUES (4466, 24, 'Presidente Venceslau', false, -21.8887477, -51.830592600000003);
INSERT INTO cities VALUES (4467, 24, 'Promissão', false, -21.5384022, -49.857673699999999);
INSERT INTO cities VALUES (4468, 24, 'Quadra', false, -23.2984583, -48.056742300000003);
INSERT INTO cities VALUES (4469, 24, 'Quatá', false, -22.2590571, -50.7089067);
INSERT INTO cities VALUES (4470, 24, 'Queiroz', false, -21.799541999999999, -50.242192099999997);
INSERT INTO cities VALUES (4471, 24, 'Queluz', false, -22.537739699999999, -44.774602399999999);
INSERT INTO cities VALUES (4472, 24, 'Quintana', false, -22.0715027, -50.3008284);
INSERT INTO cities VALUES (4473, 24, 'Rafard', false, -23.011588799999998, -47.5268327);
INSERT INTO cities VALUES (4474, 24, 'Rancharia', false, -22.2408356, -50.8849588);
INSERT INTO cities VALUES (4475, 24, 'Redenção da Serra', false, -23.2658904, -45.539780299999997);
INSERT INTO cities VALUES (4476, 24, 'Regente Feijó', false, -22.2193003, -51.307020399999999);
INSERT INTO cities VALUES (4477, 24, 'Reginópolis', false, -21.8894831, -49.228147700000001);
INSERT INTO cities VALUES (4478, 24, 'Registro', false, -24.488064900000001, -47.834837);
INSERT INTO cities VALUES (4479, 24, 'Restinga', false, -20.607385099999998, -47.485509899999997);
INSERT INTO cities VALUES (4480, 24, 'Ribeira', false, -24.6380248, -48.998083600000001);
INSERT INTO cities VALUES (4481, 24, 'Ribeirão Bonito', false, -22.0641137, -48.174709100000001);
INSERT INTO cities VALUES (4482, 24, 'Ribeirão Branco', false, -24.2196012, -48.767826499999998);
INSERT INTO cities VALUES (4483, 24, 'Ribeirão Corrente', false, -20.457360300000001, -47.590010200000002);
INSERT INTO cities VALUES (4484, 24, 'Ribeirão do Sul', false, -22.784959099999998, -49.9365284);
INSERT INTO cities VALUES (4485, 24, 'Ribeirão dos Índios', false, -21.841043200000001, -51.601841);
INSERT INTO cities VALUES (4486, 24, 'Ribeirão Grande', false, -24.097919999999998, -48.371527299999997);
INSERT INTO cities VALUES (4487, 24, 'Ribeirão Pires', false, -23.7141345, -46.413662100000003);
INSERT INTO cities VALUES (4488, 24, 'Ribeirão Preto', false, -21.1766574, -47.820761900000001);
INSERT INTO cities VALUES (4489, 24, 'Rifaina', false, -20.082083300000001, -47.424168000000002);
INSERT INTO cities VALUES (4490, 24, 'Rincão', false, -21.587517299999998, -48.067866799999997);
INSERT INTO cities VALUES (4491, 24, 'Rinópolis', false, -21.724255400000001, -50.722250000000003);
INSERT INTO cities VALUES (4492, 24, 'Rio Claro', false, -22.413398600000001, -47.569574000000003);
INSERT INTO cities VALUES (4493, 24, 'Rio das Pedras', false, -22.843368000000002, -47.607177700000001);
INSERT INTO cities VALUES (4494, 24, 'Rio Grande da Serra', false, -23.7452246, -46.402217200000003);
INSERT INTO cities VALUES (4495, 24, 'Riolândia', false, -19.981562100000001, -49.6796778);
INSERT INTO cities VALUES (4496, 24, 'Riversul', false, -23.826241, -49.403406400000001);
INSERT INTO cities VALUES (4497, 24, 'Rosana', false, -22.5718511, -53.047992600000001);
INSERT INTO cities VALUES (4498, 24, 'Roseira', false, -22.898469599999999, -45.3058184);
INSERT INTO cities VALUES (4499, 24, 'Rubiácea', false, -21.299068900000002, -50.728608700000002);
INSERT INTO cities VALUES (4500, 24, 'Rubinéia', false, -20.179919399999999, -50.997796999999998);
INSERT INTO cities VALUES (4501, 24, 'Sabino', false, -21.465577700000001, -49.576911600000003);
INSERT INTO cities VALUES (4502, 24, 'Sagres', false, -21.883988200000001, -50.955571999999997);
INSERT INTO cities VALUES (4503, 24, 'Sales', false, -21.342077499999998, -49.500500799999998);
INSERT INTO cities VALUES (4504, 24, 'Sales Oliveira', false, -20.770034800000001, -47.840457800000003);
INSERT INTO cities VALUES (4505, 24, 'Salesópolis', false, -23.532452500000002, -45.846444400000003);
INSERT INTO cities VALUES (4506, 24, 'Salmourão', false, -21.627055599999998, -50.861025599999998);
INSERT INTO cities VALUES (4507, 24, 'Saltinho', false, -22.846242799999999, -47.677438199999997);
INSERT INTO cities VALUES (4508, 24, 'Salto', false, -23.2027842, -47.286326600000002);
INSERT INTO cities VALUES (4509, 24, 'Salto de Pirapora', false, -23.6494529, -47.573463199999999);
INSERT INTO cities VALUES (4510, 24, 'Salto Grande', false, -22.8815183, -49.9621469);
INSERT INTO cities VALUES (4511, 24, 'Sandovalina', false, -22.458824700000001, -51.759914100000003);
INSERT INTO cities VALUES (4512, 24, 'Santa Adélia', false, -21.238185999999999, -48.809692800000001);
INSERT INTO cities VALUES (4513, 24, 'Santa Albertina', false, -20.0326846, -50.727099799999998);
INSERT INTO cities VALUES (4514, 24, 'Santa Bárbara d`Oeste', false, -22.754683199999999, -47.414360000000002);
INSERT INTO cities VALUES (4515, 24, 'Santa Branca', false, -23.3975449, -45.885692300000002);
INSERT INTO cities VALUES (4516, 24, 'Santa Clara d`Oeste', false, -20.100224300000001, -50.945751399999999);
INSERT INTO cities VALUES (4517, 24, 'Santa Cruz da Conceição', false, -22.1399759, -47.452279300000001);
INSERT INTO cities VALUES (4518, 24, 'Santa Cruz da Esperança', false, -21.2870779, -47.428431500000002);
INSERT INTO cities VALUES (4519, 24, 'Santa Cruz das Palmeiras', false, -21.813491299999999, -47.256326899999998);
INSERT INTO cities VALUES (4520, 24, 'Santa Cruz do Rio Pardo', false, -22.907686399999999, -49.617564700000003);
INSERT INTO cities VALUES (4521, 24, 'Santa Ernestina', false, -21.467145899999998, -48.389023700000003);
INSERT INTO cities VALUES (4522, 24, 'Santa Fé do Sul', false, -20.211894699999998, -50.927091599999997);
INSERT INTO cities VALUES (4523, 24, 'Santa Gertrudes', false, -22.456316900000001, -47.5326509);
INSERT INTO cities VALUES (4524, 24, 'Santa Isabel', false, -23.316853600000002, -46.223669399999999);
INSERT INTO cities VALUES (4525, 24, 'Santa Lúcia', false, -21.688137600000001, -48.081527199999996);
INSERT INTO cities VALUES (4526, 24, 'Santa Maria da Serra', false, -22.5679005, -48.162425599999999);
INSERT INTO cities VALUES (4527, 24, 'Santa Mercedes', false, -21.347431199999999, -51.753505400000002);
INSERT INTO cities VALUES (4528, 24, 'Santa Rita d`Oeste', false, -20.142869699999999, -50.8334008);
INSERT INTO cities VALUES (4529, 24, 'Santa Rita do Passa Quatro', false, -21.731180299999998, -47.495930299999998);
INSERT INTO cities VALUES (4530, 24, 'Santa Rosa de Viterbo', false, -21.470313699999998, -47.362076600000002);
INSERT INTO cities VALUES (4531, 24, 'Santa Salete', false, -20.240570399999999, -50.686135100000001);
INSERT INTO cities VALUES (4532, 24, 'Santana da Ponte Pensa', false, -20.251410199999999, -50.797209899999999);
INSERT INTO cities VALUES (4533, 24, 'Santana de Parnaíba', false, -23.444182099999999, -46.918954800000002);
INSERT INTO cities VALUES (4534, 24, 'Santo Anastácio', false, -21.9865435, -51.661057900000003);
INSERT INTO cities VALUES (4535, 24, 'Santo André', false, -23.666574000000001, -46.532237799999997);
INSERT INTO cities VALUES (4536, 24, 'Santo Antônio da Alegria', false, -21.086937800000001, -47.150125000000003);
INSERT INTO cities VALUES (4537, 24, 'Santo Antônio de Posse', false, -22.6065541, -46.919249100000002);
INSERT INTO cities VALUES (4538, 24, 'Santo Antônio do Aracanguá', false, -20.933818299999999, -50.497776000000002);
INSERT INTO cities VALUES (4539, 24, 'Santo Antônio do Jardim', false, -22.3465791, -46.944432399999997);
INSERT INTO cities VALUES (4540, 24, 'Santo Antônio do Pinhal', false, -22.825353400000001, -45.663318799999999);
INSERT INTO cities VALUES (4541, 24, 'Santo Expedito', false, -21.8508338, -51.396419799999997);
INSERT INTO cities VALUES (4542, 24, 'Santópolis do Aguapeí', false, -21.638560699999999, -50.505248299999998);
INSERT INTO cities VALUES (4543, 24, 'Santos', false, -23.961835600000001, -46.3322474);
INSERT INTO cities VALUES (4544, 24, 'São Bento do Sapucaí', false, -22.688257700000001, -45.736288899999998);
INSERT INTO cities VALUES (4545, 24, 'São Bernardo do Campo', false, -23.694444000000001, -46.565448199999999);
INSERT INTO cities VALUES (4546, 24, 'São Caetano do Sul', false, -23.6226238, -46.548868800000001);
INSERT INTO cities VALUES (4547, 24, 'São Carlos', false, -22.533332999999999, -51.983333000000002);
INSERT INTO cities VALUES (4548, 24, 'São Francisco', false, -20.3633208, -50.692685599999997);
INSERT INTO cities VALUES (4549, 24, 'São João da Boa Vista', false, -21.969491099999999, -46.798890200000002);
INSERT INTO cities VALUES (4550, 24, 'São João das Duas Pontes', false, -20.3897668, -50.380263599999999);
INSERT INTO cities VALUES (4551, 24, 'São João de Iracema', false, -20.499802200000001, -50.3548288);
INSERT INTO cities VALUES (4552, 24, 'São João do Pau d`Alho', false, -21.269436200000001, -51.6653296);
INSERT INTO cities VALUES (4553, 24, 'São Joaquim da Barra', false, -20.579689999999999, -47.8749635);
INSERT INTO cities VALUES (4554, 24, 'São José da Bela Vista', false, -20.595689700000001, -47.6402359);
INSERT INTO cities VALUES (4555, 24, 'São José do Barreiro', false, -22.645085699999999, -44.576695299999997);
INSERT INTO cities VALUES (4556, 24, 'São José do Rio Pardo', false, -21.595795500000001, -46.889568699999998);
INSERT INTO cities VALUES (4557, 24, 'São José do Rio Preto', false, -20.820181000000002, -49.379681300000001);
INSERT INTO cities VALUES (4558, 24, 'São José dos Campos', false, -23.1790801, -45.887247600000002);
INSERT INTO cities VALUES (4559, 24, 'São Lourenço da Serra', false, -23.855673500000002, -46.940701400000002);
INSERT INTO cities VALUES (4560, 24, 'São Luís do Paraitinga', false, -23.2280658, -45.322662600000001);
INSERT INTO cities VALUES (4561, 24, 'São Manuel', false, -22.747874899999999, -48.583459099999999);
INSERT INTO cities VALUES (4562, 24, 'São Miguel Arcanjo', false, -23.880495400000001, -48.010618999999998);
INSERT INTO cities VALUES (4563, 24, 'São Pedro', false, -23.75, -49.366667);
INSERT INTO cities VALUES (4564, 24, 'São Pedro do Turvo', false, -22.739486500000002, -49.731851800000001);
INSERT INTO cities VALUES (4565, 24, 'São Roque', false, -23.5307718, -47.135491700000003);
INSERT INTO cities VALUES (4566, 24, 'São Sebastião', false, -23.761044500000001, -45.412087999999997);
INSERT INTO cities VALUES (4567, 24, 'São Sebastião da Grama', false, -21.715136099999999, -46.8231836);
INSERT INTO cities VALUES (4568, 24, 'São Simão', false, -21.478101200000001, -47.550674899999997);
INSERT INTO cities VALUES (4569, 24, 'São Vicente', false, -23.962975400000001, -46.391802800000001);
INSERT INTO cities VALUES (4570, 24, 'Sarapuí', false, -23.640440099999999, -47.826146899999998);
INSERT INTO cities VALUES (4571, 24, 'Sarutaiá', false, -23.274284000000002, -49.479005000000001);
INSERT INTO cities VALUES (4572, 24, 'Sebastianópolis do Sul', false, -20.655632900000001, -49.921752400000003);
INSERT INTO cities VALUES (4573, 24, 'Serra Azul', false, -21.311441599999998, -47.566257499999999);
INSERT INTO cities VALUES (4574, 24, 'Serra Negra', false, -22.6118147, -46.700990500000003);
INSERT INTO cities VALUES (4575, 24, 'Serrana', false, -21.211442099999999, -47.596447400000002);
INSERT INTO cities VALUES (4576, 24, 'Sertãozinho', false, -21.143403800000002, -48.007032100000004);
INSERT INTO cities VALUES (4577, 24, 'Sete Barras', false, -24.3760923, -47.933377299999997);
INSERT INTO cities VALUES (4578, 24, 'Severínia', false, -20.808340399999999, -48.804295500000002);
INSERT INTO cities VALUES (4579, 24, 'Silveiras', false, -22.666135000000001, -44.8540274);
INSERT INTO cities VALUES (4580, 24, 'Socorro', false, -22.597157200000002, -46.517874200000001);
INSERT INTO cities VALUES (4581, 24, 'Sorocaba', false, -23.506228799999999, -47.455909900000002);
INSERT INTO cities VALUES (4582, 24, 'Sud Mennucci', false, -20.691671299999999, -50.922502999999999);
INSERT INTO cities VALUES (4583, 24, 'Sumaré', false, -22.8216149, -47.266436200000001);
INSERT INTO cities VALUES (4584, 24, 'Suzanápolis', false, -20.504915400000002, -51.028038100000003);
INSERT INTO cities VALUES (4585, 24, 'Suzano', false, -23.5409592, -46.3106498);
INSERT INTO cities VALUES (4586, 24, 'Tabapuã', false, -20.964646399999999, -49.0281874);
INSERT INTO cities VALUES (4587, 24, 'Tabatinga', false, -21.718916100000001, -48.6732814);
INSERT INTO cities VALUES (4588, 24, 'Taboão da Serra', false, -23.6070852, -46.752000199999998);
INSERT INTO cities VALUES (4589, 24, 'Taciba', false, -22.387035900000001, -51.285300800000002);
INSERT INTO cities VALUES (4590, 24, 'Taguaí', false, -23.4467368, -49.409353099999997);
INSERT INTO cities VALUES (4591, 24, 'Taiaçu', false, -21.145834399999998, -48.512418500000003);
INSERT INTO cities VALUES (4592, 24, 'Taiúva', false, -21.123799500000001, -48.450273000000003);
INSERT INTO cities VALUES (4593, 24, 'Tambaú', false, -21.702281800000002, -47.281405800000002);
INSERT INTO cities VALUES (4594, 24, 'Tanabi', false, -20.631249499999999, -49.6576606);
INSERT INTO cities VALUES (4595, 24, 'Tapiraí', false, -23.9600382, -47.504585800000001);
INSERT INTO cities VALUES (4596, 24, 'Tapiratiba', false, -21.4656293, -46.7527173);
INSERT INTO cities VALUES (4597, 24, 'Taquaral', false, -21.0666394, -48.408922599999997);
INSERT INTO cities VALUES (4598, 24, 'Taquaritinga', false, -21.406433400000001, -48.505454299999997);
INSERT INTO cities VALUES (4599, 24, 'Taquarituba', false, -23.5264065, -49.244178300000002);
INSERT INTO cities VALUES (4600, 24, 'Taquarivaí', false, -23.925114499999999, -48.694807900000001);
INSERT INTO cities VALUES (4601, 24, 'Tarabai', false, -22.3041448, -51.5522773);
INSERT INTO cities VALUES (4602, 24, 'Tarumã', false, -22.750834099999999, -50.5763125);
INSERT INTO cities VALUES (4603, 24, 'Tatuí', false, -23.3568341, -47.857391200000002);
INSERT INTO cities VALUES (4604, 24, 'Taubaté', false, -23.030938500000001, -45.548323600000003);
INSERT INTO cities VALUES (4605, 24, 'Tejupá', false, -23.342358600000001, -49.374747499999998);
INSERT INTO cities VALUES (4606, 24, 'Teodoro Sampaio', false, -22.5316236, -52.183277099999998);
INSERT INTO cities VALUES (4607, 24, 'Terra Roxa', false, -20.789523599999999, -48.329221199999999);
INSERT INTO cities VALUES (4608, 24, 'Tietê', false, -23.112304600000002, -47.722936400000002);
INSERT INTO cities VALUES (4609, 24, 'Timburi', false, -23.204277399999999, -49.6061196);
INSERT INTO cities VALUES (4610, 24, 'Torre de Pedra', false, -23.247662699999999, -48.1921331);
INSERT INTO cities VALUES (4611, 24, 'Torrinha', false, -22.427630000000001, -48.1622202);
INSERT INTO cities VALUES (4612, 24, 'Trabiju', false, -22.0423431, -48.337000099999997);
INSERT INTO cities VALUES (4613, 24, 'Tremembé', false, -22.960081200000001, -45.540491299999999);
INSERT INTO cities VALUES (4614, 24, 'Três Fronteiras', false, -20.2318949, -50.888476400000002);
INSERT INTO cities VALUES (4615, 24, 'Tuiuti', false, -22.816450499999998, -46.694446200000002);
INSERT INTO cities VALUES (4616, 24, 'Tupã', false, -21.935351600000001, -50.514238300000002);
INSERT INTO cities VALUES (4617, 24, 'Tupi Paulista', false, -21.3821078, -51.570837300000001);
INSERT INTO cities VALUES (4618, 24, 'Turiúba', false, -20.934414400000001, -50.115568500000002);
INSERT INTO cities VALUES (4619, 24, 'Turmalina', false, -20.0530303, -50.474848199999997);
INSERT INTO cities VALUES (4620, 24, 'Ubarana', false, -21.168791299999999, -49.7144616);
INSERT INTO cities VALUES (4621, 24, 'Ubatuba', false, -23.434843300000001, -45.069972399999997);
INSERT INTO cities VALUES (4622, 24, 'Ubirajara', false, -22.521636000000001, -49.659845599999997);
INSERT INTO cities VALUES (4623, 24, 'Uchoa', false, -20.949662, -49.171752400000003);
INSERT INTO cities VALUES (4624, 24, 'União Paulista', false, -20.8881348, -49.899127);
INSERT INTO cities VALUES (4625, 24, 'Urânia', false, -20.237975500000001, -50.641384899999998);
INSERT INTO cities VALUES (4626, 24, 'Uru', false, -21.7849586, -49.279733700000001);
INSERT INTO cities VALUES (4627, 24, 'Urupês', false, -21.200497500000001, -49.290648900000001);
INSERT INTO cities VALUES (4628, 24, 'Valentim Gentil', false, -20.417872599999999, -50.085041799999999);
INSERT INTO cities VALUES (4629, 24, 'Valinhos', false, -22.971199200000001, -46.996412800000002);
INSERT INTO cities VALUES (4630, 24, 'Valparaíso', false, -21.228658299999999, -50.867344299999999);
INSERT INTO cities VALUES (4631, 24, 'Vargem', false, -22.889386500000001, -46.414598400000003);
INSERT INTO cities VALUES (4632, 24, 'Vargem Grande do Sul', false, -21.835716399999999, -46.880568400000001);
INSERT INTO cities VALUES (4633, 24, 'Vargem Grande Paulista', false, -23.605512300000001, -47.0261712);
INSERT INTO cities VALUES (4634, 24, 'Várzea Paulista', false, -23.209913499999999, -46.830015400000001);
INSERT INTO cities VALUES (4635, 24, 'Vera Cruz', false, -22.2253486, -49.826890800000001);
INSERT INTO cities VALUES (4636, 24, 'Vinhedo', false, -23.0301495, -46.975550900000002);
INSERT INTO cities VALUES (4637, 24, 'Viradouro', false, -20.871307999999999, -48.299261199999997);
INSERT INTO cities VALUES (4638, 24, 'Vista Alegre do Alto', false, -21.164059200000001, -48.638569400000002);
INSERT INTO cities VALUES (4639, 24, 'Vitória Brasil', false, -20.199080800000001, -50.482013700000003);
INSERT INTO cities VALUES (4640, 24, 'Votorantim', false, -23.540456899999999, -47.443986899999999);
INSERT INTO cities VALUES (4641, 24, 'Votuporanga', false, -20.420342900000001, -49.978296100000001);
INSERT INTO cities VALUES (4642, 24, 'Zacarias', false, -21.052379999999999, -50.050553499999999);
INSERT INTO cities VALUES (4643, 24, 'São Paulo', true, -7.1462972000000002, -34.829372999999997);
INSERT INTO cities VALUES (4644, 25, 'Abatiá', false, -23.303643600000001, -50.3176287);
INSERT INTO cities VALUES (4645, 25, 'Adrianópolis', false, -24.684138999999998, -48.970121599999999);
INSERT INTO cities VALUES (4646, 25, 'Agudos do Sul', false, -25.986635799999998, -49.324477100000003);
INSERT INTO cities VALUES (4647, 25, 'Almirante Tamandaré', false, -25.3262289, -49.310420399999998);
INSERT INTO cities VALUES (4648, 25, 'Altamira do Paraná', false, -24.798438399999998, -52.708493799999999);
INSERT INTO cities VALUES (4649, 25, 'Alto Paraíso', false, -23.521127700000001, -53.726384199999998);
INSERT INTO cities VALUES (4650, 25, 'Alto Paraná', false, -23.1313219, -52.335532100000002);
INSERT INTO cities VALUES (4651, 25, 'Alto Piquiri', false, -24.026659899999999, -53.444432399999997);
INSERT INTO cities VALUES (4652, 25, 'Altônia', false, -23.872570100000001, -53.896748600000002);
INSERT INTO cities VALUES (4653, 25, 'Alvorada do Sul', false, -22.780023199999999, -51.231900799999998);
INSERT INTO cities VALUES (4654, 25, 'Amaporã', false, -23.095579499999999, -52.784821800000003);
INSERT INTO cities VALUES (4655, 25, 'Ampére', false, -25.916939599999999, -53.471103200000002);
INSERT INTO cities VALUES (4656, 25, 'Anahy', false, -24.646707599999999, -53.134572900000002);
INSERT INTO cities VALUES (4657, 25, 'Andirá', false, -23.044546100000002, -50.228236199999998);
INSERT INTO cities VALUES (4658, 25, 'Ângulo', false, -23.214359399999999, -51.935076899999999);
INSERT INTO cities VALUES (4659, 25, 'Antonina', false, -25.429658100000001, -48.711803699999997);
INSERT INTO cities VALUES (4660, 25, 'Antônio Olinto', false, -25.962849800000001, -50.208682099999997);
INSERT INTO cities VALUES (4661, 25, 'Apucarana', false, -23.551518900000001, -51.461378099999997);
INSERT INTO cities VALUES (4662, 25, 'Arapongas', false, -23.419892600000001, -51.425400400000001);
INSERT INTO cities VALUES (4663, 25, 'Arapoti', false, -24.1453357, -49.818832399999998);
INSERT INTO cities VALUES (4664, 25, 'Arapuã', false, -24.322839999999999, -51.804886199999999);
INSERT INTO cities VALUES (4665, 25, 'Araruna', false, -23.928994700000001, -52.501237099999997);
INSERT INTO cities VALUES (4666, 25, 'Araucária', false, -25.591735400000001, -49.411538100000001);
INSERT INTO cities VALUES (4667, 25, 'Ariranha do Ivaí', false, -24.376955800000001, -51.598334999999999);
INSERT INTO cities VALUES (4668, 25, 'Assaí', false, -23.377841199999999, -50.842969400000001);
INSERT INTO cities VALUES (4669, 25, 'Assis Chateaubriand', false, -24.414719699999999, -53.527567400000002);
INSERT INTO cities VALUES (4670, 25, 'Astorga', false, -23.224752299999999, -51.663111200000003);
INSERT INTO cities VALUES (4671, 25, 'Atalaia', false, -23.155488900000002, -52.059209500000001);
INSERT INTO cities VALUES (4672, 25, 'Balsa Nova', false, -25.5863716, -49.6319406);
INSERT INTO cities VALUES (4673, 25, 'Bandeirantes', false, -23.105046900000001, -50.360301300000003);
INSERT INTO cities VALUES (4674, 25, 'Barbosa Ferraz', false, -24.0383435, -52.023160500000003);
INSERT INTO cities VALUES (4675, 25, 'Barra do Jacaré', false, -23.106565400000001, -50.180526100000002);
INSERT INTO cities VALUES (4676, 25, 'Barracão', false, -26.2527288, -53.634556699999997);
INSERT INTO cities VALUES (4677, 25, 'Bela Vista da Caroba', false, -25.881701799999998, -53.684894399999997);
INSERT INTO cities VALUES (4678, 25, 'Bela Vista do Paraíso', false, -22.994768000000001, -51.1857623);
INSERT INTO cities VALUES (4679, 25, 'Bituruna', false, -26.161466799999999, -51.553090900000001);
INSERT INTO cities VALUES (4680, 25, 'Boa Esperança', false, -24.227908599999999, -52.793472100000002);
INSERT INTO cities VALUES (4681, 25, 'Boa Esperança do Iguaçu', false, -25.6295118, -53.201591299999997);
INSERT INTO cities VALUES (4682, 25, 'Boa Ventura de São Roque', false, -24.9108771, -51.6497964);
INSERT INTO cities VALUES (4683, 25, 'Boa Vista da Aparecida', false, -25.436154599999998, -53.408422799999997);
INSERT INTO cities VALUES (4684, 25, 'Bocaiúva do Sul', false, -25.196092199999999, -49.109517500000003);
INSERT INTO cities VALUES (4685, 25, 'Bom Jesus do Sul', false, -26.198938900000002, -53.5723111);
INSERT INTO cities VALUES (4686, 25, 'Bom Sucesso', false, -23.704805400000001, -51.7658396);
INSERT INTO cities VALUES (4687, 25, 'Bom Sucesso do Sul', false, -26.0765642, -52.833688799999997);
INSERT INTO cities VALUES (4688, 25, 'Borrazópolis', false, -23.9490798, -51.541479099999997);
INSERT INTO cities VALUES (4689, 25, 'Braganey', false, -24.817461099999999, -53.119943499999998);
INSERT INTO cities VALUES (4690, 25, 'Brasilândia do Sul', false, -24.2000481, -53.538586700000003);
INSERT INTO cities VALUES (4691, 25, 'Cafeara', false, -22.772935700000001, -51.721780000000003);
INSERT INTO cities VALUES (4692, 25, 'Cafelândia', false, -24.618062900000002, -53.321796999999997);
INSERT INTO cities VALUES (4693, 25, 'Cafezal do Sul', false, -23.900499400000001, -53.517130399999999);
INSERT INTO cities VALUES (4694, 25, 'Califórnia', false, -23.664464500000001, -51.3634439);
INSERT INTO cities VALUES (4695, 25, 'Cambará', false, -23.037209499999999, -50.071399100000001);
INSERT INTO cities VALUES (4696, 25, 'Cambé', false, -23.275077599999999, -51.281525899999998);
INSERT INTO cities VALUES (4697, 25, 'Cambira', false, -23.598718600000002, -51.587827099999998);
INSERT INTO cities VALUES (4698, 25, 'Campina da Lagoa', false, -24.5892564, -52.826180700000002);
INSERT INTO cities VALUES (4699, 25, 'Campina do Simão', false, -25.068895000000001, -51.825156200000002);
INSERT INTO cities VALUES (4700, 25, 'Campina Grande do Sul', false, -25.3063137, -49.052183499999998);
INSERT INTO cities VALUES (4701, 25, 'Campo Bonito', false, -25.027767000000001, -52.995359499999999);
INSERT INTO cities VALUES (4702, 25, 'Campo do Tenente', false, -25.998673700000001, -49.668288500000003);
INSERT INTO cities VALUES (4703, 25, 'Campo Largo', false, -25.4610266, -49.529120399999996);
INSERT INTO cities VALUES (4704, 25, 'Campo Magro', false, -25.3692846, -49.451304499999999);
INSERT INTO cities VALUES (4705, 25, 'Campo Mourão', false, -24.046025400000001, -52.3838048);
INSERT INTO cities VALUES (4706, 25, 'Cândido de Abreu', false, -24.5665242, -51.322246);
INSERT INTO cities VALUES (4707, 25, 'Candói', false, -25.6411525, -52.122653399999997);
INSERT INTO cities VALUES (4708, 25, 'Cantagalo', false, -25.376250800000001, -52.129075399999998);
INSERT INTO cities VALUES (4709, 25, 'Capanema', false, -25.685846900000001, -53.795329299999999);
INSERT INTO cities VALUES (4710, 25, 'Capitão Leônidas Marques', false, -25.4916071, -53.596265199999998);
INSERT INTO cities VALUES (4711, 25, 'Carambeí', false, -24.9497322, -50.109607400000002);
INSERT INTO cities VALUES (4712, 25, 'Carlópolis', false, -23.421505799999998, -49.714454099999998);
INSERT INTO cities VALUES (4713, 25, 'Cascavel', false, -24.955450299999999, -53.4552361);
INSERT INTO cities VALUES (4714, 25, 'Castro', false, -24.792233100000001, -50.011684099999997);
INSERT INTO cities VALUES (4715, 25, 'Catanduvas', false, -25.204586899999999, -53.1536562);
INSERT INTO cities VALUES (4716, 25, 'Centenário do Sul', false, -22.822187199999998, -51.609973400000001);
INSERT INTO cities VALUES (4717, 25, 'Cerro Azul', false, -24.8256686, -49.261447099999998);
INSERT INTO cities VALUES (4718, 25, 'Céu Azul', false, -25.1497785, -53.845577300000002);
INSERT INTO cities VALUES (4719, 25, 'Chopinzinho', false, -25.8554417, -52.529657);
INSERT INTO cities VALUES (4720, 25, 'Cianorte', false, -23.663255599999999, -52.6054678);
INSERT INTO cities VALUES (4721, 25, 'Cidade Gaúcha', false, -23.362512800000001, -52.925927700000003);
INSERT INTO cities VALUES (4722, 25, 'Clevelândia', false, -26.4185686, -52.389663400000003);
INSERT INTO cities VALUES (4723, 25, 'Colombo', false, -25.293111100000001, -49.2233807);
INSERT INTO cities VALUES (4724, 25, 'Colorado', false, -22.838444200000001, -51.973477799999998);
INSERT INTO cities VALUES (4725, 25, 'Congonhinhas', false, -23.5466117, -50.543421100000003);
INSERT INTO cities VALUES (4726, 25, 'Conselheiro Mairinck', false, -23.626251, -50.173803900000003);
INSERT INTO cities VALUES (4727, 25, 'Contenda', false, -25.677053300000001, -49.520106200000001);
INSERT INTO cities VALUES (4728, 25, 'Corbélia', false, -24.797993399999999, -53.292703500000002);
INSERT INTO cities VALUES (4729, 25, 'Cornélio Procópio', false, -23.1812912, -50.647983400000001);
INSERT INTO cities VALUES (4730, 25, 'Coronel Domingos Soares', false, -26.228444400000001, -52.016365200000003);
INSERT INTO cities VALUES (4731, 25, 'Coronel Vivida', false, -25.988846899999999, -52.554242700000003);
INSERT INTO cities VALUES (4732, 25, 'Corumbataí do Sul', false, -24.098575400000001, -52.121007300000002);
INSERT INTO cities VALUES (4733, 25, 'Cruz Machado', false, -26.017485099999998, -51.345706900000003);
INSERT INTO cities VALUES (4734, 25, 'Cruzeiro do Iguaçu', false, -25.624379999999999, -53.142463900000003);
INSERT INTO cities VALUES (4735, 25, 'Cruzeiro do Oeste', false, -23.785190499999999, -53.073415199999999);
INSERT INTO cities VALUES (4736, 25, 'Cruzeiro do Sul', false, -22.973184, -52.153451400000002);
INSERT INTO cities VALUES (4737, 25, 'Cruzmaltina', false, -24.0181802, -51.470512900000003);
INSERT INTO cities VALUES (4738, 25, 'Curiúva', false, -24.026477499999999, -50.438533100000001);
INSERT INTO cities VALUES (4739, 25, 'Diamante d`Oeste', false, -24.9462391, -54.103525099999999);
INSERT INTO cities VALUES (4740, 25, 'Diamante do Norte', false, -22.660932899999999, -52.871510800000003);
INSERT INTO cities VALUES (4741, 25, 'Diamante do Sul', false, -25.039109100000001, -52.691374699999997);
INSERT INTO cities VALUES (4742, 25, 'Dois Vizinhos', false, -25.734563600000001, -53.058510800000001);
INSERT INTO cities VALUES (4743, 25, 'Douradina', false, -23.374552699999999, -53.292492000000003);
INSERT INTO cities VALUES (4744, 25, 'Doutor Camargo', false, -23.539747500000001, -52.222839899999997);
INSERT INTO cities VALUES (4745, 25, 'Doutor Ulysses', false, -24.567617299999998, -49.419098300000002);
INSERT INTO cities VALUES (4746, 25, 'Enéas Marques', false, -25.944049799999998, -53.153556299999998);
INSERT INTO cities VALUES (4747, 25, 'Engenheiro Beltrão', false, -23.804369099999999, -52.2554181);
INSERT INTO cities VALUES (4748, 25, 'Entre Rios do Oeste', false, -24.706600000000002, -54.243257);
INSERT INTO cities VALUES (4749, 25, 'Esperança Nova', false, -23.726925900000001, -53.811462499999998);
INSERT INTO cities VALUES (4750, 25, 'Espigão Alto do Iguaçu', false, -25.431629600000001, -52.828917099999998);
INSERT INTO cities VALUES (4751, 25, 'Farol', false, -24.090184699999998, -52.6234605);
INSERT INTO cities VALUES (4752, 25, 'Faxinal', false, -23.999555600000001, -51.3206688);
INSERT INTO cities VALUES (4753, 25, 'Fazenda Rio Grande', false, -25.658536900000001, -49.3088427);
INSERT INTO cities VALUES (4754, 25, 'Fênix', false, -23.9365484, -51.980589799999997);
INSERT INTO cities VALUES (4755, 25, 'Fernandes Pinheiro', false, -25.415733199999998, -50.539985100000003);
INSERT INTO cities VALUES (4756, 25, 'Figueira', false, -23.845224000000002, -50.409693300000001);
INSERT INTO cities VALUES (4757, 25, 'Flor da Serra do Sul', false, -26.254166999999999, -53.305);
INSERT INTO cities VALUES (4758, 25, 'Floraí', false, -23.2998355, -52.3044856);
INSERT INTO cities VALUES (4759, 25, 'Floresta', false, -23.610220099999999, -52.087018299999997);
INSERT INTO cities VALUES (4760, 25, 'Florestópolis', false, -22.8736541, -51.381917100000003);
INSERT INTO cities VALUES (4761, 25, 'Flórida', false, -23.099356, -51.944024499999998);
INSERT INTO cities VALUES (4762, 25, 'Formosa do Oeste', false, -24.3021651, -53.311307599999999);
INSERT INTO cities VALUES (4763, 25, 'Foz do Iguaçu', false, -25.5468978, -54.588171600000003);
INSERT INTO cities VALUES (4764, 25, 'Foz do Jordão', false, -25.727978799999999, -52.094689600000002);
INSERT INTO cities VALUES (4765, 25, 'Francisco Alves', false, -24.0638997, -53.839337999999998);
INSERT INTO cities VALUES (4766, 25, 'Francisco Beltrão', false, -26.078340399999998, -53.053091199999997);
INSERT INTO cities VALUES (4767, 25, 'General Carneiro', false, -26.4288563, -51.3172365);
INSERT INTO cities VALUES (4768, 25, 'Godoy Moreira', false, -24.161762199999998, -51.9102532);
INSERT INTO cities VALUES (4769, 25, 'Goioerê', false, -24.1846207, -53.018676399999997);
INSERT INTO cities VALUES (4770, 25, 'Goioxim', false, -25.187721700000001, -52.000300799999998);
INSERT INTO cities VALUES (4771, 25, 'Grandes Rios', false, -24.128980500000001, -51.479659300000002);
INSERT INTO cities VALUES (4772, 25, 'Guaíra', false, -24.079426399999999, -54.257415600000002);
INSERT INTO cities VALUES (4773, 25, 'Guairaçá', false, -22.9544733, -52.701393799999998);
INSERT INTO cities VALUES (4774, 25, 'Guamiranga', false, -25.188109699999998, -50.803142000000001);
INSERT INTO cities VALUES (4775, 25, 'Guapirama', false, -23.5146041, -50.044398600000001);
INSERT INTO cities VALUES (4776, 25, 'Guaporema', false, -23.310327099999999, -52.774693599999999);
INSERT INTO cities VALUES (4777, 25, 'Guaraci', false, -22.970094499999998, -51.655805200000003);
INSERT INTO cities VALUES (4778, 25, 'Guaraniaçu', false, -25.103941599999999, -52.868626999999996);
INSERT INTO cities VALUES (4779, 25, 'Guarapuava', false, -25.3935271, -51.456170100000001);
INSERT INTO cities VALUES (4780, 25, 'Guaraqueçaba', false, -25.287364, -48.317037399999997);
INSERT INTO cities VALUES (4781, 25, 'Guaratuba', false, -25.8834129, -48.576213500000001);
INSERT INTO cities VALUES (4782, 25, 'Honório Serpa', false, -26.139950899999999, -52.393262300000004);
INSERT INTO cities VALUES (4783, 25, 'Ibaiti', false, -23.855668699999999, -50.194888900000002);
INSERT INTO cities VALUES (4784, 25, 'Ibema', false, -25.1138552, -53.014845000000001);
INSERT INTO cities VALUES (4785, 25, 'Ibiporã', false, -23.270825299999998, -51.042720299999999);
INSERT INTO cities VALUES (4786, 25, 'Icaraíma', false, -23.3961586, -53.628881200000002);
INSERT INTO cities VALUES (4787, 25, 'Iguaraçu', false, -23.193254599999999, -51.842401199999998);
INSERT INTO cities VALUES (4788, 25, 'Iguatu', false, -24.714652900000001, -53.088074900000002);
INSERT INTO cities VALUES (4789, 25, 'Imbaú', false, -24.4489357, -50.7645178);
INSERT INTO cities VALUES (4790, 25, 'Imbituva', false, -25.230436399999999, -50.608361799999997);
INSERT INTO cities VALUES (4791, 25, 'Inácio Martins', false, -25.526644999999998, -51.285487500000002);
INSERT INTO cities VALUES (4792, 25, 'Inajá', false, -22.751226200000001, -52.201687900000003);
INSERT INTO cities VALUES (4793, 25, 'Indianópolis', false, -23.485936800000001, -52.698132700000002);
INSERT INTO cities VALUES (4794, 25, 'Ipiranga', false, -25.0215979, -50.590109900000002);
INSERT INTO cities VALUES (4795, 25, 'Iporã', false, -24.004393100000001, -53.695506899999998);
INSERT INTO cities VALUES (4796, 25, 'Iracema do Oeste', false, -24.4234273, -53.3484604);
INSERT INTO cities VALUES (4797, 25, 'Irati', false, -25.467381, -50.651141099999997);
INSERT INTO cities VALUES (4798, 25, 'Iretama', false, -24.4245603, -52.108991500000002);
INSERT INTO cities VALUES (4799, 25, 'Itaguajé', false, -22.614430500000001, -51.966472000000003);
INSERT INTO cities VALUES (4800, 25, 'Itaipulândia', false, -25.146762899999999, -54.304932200000003);
INSERT INTO cities VALUES (4801, 25, 'Itambaracá', false, -23.013696400000001, -50.401969200000003);
INSERT INTO cities VALUES (4802, 25, 'Itambé', false, -23.6600015, -51.990201900000002);
INSERT INTO cities VALUES (4803, 25, 'Itapejara d`Oeste', false, -25.978588999999999, -52.813147299999997);
INSERT INTO cities VALUES (4804, 25, 'Itaperuçu', false, -25.219990500000002, -49.347918300000003);
INSERT INTO cities VALUES (4805, 25, 'Itaúna do Sul', false, -22.747449100000001, -52.885930199999997);
INSERT INTO cities VALUES (4806, 25, 'Ivaí', false, -24.987780900000001, -50.869402600000001);
INSERT INTO cities VALUES (4807, 25, 'Ivaiporã', false, -24.2499802, -51.680500100000003);
INSERT INTO cities VALUES (4808, 25, 'Ivaté', false, -23.402302500000001, -53.372262599999999);
INSERT INTO cities VALUES (4809, 25, 'Ivatuba', false, -23.606681699999999, -52.213062100000002);
INSERT INTO cities VALUES (4810, 25, 'Jaboti', false, -23.742911700000001, -50.083577699999999);
INSERT INTO cities VALUES (4811, 25, 'Jacarezinho', false, -23.161626200000001, -49.9697289);
INSERT INTO cities VALUES (4812, 25, 'Jaguapitã', false, -23.114619300000001, -51.537061000000001);
INSERT INTO cities VALUES (4813, 25, 'Jaguariaíva', false, -24.237851299999999, -49.722572100000001);
INSERT INTO cities VALUES (4814, 25, 'Jandaia do Sul', false, -23.603572499999999, -51.642708399999997);
INSERT INTO cities VALUES (4815, 25, 'Janiópolis', false, -24.138255399999998, -52.764165599999998);
INSERT INTO cities VALUES (4816, 25, 'Japira', false, -23.820028799999999, -50.116035199999999);
INSERT INTO cities VALUES (4817, 25, 'Japurá', false, -23.465621200000001, -52.562328800000003);
INSERT INTO cities VALUES (4818, 25, 'Jardim Alegre', false, -24.177216900000001, -51.697003899999999);
INSERT INTO cities VALUES (4819, 25, 'Jardim Olinda', false, -22.5616181, -52.046226300000001);
INSERT INTO cities VALUES (4820, 25, 'Jataizinho', false, -23.284594599999998, -50.949015799999998);
INSERT INTO cities VALUES (4821, 25, 'Jesuítas', false, -24.381906099999998, -53.375976399999999);
INSERT INTO cities VALUES (4822, 25, 'Joaquim Távora', false, -23.493227399999999, -49.906985599999999);
INSERT INTO cities VALUES (4823, 25, 'Jundiaí do Sul', false, -23.445940199999999, -50.259317799999998);
INSERT INTO cities VALUES (4824, 25, 'Juranda', false, -24.416680899999999, -52.848245200000001);
INSERT INTO cities VALUES (4825, 25, 'Jussara', false, -23.632021000000002, -52.463986800000001);
INSERT INTO cities VALUES (4826, 25, 'Kaloré', false, -23.816441999999999, -51.663518400000001);
INSERT INTO cities VALUES (4827, 25, 'Lapa', false, -25.770856899999998, -49.718831999999999);
INSERT INTO cities VALUES (4828, 25, 'Laranjal', false, -24.865914400000001, -52.457013500000002);
INSERT INTO cities VALUES (4829, 25, 'Laranjeiras do Sul', false, -25.411196, -52.411719400000003);
INSERT INTO cities VALUES (4830, 25, 'Leópolis', false, -23.0825326, -50.751642799999999);
INSERT INTO cities VALUES (4831, 25, 'Lidianópolis', false, -24.1027159, -51.653573399999999);
INSERT INTO cities VALUES (4832, 25, 'Lindoeste', false, -25.259157600000002, -53.576094099999999);
INSERT INTO cities VALUES (4833, 25, 'Loanda', false, -22.923284899999999, -53.136355399999999);
INSERT INTO cities VALUES (4834, 25, 'Lobato', false, -23.0274298, -51.944881299999999);
INSERT INTO cities VALUES (4835, 25, 'Londrina', false, -23.3103871, -51.164794299999997);
INSERT INTO cities VALUES (4836, 25, 'Luiziana', false, -24.2877914, -52.275516099999997);
INSERT INTO cities VALUES (4837, 25, 'Lunardelli', false, -24.070787500000002, -51.751420899999999);
INSERT INTO cities VALUES (4838, 25, 'Lupionópolis', false, -22.759801899999999, -51.661350499999998);
INSERT INTO cities VALUES (4839, 25, 'Mallet', false, -25.8784475, -50.826645900000003);
INSERT INTO cities VALUES (4840, 25, 'Mamborê', false, -24.2748706, -52.511365499999997);
INSERT INTO cities VALUES (4841, 25, 'Mandaguaçu', false, -23.348009300000001, -52.094949399999997);
INSERT INTO cities VALUES (4842, 25, 'Mandaguari', false, -23.5478782, -51.670052400000003);
INSERT INTO cities VALUES (4843, 25, 'Mandirituba', false, -25.758748199999999, -49.319834200000003);
INSERT INTO cities VALUES (4844, 25, 'Manfrinópolis', false, -26.142856699999999, -53.312680200000003);
INSERT INTO cities VALUES (4845, 25, 'Mangueirinha', false, -25.9448741, -52.1879481);
INSERT INTO cities VALUES (4846, 25, 'Manoel Ribas', false, -24.540130099999999, -51.6391189);
INSERT INTO cities VALUES (4847, 25, 'Marechal Cândido Rondon', false, -24.556691300000001, -54.056726300000001);
INSERT INTO cities VALUES (4848, 25, 'Maria Helena', false, -23.5930535, -53.203676299999998);
INSERT INTO cities VALUES (4849, 25, 'Marialva', false, -23.4854576, -51.792743000000002);
INSERT INTO cities VALUES (4850, 25, 'Marilândia do Sul', false, -23.739308999999999, -51.276411600000003);
INSERT INTO cities VALUES (4851, 25, 'Marilena', false, -22.721846599999999, -53.029857);
INSERT INTO cities VALUES (4852, 25, 'Mariluz', false, -23.991307800000001, -53.1463404);
INSERT INTO cities VALUES (4853, 25, 'Maringá', false, -23.427303999999999, -51.937504699999998);
INSERT INTO cities VALUES (4854, 25, 'Mariópolis', false, -26.333584800000001, -52.555311199999998);
INSERT INTO cities VALUES (4855, 25, 'Maripá', false, -24.418895599999999, -53.868348599999997);
INSERT INTO cities VALUES (4856, 25, 'Marmeleiro', false, -26.149563700000002, -53.0254914);
INSERT INTO cities VALUES (4857, 25, 'Marquinho', false, -25.0829886, -52.253684);
INSERT INTO cities VALUES (4858, 25, 'Marumbi', false, -23.7065378, -51.636726799999998);
INSERT INTO cities VALUES (4859, 25, 'Matelândia', false, -25.2423152, -53.981806599999999);
INSERT INTO cities VALUES (4860, 25, 'Matinhos', false, -25.818909900000001, -48.541420000000002);
INSERT INTO cities VALUES (4861, 25, 'Mato Rico', false, -24.690819999999999, -52.133810699999998);
INSERT INTO cities VALUES (4862, 25, 'Mauá da Serra', false, -23.907193800000002, -51.191439600000002);
INSERT INTO cities VALUES (4863, 25, 'Medianeira', false, -25.288524800000001, -54.127504700000003);
INSERT INTO cities VALUES (4864, 25, 'Mercedes', false, -24.4531937, -54.158261500000002);
INSERT INTO cities VALUES (4865, 25, 'Mirador', false, -23.256082899999999, -52.774522400000002);
INSERT INTO cities VALUES (4866, 25, 'Miraselva', false, -22.954266100000002, -51.448604899999999);
INSERT INTO cities VALUES (4867, 25, 'Missal', false, -25.087102900000001, -54.245408599999998);
INSERT INTO cities VALUES (4868, 25, 'Moreira Sales', false, -24.0443304, -53.006608800000002);
INSERT INTO cities VALUES (4869, 25, 'Morretes', false, -25.476310900000001, -48.835778699999999);
INSERT INTO cities VALUES (4870, 25, 'Munhoz de Melo', false, -23.146805700000002, -51.779302700000002);
INSERT INTO cities VALUES (4871, 25, 'Nossa Senhora das Graças', false, -22.912106000000001, -51.785885899999997);
INSERT INTO cities VALUES (4872, 25, 'Nova Aliança do Ivaí', false, -23.1776312, -52.602944999999998);
INSERT INTO cities VALUES (4873, 25, 'Nova América da Colina', false, -23.327171400000001, -50.734250500000002);
INSERT INTO cities VALUES (4874, 25, 'Nova Aurora', false, -24.5277289, -53.249681099999997);
INSERT INTO cities VALUES (4875, 25, 'Nova Cantu', false, -24.676558499999999, -52.5752235);
INSERT INTO cities VALUES (4876, 25, 'Nova Esperança', false, -25.949999999999999, -53.799999999999997);
INSERT INTO cities VALUES (4877, 25, 'Nova Esperança do Sudoeste', false, -25.9035324, -53.234999700000003);
INSERT INTO cities VALUES (4878, 25, 'Nova Fátima', false, -23.432376300000001, -50.565173799999997);
INSERT INTO cities VALUES (4879, 25, 'Nova Laranjeiras', false, -25.306243299999998, -52.534159699999996);
INSERT INTO cities VALUES (4880, 25, 'Nova Londrina', false, -22.766231900000001, -52.985887900000002);
INSERT INTO cities VALUES (4881, 25, 'Nova Olímpia', false, -23.478212599999999, -53.085573099999998);
INSERT INTO cities VALUES (4882, 25, 'Nova Prata do Iguaçu', false, -25.626360300000002, -53.346953200000002);
INSERT INTO cities VALUES (4883, 25, 'Nova Santa Bárbara', false, -23.5935691, -50.765547699999999);
INSERT INTO cities VALUES (4884, 25, 'Nova Santa Rosa', false, -24.466580400000002, -53.954414300000003);
INSERT INTO cities VALUES (4885, 25, 'Nova Tebas', false, -24.468504899999999, -51.9696018);
INSERT INTO cities VALUES (4886, 25, 'Novo Itacolomi', false, -23.761453299999999, -51.5061161);
INSERT INTO cities VALUES (4887, 25, 'Ortigueira', false, -24.224873500000001, -50.9282811);
INSERT INTO cities VALUES (4888, 25, 'Ourizona', false, -23.3869261, -52.196815200000003);
INSERT INTO cities VALUES (4889, 25, 'Ouro Verde do Oeste', false, -24.775099300000001, -53.903470200000001);
INSERT INTO cities VALUES (4890, 25, 'Paiçandu', false, -23.458146800000002, -52.049375499999996);
INSERT INTO cities VALUES (4891, 25, 'Palmas', false, -26.484151099999998, -51.991450100000002);
INSERT INTO cities VALUES (4892, 25, 'Palmeira', false, -25.434237, -49.999926500000001);
INSERT INTO cities VALUES (4893, 25, 'Palmital', false, -24.886728300000001, -52.1913658);
INSERT INTO cities VALUES (4894, 25, 'Palotina', false, -24.2816583, -53.840391799999999);
INSERT INTO cities VALUES (4895, 25, 'Paraíso do Norte', false, -23.279428500000002, -52.617452499999999);
INSERT INTO cities VALUES (4896, 25, 'Paranacity', false, -22.935419, -52.139890200000004);
INSERT INTO cities VALUES (4897, 25, 'Paranaguá', false, -25.5204691, -48.509485599999998);
INSERT INTO cities VALUES (4898, 25, 'Paranapoema', false, -22.6420973, -52.081455800000001);
INSERT INTO cities VALUES (4899, 25, 'Paranavaí', false, -23.0737694, -52.465311800000002);
INSERT INTO cities VALUES (4900, 25, 'Pato Bragado', false, -24.627805899999998, -54.226090599999999);
INSERT INTO cities VALUES (4901, 25, 'Pato Branco', false, -26.2294701, -52.671561500000003);
INSERT INTO cities VALUES (4902, 25, 'Paula Freitas', false, -26.192720999999999, -50.924184799999999);
INSERT INTO cities VALUES (4903, 25, 'Paulo Frontin', false, -26.043079899999999, -50.831563600000003);
INSERT INTO cities VALUES (4904, 25, 'Peabiru', false, -23.9180092, -52.3390171);
INSERT INTO cities VALUES (4905, 25, 'Perobal', false, -23.8961687, -53.415521699999999);
INSERT INTO cities VALUES (4906, 25, 'Pérola', false, -23.799390599999999, -53.672654999999999);
INSERT INTO cities VALUES (4907, 25, 'Pérola d`Oeste', false, -25.825123399999999, -53.7505886);
INSERT INTO cities VALUES (4908, 25, 'Piên', false, -26.0963718, -49.421503199999997);
INSERT INTO cities VALUES (4909, 25, 'Pinhais', false, -25.445300599999999, -49.193420099999997);
INSERT INTO cities VALUES (4910, 25, 'Pinhal de São Bento', false, -25.983038499999999, -53.539803900000003);
INSERT INTO cities VALUES (4911, 25, 'Pinhalão', false, -23.779672900000001, -50.035559499999998);
INSERT INTO cities VALUES (4912, 25, 'Pinhão', false, -25.707347299999999, -51.633407499999997);
INSERT INTO cities VALUES (4913, 25, 'Piraí do Sul', false, -24.539812600000001, -49.927845599999998);
INSERT INTO cities VALUES (4914, 25, 'Piraquara', false, -25.4437821, -49.0621522);
INSERT INTO cities VALUES (4915, 25, 'Pitanga', false, -24.757815300000001, -51.778051699999999);
INSERT INTO cities VALUES (4916, 25, 'Pitangueiras', false, -23.228887499999999, -51.5938278);
INSERT INTO cities VALUES (4917, 25, 'Planaltina do Paraná', false, -23.021386799999998, -52.922258399999997);
INSERT INTO cities VALUES (4918, 25, 'Planalto', false, -25.713543999999999, -53.778053300000003);
INSERT INTO cities VALUES (4919, 25, 'Ponta Grossa', false, -25.0945465, -50.1632873);
INSERT INTO cities VALUES (4920, 25, 'Pontal do Paraná', false, -25.6734145, -48.510753200000003);
INSERT INTO cities VALUES (4921, 25, 'Porecatu', false, -22.7603507, -51.385750799999997);
INSERT INTO cities VALUES (4922, 25, 'Porto Amazonas', false, -25.535552599999999, -49.892478199999999);
INSERT INTO cities VALUES (4923, 25, 'Porto Barreiro', false, -25.550924299999998, -52.4128379);
INSERT INTO cities VALUES (4924, 25, 'Porto Rico', false, -22.772348999999998, -53.267523699999998);
INSERT INTO cities VALUES (4925, 25, 'Porto Vitória', false, -26.162265900000001, -51.2321618);
INSERT INTO cities VALUES (4926, 25, 'Prado Ferreira', false, -23.045454400000001, -51.444983200000003);
INSERT INTO cities VALUES (4927, 25, 'Pranchita', false, -26.017040900000001, -53.732907300000001);
INSERT INTO cities VALUES (4928, 25, 'Presidente Castelo Branco', false, -23.284921900000001, -52.1658106);
INSERT INTO cities VALUES (4929, 25, 'Primeiro de Maio', false, -22.8499151, -51.0276408);
INSERT INTO cities VALUES (4930, 25, 'Prudentópolis', false, -25.215497200000001, -50.9689342);
INSERT INTO cities VALUES (4931, 25, 'Quarto Centenário', false, -24.282767799999998, -53.090207200000002);
INSERT INTO cities VALUES (4932, 25, 'Quatiguá', false, -23.564042700000002, -49.893850800000003);
INSERT INTO cities VALUES (4933, 25, 'Quatro Barras', false, -25.3671528, -49.0749469);
INSERT INTO cities VALUES (4934, 25, 'Quatro Pontes', false, -24.571845499999998, -53.988682900000001);
INSERT INTO cities VALUES (4935, 25, 'Quedas do Iguaçu', false, -25.440670300000001, -52.9213217);
INSERT INTO cities VALUES (4936, 25, 'Querência do Norte', false, -23.0839052, -53.4841701);
INSERT INTO cities VALUES (4937, 25, 'Quinta do Sol', false, -23.854837700000001, -52.130792499999998);
INSERT INTO cities VALUES (4938, 25, 'Quitandinha', false, -25.875701899999999, -49.487851800000001);
INSERT INTO cities VALUES (4939, 25, 'Ramilândia', false, -25.116077700000002, -54.039959400000001);
INSERT INTO cities VALUES (4940, 25, 'Rancho Alegre', false, -23.068701099999998, -50.905839700000001);
INSERT INTO cities VALUES (4941, 25, 'Rancho Alegre d`Oeste', false, -24.298903299999999, -52.942973299999998);
INSERT INTO cities VALUES (4942, 25, 'Realeza', false, -25.78032, -53.543600099999999);
INSERT INTO cities VALUES (4943, 25, 'Rebouças', false, -25.606227199999999, -50.693483899999997);
INSERT INTO cities VALUES (4944, 25, 'Renascença', false, -26.156258999999999, -52.957341999999997);
INSERT INTO cities VALUES (4945, 25, 'Reserva', false, -24.649363999999998, -50.845445099999999);
INSERT INTO cities VALUES (4946, 25, 'Reserva do Iguaçu', false, -25.804913299999999, -52.0179434);
INSERT INTO cities VALUES (4947, 25, 'Ribeirão Claro', false, -23.1879329, -49.757895599999998);
INSERT INTO cities VALUES (4948, 25, 'Ribeirão do Pinhal', false, -23.401303800000001, -50.360818299999998);
INSERT INTO cities VALUES (4949, 25, 'Rio Azul', false, -25.721512199999999, -50.794792000000001);
INSERT INTO cities VALUES (4950, 25, 'Rio Bom', false, -23.7624496, -51.413603500000001);
INSERT INTO cities VALUES (4951, 25, 'Rio Bonito do Iguaçu', false, -25.4704747, -52.544658499999997);
INSERT INTO cities VALUES (4952, 25, 'Rio Branco do Ivaí', false, -24.330317600000001, -51.314349);
INSERT INTO cities VALUES (4953, 25, 'Rio Branco do Sul', false, -25.195255499999998, -49.314017900000003);
INSERT INTO cities VALUES (4954, 25, 'Rio Negro', false, -26.104034599999999, -49.800491899999997);
INSERT INTO cities VALUES (4955, 25, 'Rolândia', false, -23.310509400000001, -51.369520600000001);
INSERT INTO cities VALUES (4956, 25, 'Roncador', false, -24.595191199999999, -52.276017199999998);
INSERT INTO cities VALUES (4957, 25, 'Rondon', false, -23.421392399999998, -52.769543900000002);
INSERT INTO cities VALUES (4958, 25, 'Rosário do Ivaí', false, -24.230571399999999, -51.270552299999999);
INSERT INTO cities VALUES (4959, 25, 'Sabáudia', false, -23.324575899999999, -51.564824899999998);
INSERT INTO cities VALUES (4960, 25, 'Salgado Filho', false, -26.169614599999999, -53.361726599999997);
INSERT INTO cities VALUES (4961, 25, 'Salto do Itararé', false, -23.601593600000001, -49.626245099999998);
INSERT INTO cities VALUES (4962, 25, 'Salto do Lontra', false, -25.794008900000001, -53.297859600000002);
INSERT INTO cities VALUES (4963, 25, 'Santa Amélia', false, -23.262418100000001, -50.443310400000001);
INSERT INTO cities VALUES (4964, 25, 'Santa Cecília do Pavão', false, -23.5202688, -50.792841600000003);
INSERT INTO cities VALUES (4965, 25, 'Santa Cruz de Monte Castelo', false, -22.963914500000001, -53.295342499999997);
INSERT INTO cities VALUES (4966, 25, 'Santa Fé', false, -23.0322362, -51.830556600000001);
INSERT INTO cities VALUES (4967, 25, 'Santa Helena', false, -24.8640741, -54.330197200000001);
INSERT INTO cities VALUES (4968, 25, 'Santa Inês', false, -22.638513799999998, -51.903086700000003);
INSERT INTO cities VALUES (4969, 25, 'Santa Isabel do Ivaí', false, -23.005285000000001, -53.187882999999999);
INSERT INTO cities VALUES (4970, 25, 'Santa Izabel do Oeste', false, -25.825977300000002, -53.483666900000003);
INSERT INTO cities VALUES (4971, 25, 'Santa Lúcia', false, -25.411016, -53.570579700000003);
INSERT INTO cities VALUES (4972, 25, 'Santa Maria do Oeste', false, -24.926735499999999, -51.8504358);
INSERT INTO cities VALUES (4973, 25, 'Santa Mariana', false, -23.141412599999999, -50.488143299999997);
INSERT INTO cities VALUES (4974, 25, 'Santa Mônica', false, -23.111371500000001, -53.106515899999998);
INSERT INTO cities VALUES (4975, 25, 'Santa Tereza do Oeste', false, -25.052705, -53.627548599999997);
INSERT INTO cities VALUES (4976, 25, 'Santa Terezinha de Itaipu', false, -25.4488722, -54.407097999999998);
INSERT INTO cities VALUES (4977, 25, 'Santana do Itararé', false, -23.755543100000001, -49.628654699999998);
INSERT INTO cities VALUES (4978, 25, 'Santo Antônio da Platina', false, -23.2982473, -50.069429999999997);
INSERT INTO cities VALUES (4979, 25, 'Santo Antônio do Caiuá', false, -22.738523799999999, -52.346397799999998);
INSERT INTO cities VALUES (4980, 25, 'Santo Antônio do Paraíso', false, -23.466361200000001, -50.6300253);
INSERT INTO cities VALUES (4981, 25, 'Santo Antônio do Sudoeste', false, -26.059615099999998, -53.717381400000001);
INSERT INTO cities VALUES (4982, 25, 'Santo Inácio', false, -22.7268504, -51.785924199999997);
INSERT INTO cities VALUES (4983, 25, 'São Carlos do Ivaí', false, -23.301577999999999, -52.478098699999997);
INSERT INTO cities VALUES (4984, 25, 'São Jerônimo da Serra', false, -23.714761599999999, -50.7294999);
INSERT INTO cities VALUES (4985, 25, 'São João', false, -25.949999999999999, -53.75);
INSERT INTO cities VALUES (4986, 25, 'São João do Caiuá', false, -22.862171100000001, -52.345837199999998);
INSERT INTO cities VALUES (4987, 25, 'São João do Ivaí', false, -23.9511398, -51.8590521);
INSERT INTO cities VALUES (4988, 25, 'São João do Triunfo', false, -25.6728597, -50.287642400000003);
INSERT INTO cities VALUES (4989, 25, 'São Jorge d`Oeste', false, -25.707916000000001, -52.919952799999997);
INSERT INTO cities VALUES (4990, 25, 'São Jorge do Ivaí', false, -23.433500899999999, -52.290889999999997);
INSERT INTO cities VALUES (4991, 25, 'São Jorge do Patrocínio', false, -23.762563799999999, -53.877552100000003);
INSERT INTO cities VALUES (4992, 25, 'São José da Boa Vista', false, -23.916607500000001, -49.652432400000002);
INSERT INTO cities VALUES (4993, 25, 'São José das Palmeiras', false, -24.8279639, -54.083610499999999);
INSERT INTO cities VALUES (4994, 25, 'São José dos Pinhais', false, -25.536512900000002, -49.204152499999999);
INSERT INTO cities VALUES (4995, 25, 'São Manoel do Paraná', false, -23.403285700000001, -52.6531661);
INSERT INTO cities VALUES (4996, 25, 'São Mateus do Sul', false, -25.876719999999999, -50.384187900000001);
INSERT INTO cities VALUES (4997, 25, 'São Miguel do Iguaçu', false, -25.347236599999999, -54.234909600000002);
INSERT INTO cities VALUES (4998, 25, 'São Pedro do Iguaçu', false, -24.933424899999999, -53.857286500000001);
INSERT INTO cities VALUES (4999, 25, 'São Pedro do Ivaí', false, -23.8565535, -51.849437700000003);
INSERT INTO cities VALUES (5000, 25, 'São Pedro do Paraná', false, -22.825036300000001, -53.221948599999997);
INSERT INTO cities VALUES (5001, 25, 'São Sebastião da Amoreira', false, -23.448619699999998, -50.748026099999997);
INSERT INTO cities VALUES (5002, 25, 'São Tomé', false, -23.5363133, -52.5842022);
INSERT INTO cities VALUES (5003, 25, 'Sapopema', false, -23.893805499999999, -50.6029847);
INSERT INTO cities VALUES (5004, 25, 'Sarandi', false, -25.847221999999999, -53.474443999999998);
INSERT INTO cities VALUES (5005, 25, 'Saudade do Iguaçu', false, -25.686966999999999, -52.608871800000003);
INSERT INTO cities VALUES (5006, 25, 'Sengés', false, -24.1132977, -49.467276900000002);
INSERT INTO cities VALUES (5007, 25, 'Serranópolis do Iguaçu', false, -25.3803193, -54.052169599999999);
INSERT INTO cities VALUES (5008, 25, 'Sertaneja', false, -23.028318200000001, -50.843713200000003);
INSERT INTO cities VALUES (5009, 25, 'Sertanópolis', false, -23.0596867, -51.033219500000001);
INSERT INTO cities VALUES (5010, 25, 'Siqueira Campos', false, -23.681791199999999, -49.847763899999997);
INSERT INTO cities VALUES (5011, 25, 'Sulina', false, -25.6899506, -52.723017499999997);
INSERT INTO cities VALUES (5012, 25, 'Tamarana', false, -23.809347599999999, -51.161742099999998);
INSERT INTO cities VALUES (5013, 25, 'Tamboara', false, -23.175743700000002, -52.469652199999999);
INSERT INTO cities VALUES (5014, 25, 'Tapejara', false, -23.7420559, -52.906700999999998);
INSERT INTO cities VALUES (5015, 25, 'Tapira', false, -23.323717200000001, -53.072183500000001);
INSERT INTO cities VALUES (5016, 25, 'Teixeira Soares', false, -25.3678393, -50.455526300000002);
INSERT INTO cities VALUES (5017, 25, 'Telêmaco Borba', false, -24.3244328, -50.616437400000002);
INSERT INTO cities VALUES (5018, 25, 'Terra Boa', false, -23.764886400000002, -52.445104200000003);
INSERT INTO cities VALUES (5019, 25, 'Terra Rica', false, -22.709697800000001, -52.620224399999998);
INSERT INTO cities VALUES (5020, 25, 'Terra Roxa', false, -24.157108099999999, -54.100368899999999);
INSERT INTO cities VALUES (5021, 25, 'Tibagi', false, -24.501807899999999, -50.441622899999999);
INSERT INTO cities VALUES (5022, 25, 'Tijucas do Sul', false, -25.920787000000001, -49.202871000000002);
INSERT INTO cities VALUES (5023, 25, 'Toledo', false, -24.719860700000002, -53.743281000000003);
INSERT INTO cities VALUES (5024, 25, 'Tomazina', false, -23.777392200000001, -49.956116999999999);
INSERT INTO cities VALUES (5025, 25, 'Três Barras do Paraná', false, -25.4006264, -53.1734632);
INSERT INTO cities VALUES (5026, 25, 'Tunas do Paraná', false, -24.977652599999999, -49.083610499999999);
INSERT INTO cities VALUES (5027, 25, 'Tuneiras do Oeste', false, -23.849890299999998, -52.869461200000003);
INSERT INTO cities VALUES (5028, 25, 'Tupãssi', false, -24.586554100000001, -53.515649000000003);
INSERT INTO cities VALUES (5029, 25, 'Turvo', false, -25.0464889, -51.5423373);
INSERT INTO cities VALUES (5030, 25, 'Ubiratã', false, -24.554865800000002, -52.9777305);
INSERT INTO cities VALUES (5031, 25, 'Umuarama', false, -23.764103599999999, -53.318360599999998);
INSERT INTO cities VALUES (5032, 25, 'União da Vitória', false, -26.230388600000001, -51.086632100000003);
INSERT INTO cities VALUES (5033, 25, 'Uniflor', false, -23.074464299999999, -52.159630800000002);
INSERT INTO cities VALUES (5034, 25, 'Uraí', false, -23.201501799999999, -50.795179500000003);
INSERT INTO cities VALUES (5035, 25, 'Ventania', false, -24.244403699999999, -50.243185599999997);
INSERT INTO cities VALUES (5036, 25, 'Vera Cruz do Oeste', false, -25.059535100000002, -53.879163200000001);
INSERT INTO cities VALUES (5037, 25, 'Verê', false, -25.883555399999999, -52.919756599999999);
INSERT INTO cities VALUES (5038, 25, 'Virmond', false, -25.3726445, -52.226920999999997);
INSERT INTO cities VALUES (5039, 25, 'Vitorino', false, -26.259426699999999, -52.8038764);
INSERT INTO cities VALUES (5040, 25, 'Wenceslau Braz', false, -23.867758899999998, -49.8117983);
INSERT INTO cities VALUES (5041, 25, 'Xambrê', false, -23.726949900000001, -53.499448600000001);
INSERT INTO cities VALUES (5042, 25, 'Curitiba', true, -25.428356300000001, -49.273251500000001);
INSERT INTO cities VALUES (5043, 26, 'Abdon Batista', false, -27.6108093, -51.024734700000003);
INSERT INTO cities VALUES (5044, 26, 'Abelardo Luz', false, -26.5672341, -52.333891700000002);
INSERT INTO cities VALUES (5045, 26, 'Agrolândia', false, -27.410653, -49.829499599999998);
INSERT INTO cities VALUES (5046, 26, 'Agronômica', false, -27.265194999999999, -49.711238100000003);
INSERT INTO cities VALUES (5047, 26, 'Água Doce', false, -26.9972919, -51.5558555);
INSERT INTO cities VALUES (5048, 26, 'Águas de Chapecó', false, -27.072994999999999, -52.9902582);
INSERT INTO cities VALUES (5049, 26, 'Águas Frias', false, -26.879875999999999, -52.862026499999999);
INSERT INTO cities VALUES (5050, 26, 'Águas Mornas', false, -27.695561300000001, -48.8233988);
INSERT INTO cities VALUES (5051, 26, 'Alfredo Wagner', false, -27.700803499999999, -49.333701400000002);
INSERT INTO cities VALUES (5052, 26, 'Alto Bela Vista', false, -27.4319387, -51.909820799999999);
INSERT INTO cities VALUES (5053, 26, 'Anchieta', false, -26.534492499999999, -53.336499000000003);
INSERT INTO cities VALUES (5054, 26, 'Angelina', false, -27.569215400000001, -48.984472400000001);
INSERT INTO cities VALUES (5055, 26, 'Anita Garibaldi', false, -26.3164695, -48.8573491);
INSERT INTO cities VALUES (5056, 26, 'Anitápolis', false, -27.902457800000001, -49.129064900000003);
INSERT INTO cities VALUES (5057, 26, 'Antônio Carlos', false, -27.516829999999999, -48.7677756);
INSERT INTO cities VALUES (5058, 26, 'Apiúna', false, -27.0336845, -49.387299900000002);
INSERT INTO cities VALUES (5059, 26, 'Arabutã', false, -27.159340199999999, -52.143109099999997);
INSERT INTO cities VALUES (5060, 26, 'Araquari', false, -26.370322900000001, -48.7232105);
INSERT INTO cities VALUES (5061, 26, 'Araranguá', false, -28.935637100000001, -49.4863711);
INSERT INTO cities VALUES (5062, 26, 'Armazém', false, -28.263088100000001, -49.019975700000003);
INSERT INTO cities VALUES (5063, 26, 'Arroio Trinta', false, -26.930858499999999, -51.335613700000003);
INSERT INTO cities VALUES (5064, 26, 'Arvoredo', false, -27.074539900000001, -52.458965800000001);
INSERT INTO cities VALUES (5065, 26, 'Ascurra', false, -26.9519734, -49.370820399999999);
INSERT INTO cities VALUES (5066, 26, 'Atalanta', false, -27.419579200000001, -49.781949300000001);
INSERT INTO cities VALUES (5067, 26, 'Aurora', false, -27.316925399999999, -49.634663799999998);
INSERT INTO cities VALUES (5068, 26, 'Balneário Arroio do Silva', false, -28.984233499999998, -49.413459799999998);
INSERT INTO cities VALUES (5069, 26, 'Balneário Barra do Sul', false, -26.455871500000001, -48.613107100000001);
INSERT INTO cities VALUES (5070, 26, 'Balneário Camboriú', false, -26.991071999999999, -48.635208400000003);
INSERT INTO cities VALUES (5071, 26, 'Balneário Gaivota', false, -29.1571183, -49.579659800000002);
INSERT INTO cities VALUES (5072, 26, 'Balneáreo Piçarras', false, -26.764412199999999, -48.672120700000001);
INSERT INTO cities VALUES (5073, 26, 'Bandeirante', false, -26.769033, -53.639408000000003);
INSERT INTO cities VALUES (5074, 26, 'Barra Bonita', false, -26.6515664, -53.443100200000003);
INSERT INTO cities VALUES (5075, 26, 'Barra Velha', false, -26.632628799999999, -48.685165300000001);
INSERT INTO cities VALUES (5076, 26, 'Bela Vista do Toldo', false, -26.276828800000001, -50.463960100000001);
INSERT INTO cities VALUES (5077, 26, 'Belmonte', false, -26.870180399999999, -53.593689099999999);
INSERT INTO cities VALUES (5078, 26, 'Benedito Novo', false, -26.7758489, -49.364640600000001);
INSERT INTO cities VALUES (5079, 26, 'Biguaçu', false, -27.494627300000001, -48.656022700000001);
INSERT INTO cities VALUES (5080, 26, 'Blumenau', false, -26.9189963, -49.0660782);
INSERT INTO cities VALUES (5081, 26, 'Bocaina do Sul', false, -27.7423015, -49.940220799999999);
INSERT INTO cities VALUES (5082, 26, 'Bom Jardim da Serra', false, -28.340370100000001, -49.624707299999997);
INSERT INTO cities VALUES (5083, 26, 'Bom Jesus', false, -26.735058299999999, -52.390827799999997);
INSERT INTO cities VALUES (5084, 26, 'Bom Jesus do Oeste', false, -26.6913917, -53.095829199999997);
INSERT INTO cities VALUES (5085, 26, 'Bom Retiro', false, -27.808049100000002, -49.533727300000002);
INSERT INTO cities VALUES (5086, 26, 'Bombinhas', false, -27.136103800000001, -48.5150942);
INSERT INTO cities VALUES (5087, 26, 'Botuverá', false, -27.196933999999999, -49.081571400000001);
INSERT INTO cities VALUES (5088, 26, 'Braço do Norte', false, -28.283480699999998, -49.158639800000003);
INSERT INTO cities VALUES (5089, 26, 'Braço do Trombudo', false, -27.358639700000001, -49.8839167);
INSERT INTO cities VALUES (5090, 26, 'Brunópolis', false, -27.310402199999999, -50.836464999999997);
INSERT INTO cities VALUES (5091, 26, 'Brusque', false, -28.25, -49.383333);
INSERT INTO cities VALUES (5092, 26, 'Caçador', false, -26.775681200000001, -51.015513900000002);
INSERT INTO cities VALUES (5093, 26, 'Caibi', false, -27.0745401, -53.251182900000003);
INSERT INTO cities VALUES (5094, 26, 'Calmon', false, -26.598865499999999, -51.1011247);
INSERT INTO cities VALUES (5095, 26, 'Camboriú', false, -27.025758, -48.654897699999999);
INSERT INTO cities VALUES (5096, 26, 'Campo Alegre', false, -26.1928026, -49.265918499999998);
INSERT INTO cities VALUES (5097, 26, 'Campo Belo do Sul', false, -27.898513999999999, -50.7573291);
INSERT INTO cities VALUES (5098, 26, 'Campo Erê', false, -26.395104100000001, -53.092567899999999);
INSERT INTO cities VALUES (5099, 26, 'Campos Novos', false, -27.401897099999999, -51.2256961);
INSERT INTO cities VALUES (5100, 26, 'Canelinha', false, -27.265410299999999, -48.768373500000003);
INSERT INTO cities VALUES (5101, 26, 'Canoinhas', false, -26.1777838, -50.390337199999998);
INSERT INTO cities VALUES (5102, 26, 'Capão Alto', false, -27.936794899999999, -50.514085600000001);
INSERT INTO cities VALUES (5103, 26, 'Capinzal', false, -27.3461076, -51.607182399999999);
INSERT INTO cities VALUES (5104, 26, 'Capivari de Baixo', false, -28.445172800000002, -48.958289100000002);
INSERT INTO cities VALUES (5105, 26, 'Catanduvas', false, -27.067482699999999, -51.663009500000001);
INSERT INTO cities VALUES (5106, 26, 'Caxambu do Sul', false, -27.1547056, -52.882968900000002);
INSERT INTO cities VALUES (5107, 26, 'Celso Ramos', false, -27.633470299999999, -51.337158899999999);
INSERT INTO cities VALUES (5108, 26, 'Cerro Negro', false, -27.797665299999998, -50.874512500000002);
INSERT INTO cities VALUES (5109, 26, 'Chapadão do Lageado', false, -27.5836015, -49.544061399999997);
INSERT INTO cities VALUES (5110, 26, 'Chapecó', false, -27.096781400000001, -52.618606900000003);
INSERT INTO cities VALUES (5111, 26, 'Cocal do Sul', false, -28.6016999, -49.326264399999999);
INSERT INTO cities VALUES (5112, 26, 'Concórdia', false, -27.234246800000001, -52.028587700000003);
INSERT INTO cities VALUES (5113, 26, 'Cordilheira Alta', false, -26.987164199999999, -52.610714399999999);
INSERT INTO cities VALUES (5114, 26, 'Coronel Freitas', false, -26.907558600000002, -52.702988599999998);
INSERT INTO cities VALUES (5115, 26, 'Coronel Martins', false, -26.510288800000001, -52.666160599999998);
INSERT INTO cities VALUES (5116, 26, 'Correia Pinto', false, -27.586241600000001, -50.365369100000002);
INSERT INTO cities VALUES (5117, 26, 'Corupá', false, -26.4260533, -49.243327299999997);
INSERT INTO cities VALUES (5118, 26, 'Criciúma', false, -28.6782979, -49.370396100000001);
INSERT INTO cities VALUES (5119, 26, 'Cunha Porã', false, -26.888114900000001, -53.177368600000001);
INSERT INTO cities VALUES (5120, 26, 'Cunhataí', false, -26.9737744, -53.0910224);
INSERT INTO cities VALUES (5121, 26, 'Curitibanos', false, -27.283256000000002, -50.585178200000001);
INSERT INTO cities VALUES (5122, 26, 'Descanso', false, -26.818764600000002, -53.508846400000003);
INSERT INTO cities VALUES (5123, 26, 'Dionísio Cerqueira', false, -26.261254900000001, -53.620669599999999);
INSERT INTO cities VALUES (5124, 26, 'Dona Emma', false, -26.986477300000001, -49.724271000000002);
INSERT INTO cities VALUES (5125, 26, 'Doutor Pedrinho', false, -26.7157673, -49.4856622);
INSERT INTO cities VALUES (5126, 26, 'Entre Rios', false, -26.725380699999999, -52.560245899999998);
INSERT INTO cities VALUES (5127, 26, 'Ermo', false, -28.984618699999999, -49.642637399999998);
INSERT INTO cities VALUES (5128, 26, 'Erval Velho', false, -27.275734, -51.441167999999998);
INSERT INTO cities VALUES (5129, 26, 'Faxinal dos Guedes', false, -26.855671099999999, -52.2564055);
INSERT INTO cities VALUES (5130, 26, 'Flor do Sertão', false, -26.779109999999999, -53.347485200000001);
INSERT INTO cities VALUES (5131, 26, 'Formosa do Sul', false, -26.651909700000001, -52.797653099999998);
INSERT INTO cities VALUES (5132, 26, 'Forquilhinha', false, -28.7480437, -49.472939099999998);
INSERT INTO cities VALUES (5133, 26, 'Fraiburgo', false, -27.026607200000001, -50.921980400000002);
INSERT INTO cities VALUES (5134, 26, 'Frei Rogério', false, -27.173245000000001, -50.804364200000002);
INSERT INTO cities VALUES (5135, 26, 'Galvão', false, -26.4567306, -52.684528499999999);
INSERT INTO cities VALUES (5136, 26, 'Garopaba', false, -28.023744900000001, -48.613905699999997);
INSERT INTO cities VALUES (5137, 26, 'Garuva', false, -26.0266175, -48.855052999999998);
INSERT INTO cities VALUES (5138, 26, 'Gaspar', false, -26.931750699999998, -48.959377500000002);
INSERT INTO cities VALUES (5139, 26, 'Governador Celso Ramos', false, -27.3157931, -48.558841299999997);
INSERT INTO cities VALUES (5140, 26, 'Grão Pará', false, -28.186562200000001, -49.2128917);
INSERT INTO cities VALUES (5141, 26, 'Gravatal', false, -28.3312682, -49.035795100000001);
INSERT INTO cities VALUES (5142, 26, 'Guabiruba', false, -27.086314999999999, -48.9866733);
INSERT INTO cities VALUES (5143, 26, 'Guaraciaba', false, -26.600753999999998, -53.516056399999997);
INSERT INTO cities VALUES (5144, 26, 'Guaramirim', false, -26.473511299999998, -49.003392900000001);
INSERT INTO cities VALUES (5145, 26, 'Guarujá do Sul', false, -26.384458500000001, -53.520942499999997);
INSERT INTO cities VALUES (5146, 26, 'Guatambú', false, -27.134792900000001, -52.787525199999997);
INSERT INTO cities VALUES (5147, 26, 'Herval d`Oeste', false, -27.1922906, -51.495712900000001);
INSERT INTO cities VALUES (5148, 26, 'Ibiam', false, -27.1835445, -51.2387972);
INSERT INTO cities VALUES (5149, 26, 'Ibicaré', false, -27.0901608, -51.365139599999999);
INSERT INTO cities VALUES (5150, 26, 'Ibirama', false, -27.053842100000001, -49.543448099999999);
INSERT INTO cities VALUES (5151, 26, 'Içara', false, -28.713821200000002, -49.300590800000002);
INSERT INTO cities VALUES (5152, 26, 'Ilhota', false, -26.877987000000001, -48.828885300000003);
INSERT INTO cities VALUES (5153, 26, 'Imaruí', false, -28.344894, -48.816396599999997);
INSERT INTO cities VALUES (5154, 26, 'Imbituba', false, -28.240543299999999, -48.670300099999999);
INSERT INTO cities VALUES (5155, 26, 'Imbuia', false, -27.498027700000002, -49.413049100000002);
INSERT INTO cities VALUES (5156, 26, 'Indaial', false, -26.897537700000001, -49.231707200000002);
INSERT INTO cities VALUES (5157, 26, 'Iomerê', false, -27.001926999999998, -51.244976399999999);
INSERT INTO cities VALUES (5158, 26, 'Ipira', false, -27.403099099999999, -51.784164799999999);
INSERT INTO cities VALUES (5159, 26, 'Iporã do Oeste', false, -26.988193800000001, -53.534596299999997);
INSERT INTO cities VALUES (5160, 26, 'Ipuaçu', false, -26.634742899999999, -52.453643800000002);
INSERT INTO cities VALUES (5161, 26, 'Ipumirim', false, -27.077324099999998, -52.135547699999996);
INSERT INTO cities VALUES (5162, 26, 'Iraceminha', false, -26.823055400000001, -53.272296900000001);
INSERT INTO cities VALUES (5163, 26, 'Irani', false, -27.0242428, -51.8857888);
INSERT INTO cities VALUES (5164, 26, 'Irati', false, -26.6575694, -52.896142699999999);
INSERT INTO cities VALUES (5165, 26, 'Irineópolis', false, -26.238720600000001, -50.802476200000001);
INSERT INTO cities VALUES (5166, 26, 'Itá', false, -27.277271899999999, -52.327301800000001);
INSERT INTO cities VALUES (5167, 26, 'Itaiópolis', false, -26.337375900000001, -49.906059499999998);
INSERT INTO cities VALUES (5168, 26, 'Itajaí', false, -26.908257599999999, -48.662602300000003);
INSERT INTO cities VALUES (5169, 26, 'Itapema', false, -27.090960299999999, -48.611994699999997);
INSERT INTO cities VALUES (5170, 26, 'Itapiranga', false, -27.171013599999998, -53.709862200000003);
INSERT INTO cities VALUES (5171, 26, 'Itapoá', false, -26.1173635, -48.6167637);
INSERT INTO cities VALUES (5172, 26, 'Ituporanga', false, -27.4249008, -49.601018099999997);
INSERT INTO cities VALUES (5173, 26, 'Jaborá', false, -27.1720437, -51.737644500000002);
INSERT INTO cities VALUES (5174, 26, 'Jacinto Machado', false, -28.998692299999998, -49.762895399999998);
INSERT INTO cities VALUES (5175, 26, 'Jaguaruna', false, -28.615414999999999, -49.025300299999998);
INSERT INTO cities VALUES (5176, 26, 'Jaraguá do Sul', false, -26.485322100000001, -49.0671994);
INSERT INTO cities VALUES (5177, 26, 'Jardinópolis', false, -26.721088600000002, -52.860138800000001);
INSERT INTO cities VALUES (5178, 26, 'Joaçaba', false, -27.1784435, -51.505013900000002);
INSERT INTO cities VALUES (5179, 26, 'Joinville', false, -26.305088300000001, -48.846093099999997);
INSERT INTO cities VALUES (5180, 26, 'José Boiteux', false, -26.960728499999998, -49.626939200000002);
INSERT INTO cities VALUES (5181, 26, 'Jupiá', false, -26.398873300000002, -52.727152500000003);
INSERT INTO cities VALUES (5182, 26, 'Lacerdópolis', false, -27.261650599999999, -51.558430700000002);
INSERT INTO cities VALUES (5183, 26, 'Lages', false, -27.8167273, -50.326444799999997);
INSERT INTO cities VALUES (5184, 26, 'Laguna', false, -28.482618500000001, -48.781498999999997);
INSERT INTO cities VALUES (5185, 26, 'Lajeado Grande', false, -26.858933, -52.566769499999999);
INSERT INTO cities VALUES (5186, 26, 'Laurentino', false, -27.2230268, -49.735944099999998);
INSERT INTO cities VALUES (5187, 26, 'Lauro Muller', false, -28.395918099999999, -49.396228999999998);
INSERT INTO cities VALUES (5188, 26, 'Lebon Régis', false, -26.931373700000002, -50.698277500000003);
INSERT INTO cities VALUES (5189, 26, 'Leoberto Leal', false, -27.508007200000002, -49.287771200000002);
INSERT INTO cities VALUES (5190, 26, 'Lindóia do Sul', false, -27.051537199999999, -52.082512199999996);
INSERT INTO cities VALUES (5191, 26, 'Lontras', false, -27.162610300000001, -49.549290599999999);
INSERT INTO cities VALUES (5192, 26, 'Luiz Alves', false, -26.7192002, -48.943212500000001);
INSERT INTO cities VALUES (5193, 26, 'Luzerna', false, -27.133210600000002, -51.467405499999998);
INSERT INTO cities VALUES (5194, 26, 'Macieira', false, -26.856530200000002, -51.376125700000003);
INSERT INTO cities VALUES (5195, 26, 'Mafra', false, -26.1116016, -49.806864900000001);
INSERT INTO cities VALUES (5196, 26, 'Major Gercino', false, -27.4176441, -48.952785499999997);
INSERT INTO cities VALUES (5197, 26, 'Major Vieira', false, -26.359226499999998, -50.322339499999998);
INSERT INTO cities VALUES (5198, 26, 'Maracajá', false, -28.847973, -49.4544195);
INSERT INTO cities VALUES (5199, 26, 'Maravilha', false, -26.760570600000001, -53.174793999999999);
INSERT INTO cities VALUES (5200, 26, 'Marema', false, -26.804172699999999, -52.626507699999998);
INSERT INTO cities VALUES (5201, 26, 'Massaranduba', false, -26.610912599999999, -49.009150499999997);
INSERT INTO cities VALUES (5202, 26, 'Matos Costa', false, -26.473552999999999, -51.151764499999999);
INSERT INTO cities VALUES (5203, 26, 'Meleiro', false, -28.8318373, -49.636208699999997);
INSERT INTO cities VALUES (5204, 26, 'Mirim Doce', false, -27.201198600000001, -50.068759300000004);
INSERT INTO cities VALUES (5205, 26, 'Modelo', false, -26.7792821, -53.052056299999997);
INSERT INTO cities VALUES (5206, 26, 'Mondaí', false, -27.101833599999999, -53.395721899999998);
INSERT INTO cities VALUES (5207, 26, 'Monte Carlo', false, -27.2240565, -50.978256600000002);
INSERT INTO cities VALUES (5208, 26, 'Monte Castelo', false, -26.460850099999998, -50.229299300000001);
INSERT INTO cities VALUES (5209, 26, 'Morro da Fumaça', false, -28.6521604, -49.210493800000002);
INSERT INTO cities VALUES (5210, 26, 'Morro Grande', false, -28.677778, -49.101666999999999);
INSERT INTO cities VALUES (5211, 26, 'Navegantes', false, -26.899394600000001, -48.6552802);
INSERT INTO cities VALUES (5212, 26, 'Nova Erechim', false, -26.905109899999999, -52.903911899999997);
INSERT INTO cities VALUES (5213, 26, 'Nova Itaberaba', false, -26.943906399999999, -52.806408400000002);
INSERT INTO cities VALUES (5214, 26, 'Nova Trento', false, -27.286172799999999, -48.930095799999997);
INSERT INTO cities VALUES (5215, 26, 'Nova Veneza', false, -28.637001300000001, -49.4983158);
INSERT INTO cities VALUES (5216, 26, 'Novo Horizonte', false, -28.399999999999999, -49.533332999999999);
INSERT INTO cities VALUES (5217, 26, 'Orleans', false, -28.368179399999999, -49.285161100000003);
INSERT INTO cities VALUES (5218, 26, 'Otacílio Costa', false, -27.487557200000001, -50.1177189);
INSERT INTO cities VALUES (5219, 26, 'Ouro', false, -27.330315599999999, -51.598084200000002);
INSERT INTO cities VALUES (5220, 26, 'Ouro Verde', false, -26.542221999999999, -53.694721999999999);
INSERT INTO cities VALUES (5221, 26, 'Paial', false, -27.252724199999999, -52.499820800000002);
INSERT INTO cities VALUES (5222, 26, 'Painel', false, -27.9249504, -50.103299800000002);
INSERT INTO cities VALUES (5223, 26, 'Palhoça', false, -27.645499699999998, -48.668208499999999);
INSERT INTO cities VALUES (5224, 26, 'Palma Sola', false, -26.3484123, -53.268348799999998);
INSERT INTO cities VALUES (5225, 26, 'Palmeira', false, -27.5793833, -50.160278599999998);
INSERT INTO cities VALUES (5226, 26, 'Palmitos', false, -27.072308400000001, -53.1579713);
INSERT INTO cities VALUES (5227, 26, 'Papanduva', false, -26.3947602, -50.1628665);
INSERT INTO cities VALUES (5228, 26, 'Paraíso', false, -26.6179205, -53.6693505);
INSERT INTO cities VALUES (5229, 26, 'Passo de Torres', false, -29.323230200000001, -49.722517600000003);
INSERT INTO cities VALUES (5230, 26, 'Passos Maia', false, -26.780827599999999, -52.064487900000003);
INSERT INTO cities VALUES (5231, 26, 'Paulo Lopes', false, -27.962407500000001, -48.682316);
INSERT INTO cities VALUES (5232, 26, 'Pedras Grandes', false, -28.435642900000001, -49.185082700000002);
INSERT INTO cities VALUES (5233, 26, 'Penha', false, -26.769833299999998, -48.646135600000001);
INSERT INTO cities VALUES (5234, 26, 'Peritiba', false, -27.373557600000002, -51.904537500000004);
INSERT INTO cities VALUES (5235, 26, 'Petrolândia', false, -27.531501800000001, -49.6962902);
INSERT INTO cities VALUES (5236, 26, 'Pinhalzinho', false, -26.837131500000002, -52.9868241);
INSERT INTO cities VALUES (5237, 26, 'Pinheiro Preto', false, -27.048962199999998, -51.230041499999999);
INSERT INTO cities VALUES (5238, 26, 'Piratuba', false, -27.418034200000001, -51.770603800000004);
INSERT INTO cities VALUES (5239, 26, 'Planalto Alegre', false, -27.0724795, -52.864601399999998);
INSERT INTO cities VALUES (5240, 26, 'Pomerode', false, -26.740752400000002, -49.175942200000001);
INSERT INTO cities VALUES (5241, 26, 'Ponte Alta', false, -27.484295299999999, -50.378129700000002);
INSERT INTO cities VALUES (5242, 26, 'Ponte Alta do Norte', false, -27.162602199999998, -50.466706899999998);
INSERT INTO cities VALUES (5243, 26, 'Ponte Serrada', false, -26.856529900000002, -52.031185999999998);
INSERT INTO cities VALUES (5244, 26, 'Porto Belo', false, -27.1581957, -48.553541600000003);
INSERT INTO cities VALUES (5245, 26, 'Porto União', false, -26.242840699999999, -51.074517100000001);
INSERT INTO cities VALUES (5246, 26, 'Pouso Redondo', false, -27.2573863, -49.9328006);
INSERT INTO cities VALUES (5247, 26, 'Praia Grande', false, -29.198506099999999, -49.950349600000003);
INSERT INTO cities VALUES (5248, 26, 'Presidente Castelo Branco', false, -27.221481600000001, -51.811116200000001);
INSERT INTO cities VALUES (5249, 26, 'Presidente Getúlio', false, -27.0465588, -49.622647600000001);
INSERT INTO cities VALUES (5250, 26, 'Presidente Nereu', false, -27.2800802, -49.391705000000002);
INSERT INTO cities VALUES (5251, 26, 'Princesa', false, -26.442997399999999, -53.5999993);
INSERT INTO cities VALUES (5252, 26, 'Quilombo', false, -26.7291572, -52.719204900000001);
INSERT INTO cities VALUES (5253, 26, 'Rancho Queimado', false, -27.679130600000001, -49.007413);
INSERT INTO cities VALUES (5254, 26, 'Rio das Antas', false, -26.526260000000001, -50.229118);
INSERT INTO cities VALUES (5255, 26, 'Rio do Campo', false, -26.945450699999999, -50.142609700000001);
INSERT INTO cities VALUES (5256, 26, 'Rio do Oeste', false, -27.193395599999999, -49.796999399999997);
INSERT INTO cities VALUES (5257, 26, 'Rio do Sul', false, -27.2145121, -49.643468400000003);
INSERT INTO cities VALUES (5258, 26, 'Rio dos Cedros', false, -26.738244099999999, -49.272622800000001);
INSERT INTO cities VALUES (5259, 26, 'Rio Fortuna', false, -28.1414154, -49.116246799999999);
INSERT INTO cities VALUES (5260, 26, 'Rio Negrinho', false, -26.254923900000001, -49.519153600000003);
INSERT INTO cities VALUES (5261, 26, 'Rio Rufino', false, -27.862293399999999, -49.779718199999998);
INSERT INTO cities VALUES (5262, 26, 'Riqueza', false, -27.070076799999999, -53.3255123);
INSERT INTO cities VALUES (5263, 26, 'Rodeio', false, -26.9148943, -49.364640199999997);
INSERT INTO cities VALUES (5264, 26, 'Romelândia', false, -26.680061899999998, -53.320019600000002);
INSERT INTO cities VALUES (5265, 26, 'Salete', false, -26.9782373, -50.004593900000003);
INSERT INTO cities VALUES (5266, 26, 'Saltinho', false, -26.608478699999999, -53.058235600000003);
INSERT INTO cities VALUES (5267, 26, 'Salto Veloso', false, -26.9044232, -51.406510099999998);
INSERT INTO cities VALUES (5268, 26, 'Sangão', false, -28.6399197, -49.1244862);
INSERT INTO cities VALUES (5269, 26, 'Santa Cecília', false, -26.960797800000002, -50.415404700000003);
INSERT INTO cities VALUES (5270, 26, 'Santa Helena', false, -26.940816399999999, -53.617851600000002);
INSERT INTO cities VALUES (5271, 26, 'Santa Rosa de Lima', false, -28.040821099999999, -49.128949499999997);
INSERT INTO cities VALUES (5272, 26, 'Santa Rosa do Sul', false, -29.1374128, -49.712628700000003);
INSERT INTO cities VALUES (5273, 26, 'Santa Terezinha', false, -26.782200700000001, -50.006311099999998);
INSERT INTO cities VALUES (5274, 26, 'Santa Terezinha do Progresso', false, -26.620497199999999, -53.200771500000002);
INSERT INTO cities VALUES (5275, 26, 'Santiago do Sul', false, -26.632168100000001, -52.673713200000002);
INSERT INTO cities VALUES (5276, 26, 'Santo Amaro da Imperatriz', false, -27.688419400000001, -48.779115400000002);
INSERT INTO cities VALUES (5277, 26, 'São Bento do Sul', false, -26.251078400000001, -49.380159599999999);
INSERT INTO cities VALUES (5278, 26, 'São Bernardino', false, -26.4260026, -52.9468271);
INSERT INTO cities VALUES (5279, 26, 'São Bonifácio', false, -27.9018625, -48.929849400000002);
INSERT INTO cities VALUES (5280, 26, 'São Carlos', false, -27.086556000000002, -53.006737399999999);
INSERT INTO cities VALUES (5281, 26, 'São Cristovão do Sul', false, -27.264225499999998, -50.442331199999998);
INSERT INTO cities VALUES (5282, 26, 'São Domingos', false, -27.050000000000001, -53.216667000000001);
INSERT INTO cities VALUES (5283, 26, 'São Francisco do Sul', false, -26.2437538, -48.638275399999998);
INSERT INTO cities VALUES (5284, 26, 'São João Batista', false, -27.276641999999999, -48.8500102);
INSERT INTO cities VALUES (5285, 26, 'São João do Itaperiú', false, -26.620416500000001, -48.768489799999998);
INSERT INTO cities VALUES (5286, 26, 'São João do Oeste', false, -27.098743899999999, -53.592789199999999);
INSERT INTO cities VALUES (5287, 26, 'São João do Sul', false, -29.225456600000001, -49.806668700000003);
INSERT INTO cities VALUES (5288, 26, 'São Joaquim', false, -26.616667, -51.600000000000001);
INSERT INTO cities VALUES (5289, 26, 'São José', false, -28.233332999999998, -49.166666999999997);
INSERT INTO cities VALUES (5290, 26, 'São José do Cedro', false, -26.454670700000001, -53.510391800000001);
INSERT INTO cities VALUES (5291, 26, 'São José do Cerrito', false, -27.662482000000001, -50.580068900000001);
INSERT INTO cities VALUES (5292, 26, 'São Lourenço do Oeste', false, -26.3527038, -52.849152099999998);
INSERT INTO cities VALUES (5293, 26, 'São Ludgero', false, -28.328697699999999, -49.181135099999999);
INSERT INTO cities VALUES (5294, 26, 'São Martinho', false, -28.173859, -48.974969000000002);
INSERT INTO cities VALUES (5295, 26, 'São Miguel da Boa Vista', false, -26.691864200000001, -53.256505199999999);
INSERT INTO cities VALUES (5296, 26, 'São Miguel do Oeste', false, -26.7258073, -53.518079999999998);
INSERT INTO cities VALUES (5297, 26, 'São Pedro de Alcântara', false, -27.568787, -48.805727099999999);
INSERT INTO cities VALUES (5298, 26, 'Saudades', false, -26.926052599999998, -53.004505600000002);
INSERT INTO cities VALUES (5299, 26, 'Schroeder', false, -26.4131739, -49.0738111);
INSERT INTO cities VALUES (5300, 26, 'Seara', false, -27.153332599999999, -52.310307100000003);
INSERT INTO cities VALUES (5301, 26, 'Serra Alta', false, -26.728470000000002, -53.042614);
INSERT INTO cities VALUES (5302, 26, 'Siderópolis', false, -28.598892500000002, -49.425409100000003);
INSERT INTO cities VALUES (5303, 26, 'Sombrio', false, -29.101972, -49.6355079);
INSERT INTO cities VALUES (5304, 26, 'Sul Brasil', false, -26.737740299999999, -52.964336500000002);
INSERT INTO cities VALUES (5305, 26, 'Taió', false, -27.116081699999999, -49.998242500000003);
INSERT INTO cities VALUES (5306, 26, 'Tangará', false, -27.104272300000002, -51.247945899999998);
INSERT INTO cities VALUES (5307, 26, 'Tigrinhos', false, -26.6869285, -53.156940499999997);
INSERT INTO cities VALUES (5308, 26, 'Tijucas', false, -27.2404747, -48.634410500000001);
INSERT INTO cities VALUES (5309, 26, 'Timbé do Sul', false, -28.831933500000002, -49.8493402);
INSERT INTO cities VALUES (5310, 26, 'Timbó', false, -26.823740300000001, -49.2710832);
INSERT INTO cities VALUES (5311, 26, 'Timbó Grande', false, -26.617742, -50.6739289);
INSERT INTO cities VALUES (5312, 26, 'Três Barras', false, -27.5, -49.566667000000002);
INSERT INTO cities VALUES (5313, 26, 'Treviso', false, -28.513920200000001, -49.457337899999999);
INSERT INTO cities VALUES (5314, 26, 'Treze de Maio', false, -28.557693400000002, -49.146630899999998);
INSERT INTO cities VALUES (5315, 26, 'Treze Tílias', false, -26.9955754, -51.413719499999999);
INSERT INTO cities VALUES (5316, 26, 'Trombudo Central', false, -27.309665899999999, -49.7943079);
INSERT INTO cities VALUES (5317, 26, 'Tubarão', false, -28.467331699999999, -49.007451500000002);
INSERT INTO cities VALUES (5318, 26, 'Tunápolis', false, -26.974461399999999, -53.638965900000002);
INSERT INTO cities VALUES (5319, 26, 'Turvo', false, -28.9279674, -49.6820424);
INSERT INTO cities VALUES (5320, 26, 'União do Oeste', false, -26.7633078, -52.8522599);
INSERT INTO cities VALUES (5321, 26, 'Urubici', false, -28.027431400000001, -49.612519800000001);
INSERT INTO cities VALUES (5322, 26, 'Urupema', false, -27.957222300000002, -49.876363300000001);
INSERT INTO cities VALUES (5323, 26, 'Urussanga', false, -28.5226747, -49.317605999999998);
INSERT INTO cities VALUES (5324, 26, 'Vargeão', false, -26.873421499999999, -52.153850900000002);
INSERT INTO cities VALUES (5325, 26, 'Vargem', false, -27.489617200000001, -50.979973800000003);
INSERT INTO cities VALUES (5326, 26, 'Vargem Bonita', false, -27.003129300000001, -51.740047699999998);
INSERT INTO cities VALUES (5327, 26, 'Vidal Ramos', false, -27.396919499999999, -49.3785454);
INSERT INTO cities VALUES (5328, 26, 'Videira', false, -27.008035400000001, -51.152297799999999);
INSERT INTO cities VALUES (5329, 26, 'Vitor Meireles', false, -26.880047600000001, -49.8324183);
INSERT INTO cities VALUES (5330, 26, 'Witmarsum', false, -26.9252699, -49.786591199999997);
INSERT INTO cities VALUES (5331, 26, 'Xanxerê', false, -26.883070700000001, -52.399988499999999);
INSERT INTO cities VALUES (5332, 26, 'Xavantina', false, -27.069182300000001, -52.342475999999998);
INSERT INTO cities VALUES (5333, 26, 'Xaxim', false, -26.961912399999999, -52.535204800000002);
INSERT INTO cities VALUES (5334, 26, 'Zortéa', false, -27.453568000000001, -51.5536235);
INSERT INTO cities VALUES (5335, 26, 'Florianópolis', true, -27.5970239, -48.549583400000003);
INSERT INTO cities VALUES (5336, 27, 'Aceguá', false, -29.746139700000001, -51.166193800000002);
INSERT INTO cities VALUES (5337, 27, 'Água Santa', false, -28.177517999999999, -52.034933000000002);
INSERT INTO cities VALUES (5338, 27, 'Agudo', false, -29.632879500000001, -53.242544100000003);
INSERT INTO cities VALUES (5339, 27, 'Ajuricaba', false, -28.2375437, -53.771511599999997);
INSERT INTO cities VALUES (5340, 27, 'Alecrim', false, -27.654005699999999, -54.762847000000001);
INSERT INTO cities VALUES (5341, 27, 'Alegrete', false, -29.784801600000002, -55.775657000000002);
INSERT INTO cities VALUES (5342, 27, 'Alegria', false, -27.827631700000001, -54.060598499999998);
INSERT INTO cities VALUES (5343, 27, 'Almirante Tamandaré do Sul', false, -28.1024536, -52.9187455);
INSERT INTO cities VALUES (5344, 27, 'Alpestre', false, -27.244945300000001, -53.028052199999998);
INSERT INTO cities VALUES (5345, 27, 'Alto Alegre', false, -28.772181799999998, -52.977729099999998);
INSERT INTO cities VALUES (5346, 27, 'Alto Feliz', false, -29.389721999999999, -51.305);
INSERT INTO cities VALUES (5347, 27, 'Alvorada', false, -28.632721, -52.183300000000003);
INSERT INTO cities VALUES (5348, 27, 'Amaral Ferrador', false, -30.8730248, -52.247255000000003);
INSERT INTO cities VALUES (5349, 27, 'Ametista do Sul', false, -27.362342900000002, -53.187707799999998);
INSERT INTO cities VALUES (5350, 27, 'André da Rocha', false, -28.631508700000001, -51.573106099999997);
INSERT INTO cities VALUES (5351, 27, 'Anta Gorda', false, -28.958619899999999, -51.995763500000002);
INSERT INTO cities VALUES (5352, 27, 'Antônio Prado', false, -28.830189300000001, -51.271134000000004);
INSERT INTO cities VALUES (5353, 27, 'Arambaré', false, -30.8818868, -51.500493900000002);
INSERT INTO cities VALUES (5354, 27, 'Araricá', false, -29.635172399999998, -50.9304396);
INSERT INTO cities VALUES (5355, 27, 'Aratiba', false, -27.394266300000002, -52.289432099999999);
INSERT INTO cities VALUES (5356, 27, 'Arroio do Meio', false, -29.398902, -51.944619299999999);
INSERT INTO cities VALUES (5357, 27, 'Arroio do Padre', false, -31.440556000000001, -52.423611000000001);
INSERT INTO cities VALUES (5358, 27, 'Arroio do Sal', false, -29.535391000000001, -49.915717000000001);
INSERT INTO cities VALUES (5359, 27, 'Arroio do Tigre', false, -29.322792499999998, -53.076406499999997);
INSERT INTO cities VALUES (5360, 27, 'Arroio dos Ratos', false, -30.077191200000001, -51.728616299999999);
INSERT INTO cities VALUES (5361, 27, 'Arroio Grande', false, -28.643889000000001, -53);
INSERT INTO cities VALUES (5362, 27, 'Arvorezinha', false, -28.850059999999999, -52.170461099999997);
INSERT INTO cities VALUES (5363, 27, 'Augusto Pestana', false, -28.517105399999998, -53.994130400000003);
INSERT INTO cities VALUES (5364, 27, 'Áurea', false, -27.697779799999999, -52.070717999999999);
INSERT INTO cities VALUES (5365, 27, 'Bagé', false, -31.328502, -54.107269899999999);
INSERT INTO cities VALUES (5366, 27, 'Balneário Pinhal', false, -30.260819399999999, -50.238769900000001);
INSERT INTO cities VALUES (5367, 27, 'Barão', false, -29.3744437, -51.498916199999996);
INSERT INTO cities VALUES (5368, 27, 'Barão de Cotegipe', false, -27.609456399999999, -52.386213699999999);
INSERT INTO cities VALUES (5369, 27, 'Barão do Triunfo', false, -30.360034800000001, -51.731901800000003);
INSERT INTO cities VALUES (5370, 27, 'Barra do Guarita', false, -27.1934407, -53.713910400000003);
INSERT INTO cities VALUES (5371, 27, 'Barra do Quaraí', false, -30.199807100000001, -57.520036699999999);
INSERT INTO cities VALUES (5372, 27, 'Barra do Ribeiro', false, -30.2915113, -51.302574499999999);
INSERT INTO cities VALUES (5373, 27, 'Barra do Rio Azul', false, -27.4059819, -52.400604899999998);
INSERT INTO cities VALUES (5374, 27, 'Barra Funda', false, -27.9201497, -53.0393574);
INSERT INTO cities VALUES (5375, 27, 'Barracão', false, -27.673297900000001, -51.450909799999998);
INSERT INTO cities VALUES (5376, 27, 'Barros Cassal', false, -29.089708900000002, -52.591352100000002);
INSERT INTO cities VALUES (5377, 27, 'Benjamin Constant do Sul', false, -27.491391400000001, -52.595886499999999);
INSERT INTO cities VALUES (5378, 27, 'Bento Gonçalves', false, -29.096543199999999, -51.451037499999998);
INSERT INTO cities VALUES (5379, 27, 'Boa Vista das Missões', false, -27.6571581, -53.318902999999999);
INSERT INTO cities VALUES (5380, 27, 'Boa Vista do Buricá', false, -27.6650542, -54.100648999999997);
INSERT INTO cities VALUES (5381, 27, 'Boa Vista do Cadeado', false, -28.584957299999999, -53.799279499999997);
INSERT INTO cities VALUES (5382, 27, 'Boa Vista do Incra', false, -28.8191013, -53.387476999999997);
INSERT INTO cities VALUES (5383, 27, 'Boa Vista do Sul', false, -29.352485900000001, -51.673701299999998);
INSERT INTO cities VALUES (5384, 27, 'Bom Jesus', false, -28.662064000000001, -50.439562500000001);
INSERT INTO cities VALUES (5385, 27, 'Bom Princípio', false, -27.800000000000001, -54.766666999999998);
INSERT INTO cities VALUES (5386, 27, 'Bom Progresso', false, -27.5447299, -53.867009899999999);
INSERT INTO cities VALUES (5387, 27, 'Bom Retiro do Sul', false, -29.6084374, -51.945870399999997);
INSERT INTO cities VALUES (5388, 27, 'Boqueirão do Leão', false, -29.279659899999999, -52.425741899999998);
INSERT INTO cities VALUES (5389, 27, 'Bossoroca', false, -28.710291300000002, -54.895069999999997);
INSERT INTO cities VALUES (5390, 27, 'Bozano', false, -28.367777799999999, -53.7708333);
INSERT INTO cities VALUES (5391, 27, 'Braga', false, -27.621161499999999, -53.738052500000002);
INSERT INTO cities VALUES (5392, 27, 'Brochier', false, -29.512753700000001, -51.556007299999997);
INSERT INTO cities VALUES (5393, 27, 'Butiá', false, -30.1193454, -51.962747100000001);
INSERT INTO cities VALUES (5394, 27, 'Caçapava do Sul', false, -30.516375100000001, -53.486825400000001);
INSERT INTO cities VALUES (5395, 27, 'Cacequi', false, -29.867830600000001, -54.8212215);
INSERT INTO cities VALUES (5396, 27, 'Cachoeira do Sul', false, -30.012511499999999, -52.919817999999999);
INSERT INTO cities VALUES (5397, 27, 'Cachoeirinha', false, -29.947685400000001, -51.095400300000001);
INSERT INTO cities VALUES (5398, 27, 'Cacique Doble', false, -27.766977399999998, -51.6624056);
INSERT INTO cities VALUES (5399, 27, 'Caibaté', false, -28.2723394, -54.6592214);
INSERT INTO cities VALUES (5400, 27, 'Caiçara', false, -27.274477900000001, -53.432605899999999);
INSERT INTO cities VALUES (5401, 27, 'Camaquã', false, -30.851491500000002, -51.812885899999998);
INSERT INTO cities VALUES (5402, 27, 'Camargo', false, -28.582205299999998, -52.191968000000003);
INSERT INTO cities VALUES (5403, 27, 'Cambará do Sul', false, -29.0374339, -50.1556213);
INSERT INTO cities VALUES (5404, 27, 'Campestre da Serra', false, -28.785659800000001, -51.098635600000001);
INSERT INTO cities VALUES (5405, 27, 'Campina das Missões', false, -27.990181199999999, -54.832163100000002);
INSERT INTO cities VALUES (5406, 27, 'Campinas do Sul', false, -27.716763799999999, -52.624008799999999);
INSERT INTO cities VALUES (5407, 27, 'Campo Bom', false, -29.680329, -51.053614699999997);
INSERT INTO cities VALUES (5408, 27, 'Campo Novo', false, -28.931944000000001, -52.321944000000002);
INSERT INTO cities VALUES (5409, 27, 'Campos Borges', false, -28.875235799999999, -53.015276800000002);
INSERT INTO cities VALUES (5410, 27, 'Candelária', false, -29.681432300000001, -52.799584500000002);
INSERT INTO cities VALUES (5411, 27, 'Cândido Godói', false, -27.952466399999999, -54.753602399999998);
INSERT INTO cities VALUES (5412, 27, 'Candiota', false, -31.476769999999998, -53.679191899999999);
INSERT INTO cities VALUES (5413, 27, 'Canela', false, -29.361759200000002, -50.8127104);
INSERT INTO cities VALUES (5414, 27, 'Canguçu', false, -31.395620900000001, -52.6863648);
INSERT INTO cities VALUES (5415, 27, 'Canoas', false, -29.918889, -51.178058700000001);
INSERT INTO cities VALUES (5416, 27, 'Canudos do Vale', false, -29.322777800000001, -52.233888899999997);
INSERT INTO cities VALUES (5417, 27, 'Capão Bonito do Sul', false, -28.101581199999998, -51.390023399999997);
INSERT INTO cities VALUES (5418, 27, 'Capão da Canoa', false, -29.758800999999998, -50.047575000000002);
INSERT INTO cities VALUES (5419, 27, 'Capão do Cipó', false, -28.9215424, -54.700918799999997);
INSERT INTO cities VALUES (5420, 27, 'Capão do Leão', false, -31.767490500000001, -52.448714299999999);
INSERT INTO cities VALUES (5421, 27, 'Capela de Santana', false, -29.692547000000001, -51.317743499999999);
INSERT INTO cities VALUES (5422, 27, 'Capitão', false, -29.268096499999999, -52.010850099999999);
INSERT INTO cities VALUES (5423, 27, 'Capivari do Sul', false, -30.1472351, -50.513034300000001);
INSERT INTO cities VALUES (5424, 27, 'Caraá', false, -29.764858499999999, -50.4432008);
INSERT INTO cities VALUES (5425, 27, 'Carazinho', false, -28.2783005, -52.766464300000003);
INSERT INTO cities VALUES (5426, 27, 'Carlos Barbosa', false, -29.300693500000001, -51.504515900000001);
INSERT INTO cities VALUES (5427, 27, 'Carlos Gomes', false, -27.692652299999999, -51.918624000000001);
INSERT INTO cities VALUES (5428, 27, 'Casca', false, -28.53905, -51.976705299999999);
INSERT INTO cities VALUES (5429, 27, 'Caseiros', false, -28.2758255, -51.675074100000003);
INSERT INTO cities VALUES (5430, 27, 'Catuípe', false, -28.2614068, -54.002459199999997);
INSERT INTO cities VALUES (5431, 27, 'Caxias do Sul', false, -29.167824400000001, -51.179383000000001);
INSERT INTO cities VALUES (5432, 27, 'Centenário', false, -27.757139200000001, -51.987459800000003);
INSERT INTO cities VALUES (5433, 27, 'Cerrito', false, -31.8518322, -52.810648200000003);
INSERT INTO cities VALUES (5434, 27, 'Cerro Branco', false, -29.6490483, -53.033617800000002);
INSERT INTO cities VALUES (5435, 27, 'Cerro Grande', false, -27.604442500000001, -53.1767088);
INSERT INTO cities VALUES (5436, 27, 'Cerro Grande do Sul', false, -30.590557199999999, -51.739396999999997);
INSERT INTO cities VALUES (5437, 27, 'Cerro Largo', false, -28.150622800000001, -54.738588300000004);
INSERT INTO cities VALUES (5438, 27, 'Chapada', false, -28.0454829, -53.067178200000001);
INSERT INTO cities VALUES (5439, 27, 'Charqueadas', false, -29.955112400000001, -51.625239999999998);
INSERT INTO cities VALUES (5440, 27, 'Charrua', false, -27.9525346, -52.016021799999997);
INSERT INTO cities VALUES (5441, 27, 'Chiapeta', false, -27.931182400000001, -53.945892200000003);
INSERT INTO cities VALUES (5442, 27, 'Chuí', false, -33.690539200000003, -53.455197599999998);
INSERT INTO cities VALUES (5443, 27, 'Chuvisca', false, -30.754876599999999, -51.968768500000003);
INSERT INTO cities VALUES (5444, 27, 'Cidreira', false, -30.174684299999999, -50.207592200000001);
INSERT INTO cities VALUES (5445, 27, 'Ciríaco', false, -28.3564501, -51.851902600000003);
INSERT INTO cities VALUES (5446, 27, 'Colinas', false, -29.3884513, -51.870513799999998);
INSERT INTO cities VALUES (5447, 27, 'Colorado', false, -28.5234092, -52.987650899999998);
INSERT INTO cities VALUES (5448, 27, 'Condor', false, -28.211006699999999, -53.470131500000001);
INSERT INTO cities VALUES (5449, 27, 'Constantina', false, -27.728852499999999, -52.986043199999997);
INSERT INTO cities VALUES (5450, 27, 'Coqueiro Baixo', false, -29.178553000000001, -52.093536200000003);
INSERT INTO cities VALUES (5451, 27, 'Coqueiros do Sul', false, -28.0987461, -52.7840086);
INSERT INTO cities VALUES (5452, 27, 'Coronel Barros', false, -28.381912799999998, -54.0663172);
INSERT INTO cities VALUES (5453, 27, 'Coronel Bicaco', false, -27.715304799999998, -53.7015387);
INSERT INTO cities VALUES (5454, 27, 'Coronel Pilar', false, -29.266667000000002, -51.683332999999998);
INSERT INTO cities VALUES (5455, 27, 'Cotiporã', false, -28.958472, -51.692605499999999);
INSERT INTO cities VALUES (5456, 27, 'Coxilha', false, -28.1305999, -52.290308500000002);
INSERT INTO cities VALUES (5457, 27, 'Crissiumal', false, -27.500545899999999, -54.103096200000003);
INSERT INTO cities VALUES (5458, 27, 'Cristal', false, -27.899999999999999, -54.950000000000003);
INSERT INTO cities VALUES (5459, 27, 'Cristal do Sul', false, -27.443882899999998, -53.241138499999998);
INSERT INTO cities VALUES (5460, 27, 'Cruz Alta', false, -28.639437099999999, -53.6061695);
INSERT INTO cities VALUES (5461, 27, 'Cruzaltense', false, -27.667745700000001, -52.6246425);
INSERT INTO cities VALUES (5462, 27, 'Cruzeiro do Sul', false, -29.513113100000002, -51.985286199999997);
INSERT INTO cities VALUES (5463, 27, 'David Canabarro', false, -28.3881102, -51.844024699999999);
INSERT INTO cities VALUES (5464, 27, 'Derrubadas', false, -27.2657773, -53.862561599999999);
INSERT INTO cities VALUES (5465, 27, 'Dezesseis de Novembro', false, -28.2013377, -55.067718599999999);
INSERT INTO cities VALUES (5466, 27, 'Dilermando de Aguiar', false, -29.7063658, -54.208874700000003);
INSERT INTO cities VALUES (5467, 27, 'Dois Irmãos', false, -29.582076600000001, -51.0944334);
INSERT INTO cities VALUES (5468, 27, 'Dois Irmãos das Missões', false, -27.6545253, -53.5298303);
INSERT INTO cities VALUES (5469, 27, 'Dois Lajeados', false, -28.984644500000002, -51.846379599999999);
INSERT INTO cities VALUES (5470, 27, 'Dom Feliciano', false, -30.704460000000001, -52.109865200000002);
INSERT INTO cities VALUES (5471, 27, 'Dom Pedrito', false, -30.981846999999998, -54.677468599999997);
INSERT INTO cities VALUES (5472, 27, 'Dom Pedro de Alcântara', false, -29.396087900000001, -49.8466448);
INSERT INTO cities VALUES (5473, 27, 'Dona Francisca', false, -29.617668999999999, -53.352344799999997);
INSERT INTO cities VALUES (5474, 27, 'Doutor Maurício Cardoso', false, -27.506421899999999, -54.362380899999998);
INSERT INTO cities VALUES (5475, 27, 'Doutor Ricardo', false, -29.075962199999999, -51.974633900000001);
INSERT INTO cities VALUES (5476, 27, 'Eldorado do Sul', false, -30.085664699999999, -51.617956599999999);
INSERT INTO cities VALUES (5477, 27, 'Encantado', false, -29.232909899999999, -51.876866999999997);
INSERT INTO cities VALUES (5478, 27, 'Encruzilhada do Sul', false, -30.526852000000002, -52.518380999999998);
INSERT INTO cities VALUES (5479, 27, 'Engenho Velho', false, -27.7085647, -52.930577700000001);
INSERT INTO cities VALUES (5480, 27, 'Entre Rios do Sul', false, -27.528445000000001, -52.733504600000003);
INSERT INTO cities VALUES (5481, 27, 'Entre-Ijuís', false, -28.359186999999999, -54.266748300000003);
INSERT INTO cities VALUES (5482, 27, 'Erebango', false, -27.853913299999999, -52.2919062);
INSERT INTO cities VALUES (5483, 27, 'Erechim', false, -27.630492, -52.236397799999999);
INSERT INTO cities VALUES (5484, 27, 'Ernestina', false, -28.499876700000002, -52.5686131);
INSERT INTO cities VALUES (5485, 27, 'Erval Grande', false, -27.383121299999999, -52.561632799999998);
INSERT INTO cities VALUES (5486, 27, 'Erval Seco', false, -27.542482199999998, -53.5096287);
INSERT INTO cities VALUES (5487, 27, 'Esmeralda', false, -28.0397508, -51.171891600000002);
INSERT INTO cities VALUES (5488, 27, 'Esperança do Sul', false, -27.358008999999999, -53.994909900000003);
INSERT INTO cities VALUES (5489, 27, 'Espumoso', false, -28.724246099999998, -52.873413200000002);
INSERT INTO cities VALUES (5490, 27, 'Estação', false, -27.898127599999999, -52.2520022);
INSERT INTO cities VALUES (5491, 27, 'Estância Velha', false, -29.649288500000001, -51.173581300000002);
INSERT INTO cities VALUES (5492, 27, 'Esteio', false, -29.8611279, -51.180944400000001);
INSERT INTO cities VALUES (5493, 27, 'Estrela', false, -29.504822099999998, -51.969760000000001);
INSERT INTO cities VALUES (5494, 27, 'Estrela Velha', false, -29.176718900000001, -53.160615300000003);
INSERT INTO cities VALUES (5495, 27, 'Eugênio de Castro', false, -28.526488799999999, -54.147161400000002);
INSERT INTO cities VALUES (5496, 27, 'Fagundes Varela', false, -28.854840800000002, -51.693038000000001);
INSERT INTO cities VALUES (5497, 27, 'Farroupilha', false, -29.224630900000001, -51.351017400000003);
INSERT INTO cities VALUES (5498, 27, 'Faxinal do Soturno', false, -29.570092599999999, -53.440714100000001);
INSERT INTO cities VALUES (5499, 27, 'Faxinalzinho', false, -27.413060000000002, -52.663460600000001);
INSERT INTO cities VALUES (5500, 27, 'Fazenda Vilanova', false, -29.592811900000001, -51.819269400000003);
INSERT INTO cities VALUES (5501, 27, 'Feliz', false, -29.49248, -51.206799799999999);
INSERT INTO cities VALUES (5502, 27, 'Flores da Cunha', false, -29.030466000000001, -51.1916084);
INSERT INTO cities VALUES (5503, 27, 'Floriano Peixoto', false, -27.847747999999999, -52.095202899999997);
INSERT INTO cities VALUES (5504, 27, 'Fontoura Xavier', false, -28.968994500000001, -52.370303);
INSERT INTO cities VALUES (5505, 27, 'Formigueiro', false, -30.009037200000002, -53.498349699999999);
INSERT INTO cities VALUES (5506, 27, 'Forquetinha', false, -29.372778, -52.084721999999999);
INSERT INTO cities VALUES (5507, 27, 'Fortaleza dos Valos', false, -28.783246800000001, -53.223414699999999);
INSERT INTO cities VALUES (5508, 27, 'Frederico Westphalen', false, -27.357515200000002, -53.394367099999997);
INSERT INTO cities VALUES (5509, 27, 'Garibaldi', false, -29.2543933, -51.5311758);
INSERT INTO cities VALUES (5510, 27, 'Garruchos', false, -28.184054400000001, -55.638609000000002);
INSERT INTO cities VALUES (5511, 27, 'Gaurama', false, -27.581147399999999, -52.0917016);
INSERT INTO cities VALUES (5512, 27, 'General Câmara', false, -29.905122800000001, -51.758928599999997);
INSERT INTO cities VALUES (5513, 27, 'Gentil', false, -28.430017599999999, -52.029700200000001);
INSERT INTO cities VALUES (5514, 27, 'Getúlio Vargas', false, -27.876198599999999, -52.220956800000003);
INSERT INTO cities VALUES (5515, 27, 'Giruá', false, -28.02843, -54.3503933);
INSERT INTO cities VALUES (5516, 27, 'Glorinha', false, -29.8809395, -50.788234799999998);
INSERT INTO cities VALUES (5517, 27, 'Gramado', false, -29.368791999999999, -50.8786439);
INSERT INTO cities VALUES (5518, 27, 'Gramado dos Loureiros', false, -27.441964200000001, -52.903196299999998);
INSERT INTO cities VALUES (5519, 27, 'Gramado Xavier', false, -29.267179299999999, -52.588403);
INSERT INTO cities VALUES (5520, 27, 'Gravataí', false, -29.9357237, -51.016590700000002);
INSERT INTO cities VALUES (5521, 27, 'Guabiju', false, -28.5211611, -51.668413200000003);
INSERT INTO cities VALUES (5522, 27, 'Guaíba', false, -30.114116899999999, -51.3281177);
INSERT INTO cities VALUES (5523, 27, 'Guaporé', false, -28.850026, -51.886232200000002);
INSERT INTO cities VALUES (5524, 27, 'Guarani das Missões', false, -28.141343500000001, -54.558516099999999);
INSERT INTO cities VALUES (5525, 27, 'Harmonia', false, -31.321943999999998, -52.288055999999997);
INSERT INTO cities VALUES (5526, 27, 'Herval', false, -32.012900000000002, -53.403123200000003);
INSERT INTO cities VALUES (5527, 27, 'Herveiras', false, -29.410410299999999, -52.660959200000001);
INSERT INTO cities VALUES (5528, 27, 'Horizontina', false, -27.624371400000001, -54.308940100000001);
INSERT INTO cities VALUES (5529, 27, 'Hulha Negra', false, -31.404456100000001, -53.869329800000003);
INSERT INTO cities VALUES (5530, 27, 'Humaitá', false, -27.5636625, -53.975818699999998);
INSERT INTO cities VALUES (5531, 27, 'Ibarama', false, -29.410287499999999, -53.123877200000003);
INSERT INTO cities VALUES (5532, 27, 'Ibiaçá', false, -28.0410073, -51.864747299999998);
INSERT INTO cities VALUES (5533, 27, 'Ibiraiaras', false, -28.3703799, -51.635440299999999);
INSERT INTO cities VALUES (5534, 27, 'Ibirapuitã', false, -28.6234252, -52.516140300000004);
INSERT INTO cities VALUES (5535, 27, 'Ibirubá', false, -28.629878000000001, -53.090401100000001);
INSERT INTO cities VALUES (5536, 27, 'Igrejinha', false, -29.5744018, -50.7876063);
INSERT INTO cities VALUES (5537, 27, 'Ijuí', false, -28.3885194, -53.915518200000001);
INSERT INTO cities VALUES (5538, 27, 'Ilópolis', false, -28.9233923, -52.131855199999997);
INSERT INTO cities VALUES (5539, 27, 'Imbé', false, -29.960251100000001, -50.128703600000001);
INSERT INTO cities VALUES (5540, 27, 'Imigrante', false, -29.3026585, -51.764897599999998);
INSERT INTO cities VALUES (5541, 27, 'Independência', false, -27.845642300000002, -54.192552399999997);
INSERT INTO cities VALUES (5542, 27, 'Inhacorá', false, -27.879840999999999, -54.016915500000003);
INSERT INTO cities VALUES (5543, 27, 'Ipê', false, -28.822318299999999, -51.275458);
INSERT INTO cities VALUES (5544, 27, 'Ipiranga do Sul', false, -27.924267, -52.422215399999999);
INSERT INTO cities VALUES (5545, 27, 'Iraí', false, -27.188726299999999, -53.251761399999999);
INSERT INTO cities VALUES (5546, 27, 'Itaara', false, -29.608605399999998, -53.765223400000004);
INSERT INTO cities VALUES (5547, 27, 'Itacurubi', false, -28.797037100000001, -55.237310600000001);
INSERT INTO cities VALUES (5548, 27, 'Itapuca', false, -28.754054799999999, -52.152207500000003);
INSERT INTO cities VALUES (5549, 27, 'Itaqui', false, -29.152511499999999, -56.550743400000002);
INSERT INTO cities VALUES (5550, 27, 'Itati', false, -29.4888841, -50.1137412);
INSERT INTO cities VALUES (5551, 27, 'Itatiba do Sul', false, -27.387545599999999, -52.459198200000003);
INSERT INTO cities VALUES (5552, 27, 'Ivorá', false, -29.5142688, -53.597589800000002);
INSERT INTO cities VALUES (5553, 27, 'Ivoti', false, -29.609003399999999, -51.162606099999998);
INSERT INTO cities VALUES (5554, 27, 'Jaboticaba', false, -27.630036199999999, -53.281862599999997);
INSERT INTO cities VALUES (5555, 27, 'Jacuizinho', false, -29.0238859, -53.064185899999998);
INSERT INTO cities VALUES (5556, 27, 'Jacutinga', false, -27.724736199999999, -52.5229651);
INSERT INTO cities VALUES (5557, 27, 'Jaguarão', false, -32.560208899999999, -53.380989200000002);
INSERT INTO cities VALUES (5558, 27, 'Jaguari', false, -29.5059516, -54.6752647);
INSERT INTO cities VALUES (5559, 27, 'Jaquirana', false, -28.863267799999999, -50.350334799999999);
INSERT INTO cities VALUES (5560, 27, 'Jari', false, -29.285819, -54.224841699999999);
INSERT INTO cities VALUES (5561, 27, 'Jóia', false, -28.6475601, -54.122503799999997);
INSERT INTO cities VALUES (5562, 27, 'Júlio de Castilhos', false, -29.226921000000001, -53.6824029);
INSERT INTO cities VALUES (5563, 27, 'Lagoa Bonita do Sul', false, -29.4893371, -53.015625900000003);
INSERT INTO cities VALUES (5564, 27, 'Lagoa dos Três Cantos', false, -28.571416800000002, -52.858832300000003);
INSERT INTO cities VALUES (5565, 27, 'Lagoa Vermelha', false, -28.210709900000001, -51.526159800000002);
INSERT INTO cities VALUES (5566, 27, 'Lagoão', false, -29.235448399999999, -52.796514199999997);
INSERT INTO cities VALUES (5567, 27, 'Lajeado', false, -29.468527099999999, -51.965274800000003);
INSERT INTO cities VALUES (5568, 27, 'Lajeado do Bugre', false, -27.684343599999998, -53.207209400000004);
INSERT INTO cities VALUES (5569, 27, 'Lavras do Sul', false, -30.815788000000001, -53.893090600000001);
INSERT INTO cities VALUES (5570, 27, 'Liberato Salzano', false, -27.593343900000001, -53.066818099999999);
INSERT INTO cities VALUES (5571, 27, 'Lindolfo Collor', false, -29.593056000000001, -51.203333000000001);
INSERT INTO cities VALUES (5572, 27, 'Linha Nova', false, -29.466768999999999, -51.206799599999997);
INSERT INTO cities VALUES (5573, 27, 'Maçambara', false, -29.1403684, -56.073873399999997);
INSERT INTO cities VALUES (5574, 27, 'Machadinho', false, -27.567918899999999, -51.669807800000001);
INSERT INTO cities VALUES (5575, 27, 'Mampituba', false, -29.2221023, -49.910899499999999);
INSERT INTO cities VALUES (5576, 27, 'Manoel Viana', false, -29.5853875, -55.4869141);
INSERT INTO cities VALUES (5577, 27, 'Maquiné', false, -29.704391300000001, -50.196146800000001);
INSERT INTO cities VALUES (5578, 27, 'Maratá', false, -29.5552527, -51.586294700000003);
INSERT INTO cities VALUES (5579, 27, 'Marau', false, -28.444956900000001, -52.209768400000002);
INSERT INTO cities VALUES (5580, 27, 'Marcelino Ramos', false, -27.467329800000002, -51.908507899999996);
INSERT INTO cities VALUES (5581, 27, 'Mariana Pimentel', false, -30.3304723, -51.581168599999998);
INSERT INTO cities VALUES (5582, 27, 'Mariano Moro', false, -27.353688699999999, -52.144978999999999);
INSERT INTO cities VALUES (5583, 27, 'Marques de Souza', false, -29.316094199999998, -52.104571);
INSERT INTO cities VALUES (5584, 27, 'Mata', false, -29.560468499999999, -54.455317600000001);
INSERT INTO cities VALUES (5585, 27, 'Mato Castelhano', false, -28.278229700000001, -52.1873115);
INSERT INTO cities VALUES (5586, 27, 'Mato Leitão', false, -29.5004265, -52.121361);
INSERT INTO cities VALUES (5587, 27, 'Mato Queimado', false, -28.248175400000001, -54.626812000000001);
INSERT INTO cities VALUES (5588, 27, 'Maximiliano de Almeida', false, -27.6304096, -51.789589900000003);
INSERT INTO cities VALUES (5589, 27, 'Minas do Leão', false, -30.145862099999999, -52.055132899999997);
INSERT INTO cities VALUES (5590, 27, 'Miraguaí', false, -27.5003414, -53.683711600000002);
INSERT INTO cities VALUES (5591, 27, 'Montauri', false, -28.631745899999999, -52.073134400000001);
INSERT INTO cities VALUES (5592, 27, 'Monte Alegre dos Campos', false, -28.675853700000001, -50.794998);
INSERT INTO cities VALUES (5593, 27, 'Monte Belo do Sul', false, -29.172930600000001, -51.652881200000003);
INSERT INTO cities VALUES (5594, 27, 'Montenegro', false, -29.689204400000001, -51.466991499999999);
INSERT INTO cities VALUES (5595, 27, 'Mormaço', false, -28.683987599999998, -52.7007908);
INSERT INTO cities VALUES (5596, 27, 'Morrinhos do Sul', false, -29.356859499999999, -49.918095200000003);
INSERT INTO cities VALUES (5597, 27, 'Morro Redondo', false, -31.588161499999998, -52.629841499999998);
INSERT INTO cities VALUES (5598, 27, 'Morro Reuter', false, -29.534035599999999, -51.086492200000002);
INSERT INTO cities VALUES (5599, 27, 'Mostardas', false, -31.104573500000001, -50.9221261);
INSERT INTO cities VALUES (5600, 27, 'Muçum', false, -29.1675507, -51.882362800000003);
INSERT INTO cities VALUES (5601, 27, 'Muitos Capões', false, -28.326294499999999, -51.184122000000002);
INSERT INTO cities VALUES (5602, 27, 'Muliterno', false, -28.329802300000001, -51.770049999999998);
INSERT INTO cities VALUES (5603, 27, 'Não-Me-Toque', false, -28.457916699999998, -52.822042500000002);
INSERT INTO cities VALUES (5604, 27, 'Nicolau Vergueiro', false, -28.5207701, -52.473401500000001);
INSERT INTO cities VALUES (5605, 27, 'Nonoai', false, -30.100281800000001, -51.216071700000001);
INSERT INTO cities VALUES (5606, 27, 'Nova Alvorada', false, -28.683361699999999, -52.151727200000003);
INSERT INTO cities VALUES (5607, 27, 'Nova Araçá', false, -28.6451332, -51.7269662);
INSERT INTO cities VALUES (5608, 27, 'Nova Bassano', false, -28.706526499999999, -51.689171199999997);
INSERT INTO cities VALUES (5609, 27, 'Nova Boa Vista', false, -28.011758199999999, -52.974987400000003);
INSERT INTO cities VALUES (5610, 27, 'Nova Bréscia', false, -29.213280300000001, -52.017197899999999);
INSERT INTO cities VALUES (5611, 27, 'Nova Candelária', false, -27.6237402, -54.091004699999999);
INSERT INTO cities VALUES (5612, 27, 'Nova Esperança do Sul', false, -29.394514699999998, -54.842187099999997);
INSERT INTO cities VALUES (5613, 27, 'Nova Hartz', false, -29.582236300000002, -50.907072200000002);
INSERT INTO cities VALUES (5614, 27, 'Nova Pádua', false, -29.025406499999999, -51.323619299999997);
INSERT INTO cities VALUES (5615, 27, 'Nova Palma', false, -29.472366300000001, -53.470412799999998);
INSERT INTO cities VALUES (5616, 27, 'Nova Petrópolis', false, -29.382645100000001, -51.118622600000002);
INSERT INTO cities VALUES (5617, 27, 'Nova Prata', false, -28.7637219, -51.608333899999998);
INSERT INTO cities VALUES (5618, 27, 'Nova Ramada', false, -28.0644426, -53.696714299999996);
INSERT INTO cities VALUES (5619, 27, 'Nova Roma do Sul', false, -28.993855100000001, -51.4186178);
INSERT INTO cities VALUES (5620, 27, 'Nova Santa Rita', false, -29.859964600000001, -51.258415999999997);
INSERT INTO cities VALUES (5621, 27, 'Novo Barreiro', false, -27.902746400000002, -53.1054897);
INSERT INTO cities VALUES (5622, 27, 'Novo Cabrais', false, -29.740097800000001, -52.961847800000001);
INSERT INTO cities VALUES (5623, 27, 'Novo Hamburgo', false, -29.684604700000001, -51.141856300000001);
INSERT INTO cities VALUES (5624, 27, 'Novo Machado', false, -27.567838500000001, -54.517717099999999);
INSERT INTO cities VALUES (5625, 27, 'Novo Tiradentes', false, -27.563495400000001, -53.183300699999997);
INSERT INTO cities VALUES (5626, 27, 'Novo Xingu', false, -27.732708200000001, -53.056767600000001);
INSERT INTO cities VALUES (5627, 27, 'Osório', false, -29.900347499999999, -50.273772299999997);
INSERT INTO cities VALUES (5628, 27, 'Paim Filho', false, -27.6890228, -51.768329999999999);
INSERT INTO cities VALUES (5629, 27, 'Palmares do Sul', false, -30.271518499999999, -50.476534600000001);
INSERT INTO cities VALUES (5630, 27, 'Palmeira das Missões', false, -27.888643699999999, -53.305342000000003);
INSERT INTO cities VALUES (5631, 27, 'Palmitinho', false, -27.3545616, -53.555571100000002);
INSERT INTO cities VALUES (5632, 27, 'Panambi', false, -28.290122799999999, -53.490906099999997);
INSERT INTO cities VALUES (5633, 27, 'Pantano Grande', false, -30.190150899999999, -52.373392199999998);
INSERT INTO cities VALUES (5634, 27, 'Paraí', false, -28.610365900000001, -51.794040500000001);
INSERT INTO cities VALUES (5635, 27, 'Paraíso do Sul', false, -29.6639029, -53.1482587);
INSERT INTO cities VALUES (5636, 27, 'Pareci Novo', false, -29.6383376, -51.398553800000002);
INSERT INTO cities VALUES (5637, 27, 'Parobé', false, -29.630658799999999, -50.825737799999999);
INSERT INTO cities VALUES (5638, 27, 'Passa Sete', false, -29.4499472, -52.956643300000003);
INSERT INTO cities VALUES (5639, 27, 'Passo do Sobrado', false, -29.7486125, -52.2723923);
INSERT INTO cities VALUES (5640, 27, 'Passo Fundo', false, -28.261162800000001, -52.4083349);
INSERT INTO cities VALUES (5641, 27, 'Paulo Bento', false, -27.7015715, -52.426019400000001);
INSERT INTO cities VALUES (5642, 27, 'Paverama', false, -29.552952099999999, -51.744123700000003);
INSERT INTO cities VALUES (5643, 27, 'Pedras Altas', false, -31.7325108, -53.584879800000003);
INSERT INTO cities VALUES (5644, 27, 'Pedro Osório', false, -31.879678200000001, -52.810448399999999);
INSERT INTO cities VALUES (5645, 27, 'Pejuçara', false, -28.422240500000001, -53.655731799999998);
INSERT INTO cities VALUES (5646, 27, 'Pelotas', false, -31.427681199999999, -52.376564899999998);
INSERT INTO cities VALUES (5647, 27, 'Picada Café', false, -29.4418972, -51.137805100000001);
INSERT INTO cities VALUES (5648, 27, 'Pinhal', false, -28.677778, -52.271110999999998);
INSERT INTO cities VALUES (5649, 27, 'Pinhal da Serra', false, -27.8747224, -51.173277800000001);
INSERT INTO cities VALUES (5650, 27, 'Pinhal Grande', false, -29.334266599999999, -53.310887999999998);
INSERT INTO cities VALUES (5651, 27, 'Pinheirinho do Vale', false, -27.211226100000001, -53.615084799999998);
INSERT INTO cities VALUES (5652, 27, 'Pinheiro Machado', false, -28, -54.999721999999998);
INSERT INTO cities VALUES (5653, 27, 'Pirapó', false, -28.045676799999999, -55.203543600000003);
INSERT INTO cities VALUES (5654, 27, 'Piratini', false, -31.442134299999999, -53.104520899999997);
INSERT INTO cities VALUES (5655, 27, 'Planalto', false, -27.4575, -54.169443999999999);
INSERT INTO cities VALUES (5656, 27, 'Poço das Antas', false, -29.404683200000001, -51.6285472);
INSERT INTO cities VALUES (5657, 27, 'Pontão', false, -28.059549400000002, -52.676042700000004);
INSERT INTO cities VALUES (5658, 27, 'Ponte Preta', false, -27.6529761, -52.490300599999998);
INSERT INTO cities VALUES (5659, 27, 'Portão', false, -29.701025300000001, -51.242823100000003);
INSERT INTO cities VALUES (5660, 27, 'Porto Lucena', false, -27.8512272, -55.019500600000001);
INSERT INTO cities VALUES (5661, 27, 'Porto Mauá', false, -27.569982899999999, -54.665340999999998);
INSERT INTO cities VALUES (5662, 27, 'Porto Vera Cruz', false, -27.7381134, -54.902191299999998);
INSERT INTO cities VALUES (5663, 27, 'Porto Xavier', false, -27.902274800000001, -55.133127500000001);
INSERT INTO cities VALUES (5664, 27, 'Pouso Novo', false, -29.171554499999999, -52.217523999999997);
INSERT INTO cities VALUES (5665, 27, 'Presidente Lucena', false, -29.5079922, -51.1550315);
INSERT INTO cities VALUES (5666, 27, 'Progresso', false, -27.643889000000001, -54.220278);
INSERT INTO cities VALUES (5667, 27, 'Protásio Alves', false, -28.738936299999999, -51.488599999999998);
INSERT INTO cities VALUES (5668, 27, 'Putinga', false, -28.982369299999998, -52.164438699999998);
INSERT INTO cities VALUES (5669, 27, 'Quaraí', false, -30.344835700000001, -56.453543199999999);
INSERT INTO cities VALUES (5670, 27, 'Quatro Irmãos', false, -27.816506700000001, -52.438065000000002);
INSERT INTO cities VALUES (5671, 27, 'Quevedos', false, -29.3536587, -54.071769099999997);
INSERT INTO cities VALUES (5672, 27, 'Quinze de Novembro', false, -28.101666999999999, -54.389721999999999);
INSERT INTO cities VALUES (5673, 27, 'Redentora', false, -27.664567000000002, -53.634191000000001);
INSERT INTO cities VALUES (5674, 27, 'Relvado', false, -29.0744209, -52.0511184);
INSERT INTO cities VALUES (5675, 27, 'Restinga Seca', false, -28.220278, -54.338889000000002);
INSERT INTO cities VALUES (5676, 27, 'Rio dos Índios', false, -27.297958999999999, -52.847404300000001);
INSERT INTO cities VALUES (5677, 27, 'Rio Grande', false, -32.033196500000003, -52.098614400000002);
INSERT INTO cities VALUES (5678, 27, 'Rio Pardo', false, -29.984488599999999, -52.371113200000003);
INSERT INTO cities VALUES (5679, 27, 'Riozinho', false, -29.640534200000001, -50.4591323);
INSERT INTO cities VALUES (5680, 27, 'Roca Sales', false, -29.2429421, -51.841207799999999);
INSERT INTO cities VALUES (5681, 27, 'Rodeio Bonito', false, -27.4692562, -53.169017099999998);
INSERT INTO cities VALUES (5682, 27, 'Rolador', false, -28.258407699999999, -54.818542299999997);
INSERT INTO cities VALUES (5683, 27, 'Rolante', false, -29.657013800000001, -50.574488199999998);
INSERT INTO cities VALUES (5684, 27, 'Ronda Alta', false, -27.766732300000001, -52.801390099999999);
INSERT INTO cities VALUES (5685, 27, 'Rondinha', false, -28.716667000000001, -50.299999999999997);
INSERT INTO cities VALUES (5686, 27, 'Roque Gonzales', false, -28.1086277, -55.004853699999998);
INSERT INTO cities VALUES (5687, 27, 'Rosário do Sul', false, -30.243448799999999, -54.921761099999998);
INSERT INTO cities VALUES (5688, 27, 'Sagrada Família', false, -27.7357789, -53.1640643);
INSERT INTO cities VALUES (5689, 27, 'Saldanha Marinho', false, -28.421051500000001, -53.124239299999999);
INSERT INTO cities VALUES (5690, 27, 'Salto do Jacuí', false, -29.087736499999998, -53.207446099999999);
INSERT INTO cities VALUES (5691, 27, 'Salvador das Missões', false, -28.123602399999999, -54.834965699999998);
INSERT INTO cities VALUES (5692, 27, 'Salvador do Sul', false, -29.4366938, -51.490936400000002);
INSERT INTO cities VALUES (5693, 27, 'Sananduva', false, -27.950565300000001, -51.807375399999998);
INSERT INTO cities VALUES (5694, 27, 'Santa Bárbara do Sul', false, -28.355854900000001, -53.253182799999998);
INSERT INTO cities VALUES (5695, 27, 'Santa Cecília do Sul', false, -28.1308653, -51.926845100000001);
INSERT INTO cities VALUES (5696, 27, 'Santa Clara do Sul', false, -29.469181599999999, -52.088511599999997);
INSERT INTO cities VALUES (5697, 27, 'Santa Cruz do Sul', false, -29.713140800000001, -52.431609199999997);
INSERT INTO cities VALUES (5698, 27, 'Santa Margarida do Sul', false, -30.338466499999999, -54.070673200000002);
INSERT INTO cities VALUES (5699, 27, 'Santa Maria', false, -29.691424399999999, -53.800756);
INSERT INTO cities VALUES (5700, 27, 'Santa Maria do Herval', false, -29.4806636, -51.047422599999997);
INSERT INTO cities VALUES (5701, 27, 'Santa Rosa', false, -27.8709822, -54.482030299999998);
INSERT INTO cities VALUES (5702, 27, 'Santa Tereza', false, -28.316369999999999, -54.094890999999997);
INSERT INTO cities VALUES (5703, 27, 'Santa Vitória do Palmar', false, -33.533826500000004, -53.349565900000002);
INSERT INTO cities VALUES (5704, 27, 'Santana da Boa Vista', false, -30.9125014, -53.106043);
INSERT INTO cities VALUES (5705, 27, 'Santana do Livramento', false, -30.889750299999999, -55.532279500000001);
INSERT INTO cities VALUES (5706, 27, 'Santiago', false, -29.1730953, -54.855757099999998);
INSERT INTO cities VALUES (5707, 27, 'Santo Ângelo', false, -28.300295899999998, -54.263506999999997);
INSERT INTO cities VALUES (5708, 27, 'Santo Antônio da Patrulha', false, -29.838446399999999, -50.516142700000003);
INSERT INTO cities VALUES (5709, 27, 'Santo Antônio das Missões', false, -28.489683400000001, -55.269349200000001);
INSERT INTO cities VALUES (5710, 27, 'Santo Antônio do Palma', false, -28.496149800000001, -52.019145399999999);
INSERT INTO cities VALUES (5711, 27, 'Santo Antônio do Planalto', false, -28.401, -52.693780400000001);
INSERT INTO cities VALUES (5712, 27, 'Santo Augusto', false, -27.8514518, -53.777206800000002);
INSERT INTO cities VALUES (5713, 27, 'Santo Cristo', false, -27.825533499999999, -54.6637652);
INSERT INTO cities VALUES (5714, 27, 'Santo Expedito do Sul', false, -27.902155700000002, -51.657040199999997);
INSERT INTO cities VALUES (5715, 27, 'São Borja', false, -28.682945, -55.977496500000001);
INSERT INTO cities VALUES (5716, 27, 'São Domingos do Sul', false, -28.505589199999999, -51.897124699999999);
INSERT INTO cities VALUES (5717, 27, 'São Francisco de Assis', false, -29.5544209, -55.127350800000002);
INSERT INTO cities VALUES (5718, 27, 'São Francisco de Paula', false, -29.446927299999999, -50.5791392);
INSERT INTO cities VALUES (5719, 27, 'São Gabriel', false, -30.343906400000002, -54.341890999999997);
INSERT INTO cities VALUES (5720, 27, 'São Jerônimo', false, -29.958463999999999, -51.722437599999999);
INSERT INTO cities VALUES (5721, 27, 'São João da Urtiga', false, -27.819656899999998, -51.824944000000002);
INSERT INTO cities VALUES (5722, 27, 'São João do Polêsine', false, -29.615903599999999, -53.442524300000002);
INSERT INTO cities VALUES (5723, 27, 'São Jorge', false, -28.497937, -51.696882299999999);
INSERT INTO cities VALUES (5724, 27, 'São José das Missões', false, -27.778928100000002, -53.126868299999998);
INSERT INTO cities VALUES (5725, 27, 'São José do Herval', false, -29.0335389, -52.300607900000003);
INSERT INTO cities VALUES (5726, 27, 'São José do Hortêncio', false, -29.533332999999999, -51.266666999999998);
INSERT INTO cities VALUES (5727, 27, 'São José do Inhacorá', false, -27.727440300000001, -54.117505399999999);
INSERT INTO cities VALUES (5728, 27, 'São José do Norte', false, -32.0072087, -52.036466799999999);
INSERT INTO cities VALUES (5729, 27, 'São José do Ouro', false, -27.7599497, -51.578200000000002);
INSERT INTO cities VALUES (5730, 27, 'São José do Sul', false, -29.537448099999999, -51.4774308);
INSERT INTO cities VALUES (5731, 27, 'São José dos Ausentes', false, -28.7179845, -50.049647999999998);
INSERT INTO cities VALUES (5732, 27, 'São Leopoldo', false, -29.760776799999999, -51.1521677);
INSERT INTO cities VALUES (5733, 27, 'São Lourenço do Sul', false, -31.362856699999998, -51.978856800000003);
INSERT INTO cities VALUES (5734, 27, 'São Luiz Gonzaga', false, -28.4084915, -54.961304900000002);
INSERT INTO cities VALUES (5735, 27, 'São Marcos', false, -29.508333, -56.847222000000002);
INSERT INTO cities VALUES (5736, 27, 'São Martinho', false, -29.508333, -52.423611000000001);
INSERT INTO cities VALUES (5737, 27, 'São Martinho da Serra', false, -29.534674800000001, -53.861742599999999);
INSERT INTO cities VALUES (5738, 27, 'São Miguel das Missões', false, -28.562565299999999, -54.552106100000003);
INSERT INTO cities VALUES (5739, 27, 'São Nicolau', false, -28.163632799999998, -55.274392599999999);
INSERT INTO cities VALUES (5740, 27, 'São Paulo das Missões', false, -28.0251999, -54.9238298);
INSERT INTO cities VALUES (5741, 27, 'São Pedro da Serra', false, -29.412953699999999, -51.503996399999998);
INSERT INTO cities VALUES (5742, 27, 'São Pedro das Missões', false, -27.773881599999999, -53.250397100000001);
INSERT INTO cities VALUES (5743, 27, 'São Pedro do Butiá', false, -28.113706199999999, -54.890051);
INSERT INTO cities VALUES (5744, 27, 'São Pedro do Sul', false, -29.634010499999999, -54.237526600000002);
INSERT INTO cities VALUES (5745, 27, 'São Sebastião do Caí', false, -29.586936600000001, -51.371322399999997);
INSERT INTO cities VALUES (5746, 27, 'São Sepé', false, -30.1705811, -53.580172099999999);
INSERT INTO cities VALUES (5747, 27, 'São Valentim', false, -27.847221999999999, -54.305);
INSERT INTO cities VALUES (5748, 27, 'São Valentim do Sul', false, -29.040424900000001, -51.763414300000001);
INSERT INTO cities VALUES (5749, 27, 'São Valério do Sul', false, -27.785907099999999, -53.938782500000002);
INSERT INTO cities VALUES (5750, 27, 'São Vendelino', false, -29.366273199999998, -51.355815200000002);
INSERT INTO cities VALUES (5751, 27, 'São Vicente do Sul', false, -29.692096899999999, -54.679690700000002);
INSERT INTO cities VALUES (5752, 27, 'Sapiranga', false, -29.6442011, -51.009724200000001);
INSERT INTO cities VALUES (5753, 27, 'Sapucaia do Sul', false, -29.842036, -51.146215099999999);
INSERT INTO cities VALUES (5754, 27, 'Sarandi', false, -27.9548193, -52.915155800000001);
INSERT INTO cities VALUES (5755, 27, 'Seberi', false, -27.473972400000001, -53.4055137);
INSERT INTO cities VALUES (5756, 27, 'Sede Nova', false, -27.638099700000001, -53.949658900000003);
INSERT INTO cities VALUES (5757, 27, 'Segredo', false, -29.334147900000001, -52.979615899999999);
INSERT INTO cities VALUES (5758, 27, 'Selbach', false, -28.626127499999999, -52.953391199999999);
INSERT INTO cities VALUES (5759, 27, 'Senador Salgado Filho', false, -28.030246300000002, -54.556130600000003);
INSERT INTO cities VALUES (5760, 27, 'Sentinela do Sul', false, -30.591624899999999, -51.563532799999997);
INSERT INTO cities VALUES (5761, 27, 'Serafina Corrêa', false, -28.7137156, -51.924920800000002);
INSERT INTO cities VALUES (5762, 27, 'Sério', false, -29.366627699999999, -52.2611773);
INSERT INTO cities VALUES (5763, 27, 'Sertão', false, -28.008377899999999, -52.236063600000001);
INSERT INTO cities VALUES (5764, 27, 'Sertão Santana', false, -30.427594500000001, -51.600242199999997);
INSERT INTO cities VALUES (5765, 27, 'Sete de Setembro', false, -27.4575, -52.559167000000002);
INSERT INTO cities VALUES (5766, 27, 'Severiano de Almeida', false, -27.413281900000001, -52.1270101);
INSERT INTO cities VALUES (5767, 27, 'Silveira Martins', false, -29.639747100000001, -53.589285400000001);
INSERT INTO cities VALUES (5768, 27, 'Sinimbu', false, -29.536507100000001, -52.518961900000001);
INSERT INTO cities VALUES (5769, 27, 'Sobradinho', false, -29.422754900000001, -53.032533700000002);
INSERT INTO cities VALUES (5770, 27, 'Soledade', false, -28.8185696, -52.510252199999996);
INSERT INTO cities VALUES (5771, 27, 'Tabaí', false, -29.6910025, -51.713526199999997);
INSERT INTO cities VALUES (5772, 27, 'Tapejara', false, -28.068382799999998, -52.010657299999998);
INSERT INTO cities VALUES (5773, 27, 'Tapera', false, -31.237221999999999, -51.033889000000002);
INSERT INTO cities VALUES (5774, 27, 'Tapes', false, -30.6742168, -51.396576099999997);
INSERT INTO cities VALUES (5775, 27, 'Taquara', false, -29.642226900000001, -50.795575700000001);
INSERT INTO cities VALUES (5776, 27, 'Taquari', false, -29.800423200000001, -51.864518799999999);
INSERT INTO cities VALUES (5777, 27, 'Taquaruçu do Sul', false, -27.391819999999999, -53.462437700000002);
INSERT INTO cities VALUES (5778, 27, 'Tavares', false, -31.300683200000002, -51.096481400000002);
INSERT INTO cities VALUES (5779, 27, 'Tenente Portela', false, -27.370854900000001, -53.757846399999998);
INSERT INTO cities VALUES (5780, 27, 'Terra de Areia', false, -29.594450500000001, -50.075261400000002);
INSERT INTO cities VALUES (5781, 27, 'Teutônia', false, -29.448797599999999, -51.8132327);
INSERT INTO cities VALUES (5782, 27, 'Tio Hugo', false, -28.5824128, -52.599642699999997);
INSERT INTO cities VALUES (5783, 27, 'Tiradentes do Sul', false, -27.3934487, -54.084922599999999);
INSERT INTO cities VALUES (5784, 27, 'Toropi', false, -29.475210300000001, -54.228487700000002);
INSERT INTO cities VALUES (5785, 27, 'Torres', false, -29.324172099999998, -49.757945900000003);
INSERT INTO cities VALUES (5786, 27, 'Tramandaí', false, -30.0104592, -50.152225999999999);
INSERT INTO cities VALUES (5787, 27, 'Travesseiro', false, -29.295293399999998, -52.052410500000001);
INSERT INTO cities VALUES (5788, 27, 'Três Arroios', false, -27.5081551, -52.1364996);
INSERT INTO cities VALUES (5789, 27, 'Três Cachoeiras', false, -29.452866799999999, -49.921088599999997);
INSERT INTO cities VALUES (5790, 27, 'Três Coroas', false, -29.517430699999998, -50.771018900000001);
INSERT INTO cities VALUES (5791, 27, 'Três de Maio', false, -27.752601899999998, -54.243707299999997);
INSERT INTO cities VALUES (5792, 27, 'Três Forquilhas', false, -29.536850600000001, -50.028948800000002);
INSERT INTO cities VALUES (5793, 27, 'Três Palmeiras', false, -27.610077799999999, -52.831048600000003);
INSERT INTO cities VALUES (5794, 27, 'Três Passos', false, -27.458475400000001, -53.930386900000002);
INSERT INTO cities VALUES (5795, 27, 'Trindade do Sul', false, -27.522403400000002, -52.887502599999998);
INSERT INTO cities VALUES (5796, 27, 'Triunfo', false, -29.942855999999999, -51.718456500000002);
INSERT INTO cities VALUES (5797, 27, 'Tucunduva', false, -27.651824900000001, -54.445429099999998);
INSERT INTO cities VALUES (5798, 27, 'Tunas', false, -31.699999999999999, -53.566667000000002);
INSERT INTO cities VALUES (5799, 27, 'Tupanci do Sul', false, -27.9083282, -51.525385399999998);
INSERT INTO cities VALUES (5800, 27, 'Tupanciretã', false, -29.082363099999998, -53.836950199999997);
INSERT INTO cities VALUES (5801, 27, 'Tupandi', false, -29.510654200000001, -51.4209763);
INSERT INTO cities VALUES (5802, 27, 'Tuparendi', false, -27.757625999999998, -54.485062800000001);
INSERT INTO cities VALUES (5803, 27, 'Turuçu', false, -31.429202, -52.1859386);
INSERT INTO cities VALUES (5804, 27, 'Ubiretama', false, -28.026433600000001, -54.723285599999997);
INSERT INTO cities VALUES (5805, 27, 'União da Serra', false, -28.7932554, -52.034253900000003);
INSERT INTO cities VALUES (5806, 27, 'Unistalda', false, -29.052078999999999, -55.128794200000002);
INSERT INTO cities VALUES (5807, 27, 'Uruguaiana', false, -29.749501200000001, -57.088207699999998);
INSERT INTO cities VALUES (5808, 27, 'Vacaria', false, -28.510669799999999, -50.929785099999997);
INSERT INTO cities VALUES (5809, 27, 'Vale do Sol', false, -29.5912395, -52.6947373);
INSERT INTO cities VALUES (5810, 27, 'Vale Real', false, -29.399014600000001, -51.254231599999997);
INSERT INTO cities VALUES (5811, 27, 'Vale Verde', false, -29.780553000000001, -52.163212700000003);
INSERT INTO cities VALUES (5812, 27, 'Vanini', false, -28.4764464, -51.848633200000002);
INSERT INTO cities VALUES (5813, 27, 'Venâncio Aires', false, -29.606037499999999, -52.194403000000001);
INSERT INTO cities VALUES (5814, 27, 'Vera Cruz', false, -29.710259400000002, -52.515746700000001);
INSERT INTO cities VALUES (5815, 27, 'Veranópolis', false, -28.900673399999999, -51.552851199999999);
INSERT INTO cities VALUES (5816, 27, 'Vespasiano Correa', false, -29.063144600000001, -51.867009099999997);
INSERT INTO cities VALUES (5817, 27, 'Viadutos', false, -27.548287599999998, -52.014702);
INSERT INTO cities VALUES (5818, 27, 'Viamão', false, -30.088357999999999, -51.023789499999999);
INSERT INTO cities VALUES (5819, 27, 'Vicente Dutra', false, -27.149639700000002, -53.3906031);
INSERT INTO cities VALUES (5820, 27, 'Victor Graeff', false, -28.5544662, -52.736010399999998);
INSERT INTO cities VALUES (5821, 27, 'Vila Flores', false, -28.869431299999999, -51.551478099999997);
INSERT INTO cities VALUES (5822, 27, 'Vila Lângaro', false, -28.110609400000001, -52.145311399999997);
INSERT INTO cities VALUES (5823, 27, 'Vila Maria', false, -28.529497200000002, -52.181045699999999);
INSERT INTO cities VALUES (5824, 27, 'Vila Nova do Sul', false, -30.338123199999998, -53.875772900000001);
INSERT INTO cities VALUES (5825, 27, 'Vista Alegre', false, -28.440556000000001, -52.965833000000003);
INSERT INTO cities VALUES (5826, 27, 'Vista Alegre do Prata', false, -28.794461200000001, -51.801643400000003);
INSERT INTO cities VALUES (5827, 27, 'Vista Gaúcha', false, -27.2908139, -53.701507700000001);
INSERT INTO cities VALUES (5828, 27, 'Vitória das Missões', false, -28.350672100000001, -54.498986700000003);
INSERT INTO cities VALUES (5829, 27, 'Westfália', false, NULL, NULL);
INSERT INTO cities VALUES (5830, 27, 'Xangri-lá', false, -29.800781099999998, -50.0515373);
INSERT INTO cities VALUES (5831, 27, 'Porto Alegre', true, -30.027704100000001, -51.228734600000003);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO countries VALUES (1, 'BR', 'Brasil');


--
-- Data for Name: destinations; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO destinations VALUES (2, 100, '2009-12-10', '2009-12-12', 3, 2, 1233, '2009-10-29 09:50:23.804046', '2009-10-29 09:50:23.804046');
INSERT INTO destinations VALUES (3, 200, '2009-11-10', '2009-11-20', 3, 3, 203, '2009-11-01 16:06:15.459898', '2009-11-01 16:06:15.459898');


--
-- Data for Name: evaluations; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO evaluations VALUES (3, 'Depois das reformas, a biblioteca ficou ótima. Com uma infraestrutura muito boa e com uma qualidade imcomparável. 
', 22, 7, 4, 5, 3, 3, 5, 5, 3, '2009-11-02 19:42:52.35868', '2009-11-02 19:42:52.35868');
INSERT INTO evaluations VALUES (4, 'O Memorial chama à atenção por sua arquitetura em madeira e vidro. Alguns o apelidaram de aquário histórico.', 22, 7, 3, 5, 3, 5, 4, 5, 2, '2009-11-02 19:51:37.537265', '2009-11-02 19:51:37.537265');
INSERT INTO evaluations VALUES (10, 'É um lugar que tras bastante comodidade, pelo fato de ter tudo o que se vá precisar a sua disposição.', 22, 7, 3, 3, 2, 4, 4, 3, 3, '2009-11-03 19:47:54.735041', '2009-11-03 19:47:54.735041');
INSERT INTO evaluations VALUES (6, 'O estilo do Palácio chama bastante atenção, pela arquitetura diferente do que estamos acostumados a ver.', 22, 7, 3, 4, 3, 3, 5, 3, 3, '2009-11-02 20:09:05.564102', '2009-11-02 20:09:05.564102');
INSERT INTO evaluations VALUES (7, 'É uma estrutura linda e seu entorno também é um convite a um belo passeio. É o novo cartão-postal da cidade.', 22, 7, 3, 5, 2, 3, 3, 5, 2, '2009-11-02 20:15:14.059639', '2009-11-02 20:15:14.059639');
INSERT INTO evaluations VALUES (8, 'É um lugar muito interessante. Vale a pena ir, pois, a arte das exposições são ótimas.', 22, 7, 4, 4, 5, 3, 4, 4, 3, '2009-11-02 20:34:08.656588', '2009-11-02 20:34:08.656588');
INSERT INTO evaluations VALUES (9, 'O fato de indigenas fazerem parte do elenco,torna a programação muito original e interessante. ', 22, 7, 5, 2, 3, 4, 5, 5, 4, '2009-11-02 20:42:34.126817', '2009-11-02 20:42:34.126817');
INSERT INTO evaluations VALUES (11, 'É uma praia maravilhosa, com uma vista linda e com ótimos restaurantes a beira mar.', 632, 7, 3, 3, 3, 5, 5, 3, 3, '2009-11-04 13:23:42.089172', '2009-11-04 13:23:42.089172');
INSERT INTO evaluations VALUES (12, 'Trata-se de uma praia urbana, onde o banho de mar não é aconselhável devido à poluição.
', 632, 7, 2, 2, 1, 4, 2, 2, 2, '2009-11-04 13:43:32.472759', '2009-11-04 13:43:32.472759');
INSERT INTO evaluations VALUES (13, 'É um hotel muito bom, recomendo a todos.', 632, 7, 4, 5, 5, 5, 5, 5, 5, '2009-11-04 15:34:21.737334', '2009-11-04 15:34:21.737334');
INSERT INTO evaluations VALUES (14, 'Bom hotel, mas existem melhores na cidade.', 632, 7, 3, 4, 3, 4, 4, 4, 3, '2009-11-04 15:48:47.996945', '2009-11-04 15:48:47.996945');
INSERT INTO evaluations VALUES (15, 'O Museu é muito interessante, possui muitas curiosidades sobre a Amazônia.', 60, 7, 4, 5, 5, 5, 5, 4, 3, '2009-11-04 16:20:58.278906', '2009-11-04 16:20:58.278906');
INSERT INTO evaluations VALUES (16, 'Único no país e único em beleza, lugar lindissímo.', 60, 7, 4, 5, 5, 5, 5, 4, 4, '2009-11-04 16:41:49.90745', '2009-11-04 16:41:49.90745');
INSERT INTO evaluations VALUES (17, 'Lugar excelente para passeios, e com ótima infraestrutura.', 60, 7, 3, 4, 3, 4, 3, 5, 3, '2009-11-04 16:55:37.950908', '2009-11-04 16:55:37.950908');
INSERT INTO evaluations VALUES (18, 'Muito Legal!!!

Ótimo lugar para diversão e Lazer. E é claro, para aqueles que adoram namorar sentindo o vento gostoso que sopra a margem do rio.
', 60, 7, 5, 5, 5, 5, 5, 5, 5, '2009-11-04 17:09:03.253175', '2009-11-04 17:09:03.253175');
INSERT INTO evaluations VALUES (25, 'Apesar das recomendações, o atendimento não foi o esperado.', 22, 7, 3, 4, 3, 4, 3, 4, 2, '2009-11-05 11:01:39.150811', '2009-11-05 11:01:39.150811');
INSERT INTO evaluations VALUES (20, 'Beleza incomparável, a igreja tem um contexto histórico interessante.', 60, 7, 3, 4, 3, 5, 2, 3, 3, '2009-11-04 17:23:28.849573', '2009-11-04 17:23:28.849573');
INSERT INTO evaluations VALUES (26, 'Hotel excelente, com ótimas acomodações.', 22, 7, 4, 3, 4, 4, 3, 3, 4, '2009-11-05 11:09:24.013569', '2009-11-05 11:09:24.013569');
INSERT INTO evaluations VALUES (22, 'Lugar muito bom, as cachoeiras são sensacionais', 60, 7, 4, 3, 5, 4, 4, 3, 4, '2009-11-04 17:38:54.850151', '2009-11-04 17:38:54.850151');
INSERT INTO evaluations VALUES (23, 'Ótimo ambiente para se asistir jogos e tomar aquela cerveja gelada, excelente rodízios em massa e pizza!', 60, 7, 3, 3, 3, 3, 3, 4, 2, '2009-11-04 17:42:55.006792', '2009-11-04 17:42:55.006792');
INSERT INTO evaluations VALUES (24, 'As refeições são maravilhosas.', 60, 7, 3, 4, 3, 4, 3, 3, 4, '2009-11-04 18:29:32.851757', '2009-11-04 18:29:32.851757');
INSERT INTO evaluations VALUES (27, 'Hoje, o porto de Manaus tenta recuperar seu glamour. Sua estrutura para recepção de turistas foi reformada recentemente. Além de servir para embarque e desembarque de passageiros e mercadorias que vão e vem das cidades do interior do Estado, recebe grandes transatlânticos de turistas de várias partes do mundo', 44, 7, 3, 3, 2, 4, 4, 4, 3, '2009-11-05 11:35:25.645115', '2009-11-05 11:35:25.645115');
INSERT INTO evaluations VALUES (28, 'Eles também oferecem cursos de ilustração botânica e atividades desenvolvidas pela SEMMA, como a Escola Itinerante, que leva alunos da escola pública para visitar os atributos do local. ', 44, 7, 4, 3, 4, 3, 4, 4, 3, '2009-11-05 11:43:34.829535', '2009-11-05 11:43:34.829535');
INSERT INTO evaluations VALUES (29, 'Lugar maravilhoso, inesquecível.', 44, 7, 4, 4, 5, 5, 5, 4, 4, '2009-11-05 15:14:33.337844', '2009-11-05 15:14:33.337844');
INSERT INTO evaluations VALUES (30, 'Melhor hotel fazenda que já visitei. Muito bom!!', 44, 7, 5, 5, 5, 5, 5, 5, 5, '2009-11-05 15:34:56.701223', '2009-11-05 15:34:56.701223');
INSERT INTO evaluations VALUES (31, 'Hotel ótimo com uma vista linda.', 44, 7, 5, 5, 5, 5, 5, 5, 4, '2009-11-05 15:51:36.515733', '2009-11-05 15:51:36.515733');
INSERT INTO evaluations VALUES (32, 'Um pouca da história da Bahia está retratada neste lugar maravilhoso. O museu e o Café, são bem interessantes.

', 1049, 7, 4, 5, 4, 5, 5, 4, 4, '2009-11-06 14:30:06.892113', '2009-11-06 14:30:06.892113');
INSERT INTO evaluations VALUES (33, 'lugar maravilhoso, com contexto histórico imenso.', 1049, 7, 5, 5, 5, 5, 5, 5, 5, '2009-11-06 14:42:17.817645', '2009-11-06 14:42:17.817645');
INSERT INTO evaluations VALUES (34, 'As praias mais concorridas sofrem com a lotação, nos fins-de-semana, havendo dificuldade para encontrar-se estacionamento. Alguns carros param sob coqueiros, o que configura um risco se houver a queda de algum fruto. Muitos guardadores exploram os banhistas, há riscos de assaltos, além do elevado preço em algumas barracas.

Alguns pontos da praia são de freqüência quase exclusiva de grupos e minorias, razão pela qual há certa discriminação. Algumas barracas servem apenas aos habituais banhistas, forma também de marcar-se território.
', 1049, 7, 3, 3, 4, 3, 3, 3, 3, '2009-11-06 14:54:10.178144', '2009-11-06 14:54:10.178144');
INSERT INTO evaluations VALUES (35, 'Além de se situar em uma ótima região de Salvador, bem pertinho a belas praias, o hotel possui atendimento ímpar por parte da sua equipe de trabalho. São profissionais que merecem todo o meu respeito e que me trataram com muita educação. ', 1049, 7, 5, 5, 5, 5, 5, 5, 5, '2009-11-06 15:12:28.058872', '2009-11-06 15:12:28.058872');
INSERT INTO evaluations VALUES (51, 'Possui pista para caminhada, lanchonetes, sanitários, policiamento, lago, local destinado a shows e apresentações e restaurante. Tudo isso torna o lugar perfeito para um dia de lazer. 
', 2728, 7, 4, 4, 4, 5, 3, 4, 4, '2009-11-08 11:32:37.611983', '2009-11-08 11:32:37.611983');
INSERT INTO evaluations VALUES (52, 'A beleza do lago é algo impressionante. 
O silêncio faz com que você integre com a natureza e aprecie um espetáculo da natureza. 
', 2666, 7, 5, 4, 5, 4, 4, 5, 4, '2009-11-08 11:44:38.826977', '2009-11-08 11:44:38.826977');
INSERT INTO evaluations VALUES (53, 'É uma oportunidade rara de contato com a cultura indígena.', 2728, 7, 4, 3, 4, 3, 5, 4, 4, '2009-11-08 12:03:26.154137', '2009-11-08 12:03:26.154137');
INSERT INTO evaluations VALUES (39, 'Hotel bem localizado, funcionários educados e simpáticos. Estava no primeiro andar embora goste de andares mais altos para apreciar melhor a vista. O café da manhã muito variado e farto.', 1049, 7, 4, 4, 5, 5, 4, 4, 5, '2009-11-06 15:29:05.672468', '2009-11-06 15:29:05.672468');
INSERT INTO evaluations VALUES (40, ' Pelo preço da diária o Hotel ficou a desejar, pois seus serviços se aproximam mais a de um Hostel. Os funcionários são atenciosos, mas o café da manhã é ruim, não há cuidado com a limpeza dos talheres e basicamente pão com manteiga. ', 1049, 7, 3, 3, 1, 4, 2, 3, 5, '2009-11-06 15:34:13.344527', '2009-11-06 15:34:13.344527');
INSERT INTO evaluations VALUES (41, 'Como é de se esperar,é o melhor parque aquático do Brasil.', 1233, 7, 5, 5, 5, 5, 5, 5, 5, '2009-11-06 18:24:17.239525', '2009-11-06 18:24:17.239525');
INSERT INTO evaluations VALUES (42, 'Humor já é ótimo a beira mar então, INESQUECÍVEL.', 1233, 7, 5, 5, 5, 5, 5, 5, 5, '2009-11-06 18:54:43.365154', '2009-11-06 18:54:43.365154');
INSERT INTO evaluations VALUES (43, 'Um museu curiosíssimo.Entre as coisas mais curiosas estão as cabeças mumificadas reduzidas dos ianonâmis.Vale a pena conferir.', 2650, 7, 4, 4, 5, 3, 4, 5, 4, '2009-11-06 19:06:21.358833', '2009-11-06 19:06:21.358833');
INSERT INTO evaluations VALUES (54, 'Ótimo lugar para passear com a família.', 2728, 7, 4, 4, 5, 4, 4, 5, 4, '2009-11-08 12:13:50.044038', '2009-11-08 12:13:50.044038');
INSERT INTO evaluations VALUES (55, 'O local é uma boa opção para simplesmente passar o tempo. As cinco salas são amplas e convidativas e o acesso é gratuito.', 2728, 7, 4, 4, 5, 4, 4, 3, 4, '2009-11-08 12:20:44.351875', '2009-11-08 12:20:44.351875');
INSERT INTO evaluations VALUES (44, 'A falta de consciência turística dos visitantes ainda é um problema para o Parque. O lixo, a depredação e a exploração imobiliária fazem estragos, mas ainda não conseguiram roubar de Chapada dos Guimarães o seu ar selvagem, intocado. Ainda. 

Talvez seja esse o momento de vir conhecer toda essa exuberância antes que, infelizmente, seja tarde demais. ', 2538, 7, 4, 4, 2, 3, 3, 3, 4, '2009-11-06 19:44:48.583663', '2009-11-06 19:44:48.583663');
INSERT INTO evaluations VALUES (49, 'Realmente, lugar ótimo para se praticar esportes.', 3906, 7, 5, 4, 4, 5, 4, 4, 4, '2009-11-07 22:43:42.448348', '2009-11-07 22:43:42.448348');
INSERT INTO evaluations VALUES (46, 'É uma linda construção, em pedra canga. Seu Museu histórico, faz com que os visitantes viagem no tempo.', 2650, 7, 4, 3, 4, 4, 4, 5, 4, '2009-11-06 20:20:02.223289', '2009-11-06 20:20:02.223289');
INSERT INTO evaluations VALUES (47, 'Lugar perfeito para Estudiosos, professores, pesquisadores e curiosos em geral. ', 2650, 7, 4, 4, 5, 3, 4, 4, 4, '2009-11-06 20:43:44.913927', '2009-11-06 20:43:44.913927');
INSERT INTO evaluations VALUES (48, 'Antes de ser adquirido pelo Sesc para tornar-se um dos mais importantes e completos complexos culturais da região centro-oeste, o prédio onde funciona o Sesc Arsenal, estava em ruínas. Vale destacar, entretanto, que tem um referencial histórico importante, cujo ponto de partida foi o início do Século XIX. Vale a pena conhecer.', 2650, 7, 5, 4, 4, 3, 4, 4, 3, '2009-11-06 21:01:48.742924', '2009-11-06 21:01:48.742924');
INSERT INTO evaluations VALUES (50, 'A praia mais parece uma piscina natural, rodeada de morros e belas mansões.', 3906, 7, 5, 5, 5, 5, 5, 5, 5, '2009-11-07 22:51:46.128331', '2009-11-07 22:51:46.128331');
INSERT INTO evaluations VALUES (56, 'Originalmente construído para abrigar um cassino, o Museu de Arte da Pampulha, projetado por Oscar Niemeyer, é uma das mais belas edificações brasileiras.', 3828, 7, 4, 3, 4, 4, 3, 3, 4, '2009-11-08 16:16:54.019199', '2009-11-08 16:16:54.019199');
INSERT INTO evaluations VALUES (57, 'Ótimo lugar para diversão.', 3828, 7, 4, 5, 4, 5, 4, 4, 5, '2009-11-08 16:24:52.957254', '2009-11-08 16:24:52.957254');
INSERT INTO evaluations VALUES (58, 'Uma bela igreja com lindas obras em seu interior e claro lugar ideal para rezar.', 3828, 7, 5, 4, 5, 4, 4, 5, 4, '2009-11-08 16:36:55.602065', '2009-11-08 16:36:55.602065');
INSERT INTO evaluations VALUES (66, 'Ótimo lugar para fazer caminhada apreciando a beleza do lugar.', 5042, 7, 4, 3, 5, 4, 4, 4, 3, '2009-11-09 17:10:16.180786', '2009-11-09 17:10:16.180786');
INSERT INTO evaluations VALUES (60, 'Para quem aprecia o futebol vale a pena conhecer este local.', 3828, 7, 4, 3, 3, 4, 4, 4, 4, '2009-11-08 16:43:01.219964', '2009-11-08 16:43:01.219964');
INSERT INTO evaluations VALUES (61, 'Alem da otima arquitetura, sempre tem espetaculos acessiveis para toda a populaçao', 3828, 7, 4, 4, 4, 5, 4, 4, 4, '2009-11-08 16:47:42.772774', '2009-11-08 16:47:42.772774');
INSERT INTO evaluations VALUES (62, 'O lugar é um paraíso para quem procura a natureza para fugir da agitação da cidade.', 409, 7, 4, 3, 4, 3, 2, 3, 4, '2009-11-08 21:14:13.674095', '2009-11-08 21:14:13.674095');
INSERT INTO evaluations VALUES (63, 'Lugar bastante abundante na flora e na fauna.Tranqüilo lugar com muitas iguarias na culinária. ', 409, 7, 4, 3, 4, 2, 4, 3, 4, '2009-11-08 22:48:18.251275', '2009-11-08 22:48:18.251275');
INSERT INTO evaluations VALUES (64, 'Um lugar sem igual,tudo estar intima mente ligada a natureza.Grande paraíso e quem vai não se arrepende diante da tamanha beleza deste lugar.', 409, 7, 5, 4, 4, 5, 3, 3, 4, '2009-11-08 23:04:52.927703', '2009-11-08 23:04:52.927703');
INSERT INTO evaluations VALUES (65, 'Ótimo atendimento.', 409, 7, 4, 3, 3, 4, 3, 3, 4, '2009-11-08 23:17:40.795606', '2009-11-08 23:17:40.795606');
INSERT INTO evaluations VALUES (67, 'É um espaço mágico que se integra à natureza do local.', 5042, 7, 4, 4, 5, 3, 4, 4, 4, '2009-11-09 17:19:55.783605', '2009-11-09 17:19:55.783605');
INSERT INTO evaluations VALUES (68, 'Lá o público pode assistir a apresentações cênicas e musicais, ver exposições de arte, assistir a palestras ou participar de cursos sobre arte e cultura. ', 5042, 7, 4, 4, 5, 4, 4, 3, 3, '2009-11-09 17:29:32.227098', '2009-11-09 17:29:32.227098');
INSERT INTO evaluations VALUES (69, 'Exposição permanente de um acervo único, coletado pela Rede Ferroviária de dentro de suas estações e locomotivas.Vale a pena conferir.', 5042, 7, 4, 4, 5, 4, 4, 4, 4, '2009-11-09 17:41:02.860089', '2009-11-09 17:41:02.860089');
INSERT INTO evaluations VALUES (70, 'Para as pessoas que curtem Otaku vale a pena marcar presença, pois o local é ponto de encontro dos otaku. ', 5042, 7, 4, 5, 4, 4, 3, 4, 5, '2009-11-09 17:57:10.558962', '2009-11-09 17:57:10.558962');
INSERT INTO evaluations VALUES (71, 'uhuhuhuhu', 2975, 8, 4, 3, 2, 5, 4, 3, 4, '2009-11-09 19:39:51.67483', '2009-11-09 19:39:51.67483');
INSERT INTO evaluations VALUES (72, 'A praia é bonita, mas não a mais bonita do Nordeste. Entretanto, a limpeza, bom atendimento e infraestrutura são excelentes. Meio longe do centro, mas comparando com praias como Jericoacoara e Lagoinha está ótima. Não conferi, mas dizem que é a única praia nadável de Fortaleza; vi muita gente utilizando as outras, mas realmente a Praia do Futuro parece a mais limpa e organizada. Se quer descansar, fique em um hotel ali perto e vá para a praia todo dia. Mas cuidado: dizem que é perigosa à noite, então não dê muita bobeira.', 1233, 9, 4, 5, 5, 3, 4, 5, 5, '2009-11-10 12:33:08.730525', '2009-11-10 12:33:08.730525');
INSERT INTO evaluations VALUES (73, 'Nem vi o mar, mas os eventos que ocorrem na praia são excelentes. A feirinha é ótima e com produtos de qualidade - mas caros, naturalmente, já que são para turistas. Os quiosques são bons, e os restaurantes pobrezinhos também; alguns, porém, são caríssimos, comida fraca e atendimento muito, muito, muito ruim.', 1233, 9, 4, 4, 5, 5, 3, 4, 3, '2009-11-10 12:43:41.649316', '2009-11-10 12:43:41.649316');
INSERT INTO evaluations VALUES (74, 'Todos os anos eu vou, é muito legal.', 22, 7, 5, 3, 3, 5, 5, 4, 4, '2009-11-10 16:48:56.759393', '2009-11-10 16:48:56.759393');
INSERT INTO evaluations VALUES (75, 'LINDA vista..vale a pena conferir.', 632, 7, 5, 5, 5, 5, 5, 5, 5, '2009-11-10 17:22:56.49365', '2009-11-10 17:22:56.49365');
INSERT INTO evaluations VALUES (76, 'As cores vivas das vestimentas, as fitas, as flores tudo contribui para emprestar exuberância e vivacidade para essa bonita dança. ', 60, 7, 5, 5, 5, 5, 5, 5, 5, '2009-11-10 17:42:30.362731', '2009-11-10 17:42:30.362731');
INSERT INTO evaluations VALUES (77, 'Essa é a famosa Lagoa da Cidade, onde todos os destinos se cruzam, onde todos se refrescam e se reabastecem na hora que aperta a fome ou a sede. Famoso ponto de encontro no fim de tarde.', 1673, 7, 4, 3, 4, 5, 4, 4, 4, '2009-11-10 18:44:20.799163', '2009-11-10 18:44:20.799163');
INSERT INTO evaluations VALUES (78, 'A infra-estrutura de lazer e entretenimento do Porto D''Aldeia Resort engloba ainda estádio com campo de futebol gramado, quadras de tênis , playground, salão de jogos, fitness center com sauna seca e sala de musculação, piscinas com toboáguas ', 1233, 7, 5, 4, 5, 3, 5, 4, 4, '2009-11-10 18:58:53.481106', '2009-11-10 18:58:53.481106');
INSERT INTO evaluations VALUES (79, 'Muito dificil de chegar, e a comida não recompensa.', 3906, 7, 3, 3, 3, 3, 3, 3, 3, '2009-11-10 19:04:41.511389', '2009-11-10 19:04:41.511389');
INSERT INTO evaluations VALUES (80, 'Ótima dica pra quem quer fazer um passeio com as crianças em João Pessoa, é o Parque Arruda Câmara.', 1673, 7, 4, 4, 5, 4, 5, 5, 4, '2009-11-10 19:07:07.729853', '2009-11-10 19:07:07.729853');
INSERT INTO evaluations VALUES (81, 'No salão há pouquíssimas mesas, que recebem iluminação indireta e estão distantes umas das outras. O objetivo é manter a privacidade dos clientes', 3906, 7, 4, 3, 4, 4, 3, 4, 4, '2009-11-10 19:08:34.446963', '2009-11-10 19:08:34.446963');


--
-- Data for Name: event_evaluations; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO event_evaluations VALUES (1, 6, 42);
INSERT INTO event_evaluations VALUES (2, 23, 71);
INSERT INTO event_evaluations VALUES (3, 29, 74);
INSERT INTO event_evaluations VALUES (4, 34, 75);
INSERT INTO event_evaluations VALUES (5, 35, 76);


--
-- Data for Name: event_tips; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO event_tips VALUES (1, 31, 14);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO events VALUES (5, 1049, 7, 'Olodum', '2009-11-24 23:00:00', 'Largo Tereza Batista- Pelourinho ', 30, 'Banda Olodum levará ao Largo Tereza Batista o show Bênção do Olodum, que será apresentado às terças-feiras de novembro (10, 17 e 24), com o mesmo formato dos shows apresentados nacional e internacionalmente, a banda apresentará um repertório de grandes sucessos e novas músicas, como Guia Olodum. Disponível em www.ibahia.com em 06/11/2009.


', '2009-11-06 14:20:59.080223', '2009-11-06 14:20:59.080223');
INSERT INTO events VALUES (2, 2975, 1, ' Projeto DORIVAL para sempre CAYMMI - Thais Uessugui', '2009-10-18 00:45:00', 'Clube do choro', 20, 'Thais Uessugui está na cena musical desde 1997, quando formou sua primeira banda em Brasília. Além de diversos trabalhos na cidade como cantora, locutora e atriz, fez parte das bandas FunQ, Flashblack, Bossafunk, Joy Band e BSB Disco Club. Foi backing vocal de Celso Salim, Rafael Cury e Dillo D''Araujo, participou da gravação de discos de artistas locais e dirigiu vocalmente alguns deles. Este ainda em três edições do festival Porão do Rock e do Brasil Clube, com público superior a 20 mil espectadores. 

http://www.clubedochoro.com.br/index.php?option=com_content&task=view&id=299&Itemid=1', '2009-10-15 10:40:19.893631', '2009-10-15 10:40:19.893631');
INSERT INTO events VALUES (3, 2975, 1, 'Projeto DORIVAL para sempre CAYMMI - PEPEU GOMES', '2009-10-21 23:45:00', 'Clube do choro', 20, 'Dias 21, 22 e 23 - PEPEU GOMES (Bandolim e guitarra). Participação: Jorge Gomes (bateria), André Gomes (contrabaixo)', '2009-10-15 10:44:45.160049', '2009-10-15 10:44:45.160049');
INSERT INTO events VALUES (4, 2975, 1, 'Eletro Jazz', '2009-10-26 23:00:00', 'Balaio Café -  CLN 201 , Bl. B, Lj. 19/31 - Asa Norte', 7, 'Projeto idealizado por Ted Falcon (violino), acompanhado dos músicos Moraes (violão/guitarra), Dudu Bello (baixo acústico) e Rafael dos Santos (Bateria). De: 06/10/2009 Até: 26/10/2009', '2009-10-15 10:55:43.830233', '2009-10-15 10:55:43.830233');
INSERT INTO events VALUES (6, 1233, 7, 'Barraca Subindo ao Céu', '2009-11-25 23:00:00', 'Avenida Zéze Diogo, 4930- Praia do Futuro', 0, 'Show de humor a beira mar.', '2009-11-06 18:49:52.701362', '2009-11-06 18:49:52.701362');
INSERT INTO events VALUES (26, 5042, 7, 'Jorge e Matheus & Claudia Leitte', '2009-11-16 00:00:00', 'Rodovia João Leopoldo Jacomel, 10454', 80, 'O Coritiba realiza o Show do Centenário, com a presença da bateria da Império, da dupla sertaneja Jorge e Mateus e da cantora Claudia Leitte, no Expotrade, em Pinhais.


O evento terá ainda uma parceria especial com a principal casa de shows sertaneja de Curitiba, “Wood´s Bar”, possibilitando a apresentação das duplas da casa: “Henrique e Diego” e “Eddy e Gil”.
', '2009-11-09 19:54:47.586031', '2009-11-09 19:54:47.586031');
INSERT INTO events VALUES (27, 5042, 7, 'Tihuana', '2009-11-12 00:00:00', 'Bispo Dom José, 2160 -', 30, 'Uma década de vida, seis discos, um dvd, disco de ouro e turnês pela Europa, Japão e Estados Unidos. Essas são as credencias da banda paulistana Tihuana que desembarca em Curitiba. O quinteto traz para a cidade o show do cd/dvd “Tropa de Elite Ao Vivo”.

Para dar uma geral na década de estrada, a banda formada por Egypcio (vocais), Román (baixo), Paulo “PG” Guilherme (bateria), Baía (percussão) e Léo (guitarras) contou com convidados especiais, vindos de diferentes praias musicais. O resultado é uma fusão de rock, rap, reggae e sons latinos - ritmos que caracterizam o Tihuana.
', '2009-11-09 19:56:31.973572', '2009-11-09 19:56:31.973572');
INSERT INTO events VALUES (28, 5042, 7, 'Monobloco - Curitiba é Show', '2009-11-15 00:00:00', 'Curitiba Master Hall', 40, 'O projeto "Curitiba é Show" traz à capital paranaense o grupo Monobloco, consagrado por incorporar diversos estilos musicais à batida do samba.  
', '2009-11-09 19:58:43.875252', '2009-11-09 19:58:43.875252');
INSERT INTO events VALUES (30, 22, 7, 'Festa do tratado de Petrópolis', '2009-11-17 16:00:00', 'Prefeitura Municipal-Centro', 5, 'Rio-Branco estabeleceu dois frontes para evitar o choque militar com a Bolívia. Num deles arregimentou o apoio da Casa Rothschild, de Londres, instituição financeira de históricas ligações com o Brasil, para que os banqueiros intermediassem um acordo com o Bolivian Syndicate de Nova York. Operação bem-sucedida, pois os norte-americanos aceitaram uma compensação de 110 mil libras esterlinas para desistir do negócio, o que enfraqueceu o lado do governo de La Paz. Em homenagem se criou a festa.', '2009-11-10 16:52:28.583845', '2009-11-10 16:52:28.583845');
INSERT INTO events VALUES (31, 22, 7, '4ª Semana da Diversidade e 4ª Parada do Orgulho LGBT  ', '2009-11-14 15:00:00', 'Centro da cidade', 0, 'A semana acontece do dia 9 a 14, com eventos artisticos-culturais no calçadão da Gameleira e na área de eventos do Arena da Floresta. Programação diversificada com a banda Tecno Montage e Ângela Ro Ro, palestras sobre saúde, direitos humanos e cultura LGBT. Dia 14 a comemoração é da 4ª Parada do Orgulho LGBT, com trios elétricos enfeitados, balões nas cores do arco-íris e show das Frenéticas e DJ Patife. 

', '2009-11-10 16:59:05.76089', '2009-11-10 17:00:58.373998');
INSERT INTO events VALUES (13, 2728, 7, 'Advocacia Segundo os Irmãos Marx', '2009-11-08 22:00:00', 'Palácio Popular da Cultura ', 70, 'Heloisa Périssé, Wilson Santos, Robson Nunes, Alex Moreno, Flavio Baiocci e Alexandre Pinheiro dividem o palco na comédia Advocacia (Segundo os Irmãos Marx), sob direção de João Fonseca e texto Bernardo Jablonski. 

São seis esquetes baseados em textos dos Irmãos Marx, o quarteto mais louco do cinema. A comédia conta as hilárias situações vividas por Yasmim Robalo, uma advogada incompetente e corrupta, interpretada pela atriz Heloísa Perissé. Na comédia mais de 32 personagens, femininos e masculinos, são divididos entre os 5 atores que compõem o elenco.


', '2009-11-08 13:39:55.97132', '2009-11-08 13:41:22.002371');
INSERT INTO events VALUES (14, 2728, 7, 'Show Jota Quest ', '2009-11-14 01:00:00', 'Estacionamento UNIDERP', 50, 'Show Jota Quest 

Camarote Open Bar
Cerveja . Refrigerante . Água


', '2009-11-08 13:48:10.532073', '2009-11-08 13:48:10.532073');
INSERT INTO events VALUES (15, 2728, 7, 'show de Elba Ramalho e Zézinho do Forró', '2009-11-08 22:30:00', 'Parque da Nações Indígenas', 0, 'O projeto MS Canta Brasil já virou ponto de encontro de quem gosta ou quer conhecer a música brasileira. É um projeto da Fundação de Cultura de Mato Grosso do Sul (FCMS) que traz, com entrada franca, apresentações mensais ao Parque das Nações Indígenas. E para o mês (novembro/2009), trará como atrações a cantora Elba Ramalho e Zézinho do Forró.
', '2009-11-08 13:51:06.288614', '2009-11-08 13:51:06.288614');
INSERT INTO events VALUES (32, 632, 7, 'Macéio Fest', '2009-12-10 22:00:00', 'Centro da cidade', 10, 'Carnaval fora de época com trios elétricos.
', '2009-11-10 17:16:07.98786', '2009-11-10 17:16:07.98786');
INSERT INTO events VALUES (17, 2728, 7, 'Projeto Brasil Cinemark', '2009-11-09 19:00:00', ' Cinemark Shopping Campo Grande', 2, 'O projeto comemora 10 anos. E você poderá assistir filmes nacionais lançados entre novembro de 2008 e outubro de 2009 por apenas R$2,00.', '2009-11-08 14:14:35.408443', '2009-11-08 14:14:35.408443');
INSERT INTO events VALUES (33, 632, 7, 'Natal', '2009-12-25 02:00:00', 'Centro da cidade', 0, 'A cidade se enfeita com luzes e ocorrem apresentações folclóricas nas ruas, como Pastoris, Reisados, Cheganças, Guerreiros e Maracatus.
', '2009-11-10 17:18:39.71281', '2009-11-10 17:18:39.71281');
INSERT INTO events VALUES (34, 632, 7, 'Reveillon', '2010-01-01 01:00:00', 'centro ', 0, 'A passagem do ano apresenta fogos de artifícios descendo em cascatas pelos edifícios e gente nas praias principalmente em Ponta Verde.', '2009-11-10 17:20:57.763031', '2009-11-10 17:20:57.763031');
INSERT INTO events VALUES (35, 60, 7, 'Marabaixo', '2009-12-10 22:30:00', 'Igreja São Benedito', 20, 'Dança folclórica de origem africana na Vila de Curiaú.', '2009-11-10 17:39:35.161993', '2009-11-10 17:39:35.161993');
INSERT INTO events VALUES (10, 2650, 7, 'Festival Dekebra ', '2009-11-21 18:00:00', 'Parque Aquático da UFMT ', 20, '15:00 - Reunião de b.boys, dançarinos, coreógrafos, profissionais da dança de rua, militantes da cultura Hip Hop de todo o Brasil para participarem da Batalha de Break dance; 
16:00 - Encontro de Dançarinos e Profissionais da Dança; 
17:00 - Encontro de Rebolation; 
19:00 - Batalha de B.boys intercalado com a Mostra Não Competitiva de Dança de Rua; 
23:00 - Pocket Shows – Grupos de Rap; 
00:00 - Show Nacional – Quelinah, MC Cabal e DJ MK e Garcia Gam; 
02:00 - Djs de Black Music
Informações:(65) 3025-3115 / 9978-3211 

 


', '2009-11-06 21:55:51.263017', '2009-11-08 16:02:53.779491');
INSERT INTO events VALUES (9, 2650, 7, 'Show de Percussão Instituto Mandala ', '2009-11-20 20:00:00', 'Largo da Igreja São Benedito ', 15, 'Ritmo dos Tambores - Show de Percussão Instituto Mandala 
Dia:20/11 – horário: 18:00 
Realização: Instituto Mandala, Coletivo de Hip Hop- Maloca, Terra do Sol Empreendimentos Culturais e Gaepac Pró-yby / Apoio Cultural Secretaria de Estado de Cultura 
Informações: (65) 3025-3115 / 9978-3211 

', '2009-11-06 21:50:33.131167', '2009-11-08 16:03:40.010788');
INSERT INTO events VALUES (12, 2650, 7, 'exposição Poptic de Robinson Machado', '2009-11-12 21:31:00', 'Av Getúlio Vargas, 247 – Centro, Cuiabá ', 10, 'A Galeria de Artes Visuais da Secretaria de Estado da Cultura receberá, entre 12 e 27 de novembro, a exposição Poptic, do artista plástico paulistano Robinson Machado. A exposição foi contemplada em março de 2009 pelo edital do Programa de Intercâmbio e Difusão Cultural 2009. A iniciativa tem o objetivo de valorizar as artes visuais e promover o acesso do público a diversas experimentações do gênero, incluindo desenho, pintura, fotografia, escultura e outros. 

', '2009-11-06 22:24:28.976087', '2009-11-08 16:04:18.002744');
INSERT INTO events VALUES (11, 2650, 7, '“A Hora da Sesta: Cultura na Tela”', '2009-11-09 13:30:00', 'Auditório do Palácio da Instrução', 5, 'Aproveite seu horário de almoço e venha se divertir e conhecer a produção audiovisual nacional. A Secretaria de Estado de Cultura em parceria com o programa de exibição e catalogação de curta metragens “Porta Curtas” desenvolvido pela Petrobrás exibe filmes regionais e nacionais na hora da sesta. 
De segunda a sexta-feira em duas sessões, das 11h30 as 12h30 e das 12h30 as 13h30 
Confira o “cardápio” do mês de Outubro/2009: 

19/10 
Dadá 
Ficção 
Eduardo Vaisman 

Belmonte 
Documentário 
Ivo Branco 
20/10 
Dalmar e Rosália 
Ficção 
Bel Bechara 

A invenção da Infancia 
Documentário 
Liliana Sulzbach 
', '2009-11-06 22:04:11.620415', '2009-11-08 16:05:05.218828');
INSERT INTO events VALUES (8, 2650, 7, 'Oficinas', '2009-11-08 10:00:00', 'Avenida Historiador Rubens de Mendonça CPA', 15, 'Oficina de Capoeira/Berimbau no Palácio da Instrução 
Dia: 06/11 – horário: 8:00 as 12:00 / 14:00 as 18:00 
Realização: Secretaria de Estado de Cultura 
Informações: (65) 3613-9233 

', '2009-11-06 21:45:46.575439', '2009-11-08 16:06:14.979593');
INSERT INTO events VALUES (16, 2728, 7, 'Temporada de Exposições 2009', '2009-11-15 16:00:00', '(Rua Antônio Maria Coelho, 6000)', 10, 'Serão apresentadas quatro mostras: A Arte de Colecionar-te (A arte pelos olhos de um colecionador), Simples Apego, Estima ao Acaso, além de obras contempladas pelo museu através do Prêmio Marcantonio Vilaça.

Nesta nova temporada de exposições, o Marco abre espaço para que a população tenha acesso a uma mostra com obras de artistas regionais, nacionais e internacionais consagrados.

', '2009-11-08 14:10:55.68478', '2009-11-08 16:07:55.974665');
INSERT INTO events VALUES (18, 3828, 7, 'Show com Maria Bethânia', '2009-11-18 23:00:00', 'Grande Teatro do Palácio das Artes', 160, 'Com mais de 40 discos lançados ao longo da sua carreira, a artista é reconhecida dentro e fora do Brasil como uma das principais cantoras da MPB. 
Maria Bethânia, irmã mais nova de Caetano Veloso, queria ser atriz e acabou criando uma maneira peculiar de se apresentar, misturando música, poesia e teatro.

', '2009-11-08 20:00:59.500444', '2009-11-08 20:02:25.678206');
INSERT INTO events VALUES (19, 3828, 7, 'Show com Exaltasamba', '2009-11-14 01:00:00', 'Chevrolet Hall', 50, 'Os pagodeiros do Exaltasamba trazem para o palco o Chevrolet Hall, os sucessos que marcaram a carreira do "Exalta", como Eu me apaixonei pela a pessoa errada, Desliga e Vem e Telegrama. Não faltarão também as novas músicas de trabalho do grupo, como Acaba Tudo Bem, Estrela e o hino dos solteiros, Livre pra Voar. 

Formado por Péricles (banjo e vocal), Pinha (repique de mão), Thiaguinho (banjo e vocal), Brilhantina (cavaco) e Thell (tantã), o Exaltasamba Já lançou mais de dez CD`s, entre trabalhos inéditos e compilações dos grandes sucessos ao vivo. 

', '2009-11-08 20:04:25.412122', '2009-11-08 20:04:25.412122');
INSERT INTO events VALUES (20, 3828, 7, 'Show com a Banda Cheiro de Amor', '2009-11-22 00:00:00', 'Chevrolet Hall', 40, 'O novo trabalho do Cheiro de Amor já superou a marca de vinte e cinco mil cópias vendidas.No Carnaval de 2009, Alinne Rosa encantou a avenida com três temas de conscientização que incluíram a luta contra a AIDS, reciclagem e câncer de mama. Tudo isso, embalado pelos maiores sucessos do grupo e os hits que fazem sucesso em todo o Brasil no momento.', '2009-11-08 20:07:34.520691', '2009-11-08 20:07:47.908692');
INSERT INTO events VALUES (21, 3828, 7, 'Festival do Camarão', '2009-11-22 22:00:00', 'Shopping Del Rey', 24.899999999999999, 'O restaurante O Barco já deu início à 6ª edição do seu Festival do Camarão. Quem passar pelo restaurante poderá experimentar petiscos e pratos à base do crustáceo. 

A idéia do Festival, segundo uma das sócias do restaurante, Cleusa Silva, é oferecer sempre novidades no cardápio. “Inovamos constantemente, de acordo com o período do ano, para que nossos clientes possam experimentar pratos diferentes. No caso do camarão, que já é uma especialidade da casa, buscamos aumentar o leque de opções em petiscos e pratos”. 

Além da variedade, outros destaques do Festival do Camarão são os preços atraentes, a qualidade dos produtos, sempre frescos, e o cuidado na elaboração dos pratos. 
', '2009-11-08 20:10:52.122819', '2009-11-08 20:10:52.122819');
INSERT INTO events VALUES (22, 3828, 7, 'Peça Os Impostores', '2009-11-29 23:00:00', 'Teatro da Biblioteca Estadual Luiz de Bessa', 20, 'Quanto vale a sua masculinidade? Para receber uma herança, dois primos precisam passar por cima de seus preconceitos para convencer a todos de que são gays. Com muito bom humor e planos fracassados, esses machões convictos vão se atrapalhar tentando esconder que gostam mesmo é de futebol e de mulher ', '2009-11-08 20:12:48.269004', '2009-11-08 20:12:48.269004');
INSERT INTO events VALUES (23, 2975, 8, 'Funfarra', '2009-11-11 00:00:00', 'Parque da Cidade', 0, 'Nao to com saco de escrever', '2009-11-09 19:39:14.805315', '2009-11-09 19:39:14.805315');
INSERT INTO events VALUES (24, 5042, 7, 'Gafieira de Primeira só na Segunda!', '2009-11-09 22:00:00', 'Avenida Iguaçu, 2300', 15, 'O projeto Gafieira de Primeira só na Segunda! tem apresentação do grupo Samba na Surdina, que tocará os sucessos de artistas como Cartola, Dorival Caymmi, Nelson Cavaquinho, Noel Rosa e Zé Kéti. A partir das 19h, dançarinos contratados vão estimular o público a dançar, ensinando os primeiros passos da gafieira', '2009-11-09 19:46:37.102096', '2009-11-09 19:46:37.102096');
INSERT INTO events VALUES (25, 5042, 7, 'LupaLuna 2009', '2009-11-21 19:30:00', 'Avenida Senador Salgado Filho, 7636 ', 50, 'Sua programação musical reúne em três palcos renomados artistas nacionais e internacionais, colocando Curitiba no mapa dos grandes festivais. 


Com uma escalação diversificada, que reúne artistas nacionais, estrangeiros e locais dos mais variados estilos musicais, o Lupaluna terá mais de 40 atrações na edição deste ano

DATA: 21de Novembro, Sábado


Palco LunaStage
Jason Mraz (EUA)
O Rappa
Jorge Ben Jor
Armandinho
Marcelo D2
NX Zero
Strike


Palco EcoMusic
Cordel do Fogo Encantado
Móveis Coloniais de Acaju
Mallu Magalhães
Cobacabana Club
Mixtape
Fuja Lurdes
Karime Hass
Cambalacho
', '2009-11-09 19:52:21.978021', '2009-11-09 19:52:21.978021');
INSERT INTO events VALUES (29, 22, 7, 'Aniversário da Cidade', '2009-12-28 20:30:00', 'Localização: Prefeitura Municipal, na Rua Rui Barbosa, Centro.', 0, 'Aniversário da cidade com ótimas atrações, para todos os públicos.', '2009-11-10 16:44:38.935391', '2009-11-10 16:44:38.935391');
INSERT INTO events VALUES (36, 22, 7, 'Show “O Mundo de Cartola” ', '2009-11-15 21:00:00', 'Biblioteca da Floresta', 15, 'No palco, Luthiene Bittencourt no vocal, Ana Fontenele no cavaquinho, Theo Moreira e Ciro Quintanna nos violões e João Gabriel Brito na percussão, com a produção e apresentação de Marcelo Brum.Com apoio da Lei Municipal de Incentivo à Cultura, músicos acreanos se reúnem para promover uma homenagem a este grande compositor brasileiro', '2009-11-10 17:48:23.79508', '2009-11-10 17:48:23.79508');
INSERT INTO events VALUES (37, 60, 7, 'Show Victor e Leo', '2009-11-26 23:00:00', 'Bom Jardim', 30, 'Dupla sertaneja, muito conhecida e admirada. ', '2009-11-10 17:53:02.716872', '2009-11-10 17:53:02.716872');
INSERT INTO events VALUES (38, 60, 7, 'Macapá Verão (Fazendinha)', '2009-12-10 22:00:00', 'balneário', 10, 'Promovido pelo Governo do Estado e pela Prefeitura, consiste na apresentação de shows com cantores regionais.Dj Mauro do Brasil, Garotos do Break, stéreo vitola, Rafael cambraia, amigos do samba, swing Brasil, clube do samba e Banda Placa
', '2009-11-10 17:58:40.44649', '2009-11-10 17:58:40.44649');
INSERT INTO events VALUES (39, 60, 7, 'Jandiá', '2009-11-12 12:00:00', 'Complexo Turístico Jandiá', 20, 'Jeferson e Cametá, DJ 8, Mec Louco, Madox, Banda Swing, Caçula do Brega, Delson Moreira e Banda e Frutos Tropicais
', '2009-11-10 18:01:54.896862', '2009-11-10 18:02:22.217648');
INSERT INTO events VALUES (40, 44, 7, 'Bagaça Manaus 2009 (forró)', '2009-11-15 23:00:00', 'Hotel Manaus summer fest', 20, 'Um dos maiores eventos direcionados para o público forrozeiro da capital amazonesne, O Bagaça Manaus 2009 promete reunir os grandes nomes do Forró local e nacional em uma maratona de muito forró e animação. ', '2009-11-10 18:06:44.024693', '2009-11-10 18:06:44.024693');
INSERT INTO events VALUES (41, 44, 7, 'Claudia Leitte', '2009-11-21 00:00:00', 'Sambódromo', 30, 'A Fabrica de Eventos completa 10 anos! E te dá um show de presente! Dia 20, no Sambódromo...Chega a Manaus o maior fenômeno baiano trazendo um show inédito de cores, energia e muito axé.Claudia Leitte.', '2009-11-10 18:09:02.636141', '2009-11-10 18:09:02.636141');
INSERT INTO events VALUES (42, 44, 7, 'Manaus Summer Fest 2009', '2009-11-27 22:00:00', 'Tropical Hotel Manaus Summer Fest', 40, 'Um Festival de Ritmos em uma unica sintonia, 8 atraçoes 2 dias de festa, 27 e 28 de novembro no pier do Tropical Hotel Manaus Summer Fest.', '2009-11-10 18:12:58.99509', '2009-11-10 18:12:58.99509');
INSERT INTO events VALUES (43, 1049, 7, 'BATE VOLTA EXPRESSO TDB - EVANAVE 2009', '2009-12-12 17:00:00', 'Espaço Praia do Forte/BA', 100, 'Atrações:
EVA, Afrodisiaco e Chica Fé.Pista:
Meia: R$50,00
Inteira: R$100,00
Camarote Feminino:
Meia: R$75,00
Inteira: R$150,00
Camarote Masculino:
Meia: R$90,00
Inteira: R$180,00
Censura:
16 anos/


Reuna 07 amigos, e ganhe o seu Bate Volta!!! - Válido para compras no Balcão do Shp Liberdade

* Onibus Executivo com sanitário, ar condicionado
* Coordenador de Grupo
* Serviço de Bordo ( na Ida ): CERVEJA,REFRI, ÁGUA, e PETISCOS
* Cobertura Fotograica na Viagem;
* Pulseira de Identificação
* CANECA DE CHOPP
* Sorteio de Ingressos, Cd`s e Dvd`s
', '2009-11-10 18:21:55.831844', '2009-11-10 18:21:55.831844');
INSERT INTO events VALUES (44, 1049, 7, 'REVEILLON NAS ÁGUAS MÁGICAS - 2010', '2010-01-01 00:00:00', 'Ponta de Humaitá', 230, 'Roteiro: Passeio para contemplar a beleza da Ponta de Humaitá, Ribeira e Farol da Barra

Estamos realizando pelo 2º ano, o Reveillon no Mar. O Reveillon Aguas Mágicas 2010, um Reveillon cheio de vibrações positivas e alegria no Mar da Baía de Todos os Santos, este ano, a bordo de uma escuna maior, e com melhor estrutura para 115 pessoas, devidamente credenciada e vistoriada pela Capitania dos Portos, confortável e segura, num ambiente decorado tematicamente., com Voz e Violão até 00:00, e depois DJ, Bebidas, Buffet Tropical para assistir na virada do ano, a queima de fogos no Farol da Barra
', '2009-11-10 18:25:44.028359', '2009-11-10 18:25:44.028359');
INSERT INTO events VALUES (45, 1049, 7, 'REVEILLON EM ITACARÉ', '2009-12-31 22:00:00', 'Cabana Corais', 50, 'VIRADA NA CABANA CORAIS, parceria, Super Praia
3 ambientes...
A virada com as bandas DIAMBA, SAMBA ROLL + bandas no palco principal, tenda de eletrônico com dj''s,
tenda de forró (com bandas regionais), queima de fogos e apresentação de malabares.
', '2009-11-10 18:27:54.924036', '2009-11-10 18:27:54.924036');
INSERT INTO events VALUES (49, 1233, 7, 'Anos Dourados', '2009-11-12 00:00:00', 'Av. Santos Dumont, 6061 ', 20, 'Confira nesta terça-feira show de flashback com a banda "Os Brasas". A banda canta sucessos dos anos 60 e 70.

O repertório é diversificado, promessa de músicas de ótima qualidade.

Confira!', '2009-11-10 18:40:21.987801', '2009-11-10 18:40:21.987801');
INSERT INTO events VALUES (50, 1233, 7, 'Chá de Panela da Babalu Show ', '2009-11-11 23:00:00', 'Av. Beira Mar, 3221', 15, 'O Beira Mar Grill traz, nesta terça e quarta, um show especial com Biba, Augusto Bonequeiro, Lailtinho, Ery Soares, Carimã, Paçoca e Fubá e Caboré. Confira, a partir das 21h', '2009-11-10 18:41:57.39008', '2009-11-10 18:41:57.39008');
INSERT INTO events VALUES (51, 1233, 7, 'Terça Hits', '2009-11-10 22:30:00', 'Av. Jovita Feitosa, 170 - Parque Araxá', 5, ' Hits Brasil já é conhecido da galera. O público desfruta em um mesmo ambiente de restaurante, pizzaria e music bar.

Com uma programação variada de segunda a domingo, a casa traz muita música ao vivo e pratos variados para os clientes.

Nesta terça-feira a galera pode conferir um delicioso cardápio e assistir ao show da cantora Débora Lima e Banda, que se apresentam a partir das 20h30. Não perca!', '2009-11-10 18:43:43.778142', '2009-11-10 18:43:43.778142');
INSERT INTO events VALUES (52, 3906, 7, 'Prazer e cia.', '2009-12-15 20:00:00', 'Spírito Jazz', 0, 'A 3ª edição do Prêmio Prazer&Cia pretende facilitar a vida de capixabas e turistas na hora de escolher onde comer bem, incentivar o turismo, melhorar o nível do serviço dos estabelecimentos, além de divulgar a cultura local e valorizar os profissionais do segmento. Os restaurantes serão avaliados nos critérios: qualidade da comida, serviço, ambiente e custo benefício.
A lista de pré-selecionados será elaborada pelos jurados da edição 2008 do Prêmio. Ao final, um júri composto por 10 pessoas - todas com reconhecida competência técnica e profissional e que apreciam a arte da boa mesa - escolherá o restaurante premium nas 21 categorias. O júri permanecerá incógnito até o fim da votação. Seus nomes e respectivos votos serão revelados no dia da premiação e na publicação especial. O resultado do Prêmio será divulgado na revista especial Prêmio Prazer&Cia.', '2009-11-10 19:31:12.752477', '2009-11-10 19:31:12.752477');
INSERT INTO events VALUES (53, 3906, 7, 'Aniversário da dupla Nando e Michel', '2009-11-12 00:30:00', 'Casa Clube', 25, 'A partir das 22h30.
Couvert para sócios:R$ 15,00 feminino ou R$ 20,00 consumação e R$ 20,00 masculino ou R$ 30 consumação.
Couvert para não Sócios: R$ 25,00 feminino ou R$ 30 consumação e R$ 40,00 masculino ou R$ 50,00 consumação.', '2009-11-10 19:33:57.349639', '2009-11-10 19:33:57.349639');
INSERT INTO events VALUES (54, 3906, 7, 'Banda Máfia', '2009-11-13 00:30:00', 'Casa Clube', 25, 'A partir das 22h30.
Couvert para sócios:R$ 15,00 feminino ou R$ 20,00 consumação e R$ 20,00 masculino ou R$ 30 consumação.
Couvert para não Sócios: R$ 25,00 feminino ou R$ 30 consumação e R$ 40,00 masculino ou R$ 50,00 consumação.', '2009-11-10 19:35:28.493643', '2009-11-10 19:36:00.659777');
INSERT INTO events VALUES (55, 3906, 7, 'Banda 027', '2009-11-14 00:30:00', 'Casa Clube', 25, 'Com banda 027 e DJ Marcinho.
A partir das 22h30.
Couvert para sócios:R$ 15,00 feminino ou R$ 20,00 consumação e R$ 20,00 masculino ou R$ 30 consumação.
Couvert para não Sócios: R$ 25,00 feminino ou R$ 30 consumação e R$ 40,00 masculino ou R$ 50,00 consumação.', '2009-11-10 19:39:11.512945', '2009-11-10 19:39:11.512945');


--
-- Data for Name: programs; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO programs VALUES (1, '2009-11-10', 20, 'Comprar chocolate na praça', 3, NULL, NULL, '2009-11-01 16:07:00.42209', '2009-11-01 16:07:00.42209');


--
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO regions VALUES (1, 1, 'NORTE');
INSERT INTO regions VALUES (2, 1, 'NORDESTE');
INSERT INTO regions VALUES (3, 1, 'CENTRO-OESTE');
INSERT INTO regions VALUES (4, 1, 'SUDESTE');
INSERT INTO regions VALUES (5, 1, 'SUL');


--
-- Data for Name: roadmaps; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO roadmaps VALUES (2, 'TItulo', 'descricao', true, 2975, 3, '2009-10-22 10:32:41.107911', '2009-10-22 10:32:41.107911');
INSERT INTO roadmaps VALUES (3, 'Viagem ao pará', 'Visita aos parentes da Marcela', true, 2975, 2, '2009-11-01 16:05:22.43058', '2009-11-01 16:05:22.43058');


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO roles VALUES (1, 'admin');
INSERT INTO roles VALUES (2, 'user');


--
-- Data for Name: roles_users; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO roles_users VALUES (2, 1);
INSERT INTO roles_users VALUES (2, 2);
INSERT INTO roles_users VALUES (2, 3);
INSERT INTO roles_users VALUES (2, 4);
INSERT INTO roles_users VALUES (2, 5);
INSERT INTO roles_users VALUES (2, 6);
INSERT INTO roles_users VALUES (2, 7);
INSERT INTO roles_users VALUES (2, 8);
INSERT INTO roles_users VALUES (2, 9);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO schema_migrations VALUES ('20090910101755');
INSERT INTO schema_migrations VALUES ('20090629111431');
INSERT INTO schema_migrations VALUES ('20090630193451');
INSERT INTO schema_migrations VALUES ('20090630193921');
INSERT INTO schema_migrations VALUES ('20090630194030');
INSERT INTO schema_migrations VALUES ('20090630194117');
INSERT INTO schema_migrations VALUES ('20090703115627');
INSERT INTO schema_migrations VALUES ('20090703120728');
INSERT INTO schema_migrations VALUES ('20090706231827');
INSERT INTO schema_migrations VALUES ('20090728122326');
INSERT INTO schema_migrations VALUES ('20090729133746');
INSERT INTO schema_migrations VALUES ('20090806120814');
INSERT INTO schema_migrations VALUES ('20090812132355');
INSERT INTO schema_migrations VALUES ('20090812132751');
INSERT INTO schema_migrations VALUES ('20090812134912');
INSERT INTO schema_migrations VALUES ('20090813124330');
INSERT INTO schema_migrations VALUES ('20090827123427');
INSERT INTO schema_migrations VALUES ('20090828000109');
INSERT INTO schema_migrations VALUES ('20090829183415');
INSERT INTO schema_migrations VALUES ('20090830135214');
INSERT INTO schema_migrations VALUES ('20090902115908');
INSERT INTO schema_migrations VALUES ('20090902121037');
INSERT INTO schema_migrations VALUES ('20090909125937');


--
-- Data for Name: shop_evaluations; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO shop_evaluations VALUES (1, 9, 10);
INSERT INTO shop_evaluations VALUES (2, 18, 13);
INSERT INTO shop_evaluations VALUES (3, 19, 14);
INSERT INTO shop_evaluations VALUES (8, 31, 25);
INSERT INTO shop_evaluations VALUES (5, 25, 22);
INSERT INTO shop_evaluations VALUES (6, 26, 23);
INSERT INTO shop_evaluations VALUES (7, 30, 24);
INSERT INTO shop_evaluations VALUES (9, 32, 26);
INSERT INTO shop_evaluations VALUES (10, 33, 30);
INSERT INTO shop_evaluations VALUES (11, 34, 31);
INSERT INTO shop_evaluations VALUES (12, 42, 35);
INSERT INTO shop_evaluations VALUES (19, 71, 65);
INSERT INTO shop_evaluations VALUES (20, 77, 78);
INSERT INTO shop_evaluations VALUES (21, 78, 79);
INSERT INTO shop_evaluations VALUES (16, 43, 39);
INSERT INTO shop_evaluations VALUES (17, 44, 40);
INSERT INTO shop_evaluations VALUES (18, 46, 41);
INSERT INTO shop_evaluations VALUES (22, 79, 81);


--
-- Data for Name: shop_tips; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO shop_tips VALUES (1, 41, 7);
INSERT INTO shop_tips VALUES (2, 79, 15);


--
-- Data for Name: shops; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO shops VALUES (76, 'Parque Aquático C.C. Águas de Valverde', 'Estrada do Marmeleiro Km 3,5', '(41) 3657-5238', '', NULL, '', 'Ao lado de Curitiba e junto à natureza.
Aberto de Quarta a Domingo.
Piscinas com toboaguas 
churrasqueira coberta para 300 pessoas 
60 churrasqueiras individuais externas 
Salão de festas com cozinha industrial', '', 'lazer,clube,salão,etc.', 1, 5042, 7, NULL, '2009-11-09 19:40:15.053277', '2009-11-09 19:40:15.417537');
INSERT INTO shops VALUES (5, 'Meliá Brasília', 'Setor Hoteleiro Sul - Qd.06-Conj. “A”- Bloco “D” - CEP:71316-000', '(61) 3218-4700', '(61) 3218-4705', 'melia.brasilia@solmelia.com', 'http://pt.solmelia.com/hoteis/brasil/brasilia/melia-brasil-21/home.htm', 'Em março de 2003, foi inaugurado o Meliá Brasil 21, o primeiro hotel de sua categoria no complexo Brasil XXI, estrategicamente situado no Eixo Monumental, entre a Torre de Televisão e a 50 m do City Park. Possui fácil acesso a Esplanada dos Ministérios e o Aeroporto Internacional Juscelino Kubitschek (13 km). Situado próximo a centros de lazer e entretenimento, bares, restaurantes e a apenas 50 m do Shopping Pátio Brasil.', 'Quartos

    * 334 Quartos, incluindo quarto para não-fumantes ed deficientes físicos
    * Banheiro completamente equipado
    * Ar-condicionado
    * TV a cabo / satélite
    * Telefone com acesso a Internet
    * Escrivaninha
    * Frigobar
    * Cofre de segurança
    * Serviço de quarto 24 horas
    * Check-in 12.00pm / Check-Out 12.00pm 

Serviços e instalações

    * Business Center
    * Acesso a internet de alta velocidade
    * Garagem

Pontos de interesse

    * Centro da cidade
    * Shopping Pátio Brasil
    * Parque da Cidade
    * Torre de Televisão

Restaurantes e bares

    * Restaurante Norton Grill, especializado em cozinha internacional, além de ser o melhor Grill da cidade
    * Lounge Bar Churchill, localizado no Lobby, oferece esplendidos vinhos e charutos

Lazer

    * Piscina
    * Fitness Center
    * Sauna', 'hotel', 13, 2975, 1, NULL, '2009-08-27 00:41:07.822205', '2009-11-09 21:40:07.894562');
INSERT INTO shops VALUES (41, 'Restaurante e Pizzaria Scarola', 'Rua Dez de Julho 739', '(92)32348542', '', NULL, '', 'Oferecemos serviço de self-service e a La Carte, com cardápio variado. 
Funcionamos de segunda à domingo das 11:00 às 02:00 horas.
Fornecemos refeições para empresas ( pagamento quinzenal ou mensal ).
Entregamos a domicilio.
Aceitamos cheque, cartão de crédito e ticket.
Som ao vivo todas as sextas.
A La Carte, temos os seguintes pratos: 
- Tambaqui 
- Pirarucu
- Tucunaré 
- Vários tipos de churrasco
', '', 'restaurante', 2, 44, 7, NULL, '2009-11-06 14:03:18.047858', '2009-11-06 14:04:43.348397');
INSERT INTO shops VALUES (3, 'Alvorada Hotel', 'SHS Quadra 04 Bloco A Setor Hoteleiro Sul', '(61) 2195-1122', '(61) 2195-1199', 'reservas@alvoradahotel.com.br', 'http://www.alvoradahotel.com.br/', 'A melhor vista de Brasília', '', 'hotel', 9, 2975, 1, NULL, '2009-08-27 00:36:53.06266', '2009-11-09 04:58:55.493492');
INSERT INTO shops VALUES (18, 'Matsubara Hotel', 'Av. Brigadeiro Eduardo Gomes, 1551 Lagoa da Anta - Maceió - Alagoas - Brasil', '(82)3214-3000', '3235-1660', 'matsubara@matsubarahotel.com.br', 'http://www.matsubarahotel.com.br/portugues/maceio/index.asp', 'Maceió é um paraíso tropical, cercado por belas praias e por badaladas atrações. Um lugar fantástico, digno de ser visitado por pessoas de todas as partes do mundo. O atraente impacto entre a história e a tecnologia desenham uma arquitetura sublime, retocando sua beleza natural.

No Matsubara Hotel você vai encontrar todo o conforto que um grande estabelecimento pode oferecer.O Matsubara possui apartamentos equipados com ar-condicionado, TV a cabo, cofre individual, secador de cabelos no quarto, som ambiente, telefone e frigobar. Além disso, o hotel dispõe de área de lazer, restaurantes especializados.

 
 
  
 

 
', '', 'hotel', 2, 632, 7, 30, '2009-11-04 15:33:00.236802', '2009-11-04 15:34:22.947722');
INSERT INTO shops VALUES (32, 'Hotel Rio Branco', 'Sta Inês n° 401 - Aviário  ', '(17)33426677', '', NULL, '', 'O Hotel Rio Branco foi inaugurado em 01 de setembro de 1929 pelo Sr. Santiago Billória e pela Sra. Dª Adelaide Arantes, então proprietária do estabelecimento. Na ocasião foi oferecida uma taça de espumante aos convidados presentes ao ato.

O Hotel Rio Branco, na época, dispunha de 25 quartos para solteiros, 4 para casais, sala de visitas, salão de refeições, além de outros compartimentos adequados a um hotel.

Todas as suas dependências foram mobiliadas de acordo com os padrões da época.

No mês de agosto de 1982, o Hotel Rio Branco foi adquirido pelo Sr. Romário de Freitas Borges, que prezando sempre pela manutenção dos padrões de qualidade, transformou gradativamente a parte interna do Hotel, porém, sem alterar a irretocável arquitectura do edifício.

Atualmente, o Hotel possui 45 apartamentos confortáveis para melhor atender o hóspede, que pode contar com a mesma segurança e ambiente familiar desde 1929.
', 'Café da Manhã:
Servido todos os dias, de segunda à sabado, das 6:15 às 09:30 horas da manhã. Domingo e feriados das 6:15 às 10:30 horas. Preço já incluído na diária, com mais de 30 itens preparado com todo capricho, onde você irá deliciar-se com, pães, roscas caseiras, pão de queijo, variados bolos, bolachas, queijo fresco, frios, goiabada, frutas, leite, café, chá e muito mais, tudo isso esperando por você. 

Serviços:
Recepção informatizada, serviço de lavanderia (segunda à sabado, das 7:00 às 16:00h), manobrista e estacionamento coberto, serviço de táxi, serviços de despertar, internet à disposição do hóspede e fax.
A diária se inicia às 12:00h e se encerra às 12:00h do dia seguinte. Criança até 5 anos no mesmo apartamento dos pais, não pagam.


', 'hotel', 3, 22, 7, NULL, '2009-11-05 11:08:26.610359', '2009-11-06 14:53:47.792699');
INSERT INTO shops VALUES (33, 'Encontro das Águas Hotel Fazenda', 'Estrada da Fazenda Velha (Rodovia SP-79, km 152) Tapiraí', '(15)32771140', '', NULL, 'http://www.encontrodasaguas.com.br/', 'Ele tem o endereço certo, no coração da Mata Atlântica, com quase tudo que você precisa para acabar com o stress, a correria e a poluição.Venha conferir!! Mata em estado natural, clima temperado de altitude, trilhas, corredeiras, cachoeiras, diversão e tranquilidade. Vista panorâmica para verdes montanhas. Você está junto a mais pura natureza com tudo de melhor que a nossa região pode oferecer. Um dos melhores climas do país. Um gramado delicioso proporcionando lazer e descanso. Lago para passeios de barco e pesca. restaurante, bar e salão de jogos, chalés servidos por barcos, quiosque para aperitivos a beira do lago, piscina para adultos e para crianças, cavalos para passeios pela região e prainha natural para crianças.', '', 'hotel fazenda, restaurante', 4, 44, 7, 44, '2009-11-05 15:32:12.068545', '2009-11-06 14:55:29.941703');
INSERT INTO shops VALUES (31, 'Aquarela Restaurante', 'Rua Cunha Vasconcelos, 652 - Centro  ', '(68) 3612 3691', '', NULL, '', 'Restaurante campeão no concurso de culinária 2007!!! Self Service, pratos regionais, churrascos variados, refrigerantes, sucos, cerveja e sobremesa.Aqui você é muito bem atendido. Ar-condicionado, churascaria, self-service, comida regional, marmitex, ambiente familiar, abrimos todos os dias para almoço. ', '', 'restaurante', 4, 22, 7, NULL, '2009-11-05 11:00:13.38581', '2009-11-06 15:22:43.156816');
INSERT INTO shops VALUES (9, 'Churrascaria Hotel Triângulo', 'RUA FLORIANO PEIXOTO, 727 ', '', '', NULL, 'http://www.portaldehospedagem.com.br/seusite.asp?id=126', 'Localizado no centro da cidade situa-se em local super tranquilo e familiar. Para maior comodidade dos hospédes são oferecidos serviços de lavanderia, estacionamento gratuito e, churrascaria(sistema rodizio e self-service por Kg).', 'Entrada: 12:00hs
/Saída:    12:00hs



Nã possui chalés. 
Diárias a partir de:
 Casal - R$ 100,00
Solteiro - R$ 60,00 
Idiomas:
 Espanhol
Serviços: Estacionamento, Internet com Banda Larga, Lavanderia, Recepção 24 horas, Serviço de despertar ', 'hotel, churrascaria', 7, 22, 7, NULL, '2009-11-03 19:41:18.656062', '2009-11-04 13:57:03.995603');
INSERT INTO shops VALUES (59, 'Água Doce Cachaçaria', 'Rua José Antonio 194 - Campo Grande', '67 3321-6978', '', NULL, 'http://www.aguadoce.com.br ', 'A Água Doce, a maior rede de cachaçarias do mundo.Água Doce Cachaçaria possui um cardápio com mais de 600 opções, entre as quais 150 coquetéis com vinho e cachaça natural, além de cervejas, vodkas, whiskys e uma enorme variedade de sucos naturais, e 150 tipos de batidas de frutas naturais. Soma-se a este cardápio uma vasta coleção com mais de 150 variedades de "cachaças" artesanais produzidas no Brasil. ', '', 'Bares, restaurantes, clubes ', 1, 2728, 7, NULL, '2009-11-08 13:05:04.434506', '2009-11-08 13:05:04.694819');
INSERT INTO shops VALUES (25, 'Macapa Hotel', 'Av Eng Francisco Azarias Neto, 17', '(96)32171350', '', NULL, 'www.macapahotel.com.br', 'Na recepção, eficiência, simpatia e calor humano. No apartamento, muito conforto. 

Comidas típicas regionais, frutas com formas, cores e sabores únicos: descubra a Região Norte através da gastronomia, no bar e restaurante abertos das 6 às 24 horas. 

Aqui, o lazer é o que não falta. Descubra a região e se encante com os igarapés, as cachoeiras, a região dos lagos e a pororoca, à beira do rio Amazonas. Nós facilitamos o seu passeio.
', '', 'hotel', 4, 60, 7, NULL, '2009-11-04 17:37:07.486302', '2009-11-04 17:38:55.842983');
INSERT INTO shops VALUES (60, 'Mercearia Bar', ' Rua 15 de Novembro 1064, Centro', '67 33849622 ', '', NULL, '', 'O Mercearia tem um clima boêmio, daqueles botecos antigos onde os tiozinhos iam ver futebol. A decoração é toda no estilo, com camisas de vários times penduradas pelo bar.O cardápio de cervejas é variado. ', '', 'Bares e Restaurantes ', 1, 2728, 7, NULL, '2009-11-08 13:11:19.526814', '2009-11-08 13:11:19.73093');
INSERT INTO shops VALUES (61, 'Santo Mé', 'Av. Afonso Pena 3883, Bairro São Gabriel', '(67) 3321-9316', '', NULL, '', 'Este bar se diferencia pela música ao vivo. Tem um espaço interno, mais quieto pra quem quer conversar, e um externo, mais perto da música, pra quem quer curtir mais o som.', 'O couvert é meio salgado (uns 7 reais por pessoa), mas vale a pena.
cervejas e fritas para duas pessoas, com couvert e serviço custa em média 44 reais.', 'bar, cerveja, música ao vivo, chopp', 1, 2728, 7, NULL, '2009-11-08 13:15:47.622644', '2009-11-08 13:15:47.970493');
INSERT INTO shops VALUES (2, 'Alvimar Hotel', 'Quadra Central Bloco 5 (Comércio) QD. Central Bloco 05 - Sobradinho', '(61) 3591-3040', '(61) 3591-3040', 'alvimarhotel@globo.com', 'http://www.alvimarhotel.com.br', 'Preferido por todos aqueles que gostam de conforto, bom gosto e economia, seja a passeio ou a negócio.Inaugurado em 1979, é fruto empreendedor dos pioneiros de Sobradinho que se instalaram e acreditaram nesta cidade. Edifício com 3.780 metros dividido em 03 pavimentos acomoda 70 apartamentos, sala para eventos comerciais e academia de fitness.Recepção com funcionários qualificados e atenciosos, aliados a um sistema informatizado garantem um atendimento rápido e cordial.', '', 'hotel', 11, 2975, 1, NULL, '2009-08-27 00:35:47.321706', '2009-11-09 05:35:52.266922');
INSERT INTO shops VALUES (1, 'Academia de Tênis e Resort', 'SCES Trecho 04 Conj. 05 Lote 1-B Setor de Clubes Esportivos Sul', '(61) 3316-6161', '', NULL, 'http://www.academiaresort.com.br/', 'O Hotel Academia de Tênis Resort conta com amplas acomodações, tranqüilidade, conforto e serviços disponíveis nos mais finos hotéis do país. Com 226 apartamentos divididos em cinco padrões de acomodações diferentes, você pode optar pela tranqüilidade dos chalés, pela traquilidadde com as 21 quadras de tênis do clube, ou pela paisagem do Lago Paranoá. O hotel também tem vista para endereços dos mais importantes da Capital Federal, os Palácios da Alvorada e do Jaburu, residências oficiais do presidente e vice-presidente da República, respectivamente.', '', 'hotel, academia, lazer, saude, eventos, tenis', 10, 2975, 1, NULL, '2009-08-27 00:32:37.980506', '2009-11-09 05:55:53.774986');
INSERT INTO shops VALUES (4, 'Bay Park', 'SHTN trecho 02 lote 05 Setor de Clubes Esportivos Norte', '(61) 3037-3000', '(61) 3306-3000', 'baypark@baypark.com.br', 'http://www.baypark.com.br/', 'É um parque aquático e um resort hotel. O parque aquático, nesta área, conta com piscina de ondas, toboáguas e lanchonete.', '', 'hotel, resort, parque, parque aquatico, piscina', 16, 2975, 1, NULL, '2009-08-27 00:39:35.76565', '2009-11-09 21:39:11.260253');
INSERT INTO shops VALUES (62, 'Buriti Suíte Hotel', 'R. Antônio Maria Coelho, 2301 - Centro', '67 3321-2211‎', '', NULL, '', 'O Harbor Self Buriti Hotel está localizado na cidade de Campo Grande, na região nobre da capital, em frente ao Hipermercado 24h e próximo dos principais centros de eventos da Cidade. O restaurante tem capacidade para até 150 pessoas e está aberto para café da manhã, almoço e jantar. Ambiente confortável e acolhedor com ar-condicionado. ara completar o sucesso de seu evento, o Harbor Self Buriti Suítes Hotel dispõe de salas projetadas, equipe especializada, modernos equipamentos audiovisuais, além de variadas opções de Coffe Break, almoço, jantar e coquetel', 'Geral: Ar condicionado, Bar, Elevador, Parque de estacionamento , Parque de estacionamento gratuito, Q...
Actividades: Piscina exterior
Cartões De Crédito Aceites: American Express, Visa, Euro/Mastercard, Diners, MaestroQuartos: 82
Cadeia Hoteleira: Harbor
Serviços: Acesso gratuito à Internet Wi-Fi incluído, Centro de negócios, Comodidades para Reuniões/Ba...', 'hotels,restaurantes,lan house', 2, 2728, 7, NULL, '2009-11-08 13:21:19.588944', '2009-11-08 13:21:35.383474');
INSERT INTO shops VALUES (26, 'Galetos Grill', 'Rua Hamilton Silva 1215, Central ', '(96) 3224-2155', '', NULL, '', 'Foi um dos bares mais movimentados da cidade. Mudou o perfil e agora serve refeições. De segunda a sexta, o almoço é no sistema por quilo (R$ 14,90), com quarenta pratos quentes e frios. Aos sábados, o cliente paga R$ 10,90 e pode se servir à vontade, seja do bufê ou da feijoada. No domingo, há também rodízio de panelinhas (R$ 10,90 por pessoa). A receita mais pedida é a de bacalhau desfiado com arroz e legumes. De segunda a quarta, por R$ 12,90, o cliente tem direito a quatro rodízios: pizza, caldos, massas ou de panelinhas.

', '', '', 3, 60, 7, NULL, '2009-11-04 17:42:13.268983', '2009-11-04 22:51:57.133389');
INSERT INTO shops VALUES (19, 'Marinas Maceió Hotel', 'Av. Álvaro Calheiros, 30 - Jatiúca', '(82) 2122.7000', '', 'reservas@marinashotel.com.br', 'http://www.marinashotel.com.br/', 'O Marinas Maceió Hotel está localizado na primeira quadra da praia de Jatiúca, uma das mais belas de Maceió. Próximo ao Shopping Center Iguatemi, aos principais pontos turísticos e a poucos metros dos melhores restaurantes da cidade com suas deliciosas variedades gastronômicas. São 54 apartamentos equipados com ar-condicionado, frigobar, TV e telefone. O hotel dispõe de garagem, gerador próprio e Room Service 24 horas. 
Há um lindo terraço na cobertura com vista para a praia de Jatiúca , varanda no hall de todos os andares, toalhas para praia e outras facilidades.
', '', 'hotel', 3, 632, 7, 33, '2009-11-04 15:47:05.471673', '2009-11-05 00:00:31.330444');
INSERT INTO shops VALUES (16, 'Hotel Ritz Lagoa da Anta', 'Av. Brigadeiro Eduardo Gomes, 546', '(82) 2121-4000', '(82) 2121-4123', 'reservas@ritzlagoadaanta.com.br', 'http://www.ritzlagoadaanta.com.br/language/pt/page.php?id=localizacao', 'Primeiro Urban Resort do Brasil, o Ritz Lagoa da Anta Urban Resort é certificado pela norma ISO 9001-2000 em todos os seus serviços. Com localização privilegiada, a beira mar da praia de Lagoa da Anta, vizinha das praias de Jatiúca e Ponta Verde, esse novo conceito de resort, dispõe de toda infra-estrutura de lazer e entretenimento para crianças e adultos, com todas as facilidades de se estar na cidade de Maceió.
 
O Hotel Ritz Lagoa da Anta fica no bairro de Cruz da Almas, em frente à praia. A piscina do hotel é a maior dos hotéis de Alagoas, com pontes e partes rasas para as crianças.', 'Infra-estrutura: Clube Infantil, Fitness Center, Piscina, Piscina Infantil, Recreador, Restaurante, Sauna a vapor, Sauna Seca, Serviço de quarto 24h, Hidromassagem, Internet, Quadra de tênis, Lavanderia, Lojas, Cafeteria, Spa, Bar e Solário.', 'hotel, piscina, restaurante, sauna, internet', 6, 632, 2, 30, '2009-11-04 14:14:34.449105', '2009-11-05 00:00:45.310473');
INSERT INTO shops VALUES (63, 'Hotel Novotel Campo Grande', 'Jardin Copacabana, Avenida Mato Grosso, 5555 ', '67 2106-5900‎', '', NULL, '', 'O hotel dispõe de um total de 87 quartos. O bar do hotel e o restaurante climatizado com zona para não fumadores contemplam diferentes ofertas culinárias. Existem várias salas de conferência à disposição de executivos. Poderá igualmente usufruir da ligação à Internet. Os pequenos hóspedes poderão divertir-se no parque infantil do hotel. Para a sua viatura existe um lugar de estacionamento mediante taxa extra.

Os quartos de decoração contemporânea compreendem casa de banho privativa com secador de cabelo. Incluem televisão via satélite/cabo, acesso à Internet, mini-bar, ar condicionado regulado centralmente e cofre de aluguer.

Na sofisticada área exterior do hotel encontra-se uma piscina. Poderá inclusivamente dispor do corte de ténis.

87 Quartos
', '', 'lazer,hospedagem,bar,restaurante,etc.', 1, 2728, 7, NULL, '2009-11-08 13:31:27.996169', '2009-11-08 13:31:28.808469');
INSERT INTO shops VALUES (30, 'PizzaMille', 'Endereço: Rua Leopoldo Machado, 2334', '(96) 3222-5375', '', NULL, 'http://www.pizzamille.com.br/pizMenu.asp?sMenu=INST', 'A PIZZAMILLE & PASTA é uma rede carioca especializada na comercialização de pizzas e massas gratinadas, com uma experiência de mais de 15 anos, pois atua no mercado de franquias desde 1991 e está presente de norte a sul do país (são cerca de 30 lojas distribuídas entre as cinco regiões brasileiras).
Nossas lojas são padronizadas para alimentação rápida (fast food de pizzas e massas gratinadas), onde nós transferimos ao franqueado, por contrato, o "KNOW-HOW" (todo o conhecimento adquirido ao longo destes anos) de aspectos operacionais, financeiros, administrativos, técnicos e comerciais necessários à manutenção de sua franquia, desde a inauguração.

Destaca-se em seu mix (na sua variedade) de produtos pizzas, calzones e massas gratinadas.

', '', '', 4, 60, 7, NULL, '2009-11-04 18:26:38.447751', '2009-11-06 15:04:23.867043');
INSERT INTO shops VALUES (42, 'Hotel Itapoã', 'Rua Dias Gomes, 4 ', '(21)21950600', '', NULL, '', 'Toda magia e encanto de Itapoã
O Hotel Itapoã Praia oferece suítes confortáveis para você curtir os encantos de uma das praias mais famosas do Brasil. Aproveite também para realizar seu evento num cenário mais que paradisíaco. O hotel dispõe de um salão de convenções para até 50 pessoas, bem próximo da piscina. Venha já ouvir o mar de Itapuã !Situado em uma das praias mais belas e conhecidas de Salvador. Próximo ao Aeroporto e à Lagoa do Abaeté.

', 'Gratuidade infantil: até 5 anos


Check-in: 12:00/
Check-out: 12:00', 'hotel', 2, 1049, 7, 47, '2009-11-06 15:10:00.261927', '2009-11-06 15:12:28.804488');
INSERT INTO shops VALUES (64, 'Hotel Odara', 'Av. Fernando Corrêa da Costa, 93 - Areão', '65 3616-3500‎', '', NULL, '', 'Odara é uma palavra de origem africana que significa "bom, bel, em boas condições, confortavelmente".
O Hotel Odara é moderno, confortável, com ambiente e decoração em estilo clean.
Durante o trajeto o hotel oferece comodidades como bebidas geladas, check-in antecipado, van equipada com DVD. 


- Café da madrugada: o hospéde que deixa o hotel entre 00:00 e 06:00 da manhã pode solicitar na recepção, sem nenhum custo adicional. 


- Rede wireless livre sem nenhum custo adicional disponível nos apartamentos, salas de reunião, restaurante e bar, além da internet banda larga gratuita e sala de business com computadores disponíveis 24 horas por dia.


- O hotel possui piscina, academia e estacionamento grátis.', 'Formas De Pagamento: Visa, Mastercard, Dinners, American Express', 'lazer,hospedagem,bar,etc.', 1, 2650, 7, NULL, '2009-11-08 14:42:30.034861', '2009-11-08 14:42:30.542492');
INSERT INTO shops VALUES (77, 'Port d''Aldeia Resort', 'Av. Manoel Mavignier- Estrada da Cofeco', '', '', NULL, 'http://www.portodaldeia.com.br/restaurantes.php', ' Sinta o prazer de uma boa mesa no nosso restaurante. Um magnífico espaço com pratos da culinária nacional e internacional.

O Porto D''Aldeia Resort abriga vários ambientes, todos decorados tematicamente, onde você pode degustar o melhor da cozinha contemporânea. 

As delícias que você degusta no nosso restaurante você só encontra aqui. Venha para o Porto D"aldeia e embarque numa deliciosa viagem pelo mundo dos sabores.

Bom apetite
      
   Restaurante do Capitão

Ambiente com ar refrigerado, decorado com motivos náuticos. O ícone principal deste espaço é o Capitão Portinho, um velho marinheiro simpático e bonachão.

Aberto no café da manhã, almoço e jantar. 
      
   Farol Deck bar
Engloba o bar da piscina e todo o espaço ao seu redor. Entre um mergulho e outro pra se refrescar, você pega um bronze e curte a deslumbrante vista do mar. Serve tira-gostos e refeições. 
 ', '', 'restaurante, hotel, resort', 3, 1233, 7, NULL, '2009-11-10 18:57:50.031047', '2009-11-10 18:59:47.902927');
INSERT INTO shops VALUES (65, 'Taiama Plaza Hotel', 'Av. Historiador Rubens de Mendonça, 1184 ', '65 3623-8498‎', '', NULL, '', 'O Taiamã Hotel possui uma belíssima área de lazer, com vista panorâmica, piscina com tobogã e ainda oferece uma ótima academia de ginástica. Você poderá desfrutar de todos os nossos ambientes e serviços.', 'Lazer: Ginásio, Piscina
Localizacao: Localizado na região central de Cuiabá, o Hotel Taiamã possibilita ao cliente acesso rápi...
Opcoes De Conforto: garagem, piscina, american bar, cafe da manha, um dormitorio, dois dormitorios, ...Servicos: Parque de estacionamento
Formas De Pagamento: Visa, Mastercard, Dinners, American Express, Cheque
Idiomas: PT', 'lazer,dormitórios,piscina,etc.', 2, 2650, 7, NULL, '2009-11-08 14:47:53.59175', '2009-11-08 21:04:03.73935');
INSERT INTO shops VALUES (78, 'Rancho Forte', 'Avenida Jaguarussu ,s/nº - próximo ao aeroclube da Barra do Jucu', '3242-2449', '', NULL, 'www.ranchoforte.com.br', 'Para chegar ao local é preciso ter atenção às placas e disposição para encarar uma estrada de terra. O restaurante integra um complexo com atividades como passeio a cavalo, trilha ecológica e parque. A propriedade preserva ruínas jesuíticas e uma passarela de madeira leva a um mirante à beira do rio Jucu. Os proprietários, Valéria e Rodrigo Sobreira, recebem pessoalmente os visitantes. Da cozinha, saem receitas caseiras como o frango caipira ao molho pardo (R$ 52,50). Prato da casa, o arroz rancho forte tem carne de sol e linguiça calabresa (R$ 23,50).horários: 9h/18h (sáb. e dom.)


', '', 'restaurante', 2, 3906, 7, NULL, '2009-11-10 19:03:42.524851', '2009-11-10 19:04:42.350784');
INSERT INTO shops VALUES (66, 'Belo Horizonte Othon Palace', 'Av. Afonso Pena, 1050 - Centro, Belo Horizonte ', '31 2126-0000‎', '', NULL, '', 'O hotel situa-se no centro de Belo Horizonte, capital de Minas Gerais, com a sua vida comercial e social distintas. O Parque Municipal, com as suas áreas verdes e lagos, encontra-se mesmo em frente ao hotel.', 'Cartões De Crédito Diners Club, Visa, American Express, Master Card 
Estilo Luxuoso, Negócio  
Geral Plano Nutricional, Luxuoso, Dataport, Não-fumantes, Piscina, Cadeira rolante acs, Café-da-manhã livre  
Localização Sala de jantar 
', 'restaurante,hotel,lazer,etc.', 1, 3828, 7, NULL, '2009-11-08 19:08:55.614864', '2009-11-08 19:08:56.01523');
INSERT INTO shops VALUES (70, 'Bar do Careca‎', 'Rua Simão Tann, 395 - Belo Horizonte ', '31 3421-3655‎', '', NULL, '', 'Simplicidade. A melhor definição para o Bar do Careca e suas acomodações. Há mais de 20 anos instalado no mesmo local, o proprietário da casa recebe apreciadores de bons tira-gostos, típicos de botequim.

O bom atendimento e a autenticidade cativam os clientes, fiéis ao bar. Um dos principais atrativos é o mural com fotos de freqüentadores, famosos ou anônimos.

No cardápio, pratos preparados em panelas de pedras pelo próprio Careca são a grande sensação do local. As sugestões da casa são língua de boi, torresmo com mandioca, dobradinha, picanha na chapa, carne-de-sol, entre outros.
', 'Faixa de Preço: até R$ 20
Horário: De ter a sex, a partir das 17h30, sáb a partir das 11h, dom e feriados das 11h às 19h.
Idade Mínima: 18
Faixa Etária: de 22 a 25
Gênero: Dance/Disco/Pop', 'Bares e Choperias', 2, 3828, 7, NULL, '2009-11-08 19:54:58.979705', '2009-11-09 06:03:04.774283');
INSERT INTO shops VALUES (69, 'Silviu''s Bar', 'R. Begônia, 199 - Esplanada, Belo Horizonte', '31 3482-3001‎', '', NULL, '', 'Um bom lugar para se reunir com amigos. E com uma ótima localização.', 'Horario: De seg a sex das 17h à 0h, sáb das 12h à 0h.Genero: Dance/Disco/Pop
Faixa de Preço: até R$ 10
', 'Bares e Choperias', 2, 3828, 7, NULL, '2009-11-08 19:47:38.588806', '2009-11-09 06:03:24.961368');
INSERT INTO shops VALUES (68, 'Hotel Serrana Palace', 'R. dos Goitacazes, 450 - Centro, Belo Horizonte', '31 3212-2365‎', '', NULL, '', 'Um ambiente acolhedor, propício ao lazer, aos negócios e a cultura. Os 116 apartamentos e suítes dispõe de ar condicionado, frigobar, telefone, música ambiente, TV à cabo e serviço de room service 24 hs. Oferecemos também, restaurante com pratos regionais e da cozinha internacional, sauna, piscina e lavanderia. Room Tax nao está incluído na diária.
', 'Sauna: sim
Serviço De Quartos: sim
Forma De Pagamento: EC/Maestro, American Express, Diner´s Club, Eurocard/ Mastercard, JCB Intl., VisaCentro Financeiro: sim
Tipo De Alojamento: Hotel
Piscina Própria Do Hotel: sim', 'musica,bar,restaurante,hotel,etc.', 2, 3828, 7, NULL, '2009-11-08 19:22:14.783508', '2009-11-09 06:03:43.704319');
INSERT INTO shops VALUES (67, 'Ouro Minas Palace Hotel', 'Av. Cristiano Machado, 4001 - Belo Horizonte ', '31 3429-4001‎', '', NULL, '', 'O Ouro Minas é o único hotel 5 estrelas de Belo Horizonte. Sua majestade pode parecer pequena para quem não conhece a cidade, mas ela é a 3 maior economia do país, daí se tem uma ideía de seu enorme parque hoteleiro. 

O Ouro Minas possui mais de 300 quartos desde os standard, luxo, suíte e presidencias. Apesar de 5 estrelas, possui os problemas que qualquer grande hotel está sujeito à ter. Seu maior ponto negativo é a localização, completamente afastado da cidade e em uma região pobre e perigosa. A menos que vc esteja viajando para algum congresso ou evento dentro do hotel, não o recomendaria apenas pela localização. Mais vale um hotel na zona sul, como Savassi ou Belvedere e poder desfrutar de uma região agradável e cheia de opções. 
', '', 'Hotel, Turismo, Travel - Hotels,etc.', 2, 3828, 7, NULL, '2009-11-08 19:16:32.317931', '2009-11-09 06:07:28.553702');
INSERT INTO shops VALUES (71, 'Roteiros', '103 Norte Avenida LO 2 lt 37 s 3 cj 4 Bairro: Plano Diretor Norte', '(63) 3215-8717', '', NULL, '', '', '', 'Hotel', 4, 409, 7, 71, '2009-11-08 23:16:45.300999', '2009-11-09 20:02:27.318869');
INSERT INTO shops VALUES (34, 'Lord Manaus Hotel', 'Rua Marcilio Dias, 217 - Cep: 69005-270 - Manaus', '(92) 3622-2844', '(92) 3622-2576', NULL, 'http://www.lordmanaus.com.br/', 'O Lord Manaus Hotel está localizado na região central em uma das mais exóticas cidades da Amazônia. Com mais de 100 unidades, constantemente atualizadas, pode-se desfrutar em algumas, a tão disputada vista para o Rio Negro.Apartamentos e suítes, completamente equipados, proporcionam um ambiente agradável e confortável. Climatizados, room bar, telefone com discagem direta, TV a cabo, internet wi-fi, fechadura eletrônica de segurança, apartamentos para portadores de necessidades especiais, andares exclusivos para não fumantes. Restaurante, lobby bar, salas para reuniões, agência de viagens, serviços de quarto 24hrs, café da manhã completo de cortesia para nossos hóspedes. A localização no centro histórico, é estratégica.', '', 'hotel', 3, 44, 7, 41, '2009-11-05 15:47:39.248347', '2009-11-06 15:29:50.323774');
INSERT INTO shops VALUES (44, 'Colonial Chile Hotel', 'Rua Chile, 7 -Centro', '', '', NULL, '', 'Apartamentos e lofts com vista para a Baía de Todos os Santos
O Colonial Chile Hotel é formado por apartamentos e lofts com decoração moderna, alguns com uma linda vista panorâmica da Baía de Todos os Santos. As acomodações contam com ar condicionado split, TV e telefone com discagem direta. O hotel oferece ainda os serviços de agência de turismo e aluguel de veículos.

O Colonial Chile Hotel encontra-se a poucos passos do Elevador Lacerda, que liga a Cidade Baixa à região do Pelourinho e da Praça Castro Alves, situada a cerca de 150mts dali.

', 'Gratuidade infantil: até 5 anos


Taxas:
ISS: 5.00% *incluso 
Tx de turismo: R$ 1.50 *incluso 
 
Horários:
Check-in: 12:00
Check-out: 12:00', 'hotel', 2, 1049, 7, NULL, '2009-11-06 15:33:03.964729', '2009-11-06 15:34:14.454217');
INSERT INTO shops VALUES (72, 'Hotel Pestana Curitiba', 'R. Comendador Araújo, 499 - Curitiba - PR, 80420-000 ', '41 3022-4801‎', '', NULL, '', 'Este hotel está localizado em suldoeste / Curitiba, Rua Comendador Araújo 499 , a apenas 15 minutos à pé do centro da cidade. Este hotel em Curitiba tem o estilo Luxuoso e a categoria cinco estrelas. Você irá encontrar várias facilidades, tais como: Restaurante, Serviços de quarto, Bar, Não fumante, Centro de negócios, Lavanderia, Ar Condicionado. O Pestana Curitiba tem 173 quartos. A partir de 241 Real Brasileiro para o preço médio dos quartos nas categorias Appartment e Double. Este hotel oferece um único serviço: cadeira rolante acs. Este hotel oferece acesso à internet em alta velocidade. Aproveite a/o sauna disponível neste hotel.
', 'Oferecem também restaurante de cozinha portuguesa e mediterrânea, Room service 24horas.



Na estrutura de lazer, oferecem os serviços do Naga Spa by Shishindo e do Fitness Center equipado com os mais modernos equipametos e vista panorâmica da cidade, piscina moderna e aquecida medindo 15 x 4m, sauna úmida, duchas, ôfuro, sala de ginástica e solarium. 



A estrutura de lazer não tem custo adicional, sendo pagos à parte somente as terapias e o ôfuro.
', 'restaurante,bar,hotel,etc.', 1, 5042, 7, NULL, '2009-11-09 19:21:08.619384', '2009-11-09 19:21:08.899909');
INSERT INTO shops VALUES (45, 'Golden Beach hotel', 'Av. Dioguinho, 4455, Praia do Futuro, Fortaleza - Ceará.', '(85) 3402-6501', '(85) 3402-6503', NULL, 'http://www.gbhotel.com.br/', 'O Goden Beach Hotel categoria 03 estrelas plus, está localizado na belissima Praia do Futuro, na primeira quadra junto ao mar. Ao seu redor está o que tem de melhor para seu lazer e diversão.Com 50 apartamentos com vista para o mar, equipados com: frigobar, cofre, tv tela plana 21'', DVD, ar-condicionado, água quente, telefone e cama box. 
', 'DIÁRIAS A PARTIR  DE

R$   99,00 - C/Café da manhã 

R$ 124,00 - C/Café da Manhã, Transfer
                      Aeroporto/Hotel/Aeroporto
                      e veículo com AR incluso

Tudo em 10 vezes sem juros no 
cartão, ou 10% de desconto p/
pgto. no cash

OBS. p/ transfer mínimo 03 diárias
', 'hotel', 2, 1233, 7, 49, '2009-11-06 15:58:44.252252', '2009-11-06 19:01:09.253885');
INSERT INTO shops VALUES (74, 'Bar do Alemão', 'R. Dr. Claudino dos Santos, 63 - Curitiba - PR, 80020-170 ', '41 3223-2585‎', '', NULL, '', 'O Bar do Alemão é um bar típico de Curitiba que tenta recriar um ambiente alemão com mesas que parecem feitas de toras inteiras e música ambiente alemã.

Eles tem o famigerado drink submarino que consiste em chopp com com Steinhaeger que vem com a caneca grande e uma canequinha menor dentro, a de Steinhaeger. Esta canequinha você pode levar pra casa na boa.
', 'Festas Particulares: Sim
Roupa: Casual
Ao Ar Livre: SimBom Ir Com: Amigos
Cartão: Sim
Estacionamento: Na rua', 'chopp,bar,restaurante,etc.', 1, 5042, 7, NULL, '2009-11-09 19:28:26.344363', '2009-11-09 19:28:26.527682');
INSERT INTO shops VALUES (46, 'Beach Park', 'Dunas de Aquiraz, 20 quilômetros ao leste de Fortaleza', '', '', NULL, 'http://www.beachpark.com.br/site/pt/home/home.asp', 'Atualmente, tem cerca de 35 mil metros quadrados (o que o torna o maior parque aquático do Brasil), mais de cem atrações e é dividido em áreas temáticas com brinquedos para crianças e, principalmente, para adultos apaixonados por adrenalina.

O Beach Park é um complexo que inclui o Acqua Park (o parque aquático, atração de maior visibilidade do complexo), duas cadeias de resorts (uma delas integrada ao Acqua Park), área de restaurantes e um Centro de Convenções. O Beach Park abre diariamente, das 11 às 17 horas.


Para aproveitar tudo o que essa terra molhada tem a oferecer é preciso enfrentar o medo; os brinquedos mais radicais são capazes de assustar os mais destemidos. Uma dica é começar pelos mais baixos e menos velozes para ganhar confiança e dar um passo à frente em busca de mais aventura. Para as crianças, há a ilha do tesouro, a arca de Noé e o aqua show, onde ficam o maremoto (a maior piscina de ondas da América Latina) e o balde gigante, que despeja 1.800 litros d’água de uma só vez em quem está por perto. 



', 'Em 2008, o ingresso custava R$ 85; há promoções para grupos e múltiplas visitas. Há restaurantes e lanchonetes dentro do parque, com preços mais altos do que a média.
', 'parque aquático', 2, 1233, 7, NULL, '2009-11-06 18:22:59.030221', '2009-11-06 18:24:18.163148');
INSERT INTO shops VALUES (48, 'Hotel Deville Cuiabá ', 'Av. Isaac Povoas,1000. Cuiabá – MT.', '(65) 3319.3000', '(65) 3319.3201', NULL, '', 'Situado no centro da cidade, a 15 minutos do aeroporto, o hotel possui acesso rápido aos pontos comerciais, culturais e turísticos da cidade.

Uma referência de hospedagem na cidade, o Hotel Deville Cuiabá dispõe de excelente estrutura e de serviços especiais para garantir a melhor estada para o hóspede que está a trabalho ou a lazer.
', 'São 9 salas de eventos para até 1000 pessoas.

• Equipamentos audiovisuais;
• Profissionais especializados para assessorar seu evento; 
• Infra-estrutura completa de apoio; 
• Conexões para computadores em rede e acesso a internet rápida (ADSL) e nas salas do 1º andar Wi-fi;
• Cozinha própria;
• 03 áreas facilitadoras: Amplo foyer, sala de apoio, área externa em volta da piscina.
', 'hotel,lazer.', 1, 2650, 7, NULL, '2009-11-06 21:23:13.912393', '2009-11-06 21:23:14.317982');
INSERT INTO shops VALUES (43, 'Bahia Sol e Mar Hotel ', 'Avenida Oceânica, 2483-Ondina - Salvador - BA', '(21)21950600', '', NULL, '', 'Repouso aconchegante na terra de São Salvador
O Bahia Praia Hotel une simplicidade, bom gosto e clima aconchegante com uma localização muito especial para você. Os apartamentos possuem ar condicionado, TV, frigobar e telefone. Dentre os serviços disponibilizados, conte com sala de internet, estacionamento, room service, restaurante, loka de conveniência e piscina.
O Bahia Sol e Mar Hotel situa-se na Praia de Ondina, a apenas 3km do Porto da Barra e a menos de 10km dos principais pontos turísticos da cidade, como Elevador Lacerda (6km), Pelourinho (6,5km) e Mercado Modelo (7km).', 'Gratuidade infantil: até 5 anos


Taxas:
Tx de turismo: R$ 1.50 *incluso 
 
Horários:
Check-in: 12:00
Check-out: 11:00', 'hotel', 10, 1049, 7, NULL, '2009-11-06 15:22:54.191526', '2009-11-09 06:06:12.508882');
INSERT INTO shops VALUES (75, 'Alice Bar', 'R. Prof. Guido Straube, 6 - Curitiba - PR, 80320-030 ', '41 3026-3172‎', '', NULL, '', 'Quem gosta da historia Alice no País das Maravilhas esse é o bar!
A decoração é inspirada nesta historia!Tem portas mágicas e cartas de baralho. Todo dia tem música ao vivo, com bandas de samba, forró e música latina. 
A especialidade da casa é o hambúrguer ao barbecue, que pode ser acompanhado de cervejas Skol, Bohemia, Original e Antartica, além de cachaças, uísques e coquetéis.
O atendimento la é muito rápido.', 'Horario: Terças a Quinta a partir das 21h, Sextas e Sábados a partir das 23h.Genero: Samba', 'Bares e Choperias', 1, 5042, 7, NULL, '2009-11-09 19:31:09.471264', '2009-11-09 19:31:09.743224');
INSERT INTO shops VALUES (49, 'Pousada Penhasco', 'Av. Penhasco, s/nº - Bom Clima -', '(65) 3301-1555', '', NULL, '', 'Todos tem o desejo de conhecer o lugar ideal de suas vidas, o verdadeiro lugar de seus sonhos.

Se ele inclui conforto e sofisticação em meio a natureza, você pode estar sonhando com a Pousada Penhasco.

Venha sentir um clima de descontração com a vista mais deslumbrante da região e fazer com que este sonho se torne realidade.

Teremos o maior prazer em lhe atender
', 'Serve café da manhã. Distante 2 km do centro, próximo a beira dos paredões de Chapada. Apartamentos com Ar, TV, Frigobar e telefone; todos com varanda e vista belíssima para os paredões e a Planície Pantaneira; possui 2 piscinas num patamar abaixo com cachoeira e uma aquecida com hidromassagem, restaurante, sauna e trilhas que levam a um deck a beira de um penhasco de mais de 200m, onde na época das chuvas observam-se 2 cachoeiras com mais de 100m cada, além de trilhas na mata. Capacidade 72 leitos em 24 aptos. 


44 aptos com Ar condicionado, TV, frigobar 

SEMANA 

1 pessoa R$ 171,00
2 pessoas R$ 190,00 
3 pessoas R$ 247,00 
4 pessoas R$ 304,00 

Cama extra R$ 57,00 
 FINAL DE SEMANA Sábado/ Domingo

1 pessoa R$ 215,00
2 pessoas R$ 239,00
3 pessoas R$ 311,00 
4 pessoas R$ 382,00 

Cama extra R$ 72,00 
 
', 'Hospedagem,lazer,', 1, 2538, 7, 53, '2009-11-06 21:30:26.841188', '2009-11-06 21:30:27.007337');
INSERT INTO shops VALUES (73, 'Hotel Deville Rayon', 'R. Visc. de Nacar, 1424 - Curitiba - PR, 80410-201 ', '41 2108-1100‎', '', NULL, '', 'O estilo Negócio do estabelecimento, O HOTEL DEVILLE RAYON tem todos os confortos, tais como: Centro de negócios. Nordeste, 6 minutos de carro de distancia do centro da cidade, este hotel na R Visconde de Nacar 1424 é ideal para conhecer as maravilhas de Curitiba, independente da duração de sua estadia.
Este hotel é parte do Ihotelier grupo. Internet em alta velocidade é disponível neste hotel. Este hotel oferece um único serviço: cadeira rolante acs. Aproveite a/o piscina disponível neste hotel.', '', 'negocios,piscina,hotel,etc.', 3, 5042, 7, NULL, '2009-11-09 19:24:48.613738', '2009-11-09 19:32:02.47173');
INSERT INTO shops VALUES (79, 'Zé da pizza', 'Rua Alaor de Queiroz Araújo ,146', '', '', NULL, '', 'pequena casa comandada por José Carlos Tonin, que já foi vencedora duas vezes da categoria, prepara vinte opções de redonda no forno a lenha revestido por tijolos refratários. Quem prepara o molho com tomates italianos - sucesso da casa - é a mulher de Tonin, Cláudia. ', 'Fazem sucesso as coberturas de marguerita (R$ 43,00) e a escarola com bacon e alho (R$ 46,00Horário:19h/23h (fecha qua.)
', 'pizzaria', 3, 3906, 7, NULL, '2009-11-10 19:07:54.64794', '2009-11-10 19:10:03.517576');
INSERT INTO shops VALUES (50, 'Bar do Português', 'Bairro Boa Esperança, próximo à Universidade Federal, na rua 43.', '', '', NULL, '', 'Barzinho simples e aconchegante, point pra moradores do bairro Boa Esperança. É rústico, um varandão, uma churrasqueira e pronto. 
Cerveja bem gelada, animação na medida, um lugar bacana para um final de tarde relaxante. O Erimar, filho do seo Manuel, é o cara que agora toca o negócio pra frente, é uma figura muito legal. Servem um churrasquinho bem legal de tira-gosto.
Fecha por volta de 23 h.', 'Churrasquinho: 2 reais, fecha por volta de 23 h.', 'cerveja,lazer,barzinho', 2, 2650, 7, NULL, '2009-11-06 22:38:32.713014', '2009-11-07 22:29:31.031729');
INSERT INTO shops VALUES (80, 'Papaguth', 'Avenida Nossa Senhora dos Navegantes ,700 - loja 1, Praça do Papa', '3071-3269', '', NULL, '', '
Há pouco mais de um ano instalado no mirante da Praça do Papa, o restaurante tem ambiente todo envidraçado e uma exuberante vista para o mar e o Convento da Penha. Com essa paisagem ao fundo, o restaurateur Júlio Lemos prepara receitas de badejo, salmão, cação, lagosta, polvo e crustáceos pescados num trecho entre a costa capixaba e o Sul da Bahia. Desses itens destaca-se o camarão VG, ingrediente central da receita que leva o nome da casa. Chega à mesa gratinado com purê de aipim, requeijão e milho, na companhia de arroz (R$ 102,00 para duas pessoas). Na versão sergio de castro, vem misturado a arroz de polvo, palmito, cogumelo e brocólis (R$ 95,00 para duas pessoas). Para abrir o apetite, prove a frigideira de siri desfiado (R$ 22,00). Na ala doce do cardápio, a pedida é o petit gâteau (R$ 14,00). Uma vez por ano, sem data pré-definida, Lemos promove um festival em que os frutos do mar têm preço único.

', 'Horário:11h/15h30 e 19h/23h30 (sáb. almoço até 16h; dom. só almoço até 17h; fecha seg.)
', '', 1, 3906, 7, NULL, '2009-11-10 19:12:49.893003', '2009-11-10 19:12:50.43049');


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO states VALUES (1, 1, 'AC', 'Acre');
INSERT INTO states VALUES (2, 1, 'AM', 'Amazonas');
INSERT INTO states VALUES (3, 1, 'AP', 'Amapá');
INSERT INTO states VALUES (4, 1, 'PA', 'Pará');
INSERT INTO states VALUES (5, 1, 'RO', 'Rondônia');
INSERT INTO states VALUES (6, 1, 'RR', 'Roraima');
INSERT INTO states VALUES (7, 1, 'TO', 'Tocantins');
INSERT INTO states VALUES (8, 2, 'AL', 'Alagoas');
INSERT INTO states VALUES (9, 2, 'BA', 'Bahia');
INSERT INTO states VALUES (10, 2, 'CE', 'Ceará');
INSERT INTO states VALUES (11, 2, 'MA', 'Maranhão');
INSERT INTO states VALUES (12, 2, 'PB', 'Paraíba');
INSERT INTO states VALUES (13, 2, 'PE', 'Pernambuco');
INSERT INTO states VALUES (14, 2, 'PI', 'Piauí');
INSERT INTO states VALUES (15, 2, 'RN', 'Rio Grande do Norte');
INSERT INTO states VALUES (16, 2, 'SE', 'Sergipe');
INSERT INTO states VALUES (17, 3, 'MT', 'Mato Grosso');
INSERT INTO states VALUES (18, 3, 'MS', 'Mato Grosso do Sul');
INSERT INTO states VALUES (19, 3, 'GO', 'Goiás');
INSERT INTO states VALUES (20, 3, 'DF', 'Distrito Federal');
INSERT INTO states VALUES (21, 4, 'MG', 'Minas Gerais');
INSERT INTO states VALUES (22, 4, 'ES', 'Espírito Santo');
INSERT INTO states VALUES (23, 4, 'RJ', 'Rio de Janeiro');
INSERT INTO states VALUES (24, 4, 'SP', 'São Paulo');
INSERT INTO states VALUES (25, 5, 'PR', 'Paraná');
INSERT INTO states VALUES (26, 5, 'SC', 'Santa Catarina');
INSERT INTO states VALUES (27, 5, 'RS', 'Rio Grande do Sul');


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO tags VALUES (1, 'Aventura');
INSERT INTO tags VALUES (2, 'Romântico');
INSERT INTO tags VALUES (3, 'Gastronomia');
INSERT INTO tags VALUES (4, 'Exótico');
INSERT INTO tags VALUES (5, 'Ecoturismo');
INSERT INTO tags VALUES (6, 'Negócios');
INSERT INTO tags VALUES (7, 'Relax');
INSERT INTO tags VALUES (8, 'Cursos');
INSERT INTO tags VALUES (9, 'Compras');
INSERT INTO tags VALUES (10, 'Cultural');


--
-- Data for Name: tips; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO tips VALUES (1, 'Raissa', 'O espaço também abriga o Theatro Hélio Melo, batizado em homenagem ao pintor acreano.', 7, '2009-11-02 19:52:14.768685', '2009-11-02 19:52:14.768685');
INSERT INTO tips VALUES (2, 'Raíssa', 'Para quem gosta de história é bastante interessante visitar.', 7, '2009-11-02 20:23:50.088685', '2009-11-02 20:23:50.088685');
INSERT INTO tips VALUES (3, 'raissa', 'A Usina de Arte João Donato, está começando seus cursos, que hão de durar inicialmente por dois anos. Os alunos não pagam nada. É uma escola pública de Arte. Os professores escalados são dos melhores. A construção é linda e imensa.', 7, '2009-11-02 20:31:46.109208', '2009-11-02 20:31:46.109208');
INSERT INTO tips VALUES (6, 'raissa', 'Destaca-se ainda na sala de espetáculos a pintura do pano de boca do palco, de autoria de Crispim do Amaral, que faz referência ao encontro das águas dos Rios Negro e Solimões.', 7, '2009-11-05 11:24:27.429231', '2009-11-05 11:24:27.429231');
INSERT INTO tips VALUES (5, 'Raissa', 'Como já foi dito, tem os melhores hoteís da cidade. Indico a hospedagem dos mesmos.', 7, '2009-11-04 15:26:01.967556', '2009-11-04 15:26:01.967556');
INSERT INTO tips VALUES (7, 'raissa', 'O melhor dia é sexta feira, por causa da múscica ao vivo.', 7, '2009-11-06 14:04:42.796563', '2009-11-06 14:04:42.796563');
INSERT INTO tips VALUES (8, 'raissa', 'Se você não tem muito dinheiro vá em outra praia, pois, o padrão não é o mesmo.', 7, '2009-11-06 15:00:35.222054', '2009-11-06 15:00:35.222054');
INSERT INTO tips VALUES (9, 'raissa', 'Fora da área de praias e barracas, a Praia do Futuro não tem a mesma movimentação que as outras praias de Fortaleza, e por isso são menos seguras.
Por isso, recomenda-se a utilização de táxis (evite os ônibus) para chegar às barracas e retornar aos hotéis, especialmente à noite.', 7, '2009-11-06 15:46:06.038423', '2009-11-06 15:46:06.038423');
INSERT INTO tips VALUES (10, 'raissa', 'Procure nadar próximo aos Salva-vidas e pergunte o melhor lugar para banho.', 7, '2009-11-06 18:31:30.268142', '2009-11-06 18:31:30.268142');
INSERT INTO tips VALUES (11, 'raissa', 'A roda de samba e o encontro para MPB com artistas capixabas acontece respectivamente às quintas e sextas-feiras, a partir das 21h30, no quiosque Chopp Vitória, que mantém um cadastro de clientes que são especialmente convidados para os eventos. Novos estilos musicais - que fogem do tradicional e animadíssimo pagode às quartas-feiras - também podem ser ouvidos nos quiosques Adrenalina, Nad e Tia Maria. ', 7, '2009-11-07 22:59:37.006751', '2009-11-07 22:59:37.006751');
INSERT INTO tips VALUES (12, 'Luis Almeida Oliveira ', 'Aproveitem bastante as cachoeiras e tentem visitar a todas elas', 7, '2009-11-08 21:15:03.164752', '2009-11-08 21:15:03.164752');
INSERT INTO tips VALUES (13, 'Mariana Fontes Augusta', 'A ilha é muito usada para estudos com o objetivo de não destruir o objeto de estudo e sim preserva-lo então para acesso à Ilha é necesária autorização do Ibama.', 7, '2009-11-08 22:45:52.75949', '2009-11-08 22:45:52.75949');
INSERT INTO tips VALUES (14, 'raissa', 'Para quem não percebeu, é a parada gay. Só recomendo se você for gay ou simpatizante.', 7, '2009-11-10 17:00:14.079181', '2009-11-10 17:00:14.079181');
INSERT INTO tips VALUES (15, 'raissa', 'Se você quiser levar seus filhos é melhor procurar outro local, porque eles não aceitam crianças.', 7, '2009-11-10 19:10:02.833265', '2009-11-10 19:10:02.833265');


--
-- Data for Name: tourist_sight_evaluations; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO tourist_sight_evaluations VALUES (3, 23, 3);
INSERT INTO tourist_sight_evaluations VALUES (4, 24, 4);
INSERT INTO tourist_sight_evaluations VALUES (10, 30, 11);
INSERT INTO tourist_sight_evaluations VALUES (6, 25, 6);
INSERT INTO tourist_sight_evaluations VALUES (7, 26, 7);
INSERT INTO tourist_sight_evaluations VALUES (8, 28, 8);
INSERT INTO tourist_sight_evaluations VALUES (9, 29, 9);
INSERT INTO tourist_sight_evaluations VALUES (11, 31, 12);
INSERT INTO tourist_sight_evaluations VALUES (12, 34, 15);
INSERT INTO tourist_sight_evaluations VALUES (13, 35, 16);
INSERT INTO tourist_sight_evaluations VALUES (14, 36, 17);
INSERT INTO tourist_sight_evaluations VALUES (15, 37, 18);
INSERT INTO tourist_sight_evaluations VALUES (18, 42, 27);
INSERT INTO tourist_sight_evaluations VALUES (17, 38, 20);
INSERT INTO tourist_sight_evaluations VALUES (19, 43, 28);
INSERT INTO tourist_sight_evaluations VALUES (20, 44, 29);
INSERT INTO tourist_sight_evaluations VALUES (21, 45, 32);
INSERT INTO tourist_sight_evaluations VALUES (22, 46, 33);
INSERT INTO tourist_sight_evaluations VALUES (23, 47, 34);
INSERT INTO tourist_sight_evaluations VALUES (24, 52, 43);
INSERT INTO tourist_sight_evaluations VALUES (25, 53, 44);
INSERT INTO tourist_sight_evaluations VALUES (30, 57, 49);
INSERT INTO tourist_sight_evaluations VALUES (27, 54, 46);
INSERT INTO tourist_sight_evaluations VALUES (28, 55, 47);
INSERT INTO tourist_sight_evaluations VALUES (29, 56, 48);
INSERT INTO tourist_sight_evaluations VALUES (31, 58, 50);
INSERT INTO tourist_sight_evaluations VALUES (32, 60, 51);
INSERT INTO tourist_sight_evaluations VALUES (33, 61, 52);
INSERT INTO tourist_sight_evaluations VALUES (34, 62, 53);
INSERT INTO tourist_sight_evaluations VALUES (35, 63, 54);
INSERT INTO tourist_sight_evaluations VALUES (36, 64, 55);
INSERT INTO tourist_sight_evaluations VALUES (37, 65, 56);
INSERT INTO tourist_sight_evaluations VALUES (38, 66, 57);
INSERT INTO tourist_sight_evaluations VALUES (39, 67, 58);
INSERT INTO tourist_sight_evaluations VALUES (46, 73, 66);
INSERT INTO tourist_sight_evaluations VALUES (41, 68, 60);
INSERT INTO tourist_sight_evaluations VALUES (42, 69, 61);
INSERT INTO tourist_sight_evaluations VALUES (43, 70, 62);
INSERT INTO tourist_sight_evaluations VALUES (44, 71, 63);
INSERT INTO tourist_sight_evaluations VALUES (45, 72, 64);
INSERT INTO tourist_sight_evaluations VALUES (47, 74, 67);
INSERT INTO tourist_sight_evaluations VALUES (48, 75, 68);
INSERT INTO tourist_sight_evaluations VALUES (49, 76, 69);
INSERT INTO tourist_sight_evaluations VALUES (50, 77, 70);
INSERT INTO tourist_sight_evaluations VALUES (51, 49, 72);
INSERT INTO tourist_sight_evaluations VALUES (52, 51, 73);
INSERT INTO tourist_sight_evaluations VALUES (53, 78, 77);
INSERT INTO tourist_sight_evaluations VALUES (54, 79, 80);


--
-- Data for Name: tourist_sight_tags; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO tourist_sight_tags VALUES (1, 1, 10, '2009-08-26 23:31:45.418685', '2009-08-26 23:31:45.418685');
INSERT INTO tourist_sight_tags VALUES (2, 2, 10, '2009-08-26 23:33:41.462613', '2009-08-26 23:33:41.462613');
INSERT INTO tourist_sight_tags VALUES (3, 3, 6, '2009-08-26 23:35:11.099977', '2009-08-26 23:35:11.099977');
INSERT INTO tourist_sight_tags VALUES (4, 3, 8, '2009-08-26 23:35:11.115808', '2009-08-26 23:35:11.115808');
INSERT INTO tourist_sight_tags VALUES (5, 3, 9, '2009-08-26 23:35:11.12557', '2009-08-26 23:35:11.12557');
INSERT INTO tourist_sight_tags VALUES (6, 3, 10, '2009-08-26 23:35:11.133482', '2009-08-26 23:35:11.133482');
INSERT INTO tourist_sight_tags VALUES (7, 4, 10, '2009-08-26 23:37:12.409822', '2009-08-26 23:37:12.409822');
INSERT INTO tourist_sight_tags VALUES (8, 5, 10, '2009-08-26 23:38:25.276218', '2009-08-26 23:38:25.276218');
INSERT INTO tourist_sight_tags VALUES (9, 6, 10, '2009-08-26 23:40:22.920481', '2009-08-26 23:40:22.920481');
INSERT INTO tourist_sight_tags VALUES (10, 7, 10, '2009-08-26 23:41:58.494841', '2009-08-26 23:41:58.494841');
INSERT INTO tourist_sight_tags VALUES (11, 7, 5, '2009-08-26 23:41:58.511768', '2009-08-26 23:41:58.511768');
INSERT INTO tourist_sight_tags VALUES (12, 8, 10, '2009-08-26 23:44:02.548624', '2009-08-26 23:44:02.548624');
INSERT INTO tourist_sight_tags VALUES (13, 9, 5, '2009-08-26 23:45:16.349508', '2009-08-26 23:45:16.349508');
INSERT INTO tourist_sight_tags VALUES (14, 9, 10, '2009-08-26 23:45:16.366269', '2009-08-26 23:45:16.366269');
INSERT INTO tourist_sight_tags VALUES (15, 10, 10, '2009-08-26 23:46:28.276748', '2009-08-26 23:46:28.276748');
INSERT INTO tourist_sight_tags VALUES (16, 11, 10, '2009-08-26 23:47:28.519072', '2009-08-26 23:47:28.519072');
INSERT INTO tourist_sight_tags VALUES (17, 12, 10, '2009-08-26 23:48:25.509518', '2009-08-26 23:48:25.509518');
INSERT INTO tourist_sight_tags VALUES (18, 13, 10, '2009-08-26 23:49:18.901773', '2009-08-26 23:49:18.901773');
INSERT INTO tourist_sight_tags VALUES (20, 14, 10, '2009-08-26 23:51:10.78869', '2009-08-26 23:51:10.78869');
INSERT INTO tourist_sight_tags VALUES (21, 14, 7, '2009-08-26 23:51:10.80561', '2009-08-26 23:51:10.80561');
INSERT INTO tourist_sight_tags VALUES (22, 15, 10, '2009-08-26 23:52:56.265576', '2009-08-26 23:52:56.265576');
INSERT INTO tourist_sight_tags VALUES (23, 15, 7, '2009-08-26 23:52:56.283431', '2009-08-26 23:52:56.283431');
INSERT INTO tourist_sight_tags VALUES (24, 15, 9, '2009-08-26 23:52:56.290072', '2009-08-26 23:52:56.290072');
INSERT INTO tourist_sight_tags VALUES (25, 15, 2, '2009-08-26 23:52:56.298608', '2009-08-26 23:52:56.298608');
INSERT INTO tourist_sight_tags VALUES (26, 15, 3, '2009-08-26 23:52:56.310378', '2009-08-26 23:52:56.310378');
INSERT INTO tourist_sight_tags VALUES (27, 16, 10, '2009-08-26 23:54:11.16934', '2009-08-26 23:54:11.16934');
INSERT INTO tourist_sight_tags VALUES (28, 17, 10, '2009-08-26 23:55:31.82683', '2009-08-26 23:55:31.82683');
INSERT INTO tourist_sight_tags VALUES (29, 18, 10, '2009-08-26 23:56:25.698955', '2009-08-26 23:56:25.698955');
INSERT INTO tourist_sight_tags VALUES (30, 19, 10, '2009-08-26 23:57:31.550806', '2009-08-26 23:57:31.550806');
INSERT INTO tourist_sight_tags VALUES (31, 19, 9, '2009-08-26 23:57:31.567695', '2009-08-26 23:57:31.567695');
INSERT INTO tourist_sight_tags VALUES (32, 19, 3, '2009-08-26 23:57:31.578794', '2009-08-26 23:57:31.578794');
INSERT INTO tourist_sight_tags VALUES (33, 20, 7, '2009-08-26 23:58:29.537384', '2009-08-26 23:58:29.537384');
INSERT INTO tourist_sight_tags VALUES (34, 22, 10, '2009-11-01 16:27:30.296041', '2009-11-01 16:27:30.296041');


--
-- Data for Name: tourist_sight_tips; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO tourist_sight_tips VALUES (1, 24, 1);
INSERT INTO tourist_sight_tips VALUES (2, 27, 2);
INSERT INTO tourist_sight_tips VALUES (3, 28, 3);
INSERT INTO tourist_sight_tips VALUES (6, 41, 6);
INSERT INTO tourist_sight_tips VALUES (5, 32, 5);
INSERT INTO tourist_sight_tips VALUES (7, 48, 8);
INSERT INTO tourist_sight_tips VALUES (8, 49, 9);
INSERT INTO tourist_sight_tips VALUES (9, 50, 10);
INSERT INTO tourist_sight_tips VALUES (10, 59, 11);
INSERT INTO tourist_sight_tips VALUES (11, 70, 12);
INSERT INTO tourist_sight_tips VALUES (12, 71, 13);


--
-- Data for Name: tourist_sights; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO tourist_sights VALUES (23, 'Biblioteca Pública', 'Av. Getúlio Vargas, 389 - Rio Branco - AC, 69900-660 ', '(0xx)68 3223-1210‎', NULL, 'Funciona todos os dias da semana. De segunda a sexta, das 8 às 21 horas; aos sábados, às 10 até 20 horas; e domingos, das 16 até 21 horas', 'Biblioteca Pública: bem-vindo ao mundo do conhecimento. 
Com espaços para todo tipo de informação e público de diferentes idades, nova biblioteca encanta frequentadores ao unir conhecimento e diversão.o espaço foi construído pensando nos jovens que muitas vezes só têm acesso ao ambiente de estudo na escola. "A biblioteca faz parte de um conjunto de bens culturais e tecnológicos que o Governo do Estado vem construindo para garantir o acesso ao conhecimento a todos. O conhecimento é algo fascinante, mas muitas vezes acontece de forma pouco atrativa. Queremos que a Biblioteca Pública seja mais um elemento de uma cidade que está sendo construída em um ambiente de informação. Sua estrutura faz parte de um projeto maior de acesso aos bens culturais." Não importa a sua preferência: literatura, contos, ciências, quadrinhos, desenhos, brincadeiras, música, Internet, ar-condicionado, ar livre, sofá, cadeiras... Na nova Biblioteca Pública você vai sempre achar alguma coisa interessante para fazer. 

', 22, 7, 3, '2009-11-02 19:34:10.705168', '2009-11-02 19:42:54.010778');
INSERT INTO tourist_sights VALUES (47, 'Praia Itapuã', 'bairro Itapuã', '', NULL, 'qualquer hora do dia', 'Esta praia já foi cantada por artistas como Vinícius, que imortalizou a poesia musical de Dorival Caymmi. 
Ela é uma das mais bonitas, com seus pescadores e jangadas, e certamente a mais famosa da capital baiana.
O nome Itapuã significa, em Tupi, "ponta de pedra" ou "pedra que ronca". Antigamente existia no local uma pedra que roncava na maré vazante, antes de se partir.
Itapuã tem o mar verde, com águas limpas, protegido por arrecifes.
Suas areias são claras, há muitas barracas e é cercada por coqueiros.
Antigamente os pescadores da vila local praticavam pesca de baleia, para utilizar o óleo refinado na ilumiação pública. 
A estátua da Sereia de Itapuã está na parte mais antiga da praia.
Nela fica o farol de Itapuã. É procurada para a prática de windsurf.
Em Itapuã foi identificado um ponto de desova para tartarugas marinhas, razão pela qual ali se instalou um posto do Projeto TAMAR, de preservação - e constitui-se em mais um atrativo para esta praia.', 1049, 7, 4, '2009-11-06 14:52:24.266848', '2009-11-06 14:54:56.999029');
INSERT INTO tourist_sights VALUES (74, 'Parque das Pedreiras', 'rua João Gava, no bairro do Pilarzinho.', '41 3355-6071', NULL, 'terça a domingo, das 8 às 21horas.', 'O Parque das Pedreiras é um espaço cultural envolvido por lagos, cascatas e mata de araucárias. Onde a arte humana encontra-se em harmonia com a arte da natureza, formando uma paisagem singular. Lá estão a Ópera de Arame e o Espaço Cultural Paulo Leminski. O Parque das Pedreiras foi inaugurado em 1992, no local de uma antiga pedreira.
A Ópera de Arame é um teatro com capacidade para 2.400 espectadores, construído em estrutura tubular e teto transparente.
', 5042, 7, 2, '2009-11-09 17:18:39.088777', '2009-11-09 17:19:56.190988');
INSERT INTO tourist_sights VALUES (63, 'Horto Florestal - Parque Florestal Antônio de Albuquerque', 'Rua Francisco Candido Xavier, s/n.', '3314-3691 ', NULL, 'De terça a sexta-feira, das 5 h. às 20 h.. Aos sábados, domingos e feriados, das 5h às 21h,', 'Possui uma área verde de 4,5 hectares, com espaço de lazer e várias espécies de árvores nativas e preserva características próprias. Mudou para horto florestal em 1956. Dispõe de biblioteca pública, centro de convivência para idosos, orquidário, espelho d´água com espaço para manifestações culturais, pista de skate, teatro de arena coberto para atividades múltiplas (capacidade para cerca de duas mil pessoas), pista de bicicross e projeto de reflorestamento e paisagismo.Uma ampla reforma foi realizada no parque e sua estrutura atual é resultado de remodelação efetivada em 1996. ', 2728, 7, 3, '2009-11-08 12:11:56.057328', '2009-11-08 12:13:50.207752');
INSERT INTO tourist_sights VALUES (75, 'Memorial de Curitiba', 'Rua Claudino dos Santos, 00', '(41)3321-3327 / (41)3213-7500', NULL, 'de terça a sexta, das 9h às 12h e das 13h às 18h, fins de semana das 9h às 15h', 'O Largo da Ordem abriga uma permanente fonte de humanidade: o Memorial de Curitiba. Um espaço para a arte e o folclore, a informação e a memória, o passado e o futuro. 

Construído num terreno irregular, seu projeto arquitetônico permite a criação de espaços e instalações funcionais e criativas. Sua cúpula, em forma de pintura, evidencia o papel de sementeira cultural da obra', 5042, 7, 2, '2009-11-09 17:28:27.787803', '2009-11-09 17:29:32.547866');
INSERT INTO tourist_sights VALUES (24, 'Memorial dos Autonomistas', 'Avenida Brasil, 216 – Centro ', '(68) 3224-2133', NULL, 'Terça a sexta, das 8 às 18 horas, sábado e domingo das 16 às 21 horas', 'Aos viajantes de carteirinha, apreciadores do turismo histórico, um dos espaços mais visitados em Rio Branco é o Memorial dos Autonomistas, anexo ao Palácio Rio Branco. O Memorial abriga os restos mortais do senador Guiomar Santos e sua esposa Lídia Hammes. Guiomar foi responsável, pelo projeto de Lei de elevação do Acre a estado, em 1957. Foi a partir dessa data que tem início efetivamente a segunda fase do Movimento Autonomista . Forma-se então o Comitê Pró-autonomia acreana para dar base de sustentação ao projeto de Lei. De 1957 a 1962, o Movimento Autonomista ganha muita força e os membros do comitê entram em intensa atividade. 
', 22, 7, 4, '2009-11-02 19:49:50.215297', '2009-11-04 13:55:04.412322');
INSERT INTO tourist_sights VALUES (38, 'IGREJA DE SÃO JOSÉ DE MACAPÁ', 'Av. São José s/n - Bairro Central', '(96) 222 2438', NULL, '', 'É o monumento mais antigo da cidade: sua construção data do século XVIII, com sua torre sineira lateral única, e sua fachada remodelada ao gosto neoclássico. É muito apreciada pela sua simplicidade e beleza da sua arquitetura, trazida pelos jesuítas europeus ainda no século XVI. 

Inaugurada em 6 de março de 1761, algumas modificações foram realizadas na estrutura do prédio após a chegada dos padres do PIME (Pontifício Instituto das Missões Estrangeiras) em 1948. Suas paredes têm lápides, que chamam a atenção dos visitantes por guardarem restos mortais de figuras ilustres do Amapá.
', 60, 7, 5, '2009-11-04 17:20:01.715773', '2009-11-04 22:51:26.018136');
INSERT INTO tourist_sights VALUES (37, 'Parque do Forte', 'Rua Cândido Mendes, s/n- Centro ', '(96) 3212 5118', NULL, 'Das 9 às 18 horas de Terça a Domingo ', 'O Parque do Forte é um audacioso projeto do Governo do Amapá de incentivo ao turismo e a cultura por meio da valorização do patrimônio histórico-cultural do Amapá. O Parque inaugurado em junho de 2006 compreende uma área de 120 mil metros quadrados no entorno da Fortaleza de São José de Macapá. Uma área privilegiada às margens do Rio Amazonas, localizado no centro da capital do Estado, cercado de áreas verdes com espaços de contemplação, parque infantil, chafariz, anfiteatro e calçadão para caminhadas, projetados pela arquiteta e paisagista Rosa Grena Kliass.', 60, 7, 3, '2009-11-04 17:08:06.246382', '2009-11-04 22:51:30.910131');
INSERT INTO tourist_sights VALUES (35, 'Marco Zero', 'Rod Juscelino Kubitschek, s/n Km 0', '', NULL, '', 'Macapa é a única cidade brasileira cortada pela Linha do Equador, portanto, dividida nos hemisférios norte e sul. Exatamente onde passa a linha de latitude zero está construído o monumento Marco Zero(com relógio de sol e terraço para observações), ponto de turismo e lazer que atrai muitas pessoas. Nele, há uma edificação onde podemos visualizar, duas vezes ao ano, o fenômeno do equinócio.Encontra-se a 5 km do centro da cidade de Macapá e pode ser alcançada pela Rodovia Juscelino Kubitscheck.
 
', 60, 7, 3, '2009-11-04 16:40:26.764557', '2009-11-04 22:51:37.640464');
INSERT INTO tourist_sights VALUES (48, 'Praia Villas do Atlântico', 'município de Lauro de Freitas', '', NULL, 'qualquer hora do dia', 'A praia é pouco frequentada durante a semana, porém fica muito movimentada nos finais de semana. Ela possui uma ótima infra estrutura com muitos quiosques. Os frequentadores da praia são de nível social elevado pois muitos moram em condomínios de excelentes casas.

A areia é fina e tem muitas pedras, embora não se forme piscinas naturais. Pratica-se o surf nas boas ondas de Villas do Atlântico. Inclusive um trecho da praia é conhecido localmente por praia dos surfistas.


', 1049, 7, 3, '2009-11-06 14:57:31.625369', '2009-11-06 15:00:35.915111');
INSERT INTO tourist_sights VALUES (42, 'Porto de Manaus', 'Rua Marques de Santa Cruz, 25 - Porto de Manaus/ESC.ARM.10 - CEP. 69.005-050 ', '+55 (92) 2123 4350 ', NULL, '', 'O Porto de Manaus foi inaugurado em 1907. Nesse dia houve uma grande festa em Manaus, pois a cidade vivia o apogeu da Época Áurea da Borracha, com grande progresso econômico. 

É considerado o Porto mais original do Brasil. Construído em um cais flutuante, ele acompanha o nível das águas do rio Negro, em épocas de grande cheias. Sua estrutura permite receber vários navios de qualquer tamanho, mesmo durante as grandes vazantes. Logo que foi inaugurado chegaram os paquetes ingleses, italianos, franceses e alemães. Eles transportavam mercadorias e passageiros. O porto passou a ser o principal ponto turístico da época e recebia navios de luxo da Lamport, da Boat Line e outros. Também saiam do porto de Manaus embarcações com borracha, castanha, madeira, produtos de exportação da época', 44, 7, 4, '2009-11-05 11:34:25.900069', '2009-11-06 16:20:00.933551');
INSERT INTO tourist_sights VALUES (39, 'Casa do Artesão', 'Av. Azarias Neto s/n- Bairro Central', '(96) 212 9156', NULL, '', 'É o maior centro do artesanato amapaense. Seu principal objetivo é fomentar a atividade artesanal no Estado e promover a geração de trabalho e renda para os artesãos locais, possibilitando assim, a exposição e a comercialização de seus produtos. O artesanato indígena também está presente, representado pelos trabalhos dos povos Waiãpi, Karipuna, Palikur, Galibi, Apari, Waina, Tirió e Kaxuiana. Na confecção das peças são utilizados vime, madeira, argila, fibra vegetal, sementes, penas, entre outros elementos retirados da natureza, sem impactar o meio ambiente
', 60, 7, 4, '2009-11-04 17:25:35.10463', '2009-11-06 16:20:05.414028');
INSERT INTO tourist_sights VALUES (20, 'Parque Nacional de Brasilia Água Mineral', 'Rodovia BR - 040 - SMU - Via EPIA', '(61) 3465-2013', NULL, 'Diariamente, das 8h às 16h', 'A apenas 10 km do centro do Plano Piloto há uma paisagem inimaginável em qualquer grande cidade: um espaço com nada menos que 30 mil hectares de árvores, trilhas e duas piscinas naturais de águas cristalinas. É o Parque Nacional de Brasília, mais conhecido como Água Mineral. Quando o assunto é qualidade de vida, este é um dos destinos preferidos dos moradores da capital.

Não faltam opções de lazer. Uma boa dica é começar o dia com um banho relaxante nas piscinas de água mineral. Depois, quem gosta de caminhada pode escolher uma das duas trilhas: a da Capivara, com duração de 20 minutos (1,3 km) ou a do Cristal Água, que pode ser feita em 1 hora (5 km). Ao final do passeio, o melhor é apreciar a vista da Chapada da Contagem, a Depressão do Paranoá e a Encosta da Contagem. Também dá para recarregar as energias num piquenique ao ar livre

O parque tem uma fauna com mais de 300 espécies de pássaros – como ema, seriema e tucano – e alguns animais em extinção, entre eles o lobo-guará, o tamanduá bandeira e o tatu canastra. Se você quer conhecer melhor as espécies nativas da flora e da fauna do cerrado, visite o museu que fica no Centro de Visitantes do local.', 2975, 1, 7, '2009-08-26 23:58:12.709254', '2009-11-01 16:13:21.459343');
INSERT INTO tourist_sights VALUES (64, 'Museu de Arte Contemporânea (Marco)', 'Rua Antônio Maria Coelho, 6000 - Parque das Nações Indígenas', '(67)3326-7449', NULL, 'De segunda a sexta, das 12 h às 18 h. Sábados, domingos e feriados, das 14 h às 18 h.', 'O Marco fica dentro do Parque das Nações Indígenas. A entrada para o museu é pela Rua Antônio Maria Coelho, 6000. Quem for de ônibus pode descer na entrada do Parque na Av. Afonso Pena e ir andando até o museu. Quem for de carro conta com um grande estacionamento. O museu tem um belo acervo, de mais de 800 peças. O curador do local, o artista plástico Humberto Espíndola, promove exposições reunindo artistas regionais, nacionais e internacionais. (A única capital brasileira a ver as tapeçarias de Violeta Parra foi Campo Grande, por exemplo, no Marco.) Vale uma visita ao museu sempre, independentemente da programação.', 2728, 7, 2, '2009-11-08 12:18:07.931578', '2009-11-08 12:20:44.620755');
INSERT INTO tourist_sights VALUES (33, 'Praia da jatiúca', 'A 4 quilômetros do Centro, continuação da Praia Ponta Verde', '', NULL, 'qualquer hora do dia.', 'É uma praia de mar agitado frequentemente usada para campeonatos de surfe. É localizada na região central e contém bares, barracas de praia com chuveiros, pista de cooper e ciclismo, shoppings centers, hotéis. Abriga competições esportivas nos finais de semana, principalmente campeonatos de surf. As águas calmas possuem um verde acentuado e o local é uma continuação da Praia de Ponta Verde, na direção norte. 

O nome vem do tupi Yatiuca, que significa carrapato. Antigamente, era comum o fruto da carrapateira na região, daí a denominação. Cercada por barracas, a praia é ótima para a pesca. 
a maior atração é o passeio de jangada até a piscina natural que se forma na maré baixa entre arrecifes e bancos de areia, à 02 km da costa de Maceió. Nos finais de semana, Pajuçara ganha bares flutuantes, que servem bebidas e tira-gosto. ', 632, 7, 3, '2009-11-04 15:41:15.031124', '2009-11-05 19:14:35.985446');
INSERT INTO tourist_sights VALUES (76, 'Museu Ferroviário de Curitiba', 'Shopping Estação', '(41) 2101-9202', NULL, 'De terça a sábado, das 10h às 18h. Domingo, das 11h às 19h', 'O museu foi fundado em 1982 e ainda mantém intactas as partes da arquitetura do local além do mobiliário e peças que colaboram para o resgate da memória ferroviária. 

É possível conhecer um pouco mais da história das ferrovias no Paraná, que iniciou em 1885, quando foi inaugurado o trecho ferroviário entre Paranaguá e Curitiba. 

Com mais de 600 peças, o acervo do museu possui itens como um livro utilizado para a contabilidade da antiga estação e outras peças históricas como os relógios, telefones e telégrafos que eram utilizados na Estação, além de objetos que ficavam no interior dos trens, como bagageiros, fechaduras e luminárias da época, além de uma réplica de locomotiva a vapor. 

Um acervo constituído por recortes de jornais e livros sobre as ferrovias está à disposição dos visitantes para ser consultado.
', 5042, 7, 2, '2009-11-09 17:38:18.537609', '2009-11-09 17:41:03.563691');
INSERT INTO tourist_sights VALUES (26, 'Passarela Joaquim Macedo', 'Centro, Rio Branco (AC).', '', NULL, 'A qualquer hora do dia.', 'A passarela Governador Joaquim Macedo, em Rio Branco, foi inaugurada há dois anos e hoje é um dos principais cartões-postais da capital do Acre. A obra simboliza as transformações urbanas pela qual a cidade vem passando desde o início dos anos 2000.A passarela estaiada (onde a estrutura da ponte é fixada através de cabos) tem 200 metros de extensão e 5,50 metros de largura. Usada exclusivamente por pedestres e ciclistas, a ponte cruza o rio Acre unindo o Centro da cidade ao bairro do Segundo Distrito.
Segundo o Detran, cerca de 10 mil pessoas cruzavam o rio diariamente, mas antes tinham que dividir a passagem com automóveis motos e caminhões na duas antigas pontes que cruzam o rio. Agora, com uma passarela exclusiva, os acreanos além de ganharem em mobilidade têm um belo monumento.
', 22, 7, 4, '2009-11-02 20:13:33.464212', '2009-11-04 13:56:12.667606');
INSERT INTO tourist_sights VALUES (22, 'Academia Brasileira de Letras', 'Avenida Presidente Wilson, 203, bairro Centro', '(21) 3979-2500', NULL, 'Há visitas guiadas gratuitas às segundas, quartas e sextas-feiras, às 14h e às 16h. A biblioteca funciona de segunda a sexta-feira, das 9h às 18h, e o Espaço Cultural Machado de Assis, das 13h às 18h', 'Cópia do Petit Trianon de Paris, foi construída para abrigar o pavilhão da França na Exposição Internacional do Centenário da Independência do Brasil. No anexo funciona o Espaço Cultural Machado de Assis, com objetos do escritor – um dos fundadores da academia. Possui também uma biblioteca com 90 mil volumes', 3998, 2, 4, '2009-11-01 16:27:17.454726', '2009-11-04 23:59:08.421686');
INSERT INTO tourist_sights VALUES (77, 'Praça do Japão', 'Fica entre as avenidas Sete de Setembro e República Argentina, Água Verde.', '3264-5474 ', NULL, ' de terça a domingo, das 9 às 12h e das 14h às 18h.', 'Numa área bem arborizada de 14 mil m², no bairro de Água Verde, está a Praça do Japão. Uma homenagem à imigração japonesa em Curitiba. Seu projeto foi iniciado em 1958 e a Praça concluída em 1962. Uma reforma, em 1993, incluiu o Portal Japonês e o Memorial da Imigração Japonesa.

A Praça do Japão segue as linhas tradicionais dos jardins japoneses. Possui lago de carpas, 30 cerejeiras enviadas do Japão, cerimônia de chá (às quintas) e museu.

', 5042, 7, 2, '2009-11-09 17:54:00.149797', '2009-11-09 17:57:10.894079');
INSERT INTO tourist_sights VALUES (4, 'Complexo Cultural da República João Herculino', 'Setor Cultural Sul, Lote 2, próximo à Rodoviária do Plano Piloto - Zona 0', '(61) 3325-6410', NULL, 'Museu - Terça a domingo, das 9h às 18h30 / Biblioteca – Ligar para agendar', 'Depois de quase meio século, saíram do papel dois projetos de Oscar Niemeyer desenhados na época da construção de Brasília. No final de 2006, foram inaugurados o Museu Nacional Honestino Guimarães e a Biblioteca Nacional Leonel de Moura Brizola, que integram o Complexo Cultural da República João Herculino. 

Construídos numa área de 91,8 mil metros quadrados, os espaços são mais uma opção de lazer cultural gratuito. O museu foi criado para abrigar exposições de arte e oficinas de restauração de pinturas e esculturas. Fique atento à agenda de mostras e cursos. No formato de oca e cercado por uma passarela, o prédio em si já é uma obra de arte. 

A biblioteca, com acervo ainda em formação, tem estrutura para se tornar uma das mais modernas do País, principalmente no quesito inclusão digital. Comporta mais de 500 mil volumes impressos e 200 microcomputadores com acesso à internet e aos acervos de outras bibliotecas brasileiras.', 2975, 1, 7, '2009-08-26 23:36:54.989795', '2009-10-17 00:36:39.565843');
INSERT INTO tourist_sights VALUES (29, 'Casa dos Povos da Floresta', 'Parque da Maternidade, Setor B', ' 3224 5668 e 3224 5667. ', NULL, '2ª a 6ª feira de 8h às 18h e sábados e domingos de 16h às 21h.', 'Teve sua construção inspirada nas malocas indígenas e constitui-se num espaço de valorização cultural dos povos indígenas, seringueiros e ribeirinhos. Possui um acervo de livros, revistas, publicações e documentos, sala de vídeo e peças artesanais indígenas. Com uma programação especial que envolve visitas guiadas e exposição sobre a história dos povos indígenas do Acre, a Casa dos Povos da Floresta comemora o Dia do Índio (19) compartilhando com a comunidade escolar o conhecimento cultural das 14 etnias existentes no Estado. O diferencial é que entre os atores envolvidos na programação estão representantes indígenas', 22, 7, 3, '2009-11-02 20:40:37.170852', '2009-11-04 03:04:19.819741');
INSERT INTO tourist_sights VALUES (28, 'USINA DE ARTES JOÃO DONATO', 'Avenida das Acácias, nº. 1, zona A - Distrito Industrial.', '(68) 3229-6892', NULL, '', 'Surgiu dos escombros da velha usina de beneficiamento de castanha, que foi abandonada por mais de uma década, sendo transformada em uma escola de artes onde são oferecidas oficinas de música, artes cênicas e cinema. O antigo galpão da usina hoje dispõe de teatro, salas de aula, salas de exposição, restaurante e biblioteca. ', 22, 7, 6, '2009-11-02 20:28:54.333453', '2009-11-04 12:15:57.132189');
INSERT INTO tourist_sights VALUES (44, 'Encontro das Águas', 'Parque Ecológico do Janauary', '', NULL, '', 'O Encontro das Águas é um fenômeno que acontece na confluência entre o rio Negro, de água preta, e o rio Solimões, de água barrenta, onde as águas dos dois rios correm lado a lado sem se misturar por uma extensão de mais de 6 km. É uma das principais atrações turisticas da cidade de Manaus.

Esse fenômeno acontece em decorrência da diferença entre a temperatura e densidade das águas e, ainda, à velocidade de suas correntezas: o Rio Negro corre cerca de 2 km/h a uma temperatura de 22°C, enquanto que o Rio Solimões corre de 4 a 6 km/h a uma temperatura de 28°C.

Há dezenas de agências de turismo que oferecem o passeio à região, em roteiros que costumam incluir uma volta pelos igarapés da região. Se o passeio for feito em um barco pequeno, o visitante pode pôr a mão na água durante a travessia de um lado para o outro das águas, e sentir que os rios têm temperaturas diferentes.

No período do rio cheio que vai de janeiro a julho é a melhor epoca para fazer um passeio para observar o encontro das águas, uma vez que as saidas dentre os igarapés são em canoas motorizadas. Pode-se entrar nos furos e braços de rios e ter a possibilidade de ver animais como: pássaros, macacos e preguiças.

O passeio sempre é realizado no Parque Ecológico do Janauary, onde também pode-se observar e tirar fotos das plantas aquáticas Vitórias-Régias. No final do paseio é em um restaurante flutuante, com a comida tipica amazonense. Está em construção uma plataforma de observação do encontro projetada por Oscar Niemeyer.

', 44, 7, 4, '2009-11-05 15:08:43.894708', '2009-11-06 15:45:03.305819');
INSERT INTO tourist_sights VALUES (10, 'Jardim Zoológico de Brasília', 'Av. das Nações - Via L4 Sul', '(61) 3345-3280', NULL, 'De terça-feira a domingo, das 9h às 17h', 'Um dos mais conhecidos do Brasil, o Jardim Zoológico de Brasília tem ambientes semelhantes aos de selvas e florestas. Numa área de 140 hectares, lagos, ilhas, pátios e muitas árvores tentam imitar o habitat natural de mais de 250 espécies – aproximadamente 1.300 animais. Nesta variedade, estão bichos exóticos, como o faisão, e outros ameaçados de extinção, como a jaguatirica.

Mas o maior diferencial do zôo é seu caráter interativo e educacional. Durante o passeio pelo parque, é possível alimentar alguns bichinhos. Você também pode aproveitar o cenário para montar um piquenique e até fazer um churrasco nas áreas apropriadas. Só não é permitido levar bebida alcoólica.

Estudantes entre 12 e 17 anos, filhos de comerciários, podem participar de um programa de acampamento ecológico. Lá, eles aprendem na prática sobre o meio ambiente (saiba mais aqui). Outra boa opção de ensino são as visitas monitoradas, que levam a sala de aula ao zoológico.

Inaugurado em 1957, o Zoológico de Brasília é bem mais que um lugar de visitação. A estrutura do local inclui teatro de arena, auditório, biblioteca e museu e laboratório de taxidermia. Ao seu lado está o Santuário de Vida Silvestre do Riacho Fundo e o Parque das Aves. Os três espaços são administrados pela Fundação Pólo Ecológico de Brasília - FunPEB.', 2975, 1, 7, '2009-08-26 23:46:16.386106', '2009-10-17 00:36:40.346479');
INSERT INTO tourist_sights VALUES (18, 'Legião da Boa Vontade-LBV', 'SGAS 915 Lotes 75/76', '(61) 3245-1070', NULL, 'Todos os dias, em qualquer horário', 'Esqueça dogmas ou extremismos religiosos. O Templo da Boa Vontade não foi feito para um grupo específico. Ao contrário: desde que foi inaugurado, em 1989, seu objetivo é ser o ponto de encontro da espiritualidade, cultura, arte, ecologia e medicina espiritual. O prédio foi construído pela Legião da Boa Vontade (LBV).

Com 21 metros de altura, essa pirâmide de sete faces é o local mais visitado pelos turistas em Brasília. E não é apenas pelo caráter de ecumenismo irrestrito, sem santos ou divindades nos altares. No ápice da obra, um cristal puro de 21 quilos ilumina o ambiente. Considerada por muitos a maior do mundo, esta jóia deixa qualquer um boquiaberto.

Quando for ao templo, não deixe de fazer o caminho da peregrinação. Basta tirar os sapatos e seguir a espiral de pedras negras desenhada no piso. Quando chegar ao centro, toque o círculo de cobre e levante as mãos para o alto. Dizem que este ritual atrai boas energias. Para se purificar, retorne pelas pedras brancas e, no final, tome um gole de água da fonte – que faz o mesmo percurso da espiral, mas por baixo da terra.

Além da meditação, você também pode visitar os espaços anexos à pirâmide, onde estão uma galeria de arte, o Memorial Alziro Zarur, a Sala Egípcia, o Salão Nobre, os jardins subterrâneos e o Parlamento Mundial da Fraternidade Ecumênica, construído em 1994 para abrigar conferências da LBV.', 2975, 1, 6, '2009-08-26 23:56:16.844433', '2009-10-17 00:36:42.043233');
INSERT INTO tourist_sights VALUES (19, 'Torre de televisão', 'Eixo Monumental – Lado Oeste – Canteiro Central', '(61) 3322-6611', NULL, 'Todos os dias, das 9h às 18h', 'Para entender o Plano Piloto, pegue um mapa de Brasília e vá ao mirante da Torre de televisão. De uma plataforma de 75 metros de altura, é possível ver o eixo e as asas do avião que dá forma à cidade. No meio da planície, o destaque é a Esplanada dos Ministérios, com o Congresso Nacional ao fundo.

Projetada por Lúcio Costa para transmitir sinais de rádio e TV com alta qualidade, a torre é hoje um dos principais pontos turísticos da cidade. Não à toa: seus 224 metros de comprimento a tornam uma das mais altas estruturas do gênero na América Latina. Aos sábados e domingos, a tradicional feirinha de comidas e artesanatos lota o pátio ao redor da torre desde 1970.

Para subir ao mirante, não se preocupe com o cansaço, pois há um elevador à sua disposição. Antes de chegar ao ponto mais alto, você pode visitar o Museu Nacional de Gemas. Instalado na plataforma mais baixa da torre, a 25 metros do chão, o local guarda uma enorme variedade de pedras brasileiras, preciosas e semi-preciosas.', 2975, 1, 5, '2009-08-26 23:57:20.159541', '2009-10-17 00:36:43.684428');
INSERT INTO tourist_sights VALUES (17, 'Teatro Nacional', 'Setor Cultural Norte – Via N2', '(61) 3325-6105', NULL, 'Segunda a sexta-feira, das 15h às 17h30', 'Inaugurado em março de 1979, o Teatro Nacional Claudio Santoro é um projeto de Oscar Niemeyer e tem influência da arquitetura asteca. As obras, que começaram em 1960, foram realizadas em etapas. Enquanto o teatro não estava concluído, o local serviu de palco para concursos de beleza, bailes de carnaval, missas e eventos esportivos. Hoje, o teatro é o maior complexo da cidade destinado às artes. Além das salas de espetáculos Martins Pena, Alberto Nepomuceno e Villa-Lobos, o espaço conta ainda com uma galeria de artes plásticas. Ao visitar o local, fique atento aos jardins e às esculturas – “O Contorcionista”, de Alfredo Ceschiatti, e “O Pássaro” – que dão um toque especial ao ambiente. Em forma de pirâmide, o teatro também é espaço para boatos assombrados. Dizem que, durante a madrugada, funcionários já ouviram vozes e sons dos pianos das salas.', 2975, 1, 6, '2009-08-26 23:55:25.254333', '2009-10-23 19:12:31.56806');
INSERT INTO tourist_sights VALUES (6, 'Congresso Nacional', 'Praça dos Três Poderes', '(61) 3216-1771', NULL, 'Todos os dias do ano, inclusive feriados, das 9h às 17h (visitas guiadas de 30 em 30 minutos, a partir de 9h30).', 'Cartão postal de Brasília, o Congresso Nacional é mais do que a sede do Poder Legislativo. Símbolo da arquitetura de Oscar Niemeyer, a obra se destaca na paisagem plana e organizada da cidade. Além da beleza, o desenho do projeto desafiou os engenheiros da época.

No final dos anos de 1950, a sustentação de duas enormes cúpulas exigiu semanas de cálculos complexos. O trabalho de muitos profissionais deu forma côncava ao plenário do Senado Federal e convexa ao plenário da Câmara dos Deputados.

Nas duas torres do edifício central ficam as áreas administrativas e técnicas do Congresso. A altura dos prédios ilustra a importância e a representatividade do local: com 28 andares ou 100 metros de comprimento, eles foram projetados para serem sempre os mais altos da capital federal.

Diariamente, são realizadas visitas monitoradas ao Congresso Nacional. Não deixe de passar pelos Salões Negro, Verde e Nobre, os plenários e as galerias. Se der sorte, você pode assistir a uma sessão da Câmara ou do Senado e até encontrar o seu candidato das últimas eleições. Do lado de fora, os jardins projetados por Burle Marx são uma atração a parte. Valem a pena conhecer.', 2975, 1, 6, '2009-08-26 23:40:12.225722', '2009-10-17 00:37:00.072373');
INSERT INTO tourist_sights VALUES (5, 'Concha Acústica', 'Orla do Lago Paranoá - Setor de Hotéis e Turismo Norte', '(61) 3306-1065', NULL, 'Todos os dias, das 8h às 19h', 'Quem passa pelas margens do Lago Paranoá fica admirado com as formas da Concha Acústica. Projeto de Oscar Niemeyer inaugurado em 1969, o desenho parece se integrar perfeitamente à paisagem natural da região.

Mas é ao assistir a um espetáculo no local que se percebe o valor da obra. Numa área de mais de 8 mil m², o som da voz humana pode ser ouvido por até 10 mil pessoas, sem necessidade de amplificação. Isso porque o palco, localizado num nível inferior ao da platéia, tem concha acústica com 42 metros de comprimento e 5 metros de altura na parte mais elevada.

Torça para estar em Brasília em dia de espetáculo na Concha. Se isso não acontecer, você mesmo pode testar a acústica do local.', 2975, 1, 5, '2009-08-26 23:38:09.410923', '2009-10-17 00:37:03.275777');
INSERT INTO tourist_sights VALUES (30, 'Praia Cruz das Almas', 'fica localizada na saída norte da cidade pela rodovia estadual Al. 101/Norte', '', NULL, 'qualquer hora do dia', 'localizada num antigo cemitério indígena carregada de misticismo. Segundo o que dizem, Cruz das Almas teve origem quando um casal de índios de tribos rivais viveu uma paixão proibida e, por isso, foi morto e enterrado naquela região.Possui ondas fortes, ótima para a pesca com linha de vara e sendo uma maravilha para os surfistas durante o dia e durante a noite se transforma num esplendido cenário para casais de namorados. Praia muito freqüentada por moradores do bairro e por condôminos de conjuntos habitacionais mais próximos. Esta praia é dividida em duas partes, sendo uma mais deserta e outra urbanizada, com barracas de serviços, restaurantes e opções de hospedagem', 632, 7, 5, '2009-11-04 13:20:57.734471', '2009-11-05 09:34:14.337608');
INSERT INTO tourist_sights VALUES (7, 'Ermida Dom Bosco', 'SHDB – Parque Dom Bosco – QL 30', '(61) 3367-4505', NULL, '', 'A pequena igreja às margens do Lago Paranoá foi construída em homenagem ao santo São João Melchior Bosco. Reza a lenda que Dom Bosco sonhou com a criação de uma cidade onde hoje está localizada Brasília.

Projetada por Oscar Niemeyer e inaugurada em 1957, a Ermida Dom Bosco foi erguida em um pequeno morro, o que garante uma vista vislumbrante. Ao seu redor, um jardim transmite paz aos visitantes.

A Ermida faz parte de uma parque de preservação ecológica onde, também em homenagem ao santo, foi inaugurada em 2006 a Capela Dom Bosco. Igualmente bela, a obra tem um altar para a celebração de missas.

Se tiver disposição, aproveite a ida ao local para fazer trilhas e caminhadas pelo parque. O pôr-do-sol é uma atração à parte.', 2975, 1, 5, '2009-08-26 23:41:48.462913', '2009-10-17 00:37:04.719329');
INSERT INTO tourist_sights VALUES (65, 'Museu de Arte da Pampulha', ' Avenida Dr Otacílio Negrão de Lima,16.585', ' (031) 3277-7946/3277-7953/3277-', NULL, 'de terça a domingo até 19h', 'Localizado no conjunto arquitetônico da Pampulha, projetado por Oscar Niemeyer (1907) entre 1942 e 1944, o Museu de Arte da Pampulha - MAP é inaugurado em 1956 no edifício onde funciona um cassino, que, com a proibição do jogo no país em 1946, fecha suas portas. O projeto de criação de um museu de arte moderna e contemporânea em Belo Horizonte visa atualizar culturalmente a capital mineira, que nos anos 1940 e 1950 assiste à significativa expansão física e populacional. Além de novos bairros - por exemplo, a Pampulha e Cidade Jardim, zonas residenciais de elite - o período conhece a instituição da Cidade Universitária (1944/1951) e de um distrito industrial, batizado de Cidade Industrial. Do ponto de vista artístico, a experiência da Escola Guignard, dirigida por Guignard (1896 - 1962), funciona como um espaço catalisador da produção local e formador de gerações de artistas plásticos de renome, como Amilcar de Castro (1920 - 2002), Farnese de Andrade (1926 - 1996), Franz Weissmann (1911 - 2005), Mary Vieira (1927 - 2001), Maria Helena Andrés (1922), Mário Silésio (1913 - 1990), entre muitos outros. A renovação cultural na época pode ser também aferida pelos projetos arquitetônicos de Eduardo Mendes Gusmão e Sylvio Vasconcellos e pelas revistas Edifício e Arquitetura e Engenharia, que dinamizam os debates sobre urbanismo, arte e arquitetura. A modernização do teatro com João Ceschiatti, João Etienne Filho e Pontes de Paula Lima, e a criação do Centro de Estudos Cinematográficos e da Revista de Cinema são outras iniciativas que permitem aferir a temperatura artística na cidade. Em relação às artes plásticas, destaca-se a 1ª Exposição de Arte Moderna, em 1944, com a participação de artistas de várias regiões do Brasil.

', 3828, 7, 2, '2009-11-08 16:15:17.196985', '2009-11-08 16:16:54.340324');
INSERT INTO tourist_sights VALUES (31, 'Praia do Sobral ', 'localizada no bairro Sobral', '', NULL, 'qualquer hora do dia.', 'é uma das mais belas praias antes de chegar ao centro de Maceió. O mar da praia do sobral é mais bravo sendo ótimo para prática de surf. Possui areia branca e fina ideal para futebol de areia. A praia do sobral é bastante utilizada para campeonatos de surf e futebol de areia. Continuação da Praia da Avenida, Sobral fica localizada no bairro de mesmo nome.', 632, 7, 3, '2009-11-04 13:41:48.87798', '2009-11-06 09:11:25.638104');
INSERT INTO tourist_sights VALUES (11, 'Memorial dos Povos Indígenas', 'Eixo Monumental Oeste – Praça do Buriti', '(61) 3344-1155', NULL, 'Terça a sexta-feira, das 9h às 18h; sábados, domingos e feriados, das 10h às 18h', 'Em pleno Eixo Monumental uma construção na forma de espiral guarda a história de quem habitavam o território brasileiro antes da chegada dos portugueses. O Memorial dos Povos Indígenas foi inspirado nas malocas dos índios e em suas tradições. Por isso, ao projetar o museu, Oscar Niemeyer criou um pátio no meio do prédio e sugeriu que lá fossem realizados os eventos da casa, assim como os rituais no centro de uma aldeia.

Quando for visitar o memorial, não deixe de consultar a programação de atividades. Se der sorte de estar em Brasília no Dia do Índio, 19 de abril, você poderá conferir uma programação especial, com apresentações de tribos nacionais e, quem sabe, internacionais.

A riqueza e a diversidade da cultura indígena também podem ser conhecidas a partir do acervo do local, um dos mais valiosos do Brasil. Entre outras peças está nada menos que uma coleção etnográfica, com 382 peças, doada pelos antropólogos Darcy e Berta Ribeiro. A coletânea inclui exemplares da plumaria Urubu-Kaapor, reunidas durante quase 40 anos de pesquisa de campo.

Embora hoje o museu seja uma das principais referências nacionais sobre a cultura indígena, por anos sua existência foi posta em cheque. Em 1987, logo que a construção ficou pronta, o prédio não foi inaugurado para sua finalidade inicial e passou a ser um museu de arte moderna.

Somente depois de muitas manifestações e de fechar as portas diversas vezes, em 1999 o espaço se tornou, definitivamente, o Memorial dos Povos Indígenas. Essa conquista foi motivada por um fato que você deve lembrar: dois anos antes, alguns jovens haviam queimado o índio Gaudino Pataxó. O corpo dele foi velado no museu e serviu de alerta para a necessidade de criar uma cultura de respeito aos índios.', 2975, 1, 5, '2009-08-26 23:47:21.780769', '2009-10-17 00:37:06.86337');
INSERT INTO tourist_sights VALUES (15, 'Pontão do Lago Sul', 'SHIS, QL10, LT. 1/33 - Pontão do Lago Sul', '(61) 3364-0580', 'pontao@pontaodolagosul.com.br', '', 'Conhecido pela bela paisagem, o Pontão do Lago Sul é um dos locais mais frequentados por quem procura bons restaurantes e um clima praiano.

Situado às margens do Lago Paranoá e próximo à ponte Lúcio Costa, o Pontão é parada obrigatória para aqueles que querem conhecer Brasília. Além da praça gastronômica, há também feiras de artesanato, shows musicais e parques para crianças.

Algumas pessoas aproveitam o lago artificial para praticar esportes náuticos ou passear de lancha. À noite, a iluminação dá um charme especial ao Pontão – lugar ideal para relaxar depois de um dia de trabalho.

Inaugurado em abril de 2002, o espaço com 134 mil m² e recebe cerca de 120 mil visitantes por mês. Apesar do grande movimento, não se preocupe com estacionamento: são 1,5 mil vagas.', 2975, 1, 5, '2009-08-26 23:52:39.78083', '2009-10-17 00:37:07.578608');
INSERT INTO tourist_sights VALUES (3, 'Centro de Convenções Ulysses Guimarães', 'Eixo Monumental - SDC (Setor de Divulgação Cultural), entre a Torre de TV e o Memorial JK', '(61) 3325-6378', NULL, 'Segunda a sexta-feira, das 9h às 12h e das 14h às 18h', 'De frente para a Esplanada dos Ministérios e a poucos minutos do núcleo das decisões políticas e econômicas, está um dos mais modernos espaços para eventos do País. Reinaugurado em 2005 após uma grande reforma, o Centro de Convenções Ulysses Guimarães tem 54 mil m² de área total. É três vezes maior do que o prédio original, construído na década de 1970.

Com capacidade para receber quase 10 mil pessoas e adaptado para portadores de necessidades especiais, o local vem sendo eleito sede de importantes encontros nacionais e internacionais. A escolha é fácil de explicar: vizinho dos três poderes, o Centro está a 15 minutos do aeroporto e ao lado do setor de hotéis. Além disso, a localização estratégica de Brasília, no centro do País, agiliza o acesso a partir de outros estados.

O edifício é dividido em alas, o que permite a realização de diferentes eventos ao mesmo tempo. Exposições e feiras podem acontecer tanto na área climatizada da ala Sul quanto no vão livre da ala Oeste. Do outro lado, quatro auditórios abrigam palestras ou apresentações de teatro e cinema. O auditório principal, que pode receber até 3 mil pessoas, fica na ala Norte. Veja as plantas do local.

O Centro de Convenções Ulysses Guimarães tem ajudado Brasília a fortalecer sua vocação para o turismo de negócios. Confira a agenda de eventos. Com um projeto arquitetônico ousado, o espaço também se tornou uma atração para qualquer visitante da capital.', 2975, 1, 5, '2009-08-26 23:34:54.482235', '2009-10-17 00:37:08.384314');
INSERT INTO tourist_sights VALUES (16, 'Santuário Dom Bosco', 'W3 Sul, Quadra 702', '(61) 3223-6542', 'contato@santuariodombosco.org.br', 'As cerimônias acontecem às 7h e às 18h, de segunda a sábado, e às 8h, às 11h, às 18h e às 19h30, no domingo', 'O Santuário Dom Bosco é mais uma homenagem ao padroeiro da cidade, o santo São João Melchior Bosco. Projeto de Carlos Alberto Naves, aluno de Oscar Niemeyer, a igreja tem 80 colunas estilo Brise Soleil que se fecham em arcos góticos.

Um dos destaques do santuário é o lustre central, formado por 7,4 mil peças de vidro murano, 180 lâmpadas e com peso aproximado de 3 toneladas. As portas descrevem a vida de Dom Bosco – que teve um sonho premonitório com a construção de Brasília. Para manter a igreja limpa, o pároco conta com a ajuda dos fiéis, que se organizam em mutirão a cada dois anos.

Quem quiser assistir a uma missa deve se programar para não perder os horários. A igreja tem capacidade para 1,2 mil pessoas. ', 2975, 1, 8, '2009-08-26 23:54:02.803854', '2009-10-23 07:43:19.320853');
INSERT INTO tourist_sights VALUES (12, 'Palácio da Alvorada', 'Via Presidencial', '(61) 3411-2042', NULL, '', 'Construído para ser a residência oficial do presidente, o Palácio da Alvorada foi inaugurado em 1958. O projeto de Oscar Niemeyer ficou pronto em apenas sete meses e tornou-se um marco da arquitetura moderna.

Grandioso em tamanho e beleza, o Palácio é formado por colunas de mármore em forma de avião, que parecem tocar levemente o solo. Entre jardins, piscina olímpica, residência e anexos, somam-se 7 mil m² de área total. Nos 800 m² construídos para uso do Presidente estão a suíte do casal, com 120 m², e a biblioteca, com 150 m².

Apesar de não ser aberto para visitação, vale a pena conhecer a parte externa do edifício. Uma boa dica para quem gosta de fotografia é ir no final da tarde: a paisagem fica ainda mais bonita com o pôr-do-sol.

Além da arquitetura, outra grande atração é o famoso “Poço dos desejos”. Lembre-se de fazer o seu pedido e jogar uma moeda no canal. ', 2975, 1, 6, '2009-08-26 23:48:18.505998', '2009-11-09 19:33:16.824628');
INSERT INTO tourist_sights VALUES (66, 'Casa do Baile', 'Avenida Otacílio Negrão de Lima, 751 ', '(31) 277.7443', NULL, 'De terça a domingo, das 09 às 19 horas', 'Parte do Conjunto Arquitetônico da Pampulha, a Casa do Baile foi reaberta em dezembro de 2002, transformando-se em Centro de Referência de Urbanismo, Arquitetura e do Design, ligado à Fundação Municipal de Cultura que por sua vez é ligada à Prefeitura de Belo Horizonte.

A proposta deste centro é a de organizar, documentar e valorizar tanto os espaços construídos e simbólicos da cidade quanto objetos que se tornaram referência na vida cotidiana de nossa sociedade. Para tanto, o acesso democrático às informações relativas ao urbanismo, arquitetura e design torna-se fundamental para a valorização da identidade social dos belohorizontinos.

A Casa recebe exposições temporárias, a divulga publicações, desenvolve seminários, encontros e outros eventos relacionados às áreas pertinentes à Casa. Possui um salão de 255m2, um auditório de 53 lugares com recursos multimídia, salas de apoio administrativo, ilha digital com os acervos documentais disponíveis a pesquisadores e ao público em geral.
', 3828, 7, 2, '2009-11-08 16:23:20.35794', '2009-11-08 16:24:53.201927');
INSERT INTO tourist_sights VALUES (60, 'Parque das Nações Indígenas', 'Av Afonso Pena, 6519', '(67)3326-2254 ', NULL, '3ª a domingo das 6h às 21h', 'É considerado um dos maiores parques (dentro de um perímetro urbano) do mundo[1], com uma extensão de 119 hectares. Oferece infra-estrutura adequada para a prática de lazer, diversão e esporte. Dispõe de quadra de esportes, pátio para skate e patins, sanitários, pista asfaltada para caminhada de quatro mil metros, lanchonetes, policiamento e um grande lago formado próximo à nascente do córrego Prosa. Dispõe também de local para apresentações, Museu do Índio, Museu de Arte Contemporânea, Museu de História Natural, além do Monumento do Índio.

70% de sua vegetação é formada por gramas e árvores ornamentais originárias do seu projeto de paisagismo. Uma grande quantidade de espécies de árvores são preservadas, como por exemplo o jenipapo, a mangueira e a aroeira.
', 2728, 7, 3, '2009-11-08 11:30:59.856242', '2009-11-09 22:41:11.743446');
INSERT INTO tourist_sights VALUES (32, 'Praia da Ponta Verde', 'Localizada logo após a Praia de Pajuçara', '', NULL, 'qualquer hora do dia', 'Praia de mar calmo. Concentra algumas da melhores opções de hotéis em Maceió e é o ponto de encontro dos jovens.É uma das praias mais freqüentadas da cidade, que abrigou o mais famoso símbolo da cidade, “Gogó da Ema”. Possui águas claras e transparentes com arrecifes que formam piscinas naturais que na maré baixa se consegue ver os banhistas principalmente próximos ao farol. É uma praia super badalada com barracas com músicas ao vivo, bares, restaurantes, hotéis entre outros. 

', 632, 7, 4, '2009-11-04 15:22:55.101192', '2009-11-04 15:26:02.399289');
INSERT INTO tourist_sights VALUES (56, 'Arsenal de Guerra', 'Rua 13 de junho, s/nº – 78.020-001 – Centro Sul – Cuiabá-MT', '(65) 3616-6900', NULL, 'Terça a Sexta das 14h às 21h, Sábados e Domingos das 16h às 20h', 'Criado, antes, com o nome Real Trem de Guerra, por Carta Régia de D. João VI em 1818, destinado a um estabelecimento militar para o conserto e fábrica de armas. Teve iniciada a construção em 1819, durante o governo do 9º e último Capitão General de Mato Grosso, Francisco de Paula Magessi Tavares de Carvalho, vindo a concluir-se em 1832, quando foi inaugurado. Em 15/11/1831 por determinação da lei foi criado o Arsenal de Guerra da Província de Mato Grosso. O edifício foi posteriormente ampliado e adaptado para funcionamento do Arsenal de Guerra e os varandões dos flancos foram construídos em 1848. Técnicas construtivas e materiais da região para erguer um edifício neoclássico, nos moldes franco-lusitanos que caracterizavam, em maioria, as construções oficiais do Rio de Janeiro. Os ambientes internos são protegidos por um avarandado ininterrupto. As insígnias da casa militar estão nos frisos em relevos simétricos, destacados das superfícies lisas para atender à sobriedade que qualifica o estilo, observado na composição da fachada principal. As cores ocre para as áreas planas e branco para os relevos acentuam a composição e tornam ainda mais expressiva a linearidade clássica.', 2650, 7, 2, '2009-11-06 20:58:57.358854', '2009-11-06 21:01:48.991416');
INSERT INTO tourist_sights VALUES (55, 'Museu Rondon', 'Av. Fernando Corrêa da Costa, em frente ao Parque Aquático da UFMT.', '(65) 3615 8489', NULL, 'De segunda a sexta, entre 8h e 18h. ', 'O Museu Rondon foi criado em 1972 para ser um centro de indigenismo, pesquisa e divulgação das culturas indígenas em Mato Grosso. Seu acervo atual ultrapassa mil peças, incluindo adornos plumários, indumentárias, armas, artefatos de ritual mágico, cerâmicas, instrumentos musicais, tecelagem, trançados, utensílios, etc, além do material fotográfico retratando o cotidiano das aldeias. Seu nome é um tributo ao matogrossense marechal Cândido Mariano da Silva Rondon, pela sua determinação na defesa dos direitos indígenas.
Foi a proximidade com os índios que levou à formação do acervo de peças de uso tradicional, coletadas diretamente nas aldeias. No seu interior, o Museu Rondon   buscou colocar o visitante em contato com o ambiente mais íntimo da casa indígena, retratando-a na singela distribuição dos objetos: as redes, a terra batida, a lenha, o fogo. Ao lado do prédio do Museu, no Parque Aquático, em meio aos coqueiros e à sombra das árvores do cerrado, foi construída uma casa indígena no modelo ovalado xinguano, que exigiu dos índios Bakairi a recuperação da sua própria memória. Com uma média anual de mais de 6 mil visitantes, recebe principalmente estudantes da rede de ensino de 1º e 2º graus.

', 2650, 7, 3, '2009-11-06 20:38:02.133417', '2009-11-06 21:03:31.665857');
INSERT INTO tourist_sights VALUES (53, 'Chapada dos Guimarães', 'Localizado à 60 quilômetros de Cuiabá.', '(65) 649-4094', NULL, 'Todos os dias da semana, das 8:00 às 17:00 h', 'o Parque Nacional de Chapada dos Guimarães é um dos lugares mais belos do Brasil. Aliás, belo é isenção jornalística, o lugar é mesmo deslumbrante, cinematográfico. 

Ao todo, são 33 mil hectares de cachoeiras, paredões e mirantes de fazer amarelar o Ronaldinho. Tudo isso envolto em um clima ameno - frio, se comparado ao de Cuiabá - e misterioso. Isso mesmo! Além das belezas naturais, aqui também é uma terra de místicos, esotéricos e ufólogos de plantão. 

Além de pista de pouso de extraterrestres, muitos afirmam que Chapada é um canalizador de energias cósmicas, um berço para a civilização do terceiro milênio. 
', 2538, 7, 3, '2009-11-06 19:42:06.44173', '2009-11-06 21:03:47.790919');
INSERT INTO tourist_sights VALUES (3, 'Centro de Convenções Ulysses Guimarães', 'Eixo Monumental - SDC (Setor de Divulgação Cultural), entre a Torre de TV e o Memorial JK', '(61) 3325-6378', NULL, 'Segunda a sexta-feira, das 9h às 12h e das 14h às 18h', 'De frente para a Esplanada dos Ministérios e a poucos minutos do núcleo das decisões políticas e econômicas, está um dos mais modernos espaços para eventos do País. Reinaugurado em 2005 após uma grande reforma, o Centro de Convenções Ulysses Guimarães tem 54 mil m² de área total. É três vezes maior do que o prédio original, construído na década de 1970.

Com capacidade para receber quase 10 mil pessoas e adaptado para portadores de necessidades especiais, o local vem sendo eleito sede de importantes encontros nacionais e internacionais. A escolha é fácil de explicar: vizinho dos três poderes, o Centro está a 15 minutos do aeroporto e ao lado do setor de hotéis. Além disso, a localização estratégica de Brasília, no centro do País, agiliza o acesso a partir de outros estados.

O edifício é dividido em alas, o que permite a realização de diferentes eventos ao mesmo tempo. Exposições e feiras podem acontecer tanto na área climatizada da ala Sul quanto no vão livre da ala Oeste. Do outro lado, quatro auditórios abrigam palestras ou apresentações de teatro e cinema. O auditório principal, que pode receber até 3 mil pessoas, fica na ala Norte. Veja as plantas do local.

O Centro de Convenções Ulysses Guimarães tem ajudado Brasília a fortalecer sua vocação para o turismo de negócios. Confira a agenda de eventos. Com um projeto arquitetônico ousado, o espaço também se tornou uma atração para qualquer visitante da capital.', 2975, 1, 6, '2009-08-26 23:34:54.482235', '2009-10-23 16:54:09.372166');
INSERT INTO tourist_sights VALUES (13, 'Palácio do Planalto', 'Praça dos Três Poderes - Zona 0', '(61) 3411-2317', NULL, 'Domingo, das 9h30 às 14h30. Não funciona em feriados. Grupos escolares precisam agendar a visita', 'A rampa por onde já passaram tantos Presidentes e Chefes de Estado pode ser escalada por cidadãos comuns. Aos domingos, dia de visita no Palácio do Planalto, você pode conhecer este e outros importantes cenários de decisões da política brasileira.

Sede do Poder Executivo desde 1960, o edifício é um dos mais conhecidos do País. O projeto, de Oscar Niemeyer, tem fachada cercada por colunas de mármore que tocam suavemente o solo, como os pilares do Palácio da Alvorada.

Do lado de dentro, quem participa do tour pode recordar cenas históricas. Muitas decisões importantes saíram de reuniões na sala da mesa oval. Nos salões das cerimônias oficiais, foram assinadas leis que podem ter mudado sua vida. Se você não se lembrar de nenhum momento marcante, os guias estarão lá para refrescar a sua memória.

Alguns cômodos ficarão apenas na sua lembrança – no terceiro andar, não é permitido fotografar. Lá estão os locais que mais despertam a curiosidade do público – como o Gabinete da Presidência da República e a Sala de Audiências. ', 2975, 1, 7, '2009-08-26 23:49:11.710032', '2009-10-23 18:19:47.791631');
INSERT INTO tourist_sights VALUES (2, 'Catetinho', 'Km 0 da BR 040, Trevo do Gama, Zona 0', '(61) 3338-8694', NULL, '', 'Simples e com estrutura toda em madeira, o Catetinho foi a primeira moradia presidencial em Brasília. A idéia da construção surgiu de uma conversa entre amigos. Enquanto o músico Dilermando Reis sugeria o nome – uma alusão ao Palácio do Catete, antiga residência do presidente no Rio de Janeiro – Oscar Niemeyer esboçou o projeto em um guardanapo.

A obra ficou pronta em apenas dez dias e, logo após a inauguração, em 10 de novembro de 1956, Juscelino Kubitschek fez o primeiro despacho oficial no Catetinho. Durante dois anos, JK morou e trabalhou na residência.

Em 1959, o Catetinho foi tombado pelo Instituto do Patrimônio Histórico e Artístico Nacional (Iphan). Hoje, o espaço não é apenas um ponto turístico. Visitar o Catetinho é como ter uma aula de história sobre a capital do Brasil e sobre JK. A casa está restaurada e é possível ver objetos pessoais do ex-presidente, como seu chapéu marrom e um pijama de seda.', 2975, 1, 6, '2009-08-26 23:33:06.512178', '2009-10-23 18:43:28.784438');
INSERT INTO tourist_sights VALUES (1, 'Catedral Metropolitana', 'Esplanada dos Ministérios, Eixo Monumental – Leste', '(61) 3224-4073', NULL, 'Diariamente, das 8h às 18h', 'Patrimônio Histórico e Artístico Nacional, a Catedral Metropolitana de Brasília é considerada um marco na história da arquitetura e da engenharia brasileira. A obra de Oscar Niemeyer, inaugurada em 1967, pouco lembra as igrejas tradicionais – principalmente pela forma circular.

É fácil perceber a ousadia do projeto. Sua estrutura é composta por 16 enormes colunas, que saem do solo e se encontram no topo, formando uma espécie de coroa. O acesso ao interior é feito por uma passagem subterrânea revestida em preto, contrastando com o salão principal. Lá dentro, a luz natural que entra pelos vitrais do teto se reflete no mármore branco das paredes e colunas.

Outra surpresa é a acústica da igreja. Durante a visita, faça o teste: fique próximo à parede e peça para outra pessoa fazer o mesmo em qualquer outro ponto do salão. Quando você falar, ela ouvirá sua voz, como num telefone sem fio.

Além do ousado projeto arquitetônico, este templo também guarda importantes peças e obras de arte, como o altar-mor, doado pelo Papa Paulo VI, a Via-Sacra, de Di Cavalcanti, e os quatro evangelistas, de Alfredo Ceschiatti, cada um com três metros de altura.', 2975, 1, 7, '2009-08-26 23:31:13.703233', '2009-10-23 18:57:21.266151');
INSERT INTO tourist_sights VALUES (8, 'Espaço Lúcio Costa', 'Praça dos Três Poderes - subsolo', '(61) 3325-6163', NULL, 'Terça a domingo e feriados, das 9h às 18h', 'Quem chega a Brasília pela primeira vez quer entender como a capital foi concebida. Para isso, o melhor é visitar o Espaço Lúcio Costa. Com uma maquete de 170 m² do Plano Piloto e cópias de seus croquis e relatório oficial, o local é um paraíso para quem gosta de urbanismo e arquitetura.

Localizada no subterrâneo da Praça dos Três Poderes e desenhada por Oscar Niemeyer, a construção é uma homenagem ao urbanista que idealizou a cidade. Em 1957, o projeto de Lúcio Costa foi escolhido por um júri internacional entre os 26 participantes do Concurso Nacional do Plano Piloto da Nova Capital do Brasil.

Trinta anos depois, a Unesco (Organização das Nações Unidas para Educação, Ciência e Cultura) reconheceu Brasília como Patrimônio Cultural da Humanidade. A construção da capital é um divisor de águas na história da arquitetura e do urbanismo mundial.

A maquete do Plano Piloto já foi exposta em outras cidades do Brasil e no exterior. Criada em 1988, ela está no Espaço Lúcio Costa desde a inauguração do local, em 1992. Neste protótipo, há um sistema de som que transmite informações em quatro idiomas. Ao lado, fica uma maquete tátil, com legendas em Braille.', 2975, 1, 7, '2009-08-26 23:43:33.519198', '2009-10-23 19:08:36.423749');
INSERT INTO tourist_sights VALUES (68, 'Mineirão', 'Avenida Antônio Abrahão Caram, 1001 - Pampulha ', '(31) 499.1100 ', NULL, 'Aberto diariamente de 8h às 18h. ', 'Inaugurado em 1965, o "Mineirão", segundo maior estádio coberto do mundo com capacidade para 130 mil pessoas, ajudou a levar o futebol mineiro para lugar de destaque e dotou o público de um espaço adequado para assistir a grandes espetáculos do futebol profissional.O Estádio Governador Magalhães Pinto, mais conhecido como Mineirão, é o segundo maior estádio de futebol do Brasil e o 29ª maior do mundo, de acordo com as estimativas do World Stadium. No Brasil é superado apenas pelo Maracanã.', 3828, 7, 5, '2009-11-08 16:41:05.11008', '2009-11-09 06:28:27.973903');
INSERT INTO tourist_sights VALUES (69, 'Palácio das Artes ', 'Avenida Afonso Pena, 1537- Centro ', '(31) 237-7234 ', NULL, 'Visitas monitoradas marcadas com antecedência pelo telefone.', 'Construído dentro da área do Parque Municipal, o prédio teve projeto inicial de Niemeyer. A planta definitiva ficou a cargo do engenheiro Hélio Ferreira Pinto e a inauguração foi em 1971. A construção imponente e moderna abriga a Grande Galeria, com um espaço nobre para as artes visuais, e mais três galerias para exposições artísticas, lançamentos literários e eventos do gênero, o Foyer, as salas Arlinda Corrêa Lima e Genesco Murta, a sala de cinema Humberto Mauro e ainda duas salas de espetáculos: o Grande Teatro e o Teatro de Arena João Ceschiatti. Funciona no mesmo prédio o Centro de Artesanato Mineiro.
', 3828, 7, 3, '2009-11-08 16:46:15.534636', '2009-11-09 06:28:51.05676');
INSERT INTO tourist_sights VALUES (43, 'Jardim Botânico ', ' Estrada de Belém, s/nº Colônia Cachoeira Grande Aleixo', '', NULL, 'de terça a domingo,das 8 às 15hs. A administração pede o agendamento prévio para grupos escolares e visitas de grande número de turistas', 'Jardim Botânico de Manaus Adolpho Ducke foi criado em 2000, pela Prefeitura Municipal de Manaus em parceria com o Instituto Nacional de Pesquisas da Amazônia - INPA, com o objetivo de buscar alternativas para conter o avanço da ocupação desordenada - invansões - na zona leste de Manaus e proteger as florestas da região. A missaõ dos jardins botânicos é aumentar o conhecimento do público em geral quanto à importância das plantas para o homem e suas futuras gerações.Ao longo da trilha, existem diversas árvores identificadas, como o angelim-pedra, castanha-de-macaco, acariquara, breu, tachi, entre outras. Atualmente, o Jardim Botânico está desenvolvendo projetos de educação ambiental como o "Comunidade no Jardim Botânico".', 44, 7, 4, '2009-11-05 11:42:06.414733', '2009-11-06 15:45:29.990394');
INSERT INTO tourist_sights VALUES (67, 'Igreja de São Francisco', 'Avenida Otacílio Negrão de Lima, s/nº - Pampulha ', '(31) 491.2319 ', NULL, '', 'A Igreja de São Francisco de Assis foi inaugurada em 1943. Com linhas arrojadas, apresenta mosaicos nas laterais da nave. Seu interior abriga a Via Sacra, constituída por 14 painéis de Portinari, considerada a sua obra mais significativa.
Os jardins são assinados por Burle Marx.
Foi o último prédio a ser inaugurado do Conjunto Arquitetônico da Pampulha.

É considerada a obra-prima do conjunto. No projeto da capela Oscar Niemeyer faz novos experimentos em concreto armado, abandonando a laje sob pilotis e criando uma abóbada parabólica em concreto, até então só utilizada em hangares. A abóbada na capela da Pampulha seria ao mesmo estrutura e fechamento, eliminando a necessidade de alvenarias. Inicia aquilo que seria a diretriz de toda a sua obra: uma arquitetura onde será preponderante a plasticidade da estrutura de concreto armado, em formas ousadas, inusitadas e marcantes.

', 3828, 7, 3, '2009-11-08 16:33:42.727409', '2009-11-08 21:03:51.603803');
INSERT INTO tourist_sights VALUES (34, 'Museu Fortaleza de São José de Macapá', 'Rua Cândido Mendes, s/n- Centro', '(96) 3212-5118 ', NULL, '', 'O Museu Fortaleza de São José de Macapá é uma obra de memória, com referência ao período da conquista definitiva da Amazônia pelos lusitanos. Levantada na foz pela margem esquerda do grande rio Amazonas, visando garantir a posse regional junto com outras fortificações erguidas no interior da floresta. Além da segurança, garantiu o desenvolvimento do povoamento, de exploração dos recursos regionais e do comércio com a metrópole. Arquitetonicamente de influência Vauban, constitui-se em um núcleo cercado por diversos elementos de reforço a defesa. O acervo do museu é composto de objetos e fragmentos encontrados em prospecções arqueológicas feitas nas áreas interna e externa da fortificação, por pesquisadores do Museu Paraense Emílio Goeldi, sob a coordenação dos arqueólogos Marcos Magalhães, da Universidade Federal de Pernambuco, e Marcos Albuquerque, do Instituto do Patrimônio Histórico Artístico Nacional, através do historiador Adler Homero, por doações feitas pela comunidade local e resultantes das atividades desenvolvidas pela equipe da instituição.', 60, 7, 4, '2009-11-04 16:18:22.419665', '2009-11-04 23:59:15.164303');
INSERT INTO tourist_sights VALUES (45, 'Farol da Barra', 'antiga ponta do Padrão, em Salvador', '', NULL, '', 'No século XVII, o porto de Salvador era um dos mais movimentados e importantes do continente, e era preciso auxiliar as embarcações que chegavam à Baía de Todos os Santos em busca de pau-brasil e outras madeiras-de-lei, açúcar, algodão, tabaco e outros itens, para abastecer o mercado consumidor europeu.

No fim desse século, após o trágico naufrágio do Galeão Santíssimo Sacramento, capitânia da frota da Companhia Geral de Comércio do Brasil, num banco de areia frente à foz do rio Vermelho, a 5 de maio de 1668, o Forte de Santo Antônio da Barra foi reedificado a partir de 1696, durante o Governo Geral de João de Lencastre (1694-1702), vindo a receber um farol - um torreão quadrangular encimado por uma lanterna de bronze envidraçada, alimentada a óleo de baleia -, de acordo com o Instituto Geográfico e Histórico da Bahia, o primeiro do Brasil e o mais antigo do Continente (1698), quando passou a ser chamado de Vigia da Barra ou de Farol da Barra.

O diário de bordo do corsário inglês William Dampier, em 1699, relata: "A entrada da Baía de Todos os Santos é defendida pelo imponente Forte de Santo Antônio, cujos lampiões acesos e suspensos para orientação dos navios, vimos de noite."
', 1049, 7, 2, '2009-11-06 14:27:59.753974', '2009-11-06 14:30:07.632342');
INSERT INTO tourist_sights VALUES (9, 'Jardim Botânico de Brasília', 'SMDB conjunto 12, Lago Sul', '(61) 3366-4482', NULL, '', 'O Jardim Botânico é parada obrigatória para quem visita Brasília pela primeira vez. A fauna e a flora típicas do cerrado reservam algumas surpresas. Diferentemente de todos os outros parques do País, o jardim não é formado por plantas de várias regiões, e sim pela vegetação natural da região.

São cerca de 4,5 mil hectares, 526 destinados à visitação e quase 4 mil de reserva ecológica. Não se assuste se encontrar alguns animais em extinção, como o veado-campeiro, tatu-canastra e o tamanduá-bandeira. A dica é aproveitar a oportunidade e tentar fotografá-los.

Para quem gosta de ler ao ar livre, o parque conta ainda com uma biblioteca ecológica, inaugurada em março de 2007. O espaço é destinado às crianças.', 2975, 1, 8, '2009-08-26 23:44:50.983122', '2009-11-09 05:28:09.72483');
INSERT INTO tourist_sights VALUES (71, 'Tocantins(Palmas)Ilha do Bananal', 'Se localiza entre os  Araguaia e Javaé', '(63) 3215-2381', NULL, '', 'É a maior ilha fluvial do mundo, com o ecossistema rico em animais de diversas espécies, espalhado por grande extensão que se mantém inundado em maior parte do ano (período de chuva de outubro a março) e formam lagos na estiagem.', 409, 7, 4, '2009-11-08 22:44:00.353567', '2009-11-09 06:26:22.186884');
INSERT INTO tourist_sights VALUES (54, 'Palácio da Instrução', 'Avenida Historiador Rubens de Mendonça CPA', '36135700', NULL, '', 'Belíssima construção, em pedra canga, localizada na região central de Cuiabá, ao lado da Catedral Metropolitana. Inaugurado 1914 , é a sede da Secretaria Estadual de Cultura, do Museu de História Natural e Antropologia e da Biblioteca Pública. 
Com seu Museu histórico, retrata o Estado em todas as suas fases, do período Colonial à República. Fica no centro e recebe muitas visitas. Abriga também o museu de História Natural e Antropologia. No ambiente é  feito exposição de pequisa técnico-científicas ligadas ao Centro de Zoologia, Botânica,  e Antropologia.', 2650, 7, 13, '2009-11-06 19:58:49.4231', '2009-11-09 06:26:40.715982');
INSERT INTO tourist_sights VALUES (70, 'Tocantins(Palmas)', 'distante 32 quilômetros de Palmas, localizado ao pé da Serra do Carmo', '(63) 3215-5089', NULL, '', 'Lugar calmo certo para quem estar querendo fugir de agitadas cidades afim de descansar a cabeça.Com varias cachoeiras,trilhas,hotel com apartamentos, chalés, piscinas, salão de jogos, restaurantes, bares, shows artísticos e atividades de lazer. ', 409, 7, 5, '2009-11-08 21:12:54.818003', '2009-11-09 17:03:43.402477');
INSERT INTO tourist_sights VALUES (36, 'Porto de Santana', 'Rua Cláudio Lúcio Monteiro, 1380 – Novo Horizonte – Santana', '96 3314–1200 /3314–1205', NULL, '', 'A construção do Porto de Santana (antigo Porto de Macapá) foi iniciada em 1980, com a finalidade original de atender à movimentação de mercadorias por via fluvial, transportadas para o Estado do Amapá e para a Ilha de Marajó. Todavia, pela sua posição geográfica privilegiada, tornou-se uma das principais rotas marítimas de navegação, permitindo conexão com portos de outros continentes, além da proximidade com o Caribe, Estados Unidos e União Européia, servindo como porta de entrada e saída da região amazônica. 
A inauguração oficial das instalações ocorreu em 6 de maio de 1982. A partir de 14 de dezembro de 2002, através do Convênio de Delegação nº 009/02 do Ministério dos Transportes e a Prefeitura de Santana, com a interveniência da Companhia Docas do Pará, foi criada a Companhia Docas de Santana, empresa pública de direito privado para exercer a função de Autoridade Portuária.É um local que exibe uma beleza exótica, oferece passeios maravilhoso, além de possuir um ótima infra-estrutura.

www.docasdesantana.com.br ', 60, 7, 7, '2009-11-04 16:53:48.645834', '2009-11-04 23:59:47.981682');
INSERT INTO tourist_sights VALUES (57, 'Praia de Camburi', 'ao norte da cidade(parte continental )', '', NULL, 'qualquer hora do dia', 'Música baiana, MPB, roda de pagode, futebol, frescobol, cooper, caminhada. Cerveja, peroá com fritas e carne de sol com aipim. Tudo isso num só lugar. É assim a Praia de Camburi, a maior de Vitória com cinco quilômetros de extensão e muito espaço para reunir tribos de todos os tipos. Para curtir a praia a seu modo, basta escolher um dos 46 quiosques, aquele que mais se adequar ao seu estilo, e aproveitar o sol que sempre aparece na cidade.Os quiosques abrem por volta das 8 horas e fecham, teoricamente, às 22 horas, podendo se estender até à meia-noite. Isso proporciona aos freqüentadores a possibilidade de se divertir também à noite, à beira-mar. 

Para quem gosta de esporte, a praia também oferece várias alternativas. Com uma boa faixa de areia, o local proporciona a prática de esportes que vão da tradicional caminhada até o futevôlei, passando pelo frescobol, vôlei e futebol. 

Além disso, no verão, a praia é palco de atrações especiais promovidas pela Prefeitura de Vitória, que monta uma arena com uma vasta programação cultural e esportiva, atraindo um grande número de pessoas à praia. Localizada na zona norte de Vitória, o principal cartão postal da cidade é também um dos locais preferidos do capixaba.

', 3906, 7, 2, '2009-11-07 22:41:32.990547', '2009-11-07 22:43:43.321242');
INSERT INTO tourist_sights VALUES (46, 'Pelourinho', 'Limitando-se ao norte com Pilar, Santo Antônio e Barbalho, ao sul com a Sé e Saúde, a leste com o Comércio e a oeste com Sete Portas', '', NULL, '', 'O Pelourinho é o nome de um bairro da capital do estado brasileiro da Bahia, localizada em seu Centro Histórico, que possui um conjunto arquitetônico colonial (barroco português) preservado e integrante do Patrimônio Histórico da UNESCO.

A palavra pelourinho se refere a uma coluna de pedra, localizada normalmente ao centro de uma praça, onde criminosos eram expostos e castigados. No Brasil Colônia era principalmente usado para castigar escravos com chicotadas.Somente a partir dos anos 1980 (com o reconhecimento do casario como patrimônio da humanidade pela UNESCO) e dos anos 1990 (com a revitalização da região) é que o Pelourinho transformou-se no que é hoje: um centro de "efervescência" cultural.

Nas últimas décadas, o Pelourinho passou a atrair artistas de todos os gêneros: cinema, música, pintura, tornando-o um importante centro cultural de Salvador.
', 1049, 7, 3, '2009-11-06 14:37:50.23542', '2009-11-06 14:42:18.523696');
INSERT INTO tourist_sights VALUES (72, 'Tocantins(Palmas)Jalapão', 'A leste próximo a Pedra da Baliza, ponto de referência das fronteiras do Piauí, Maranhão e Bahia.', '(63) 3218-2357', 'ascom.adtur@yahoo.com.br', '', 'Brasil, um lugar abençoado por natureza. Bem no centro deste país, no estado do Tocantins, encontra-se um paraíso natural de beleza única: o Jalapão, um dos principais roteiros para quem pratica o ecoturismo e o turismo de aventura. No mundo, com certeza, não há cenário igual.

A região do Jalapão é um lugar de descobertas permanentes. Em plena mata de transição entre o cerrado e a caatinga, onde predomina uma vegetação rasteira similar às savanas, surgem cachoeiras, rios de águas cristalinas, corredeiras, grandes chapadas e formações rochosas de cores e formas variadas.

Neste cenário, destacam-se dunas de areias douradas, com até 30 metros de altura, o que levou o lugar a ser chamado de deserto do Jalapão.', 409, 7, 3, '2009-11-08 23:01:58.096698', '2009-11-09 06:20:36.230033');
INSERT INTO tourist_sights VALUES (58, 'Praia da ilha do Boi', 'fica dentro da ilha do Boi', '', NULL, 'qualquer hora do dia', 'A praia oferece águas claras e panorâmica da baía  

Pode parecer impossível que uma praia cravada no centro de uma capital consiga conciliar a democracia do acesso ao fato de atrair prioritariamente gente bonita e, mais ainda, manter um clima de tranqüilidade e descanso. Pois assim é a praia da Ilha do Boi.
Com extensão de 140 metros, o local mantém sua reserva graças a algumas peculiaridades. Além das águas tranqüilas e claríssimas, a praia da Ilha do Boi não possui música em alto volume. O que se houve é apenas o burburinho das ondas e do bate-papo. 

Para chegar até ela é preciso deixar o carro no estacionamento ou em alguma rua próxima (a praia é disputada e é necessário chegar cedo para conseguir uma vaga por perto) e passar pela alameda Jaime Alemão, coberta por folhagens. 

Esses ingredientes cativam quem conhece o lugar. Foi assim com Clério Januário, o Baiano, dono de uma das barracas, que há exatos 13 anos trabalha no local e já possui clientes que se achegam à barraca apenas para uma conversa boa e uma cervejinha amiga.

Tímido, Baiano não confessa, mas os amigos afirmam que ele já é patrimônio do lugar e já viu muitos namoros se transformarem em casamento nas areias da ilha, ideais para quem está sozinho, ou mesmo disposto a fugir da agitação tradicional
', 3906, 7, 2, '2009-11-07 22:50:14.76146', '2009-11-07 22:51:46.890993');
INSERT INTO tourist_sights VALUES (41, 'Teatro de Manaus', 'R. Tapajós, 5 - Centro', ' (92) 622-1880 ', NULL, 'Visitação: 2ª a sáb., das 9h às 16h. ', 'O Teatro Amazonas é um belo teatro brasileiro, segundo maior teatro da Amazônia (Superado apenas pelo Teatro da Paz em Belém).Foi construído na época do Ciclo da Borracha, em plena Floresta amazônica, sendo um referencial da cultura no estado e uma das mais belas obras. Destacam-se os ornamentos sobre as colunas do pavimento térreo, com máscaras em homenagem a dramaturgos e compositores clássicos famosos, como Ésquilo, Aristóphane, Moliére, Carlos Gomes, Rossini, Mozart, Verdi, Chopin e outros. Sobre o teto abobadado estão afixadas quatro telas pintadas em Paris pela Casa Carpezot - a mais tradicional da época -, onde são retratadas alegorias à música, dança, tragédia e uma homenagem ao grande compositor brasileiro Carlos Gomes.


', 44, 7, 4, '2009-11-05 11:20:23.567958', '2009-11-06 18:30:07.78947');
INSERT INTO tourist_sights VALUES (51, 'Praia Iracema', 'Bairro Iracema', '', NULL, 'qualquer hora do dia', 'A imagem de Iracema está tão associada a Fortaleza que existem atualmente cinco estátuas da índia na cidade (veja esse roteiro turístico dedicado a Iracema, símbolo de Fortaleza). Até o final do século passado, a estátua da Praia do Mucuripe, inaugurada em 1965, era a mais conhecida, ponto obrigatório de visitação.
Em 1996, uma nova estátua foi inaugurada à beira-mar da Praia de Iracema. Diferentemente das demais, que mostram Iracema e família, essa obra mais recente, denominada "Iracema, a Guardiã", mostra a heroína segurando um grande arco, olhando para o mar, como se estivesse em posição de batalha.Desde o entardecer, moradores locais e visitantes começam a rumar para Iracema, em busca das diversas opções de restaurantes e diversão noturna; as ruas de Iracema ficam tomadas até o amanhecer. 

Embora tenha sido sempre a área preferida pelos boêmios de Fortaleza, Iracema viveu um período de decadência até os anos 1980; naquela época, o Governo deu impulso a um programa de revitalização da área, com obras públicas e incentivos a novos empreendimentos. Vários edifícios antigos foram reformados (aproveitando-se de isenções de IPTU), vários restaurantes, clubes noturnos e lojas foram abertos.
O Centro Cultural Dragão do Mar foi construído pelo governo, e transformou-se num dos maiores centros do gênero no país. A antiga Ponte dos Ingleses foi reconstruída, ganhou lojas e outros serviços, e transformou-se também num dos pontos mais procurados pelos turistas. 

', 1233, 7, 5, '2009-11-06 18:43:23.059763', '2009-11-10 12:43:41.819516');
INSERT INTO tourist_sights VALUES (50, 'Praia de Mucuripe', 'continuação da Praia do Meireles, na direção leste', '', NULL, 'qualquer hora do dia', 'Mucuripe é a continuação da Praia do Meireles, na direção leste; não há um claro marco divisório entre essas praias. O calçadão de Mucuripe é um pouco mais estreito que o do Meireles, mas é largo o suficiente para atrair diversas pessoas, que vêm para passear, caminhar ou assistir às peladas nas quadras de areia.

No final da praia, no trecho próximo ao Porto de Mucuripe, pode-se ver diariamente uma profusão de jangadas e outros barcos rústicos. Existem diversas jangadas turísticas espalhadas por Fortaleza, para que os turistas tirem fotografias; em Mucuripe, as jangadas são de fato utilizadas como meio de vida pra diversas famílias de pescadores. Dependendo do horário, pode-se ver os jangadeiros ajudando-se mutuamente no trabalho manual (utilizando tábuas roliças) de levar as jangadas para o mar e de volta para a areia.
No final da avenida beira-mar, encontra-se o mercadinho de peixes e frutos do mar; pode-se não apenas admirar a fartura de peixes, lagostas, lulas e crustáceos, mas também comprar pequenas porções e levá-las para que sejam preparadas em pequenas barracas, no próprio mercado.

É do Mucuripe também que partem os passeios de barco; as embarcações podem levar algumas dezenas de pessoas, e aparentemente são vistoriadas para garantir a segurança dos passageiros. Informe-se nos quiosques localizados nas calçadas da praia (esses mesmos passeios são anunciados nos hotéis da cidade; indo diretamente aos quiosques, é possível obter algum desconto). 
', 1233, 7, 2, '2009-11-06 18:30:02.208581', '2009-11-06 18:31:31.116867');
INSERT INTO tourist_sights VALUES (78, 'Parque Solon de Lucena', 'Parque Sólon Lucena, 530 - Centro', '', NULL, '', 'É um dos recantos mais bonitos da capital, senão a sua mais bela expressão paisagística. Constitui por assim dizer o centro mesmo da cidade, ao lado do Ponto de Cem Réis e de outros logradouros principais. Antigo sítio pertencente ao domínio dos Jesuítas, o local contava, em tempos recuados, com um verdadeiro bosque, mostrando a pujança da Mata Atlântica. As árvores circundavam a lagoa natural ali existente, lagoa esta depois incluída na urbanização geral do parque.
O conjunto formado pelo pântano, vegetação e lagoa denominava-se Lagoa dos Irerês. Os jardins de hoje têm o traçado original do paisagista Burle Marx, podendo-se ver ainda o bambuzal e exemplares de pau-d’arco e de outras árvores da reserva da Mata Atlântica, além das belas palmeiras imperiais que acompanham o desenho do lago central.
A Lagoa do Parque Solon de Lucena foi eleita o cartão de visita da cidade e um de seus pontos mais pitorescos para passeio, diversão e lazer. 
Encontra-se nos seus arredores a Primeira Igreja Batista, datando de 1958, o templo atual apresenta um estilo arquitetônico neoclássico de marcante beleza.
É a porta de entrada para o Centro Histórico da cidade.
', 1673, 7, 2, '2009-11-10 18:35:59.452047', '2009-11-10 18:44:21.852482');
INSERT INTO tourist_sights VALUES (59, 'Praia da Curva da Jurema', 'Localizada na Enseada do Suá', '', NULL, '', 'O que você acharia de um bar que lhe enviasse um convite vip para ouvir MPB ou bossa nova, num ambiente restrito a pessoas amigas para uma conversa agradável? Pois isso acontece na praia da Curva da Jurema e o encontro é patrocinado por um quiosque à beira-mar. Mas se você não gosta de MPB ou bossa nova, existe a opção de uma roda de samba; ou ainda de um animado pagode; ou de uma tranqüila pescaria; ou de um café da manhã com pão-de-queijo.

Não é à toa que a praia da Curva da Jurema está sempre cheia. Numa faixa de areia com 800 metros de extensão pode-se encontrar de tudo um pouco e a qualquer hora do dia. 

No Toca do Barão é possível desfrutar de uma boa música ao vivo logo aos sábados pela manhã. O café da manhã com pão-de-queijo é oferecido pelo Plataforma 16, que também serve caldos e pizza a partir do meio-dia. 

Para quem gosta de ver o entardecer numa boa pescaria, o horário (determinado pela Prefeitura de Vitória) é das 17 às 9 horas. Desta forma, todos podem curtir seu lazer preferido sem atrapalhar ninguém.

A praia da Curva da Jurema conta com toda a infra-estrutura necessária para atender aos banhistas como chuveiros, salva-vidas e amplo estacionamento. Além disso, a prefeitura mantém um módulo no local para prestar serviços de orientação aos turistas e aos adeptos à prática de exercício físico, além de exposições culturais. 
', 3906, 7, 3, '2009-11-07 22:57:59.337688', '2009-11-07 22:59:37.980413');
INSERT INTO tourist_sights VALUES (61, 'Gruta da Lagoa Azul', '20 km do centro de Bonito', '', NULL, 'Somente no período da manhã. ', 'Descoberta por um índio Terena em 1924, a caverna possui em seu interior umlago azul com dimensões que a tornam uma das maiores cavidades inundadas do planeta. Em 1992 um expedição Franco-Brasileira de espeleomergulhadores, encontrou uma série de fósseis de mamíferos - como o tigre de dente de sabre e preguiça gigante - que viveram durante o período geológico do Pleistoceno - 6.000 a 10.000 anos atrás.

Após uma descida de 100 m, depara-se com um lago de águas intensamente azuladas, cuja profundidade estima-se ser de 90 m. Com suas formações geológicas - não só o teto como o piso da gruta são repletos de espeleotemas de várias formas e tamanhos - desperta a atenção dos turistas e pesquisadores do mundo inteiro. Ninguém sabe ao certo de onde vêm suas águas, acredita-se na existência de um rio subterrâneo, que alimenta o lago.

', 2666, 7, 2, '2009-11-08 11:40:35.300011', '2009-11-08 11:44:39.304174');
INSERT INTO tourist_sights VALUES (27, 'MUSEU DA BORRACHA “GOV. GERALDO MESQUITA”', 'Avenida Ceará, 1.441 – Centro ', '68) 3223-1202', NULL, '2ª a 6ª feira das 8h às 18h. Sábado e Domingo das 16h às 21h. Para grupos é necessário agendar.', 'Criado pelo Dec. Estadual nº 030, de 03 de abril de 1978. Reúne um acervo de peças de arqueologia, paleontologia, coleção de manuscritos e impressos da história do Acre como jornais, revistas e publicações diversas, fotografias, peças e documentos de diversos grupos etnográficos do Estado, objetos e utensílios de extração do látex e peças de borracha.', 22, 7, 9, '2009-11-02 20:21:31.543997', '2009-11-06 19:03:54.245109');
INSERT INTO tourist_sights VALUES (25, 'Palácio Rio Branco', 'Rua Benjamin Constant, em frente a Praça Eurico Gaspar Dutra - Centro.', '(68)32241885', NULL, '', 'Construído em 1930 no governo do Dr. Hugo Carneiro. Tem inspiração da arquitetura grega, tendo sua fachada ornamentada por quatro colunas jônicas. Nele está instalada a sede do Governo Estadual.o Palácio Rio Branco foi projetado com mistura de tendências da art-decô ao neo-clássico, com acentuadas características de art-noveau, o que até hoje podem ser observadas em seus contornos arredondados, na predominância de motivos florais nos entalhes e nas pinturas externas. O mesmo estilo é encontrado nos móveis de inspiração francesa que ainda decoram vários cômodos do palácio.

', 22, 7, 9, '2009-11-02 20:02:58.521506', '2009-11-06 19:04:11.655561');
INSERT INTO tourist_sights VALUES (62, 'Memorial da Cultura Indígena', 'Situado na Aldeia Indígena Urbana Marçal de Souza', '(67) 341 6729', NULL, 'Diariamente das 8h às 18h. R$ 1,00 (por pessoa)', 'Situado na Aldeia Indígena Urbana Marçal de Souza, única do Brasil, o memorial foi construído com bambu tratado, coberto com palha de bacuri e possui área total de 340 metros quadrados e no primeiro piso (280 m²) destina-se a exposição e comercialização de artesanato. No mezanino é reservado para oficina de artesanato e depósito de materiais. Espaço de resgate da cultura indígena, com acervo variado de cerâmica Terena, artesanato em palha, telas com motivos indígenas e literatura específica. ', 2728, 7, 2, '2009-11-08 12:01:28.979623', '2009-11-08 12:03:26.371035');
INSERT INTO tourist_sights VALUES (73, 'Jardim Botânico', 'Acesso pela rua Eng°. Ostoja Roguski – bairro Jardim Botânico.', '3362-5289', NULL, 'diariamente, das 6 h às 21 h (no verão) e das 7 h às 20 h (no inverno).', 'O Jardim Botânico Fanchette Rischbieter foi inaugurado em 1991, com uma área de 245 mil m², incluindo um velódromo. Seus jardins geométricos e a estufa de três abóbadas tornaram-se um dos principais cartões postais de Curitiba.

A estufa abriga plantas características da floresta atlântica do Brasil. Sua arquitetura, em estrutura metálica e estilo art-noveau, foi inspirada em um palácio de cristal que existiu em Londres, no século 19.


O Jardim Botânico conta ainda com o Museu Botânico, trilhas em bosque de araucárias, lago, quadras esportivas e um velódromo', 5042, 7, 4, '2009-11-09 17:06:24.80763', '2009-11-09 17:10:29.325436');
INSERT INTO tourist_sights VALUES (52, 'Museu Ramis Bucair', 'Rua Galdino Pimentel, 195, calçadão.', '3223240', NULL, 'Segunda a sexta, de 8h a 18h', 'Onde você pode ver cartas e mapas antigos, artefatos indígenas, animais empalhados, fósseis de peixes, crustáceos, pedras com inscrições rupestres. Antigamente era chamado de Museu de Pedras, você encontra muitos tipos de rochas, pedras preciosas e semi-preciosas, aspectos da formação geológica de Mato Grosso. 

', 2650, 7, 8, '2009-11-06 18:59:17.833146', '2009-11-06 19:26:46.482493');
INSERT INTO tourist_sights VALUES (14, 'Parque da Cidade', 'Asa Sul de Brasília - entradas pelo eixo Monumental, setor de Indústria e Quadras 901, 906 e 910 Sul', '(61) 3225-2451', NULL, 'As atividades são gratuitas e acontecem de segunda a sexta, pela manhã', 'Se você acha que uma praia faz falta em Brasília, vai ter uma boa surpresa ao ar livre. O Parque da Cidade – Sarah Kubitschek é um complexo de diversão com área equivalente a 420 hectares, localizado na Asa Sul. O espaço, público e gratuito, atende a todos os gostos e idades: além de duas ciclovias, tem parque infantil, lago com pedalinhos e caiaques,z churrasqueiras, campos de futebol, kartódromo, campo de aeromodelismo, anfiteatro e estádio hípico.

O Parque é ideal para a prática de atividades físicas e para a diversão em família. Uma boa dica é o passeio nos pedalinhos do lago, onde pais e crianças podem andar juntos. Se o dia estiver bonito, dá até para fazer um piquenique nos quiosques ou no gramado.

Quem tem mais de 60 anos pode participar de aulas de Tai Chi Chuan, ioga e condicionamento físico.

Para ser criado, o Parque da Cidade contou com a experiência de três grandes nomes da área: Oscar Niemeyer (arquitetura), Burle Marx (jardins) e Lúcio Costa (urbanismo). Só por isso já dá para imaginar que a visita vale mesmo a pena.', 2975, 1, 41, '2009-08-26 23:50:51.302532', '2009-11-10 19:03:29.714792');
INSERT INTO tourist_sights VALUES (49, 'Praia do Futuro', 'Avenida Dioguinho, no sudeste da cidade', '', NULL, 'qualquer hora do dia', 'A Praia do Futuro é a preferida de fortalezenses e turistas para banhos e mergulhos. A Praia do Futuro, um pouco mais afastada da área urbana, tem águas mais limpas; os fortes ventos provocam ondas mais altas e fortes (boas para surf e windsurf, mas requer atenção redobrada de banhistas, especialmente crianças).
Além das praias, outra atração da Praia do Futuro são as barracas de praia; embora existam também barracas de praia no Meireles e em Mucuripe, elas não se comparam em tamanho e infraestrutura às barracas da Praia do Futuro. 
As maiores barracas da Praia do Futuro contam não apenas com centenas de mesas (algumas sobre a areia da praia, outras dentro das barracas), mas com uma estrutura comparável a hotéis: piscinas, play ground, palcos para shows de música e humorismo. É possível aproveitar todo o dia e toda a noite nas grandes barracas', 1233, 7, 17, '2009-11-06 15:45:20.69321', '2009-11-10 19:03:37.189289');
INSERT INTO tourist_sights VALUES (79, 'Parque Zôo Botânico Arruda Câmara ', ' Rua Gouveia Nóbrega', '', NULL, '', '

O Parque Arruda Câmara é um jardim zoobotânico localizado em João Pessoa, Paraíba.

Popularmente chamado Bica, em virtude de uma fonte natural de água potável em seu centro, o Parque Arruda Câmara é um oásis no meio da capital paraibana. Recanto dos mais pitorescos da cidade, constitui-se num verdadeiro santuário ecológico encravado no centro de João Pessoa. É tombado pelo IPHAEP (Instituto do Patrimônio Histórico e Artístico do Estado da Paraíba) desde 26 de agosto de 1980.
', 1673, 7, 3, '2009-11-10 19:06:04.354278', '2009-11-10 19:10:20.777626');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO users VALUES (6, 'bianchi', 'bianchi.ucb@gmail.com', 'm', '1962-08-27', 2975, 'ac2ffa627ba9a0f6bc9677e5e382ffa38a919423', 'a942f5760d2086acc327f66ccd2d2ee348c1e442', '2009-10-22 21:30:31.33608', '2009-10-22 21:30:31.33608', NULL, NULL);
INSERT INTO users VALUES (3, 'capaca', 'pedro.capaca@gmail.com', 'm', '1985-03-05', 2975, '9fde778a11de9fc3e3e897e2fed12c439b6c1ae9', 'bac6e38821e94cc2ffc9cd8ea16f9933ee20c2e3', '2009-10-15 09:20:07.662691', '2009-10-15 09:20:07.662691', NULL, NULL);
INSERT INTO users VALUES (4, 'ricardomfreitas', 'ricardomfreitas@gmail.com', 'm', '1986-07-11', 2975, 'e453e08dac1b3016de7e148a0a97fe33cde6528c', '9a32102e9cb3b1bf6aa83a21542216327f7814bd', '2009-10-15 09:40:41.95424', '2009-10-15 09:40:41.95424', NULL, NULL);
INSERT INTO users VALUES (5, 'Marcela', 'menmarcela@gmail.com', 'f', '1988-09-01', 2975, '41c22b3758558b4ac5ba54894b5095af56d4d27a', 'f762bbbbaa91fbc611e02c289db292a0ea4dca60', '2009-10-15 10:17:25.875179', '2009-10-15 10:17:25.875179', NULL, NULL);
INSERT INTO users VALUES (8, 'miccieli', 'miccieli.ucb@gmail.com', 'm', '1985-02-16', 2975, '4ce981e420348282960e337654b1067ea792e51a', '8afb9087e0d496b082d00a0bfc09fcbf516ffa93', '2009-11-09 19:31:18.781451', '2009-11-09 19:31:18.781451', NULL, NULL);
INSERT INTO users VALUES (2, 'tulios', 'ornelas.tulio@gmail.com', 'm', '1987-12-15', 2975, 'ecb752f822b97a25b15debf3c9cba77403aa4c7e', 'fe35e23b36c0b2cad05402c35045419e07793abc', '2009-09-02 08:59:33.863789', '2009-11-08 21:04:29.715782', NULL, NULL);
INSERT INTO users VALUES (1, 'quentin', 'quentin@example.com', 'm', '1985-10-10', 2975, 'f32bb392ceb1d803bdb4b373a2f5abe1ec2343ec', '7e3041ebc2fc05a40c60028e2c4901a81035d3cd', '2009-08-14 22:50:44', '2009-10-15 11:59:52.227519', NULL, NULL);
INSERT INTO users VALUES (9, 'brandizzi', 'brandizzi+viajarabessa.com.br@gmail.com', 'm', '1984-12-31', 2975, '1e76963e789bdcdca221f208efdd19c9b72e5b8e', '6051e2e3321f3d7060f5d973f5db9eb1706319e5', '2009-11-10 12:25:00.559866', '2009-11-10 12:25:00.559866', NULL, NULL);
INSERT INTO users VALUES (7, 'raissa', 'rah_ornelas@hotmail.com', 'f', '1991-07-12', 2975, '83305bbe086e5e65a442ad37544ef87b3a94f06f', 'a879577153d6e8ff9fab97231701a9ab83662621', '2009-11-02 18:59:16.670594', '2009-11-10 18:16:55.141036', 'dfb4b4f4bddab836def3032d7def3555920bf0c8', '2009-11-24 20:16:55.116939');


--
-- Data for Name: vehicles; Type: TABLE DATA; Schema: public; Owner: viajarabessa
--

INSERT INTO vehicles VALUES (1, 'Carro', NULL, NULL);
INSERT INTO vehicles VALUES (2, 'Ônibus', NULL, NULL);
INSERT INTO vehicles VALUES (3, 'Avião', NULL, NULL);
INSERT INTO vehicles VALUES (4, 'Navio', NULL, NULL);


--
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: destinations_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY destinations
    ADD CONSTRAINT destinations_pkey PRIMARY KEY (id);


--
-- Name: evaluations_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY evaluations
    ADD CONSTRAINT evaluations_pkey PRIMARY KEY (id);


--
-- Name: event_evaluations_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY event_evaluations
    ADD CONSTRAINT event_evaluations_pkey PRIMARY KEY (id);


--
-- Name: event_tips_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY event_tips
    ADD CONSTRAINT event_tips_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: programs_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY programs
    ADD CONSTRAINT programs_pkey PRIMARY KEY (id);


--
-- Name: regions_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);


--
-- Name: roadmaps_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY roadmaps
    ADD CONSTRAINT roadmaps_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: shop_evaluations_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY shop_evaluations
    ADD CONSTRAINT shop_evaluations_pkey PRIMARY KEY (id);


--
-- Name: shop_tips_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY shop_tips
    ADD CONSTRAINT shop_tips_pkey PRIMARY KEY (id);


--
-- Name: shops_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY shops
    ADD CONSTRAINT shops_pkey PRIMARY KEY (id);


--
-- Name: states_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: tips_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY tips
    ADD CONSTRAINT tips_pkey PRIMARY KEY (id);


--
-- Name: tourist_sight_evaluations_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY tourist_sight_evaluations
    ADD CONSTRAINT tourist_sight_evaluations_pkey PRIMARY KEY (id);


--
-- Name: tourist_sight_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY tourist_sight_tags
    ADD CONSTRAINT tourist_sight_tags_pkey PRIMARY KEY (id);


--
-- Name: tourist_sight_tips_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY tourist_sight_tips
    ADD CONSTRAINT tourist_sight_tips_pkey PRIMARY KEY (id);


--
-- Name: tourist_sights_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY tourist_sights
    ADD CONSTRAINT tourist_sights_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: vehicles_pkey; Type: CONSTRAINT; Schema: public; Owner: viajarabessa; Tablespace: 
--

ALTER TABLE ONLY vehicles
    ADD CONSTRAINT vehicles_pkey PRIMARY KEY (id);


--
-- Name: index_event_evaluations_on_event_id_and_evaluation_id; Type: INDEX; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE UNIQUE INDEX index_event_evaluations_on_event_id_and_evaluation_id ON event_evaluations USING btree (event_id, evaluation_id);


--
-- Name: index_roles_users_on_role_id; Type: INDEX; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE INDEX index_roles_users_on_role_id ON roles_users USING btree (role_id);


--
-- Name: index_roles_users_on_user_id; Type: INDEX; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE INDEX index_roles_users_on_user_id ON roles_users USING btree (user_id);


--
-- Name: index_shop_evaluations_on_shop_id_and_evaluation_id; Type: INDEX; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE UNIQUE INDEX index_shop_evaluations_on_shop_id_and_evaluation_id ON shop_evaluations USING btree (shop_id, evaluation_id);


--
-- Name: index_tags_on_name; Type: INDEX; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE UNIQUE INDEX index_tags_on_name ON tags USING btree (name);


--
-- Name: index_tourist_sight_evaluations; Type: INDEX; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE UNIQUE INDEX index_tourist_sight_evaluations ON tourist_sight_evaluations USING btree (tourist_sight_id, evaluation_id);


--
-- Name: index_tourist_sight_tags_on_tourist_sight_id_and_tag_id; Type: INDEX; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE UNIQUE INDEX index_tourist_sight_tags_on_tourist_sight_id_and_tag_id ON tourist_sight_tags USING btree (tourist_sight_id, tag_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: viajarabessa; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: viajarabessa
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM viajarabessa;
GRANT ALL ON SCHEMA public TO viajarabessa;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

