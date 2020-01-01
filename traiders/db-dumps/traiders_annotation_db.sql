--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-3.pgdg90+1)
-- Dumped by pg_dump version 11.5 (Debian 11.5-3.pgdg90+1)

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

SET default_with_oids = false;

--
-- Name: annotation_annotation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annotation_annotation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    body_id integer NOT NULL,
    target_id integer NOT NULL,
    creator character varying(512)
);


ALTER TABLE public.annotation_annotation OWNER TO postgres;

--
-- Name: annotation_annotation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annotation_annotation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_annotation_id_seq OWNER TO postgres;

--
-- Name: annotation_annotation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.annotation_annotation_id_seq OWNED BY public.annotation_annotation.id;


--
-- Name: annotation_annotationbody; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annotation_annotationbody (
    id integer NOT NULL,
    type character varying(32) NOT NULL,
    value character varying(512),
    identifier character varying(512)
);


ALTER TABLE public.annotation_annotationbody OWNER TO postgres;

--
-- Name: annotation_annotationbody_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annotation_annotationbody_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_annotationbody_id_seq OWNER TO postgres;

--
-- Name: annotation_annotationbody_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.annotation_annotationbody_id_seq OWNED BY public.annotation_annotationbody.id;


--
-- Name: annotation_annotationtarget; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annotation_annotationtarget (
    id integer NOT NULL,
    source character varying(512) NOT NULL,
    selector_id integer NOT NULL
);


ALTER TABLE public.annotation_annotationtarget OWNER TO postgres;

--
-- Name: annotation_annotationtarget_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annotation_annotationtarget_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_annotationtarget_id_seq OWNER TO postgres;

--
-- Name: annotation_annotationtarget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.annotation_annotationtarget_id_seq OWNED BY public.annotation_annotationtarget.id;


--
-- Name: annotation_fragmentselector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annotation_fragmentselector (
    id integer NOT NULL,
    value character varying(64) NOT NULL
);


ALTER TABLE public.annotation_fragmentselector OWNER TO postgres;

--
-- Name: annotation_fragmentselector_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annotation_fragmentselector_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annotation_fragmentselector_id_seq OWNER TO postgres;

--
-- Name: annotation_fragmentselector_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.annotation_fragmentselector_id_seq OWNED BY public.annotation_fragmentselector.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: annotation_annotation id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotation ALTER COLUMN id SET DEFAULT nextval('public.annotation_annotation_id_seq'::regclass);


--
-- Name: annotation_annotationbody id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotationbody ALTER COLUMN id SET DEFAULT nextval('public.annotation_annotationbody_id_seq'::regclass);


--
-- Name: annotation_annotationtarget id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotationtarget ALTER COLUMN id SET DEFAULT nextval('public.annotation_annotationtarget_id_seq'::regclass);


--
-- Name: annotation_fragmentselector id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_fragmentselector ALTER COLUMN id SET DEFAULT nextval('public.annotation_fragmentselector_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: annotation_annotation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.annotation_annotation (id, created, body_id, target_id, creator) FROM stdin;
80	2019-12-24 14:11:35.995189+00	80	80	https://api.traiders.tk/users/545/
81	2019-12-24 14:13:18.854203+00	81	81	https://api.traiders.tk/users/545/
82	2019-12-24 16:08:33.46294+00	82	82	https://api.traiders.tk/users/546/
83	2019-12-24 16:08:54.826414+00	83	83	https://api.traiders.tk/users/546/
84	2019-12-24 16:09:13.605005+00	84	84	https://api.traiders.tk/users/546/
85	2019-12-24 16:09:26.328396+00	85	85	https://api.traiders.tk/users/546/
34	2019-12-18 15:16:50.851344+00	34	34	https://api.traiders.tk/users/546/
35	2019-12-18 15:20:33.718159+00	35	35	https://api.traiders.tk/users/546/
46	2019-12-22 08:19:10.530584+00	46	46	https://api.traiders.tk/users/546/
48	2019-12-22 11:47:01.004649+00	48	48	https://api.traiders.tk/users/546/
49	2019-12-22 11:47:50.039796+00	49	49	https://api.traiders.tk/users/546/
50	2019-12-22 11:50:49.260705+00	50	50	https://api.traiders.tk/users/546/
51	2019-12-22 15:09:54.946731+00	51	51	https://api.traiders.tk/users/546/
52	2019-12-22 15:20:46.944736+00	52	52	https://api.traiders.tk/users/546/
53	2019-12-22 16:24:22.739079+00	53	53	https://api.traiders.tk/users/546/
54	2019-12-23 14:54:31.26437+00	54	54	https://api.traiders.tk/users/546/
55	2019-12-23 14:55:04.947423+00	55	55	https://api.traiders.tk/users/546/
56	2019-12-23 15:01:58.66144+00	56	56	https://api.traiders.tk/users/546/
57	2019-12-23 15:02:24.069214+00	57	57	https://api.traiders.tk/users/546/
58	2019-12-23 15:03:23.840425+00	58	58	https://api.traiders.tk/users/546/
59	2019-12-23 15:06:20.180443+00	59	59	https://api.traiders.tk/users/546/
60	2019-12-23 16:10:45.7247+00	60	60	https://api.traiders.tk/users/546/
77	2019-12-24 14:09:08.712886+00	77	77	https://api.traiders.tk/users/545/
78	2019-12-24 14:09:15.898942+00	78	78	https://api.traiders.tk/users/545/
79	2019-12-24 14:10:06.703167+00	79	79	https://api.traiders.tk/users/586/
86	2019-12-24 16:09:43.412138+00	86	86	https://api.traiders.tk/users/546/
87	2019-12-24 16:37:17.555025+00	87	87	https://api.traiders.tk/users/589/
88	2019-12-24 17:13:09.689132+00	88	88	https://api.traiders.tk/users/589/
89	2019-12-24 17:17:33.739437+00	89	89	https://api.traiders.tk/users/592/
90	2019-12-24 17:17:49.097148+00	90	90	https://api.traiders.tk/users/592/
91	2019-12-24 17:18:00.644092+00	91	91	https://api.traiders.tk/users/592/
92	2019-12-24 17:22:58.797981+00	92	92	https://api.traiders.tk/users/586/
93	2019-12-24 17:29:27.927813+00	93	93	https://api.traiders.tk/users/589/
94	2019-12-24 17:29:41.919913+00	94	94	https://api.traiders.tk/users/589/
95	2019-12-24 17:31:39.418454+00	95	95	https://api.traiders.tk/users/590/
96	2019-12-24 17:32:20.862357+00	96	96	https://api.traiders.tk/users/590/
97	2019-12-24 17:32:51.085023+00	97	97	https://api.traiders.tk/users/590/
98	2019-12-24 17:33:45.084855+00	98	98	https://api.traiders.tk/users/546/
\.


--
-- Data for Name: annotation_annotationbody; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.annotation_annotationbody (id, type, value, identifier) FROM stdin;
1	TextualBody	New annot	\N
2	TextualBody	some comment ahahh	\N
3	TextualBody	some comment ahahh	\N
6	TextualBody	Deneme	\N
5	Image	\N	https://img.favpng.com/4/3/2/world-of-warcraft-legion-clip-art-png-favpng-yUtx3yxcSPXEq2KHBkspTiY5W.jpg
82	Image	\N	https://firebasestorage.googleapis.com/v0/b/traiders-1570912018415.appspot.com/o/1575406229280-ffs5579_6.jpg?alt=media&token=5714354f-8486-4155-8fb0-fed3d5c842cf
4	Image	\N	http://www.ekomonitor.com.tr/wp-content/uploads/2019/07/1557121823163-dolar-710x399.jpg
7	TextualBody	asd	\N
8	TextualBody	Trying with user details.	\N
9	TextualBody	Fetch after successfull operation?	\N
10	TextualBody	\N	\N
11	TextualBody	Hello	\N
12	Image	\N	https://firebasestorage.googleapis.com/v0/b/traiders-1570912018415.appspot.com/o/1564410417789-0.jpeg?alt=media&token=ec32980e-1ed3-4408-8b56-9aec3c17126c
13	TextualBody	vovovovo	\N
14	TextualBody	very political	\N
15	TextualBody	almost fifty percent	\N
16	TextualBody	super	\N
17	TextualBody	alliance annotation	\N
18	TextualBody	turkish	\N
19	TextualBody	What a peaceful organization	\N
20	TextualBody	nice country	\N
21	TextualBody	my country	\N
22	TextualBody	Hello	\N
23	Image	\N	https://firebasestorage.googleapis.com/v0/b/traiders-1570912018415.appspot.com/o/1573638005068-avatar.png?alt=media&token=38138308-67d1-4220-a9f8-4cdcaad359c5
24	Image	\N	https://firebasestorage.googleapis.com/v0/b/traiders-1570912018415.appspot.com/o/1573638005068-avatar.png?alt=media&token=38138308-67d1-4220-a9f8-4cdcaad359c5
25	TextualBody	hello	\N
26	TextualBody	dene bakalım	\N
27	TextualBody	hello	\N
28	TextualBody	Are we gonna be able to fix this?\nSure asap.	\N
29	TextualBody	Just work please.	\N
30	TextualBody	Hello	\N
31	TextualBody	Hello	\N
32	TextualBody	Hello	\N
33	TextualBody	To the right place please!	\N
34	TextualBody	Lets try one more time.	\N
35	Image	\N	https://firebasestorage.googleapis.com/v0/b/traiders-1570912018415.appspot.com/o/1575406229280-ffs5579_6.jpg?alt=media&token=553b0aac-84a4-474a-9e83-516d1e1afb3c
36	TextualBody	an organization	\N
37	TextualBody	test	\N
38	TextualBody	Super organization	\N
39	TextualBody	another great organization	\N
40	TextualBody	a letter in alphabet	\N
41	TextualBody	an animal	\N
42	TextualBody	trump trumpet	\N
43	TextualBody	Putin put	\N
44	TextualBody	kim yong kim yok	\N
45	TextualBody	one more annotation	\N
46	Image	\N	https://firebasestorage.googleapis.com/v0/b/traiders-1570912018415.appspot.com/o/1575406229280-ffs5579_6.jpg?alt=media&token=caf62da1-e32b-4742-b022-6d2d4a1b75d9
47	Image	\N	http://example.org/image.png
48	Image	\N	https://firebasestorage.googleapis.com/v0/b/traiders-1570912018415.appspot.com/o/1573638028636-avatar%20(1).png?alt=media&token=c390a56a-3043-4326-b829-7c7fca495ece
49	TextualBody	deneme	\N
50	TextualBody	https://www.youtube.com/watch?v=6EW9l82Xl0o	\N
51	TextualBody	hello	\N
52	Image	\N	https://firebasestorage.googleapis.com/v0/b/traiders-1570912018415.appspot.com/o/1573638005068-avatar.png?alt=media&token=de009aff-88d4-4647-a0df-668db63c1582
53	TextualBody	Hello	\N
54	TextualBody	hello	\N
55	Image	\N	https://firebasestorage.googleapis.com/v0/b/traiders-1570912018415.appspot.com/o/1573638005068-avatar.png?alt=media&token=556f077a-0123-4246-b923-fd8ad250927c
56	TextualBody	disable?	\N
57	TextualBody	disable?	\N
58	TextualBody	disable please	\N
59	TextualBody	Hello	\N
60	TextualBody	Merhaba Yunusum	\N
61	TextualBody	Yılan gibi çalışıyor tısss	\N
62	Image	\N	https://firebasestorage.googleapis.com/v0/b/traiders-1570912018415.appspot.com/o/1573638005068-avatar.png?alt=media&token=64c9f256-f41b-43a4-9b5c-936cabb507ab
63	TextualBody	EU FLAG	\N
64	TextualBody	halo?	\N
65	TextualBody	hello	\N
66	TextualBody	German Flag	\N
67	TextualBody	Ekleyebiliyoruz değil mi?	\N
68	Image	\N	https://firebasestorage.googleapis.com/v0/b/traiders-1570912018415.appspot.com/o/1575406229280-ffs5579_6.jpg?alt=media&token=10b918b7-8e3d-4e46-af4a-6528989e22e0
69	TextualBody	Hello	\N
70	TextualBody	NATO	\N
71	TextualBody	Merhaba	\N
72	TextualBody	Very bad one	\N
73	TextualBody	kato	\N
74	TextualBody	kato	\N
75	TextualBody	Ekledim.	\N
76	TextualBody	test	\N
77	TextualBody	IOTA is a distributed ledger technology based on a data structure called the "tangle"	\N
78	TextualBody	IOTA is a distributed ledger technology based on a data structure called the "tangle"	\N
79	TextualBody	wtf is this bullshit	\N
80	TextualBody	The IOTA Tangle is a stream of interlinked and individual transactions. These transactions are distributed and stored across a decentralised network of participants.	\N
81	TextualBody	A Bollinger Band is a technical analysis tool defined by a set of lines plotted two standard deviations (positively and negatively) away from a simple moving average (SMA) of the security's price.	\N
83	TextualBody	username	\N
84	TextualBody	Hello	\N
85	TextualBody	tısss	\N
86	Image	\N	https://firebasestorage.googleapis.com/v0/b/traiders-1570912018415.appspot.com/o/1575406229280-ffs5579_6.jpg?alt=media&token=673c58ee-b9ff-44e2-a3e9-4b8663930490
87	TextualBody	tangle is future	\N
88	TextualBody	halving is coming 2020 may	\N
89	Image	\N	https://firebasestorage.googleapis.com/v0/b/traiders-1570912018415.appspot.com/o/1576421657447-68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f776174747061642d6d656469612d736572766963652f53746f7279496d6167652f6b6534713175574c475569537a673d3d2d3233323735343933372e313433636231346138326662316431332e706e67.png?alt=media&token=452d5d13-b40f-4770-b1a6-54bdd800ae63
90	TextualBody	yummy	\N
91	TextualBody	yummy	\N
92	Image	\N	https://firebasestorage.googleapis.com/v0/b/traiders-1570912018415.appspot.com/o/1577204361612-brexit.jpg?alt=media&token=5720a9ed-798b-4409-b51f-45ce283b6a77
93	TextualBody	test	\N
94	TextualBody	another test	\N
95	TextualBody	annotating :)	\N
96	TextualBody	nice hair	\N
97	Image	\N	https://firebasestorage.googleapis.com/v0/b/traiders-1570912018415.appspot.com/o/1577204361612-brexit.jpg?alt=media&token=45c3257e-9292-4a21-8483-450e7b21d2e6
98	TextualBody	intersecting	\N
\.


--
-- Data for Name: annotation_annotationtarget; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.annotation_annotationtarget (id, source, selector_id) FROM stdin;
1	http://example.org/article/1	1
2	https://traiders.tk/articles/5	2
3	https://media.traiders.tk/f04f56ff-d3dd-44b8-970f-e2ec26fe9467.jpeg	3
4	https://traiders.tk/articles/5	4
5	https://media.traiders.tk/f04f56ff-d3dd-44b8-970f-e2ec26fe9467.jpeg	5
6	https://api.traiders.tk/articles/103/	6
7	https://api.traiders.tk/articles/103/	7
8	https://api.traiders.tk/articles/103/	8
9	https://api.traiders.tk/articles/103/	9
10	https://api.traiders.tk/articles/103/	10
11	https://api.traiders.tk/articles/103/	11
12	https://api.traiders.tk/articles/103/	12
13	https://api.traiders.tk/articles/103/	13
14	https://api.traiders.tk/articles/103/	14
15	https://api.traiders.tk/articles/99/	15
16	https://api.traiders.tk/articles/103/	16
17	https://api.traiders.tk/articles/103/	17
18	https://api.traiders.tk/articles/103/	18
19	https://api.traiders.tk/articles/103/	19
20	https://api.traiders.tk/articles/103/	20
21	https://api.traiders.tk/articles/103/	21
22	https://api.traiders.tk/articles/103/	22
23	https://api.traiders.tk/articles/103/	23
24	https://api.traiders.tk/articles/103/	24
25	https://api.traiders.tk/articles/103/	25
26	https://api.traiders.tk/articles/99/	26
27	https://api.traiders.tk/articles/105/	27
28	https://api.traiders.tk/articles/99/	28
29	https://api.traiders.tk/articles/99/	29
30	https://api.traiders.tk/articles/99/	30
31	https://api.traiders.tk/articles/99/	31
32	https://api.traiders.tk/articles/99/	32
33	https://api.traiders.tk/articles/99/	33
34	https://api.traiders.tk/articles/99/	34
35	https://api.traiders.tk/articles/99/	35
36	https://api.traiders.tk/articles/103/	36
37	https://api.traiders.tk/articles/103/	37
38	https://api.traiders.tk/articles/103/	38
39	https://api.traiders.tk/articles/103/	39
40	https://api.traiders.tk/articles/103/	40
41	https://api.traiders.tk/articles/103/	41
42	https://api.traiders.tk/articles/103/	42
43	https://api.traiders.tk/articles/103/	43
44	https://api.traiders.tk/articles/103/	44
45	https://api.traiders.tk/articles/103/	45
46	https://api.traiders.tk/articles/99/	46
47	https://traiders.tk/articles/5	47
48	https://api.traiders.tk/articles/99/	48
49	https://api.traiders.tk/articles/99/	49
50	https://api.traiders.tk/articles/99/	50
51	https://media.traiders.tk/img4.jpg	51
52	https://media.traiders.tk/img4.jpg	52
53	https://media.traiders.tk/img4.jpg	53
54	https://media.traiders.tk/img0.jpg	54
55	https://media.traiders.tk/img0.jpg	55
56	https://media.traiders.tk/img0.jpg	56
57	https://media.traiders.tk/img0.jpg	57
58	https://media.traiders.tk/img0.jpg	58
59	https://media.traiders.tk/img0.jpg	59
60	https://media.traiders.tk/img0.jpg	60
61	https://media.traiders.tk/f04f56ff-d3dd-44b8-970f-e2ec26fe9467.jpeg	61
62	https://media.traiders.tk/f04f56ff-d3dd-44b8-970f-e2ec26fe9467.jpeg	62
63	https://media.traiders.tk/f04f56ff-d3dd-44b8-970f-e2ec26fe9467.jpeg	63
64	https://api.traiders.tk/articles/103/	64
65	https://media.traiders.tk/f04f56ff-d3dd-44b8-970f-e2ec26fe9467.jpeg	65
66	https://media.traiders.tk/f04f56ff-d3dd-44b8-970f-e2ec26fe9467.jpeg	66
67	https://api.traiders.tk/articles/103/	67
68	https://api.traiders.tk/articles/103/	68
69	https://api.traiders.tk/articles/103/	69
70	https://api.traiders.tk/articles/103/	70
71	https://api.traiders.tk/articles/103/	71
72	https://api.traiders.tk/articles/103/	72
73	https://api.traiders.tk/articles/103/	73
74	https://api.traiders.tk/articles/103/	74
75	https://media.traiders.tk/f04f56ff-d3dd-44b8-970f-e2ec26fe9467.jpeg	75
76	https://api.traiders.tk/articles/103/	76
77	https://api.traiders.tk/articles/132/	77
78	https://api.traiders.tk/articles/132/	78
79	https://api.traiders.tk/articles/130/	79
80	https://api.traiders.tk/articles/132/	80
81	https://api.traiders.tk/articles/132/	81
82	https://api.traiders.tk/articles/96/	82
83	https://media.traiders.tk/img2.jpg	83
84	https://media.traiders.tk/img2.jpg	84
85	https://media.traiders.tk/img2.jpg	85
86	https://media.traiders.tk/img2.jpg	86
87	https://api.traiders.tk/articles/132/	87
88	https://api.traiders.tk/articles/132/	88
89	https://media.traiders.tk/baklava.jpg	89
90	https://media.traiders.tk/baklava.jpg	90
91	https://media.traiders.tk/baklava.jpg	91
92	https://api.traiders.tk/articles/127/	92
93	https://api.traiders.tk/articles/133/	93
94	https://api.traiders.tk/articles/133/	94
95	https://api.traiders.tk/articles/132/	95
96	https://media.traiders.tk/img332_qyzoHks.jpg	96
97	https://media.traiders.tk/img332_qyzoHks.jpg	97
98	https://media.traiders.tk/img332_qyzoHks.jpg	98
\.


--
-- Data for Name: annotation_fragmentselector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.annotation_fragmentselector (id, value) FROM stdin;
1	char=0,100
2	char=10,20
3	xywh=50,50,100,100
4	char=10,20
5	xywh=50,50,100,100
6	char=0,16
7	char=160,178
8	char=0,9
9	char=0,30
10	char=0,13
11	char=396,405
12	char=320,341
13	char=276, 297
14	char=326, 352
15	char=600, 632
16	char=427,437
17	char=266,274
18	char=638,645
19	char=553,557
20	char=225,231
21	char=46,52
22	char=0,9
23	char=89,107
24	char=89,107
25	char=172,183
26	char=1,1
27	char=3,4
28	char=587,637
29	char=49,53
30	char=2,11
31	char=216,221
32	char=10,14
33	char=77,85
34	char=0,10
35	char=77,85
36	char=377,381
37	char=382,409
38	char=764,768
39	char=377,381
40	char=378,379
41	char=378,380
42	char=377,381
43	char=377,381
44	char=377,381
45	char=377,381
46	char=11,25
47	char=10,20
48	char=26,50
49	char=15,21
50	char=51,61
51	xywh=56.18,7.35,9.87,9.54
52	xywh=62.89,12.52,16.45,15.50
53	xywh=38.55,61.80,11.45,9.54
54	xywh=5.20,5.60,11.00,9.80
55	xywh=36.40,4.40,15.00,9.20
56	xywh=71.30,6.00,15.00,14.60
57	xywh=82.70,36.00,10.40,11.80
58	xywh=6.30,31.40,12.40,10.00
59	xywh=10.50,49.20,14.00,8.60
60	xywh=19.70,73.60,25.20,17.40
61	xywh=20.98,22.25,14.12,20.33
62	xywh=9.90,54.95,18.43,16.21
63	xywh=37.25,10.16,30.78,36.54
64	char=0,9
65	xywh=47.45,68.41,18.82,12.91
66	xywh=69.61,1.65,11.37,10.44
67	char=339,359
68	char=46,57
69	char=638,653
70	char=203,207
71	char=10,22
72	char=22,42
73	char=781,785
74	char=781,785
75	xywh=72.35,26.37,18.24,22.53
76	char=193,199
77	char=0,0
78	char=0,0
79	char=0,2
80	char=158,176
81	char=1212,1226
82	char=216,323
83	xywh=74.22,16.04,16.41,33.33
84	xywh=10.47,32.50,19.53,23.33
85	xywh=39.53,38.96,31.88,26.04
86	xywh=11.56,68.75,23.44,14.58
87	char=158,164
88	char=0,7
89	xywh=24.14,28.53,11.71,10.12
90	xywh=29.71,34.36,0.14,0.00
91	xywh=61.86,32.82,24.00,39.88
92	char=614,620
93	char=23,30
94	char=14,35
95	char=165,176
96	xywh=53.28,2.10,20.51,32.00
97	xywh=17.18,33.81,18.81,34.57
98	xywh=9.72,1.81,82.88,81.71
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add annotation body	7	add_annotationbody
26	Can change annotation body	7	change_annotationbody
27	Can delete annotation body	7	delete_annotationbody
28	Can view annotation body	7	view_annotationbody
29	Can add fragment selector	8	add_fragmentselector
30	Can change fragment selector	8	change_fragmentselector
31	Can delete fragment selector	8	delete_fragmentselector
32	Can view fragment selector	8	view_fragmentselector
33	Can add annotation target	9	add_annotationtarget
34	Can change annotation target	9	change_annotationtarget
35	Can delete annotation target	9	delete_annotationtarget
36	Can view annotation target	9	view_annotationtarget
37	Can add annotation	10	add_annotation
38	Can change annotation	10	change_annotation
39	Can delete annotation	10	delete_annotation
40	Can view annotation	10	view_annotation
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$T3yFE3qwKJHn$jmMeC1Ua2ePVKSwpcYxCI56fQgqx8s7UNrnuEuGIqDU=	2019-12-29 18:24:40.29136+00	t	admin			traidersapp@gmail.com	t	t	2019-12-13 21:55:59.998606+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-12-15 13:11:32.864093+00	6	Annotation object (6)	2	[{"changed": {"fields": ["creator"]}}]	10	1
2	2019-12-15 13:11:57.359233+00	5	Annotation object (5)	2	[{"changed": {"fields": ["creator"]}}]	10	1
3	2019-12-15 13:12:01.984322+00	4	Annotation object (4)	2	[{"changed": {"fields": ["creator"]}}]	10	1
4	2019-12-15 13:12:07.07561+00	3	Annotation object (3)	2	[{"changed": {"fields": ["creator"]}}]	10	1
5	2019-12-15 13:12:11.605419+00	1	Annotation object (1)	2	[{"changed": {"fields": ["creator"]}}]	10	1
6	2019-12-15 13:12:15.588779+00	2	Annotation object (2)	2	[{"changed": {"fields": ["creator"]}}]	10	1
7	2019-12-15 13:14:46.832445+00	5	AnnotationBody object (5)	2	[{"changed": {"fields": ["identifier"]}}]	7	1
8	2019-12-15 13:16:33.130782+00	4	AnnotationBody object (4)	2	[{"changed": {"fields": ["identifier"]}}]	7	1
9	2019-12-15 13:18:01.052961+00	4	AnnotationBody object (4)	2	[{"changed": {"fields": ["identifier"]}}]	7	1
10	2019-12-18 15:15:18.966948+00	33	Annotation object (33)	3		10	1
11	2019-12-18 15:15:18.986531+00	32	Annotation object (32)	3		10	1
12	2019-12-18 15:15:18.988694+00	31	Annotation object (31)	3		10	1
13	2019-12-18 15:15:18.989891+00	30	Annotation object (30)	3		10	1
14	2019-12-18 15:15:18.991139+00	29	Annotation object (29)	3		10	1
15	2019-12-18 15:15:18.992506+00	28	Annotation object (28)	3		10	1
16	2019-12-18 15:15:18.994602+00	27	Annotation object (27)	3		10	1
17	2019-12-18 15:15:18.995753+00	26	Annotation object (26)	3		10	1
18	2019-12-18 15:15:18.99689+00	25	Annotation object (25)	3		10	1
19	2019-12-18 15:15:18.998848+00	24	Annotation object (24)	3		10	1
20	2019-12-18 15:15:19.000027+00	23	Annotation object (23)	3		10	1
21	2019-12-18 15:15:19.001226+00	22	Annotation object (22)	3		10	1
22	2019-12-18 15:15:19.003273+00	21	Annotation object (21)	3		10	1
23	2019-12-18 15:15:19.004417+00	20	Annotation object (20)	3		10	1
24	2019-12-18 15:15:19.00568+00	19	Annotation object (19)	3		10	1
25	2019-12-18 15:15:19.006847+00	18	Annotation object (18)	3		10	1
26	2019-12-18 15:15:19.008122+00	17	Annotation object (17)	3		10	1
27	2019-12-18 15:15:19.00926+00	16	Annotation object (16)	3		10	1
28	2019-12-18 15:15:19.010452+00	15	Annotation object (15)	3		10	1
29	2019-12-18 15:15:19.01155+00	12	Annotation object (12)	3		10	1
30	2019-12-18 15:15:19.013571+00	11	Annotation object (11)	3		10	1
31	2019-12-18 15:15:19.014728+00	10	Annotation object (10)	3		10	1
32	2019-12-18 15:15:19.016691+00	9	Annotation object (9)	3		10	1
33	2019-12-18 15:15:19.017877+00	8	Annotation object (8)	3		10	1
34	2019-12-18 15:15:19.019064+00	7	Annotation object (7)	3		10	1
35	2019-12-18 15:15:19.021979+00	6	Annotation object (6)	3		10	1
36	2019-12-18 15:15:19.023165+00	5	Annotation object (5)	3		10	1
37	2019-12-18 15:15:19.024342+00	4	Annotation object (4)	3		10	1
38	2019-12-18 15:15:19.025487+00	3	Annotation object (3)	3		10	1
39	2019-12-18 15:15:19.026682+00	2	Annotation object (2)	3		10	1
40	2019-12-18 15:15:19.028812+00	1	Annotation object (1)	3		10	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	annotation	annotationbody
8	annotation	fragmentselector
9	annotation	annotationtarget
10	annotation	annotation
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-12-13 21:55:00.474356+00
2	auth	0001_initial	2019-12-13 21:55:00.589116+00
3	admin	0001_initial	2019-12-13 21:55:00.783393+00
4	admin	0002_logentry_remove_auto_add	2019-12-13 21:55:00.823061+00
5	admin	0003_logentry_add_action_flag_choices	2019-12-13 21:55:00.831564+00
6	annotation	0001_initial	2019-12-13 21:55:00.942101+00
7	contenttypes	0002_remove_content_type_name	2019-12-13 21:55:00.972987+00
8	auth	0002_alter_permission_name_max_length	2019-12-13 21:55:00.9779+00
9	auth	0003_alter_user_email_max_length	2019-12-13 21:55:00.986192+00
10	auth	0004_alter_user_username_opts	2019-12-13 21:55:00.994435+00
11	auth	0005_alter_user_last_login_null	2019-12-13 21:55:01.003298+00
12	auth	0006_require_contenttypes_0002	2019-12-13 21:55:01.005195+00
13	auth	0007_alter_validators_add_error_messages	2019-12-13 21:55:01.013875+00
14	auth	0008_alter_user_username_max_length	2019-12-13 21:55:01.030334+00
15	auth	0009_alter_user_last_name_max_length	2019-12-13 21:55:01.04934+00
16	auth	0010_alter_group_name_max_length	2019-12-13 21:55:01.059681+00
17	auth	0011_update_proxy_permissions	2019-12-13 21:55:01.07054+00
18	sessions	0001_initial	2019-12-13 21:55:01.090985+00
19	annotation	0002_annotation_creator	2019-12-15 13:08:52.242297+00
20	annotation	0003_auto_20191215_1736	2019-12-15 17:36:41.503487+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
bfqoa8py5qbl4gw0hd0kchq6mai2wpfp	NGEyNmU3MTZmYjg2MDBlNWQ4OGVmNmVkYWNjYjc4NWY2MGYxZjAzYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNmQyOThiM2IwYjNmZjcwZDNjOWEzMTIxYTUzYjc3MTA1YzU5NmYyIn0=	2019-12-27 21:56:04.410567+00
bs4lghjlwvlj66tplsyueuxmmjt4g1ls	NGEyNmU3MTZmYjg2MDBlNWQ4OGVmNmVkYWNjYjc4NWY2MGYxZjAzYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjNmQyOThiM2IwYjNmZjcwZDNjOWEzMTIxYTUzYjc3MTA1YzU5NmYyIn0=	2020-01-12 18:24:40.421909+00
\.


--
-- Name: annotation_annotation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annotation_annotation_id_seq', 98, true);


--
-- Name: annotation_annotationbody_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annotation_annotationbody_id_seq', 98, true);


--
-- Name: annotation_annotationtarget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annotation_annotationtarget_id_seq', 98, true);


--
-- Name: annotation_fragmentselector_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annotation_fragmentselector_id_seq', 98, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 40, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);


--
-- Name: annotation_annotation annotation_annotation_body_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotation
    ADD CONSTRAINT annotation_annotation_body_id_key UNIQUE (body_id);


--
-- Name: annotation_annotation annotation_annotation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotation
    ADD CONSTRAINT annotation_annotation_pkey PRIMARY KEY (id);


--
-- Name: annotation_annotation annotation_annotation_target_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotation
    ADD CONSTRAINT annotation_annotation_target_id_key UNIQUE (target_id);


--
-- Name: annotation_annotationbody annotation_annotationbody_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotationbody
    ADD CONSTRAINT annotation_annotationbody_pkey PRIMARY KEY (id);


--
-- Name: annotation_annotationtarget annotation_annotationtarget_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotationtarget
    ADD CONSTRAINT annotation_annotationtarget_pkey PRIMARY KEY (id);


--
-- Name: annotation_annotationtarget annotation_annotationtarget_selector_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotationtarget
    ADD CONSTRAINT annotation_annotationtarget_selector_id_key UNIQUE (selector_id);


--
-- Name: annotation_fragmentselector annotation_fragmentselector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_fragmentselector
    ADD CONSTRAINT annotation_fragmentselector_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: annotation_annotation annotation_annotatio_body_id_b571cbe7_fk_annotatio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotation
    ADD CONSTRAINT annotation_annotatio_body_id_b571cbe7_fk_annotatio FOREIGN KEY (body_id) REFERENCES public.annotation_annotationbody(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: annotation_annotationtarget annotation_annotatio_selector_id_5675d30b_fk_annotatio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotationtarget
    ADD CONSTRAINT annotation_annotatio_selector_id_5675d30b_fk_annotatio FOREIGN KEY (selector_id) REFERENCES public.annotation_fragmentselector(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: annotation_annotation annotation_annotatio_target_id_e6185b3c_fk_annotatio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annotation_annotation
    ADD CONSTRAINT annotation_annotatio_target_id_e6185b3c_fk_annotatio FOREIGN KEY (target_id) REFERENCES public.annotation_annotationtarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

