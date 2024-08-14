--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--





--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:K+nOJaHEh2E521MpiEpX2A==$FFWbQzX7qSUGEfVUwgYynwOsmHOkxYhjUMLWC+lTaQ4=:rfIx7Xv7U0j21yZYxLueu+SKHO8sMMmy625Sxerpfn0=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+1)

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Debian 16.4-1.pgdg120+1)

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: enum_interactions_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_interactions_type AS ENUM (
    'email',
    'call',
    'purchase',
    'deal',
    'meeting',
    'other'
);


ALTER TYPE public.enum_interactions_type OWNER TO postgres;

--
-- Name: enum_users_role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.enum_users_role AS ENUM (
    'admin',
    'seller',
    'user'
);


ALTER TYPE public.enum_users_role OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: contacts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contacts (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "phoneNumber" character varying(255),
    address character varying(255),
    avatar character varying(255),
    "firstName" character varying(255),
    "lastName" character varying(255),
    email character varying(255),
    "companyName" character varying(255),
    industry character varying(255),
    "companyLogo" character varying(255),
    "companyDeals" integer,
    "companyRevenue" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.contacts OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.contacts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.contacts_id_seq OWNER TO postgres;

--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.contacts_id_seq OWNED BY public.contacts.id;


--
-- Name: interactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interactions (
    id integer NOT NULL,
    "contactId" integer NOT NULL,
    type public.enum_interactions_type NOT NULL,
    date timestamp with time zone NOT NULL,
    notes text,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.interactions OWNER TO postgres;

--
-- Name: interactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.interactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.interactions_id_seq OWNER TO postgres;

--
-- Name: interactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.interactions_id_seq OWNED BY public.interactions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    role public.enum_users_role DEFAULT 'user'::public.enum_users_role NOT NULL,
    "firstName" character varying(255) NOT NULL,
    "lastName" character varying(255) NOT NULL,
    avatar character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: contacts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts ALTER COLUMN id SET DEFAULT nextval('public.contacts_id_seq'::regclass);


--
-- Name: interactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interactions ALTER COLUMN id SET DEFAULT nextval('public.interactions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts (id, "userId", "phoneNumber", address, avatar, "firstName", "lastName", email, "companyName", industry, "companyLogo", "companyDeals", "companyRevenue", "createdAt", "updatedAt") FROM stdin;
1	35	1-876-232-1249	5800 River Road	https://avatars.githubusercontent.com/u/91167686	Quinn	Pouros	Serenity.Schaefer39@hotmail.com	Walter LLC	Entertainment	https://loremflickr.com/640/480/business-logo?lock=2063802342309888	86	184142	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
2	43	(988) 487-8984	24143 Jarred Viaduct	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/686.jpg	Esperanza	Koepp	Shane_Marquardt80@yahoo.com	Predovic, Thompson and Ward	Technology	https://loremflickr.com/640/480/business-logo?lock=4690969198854144	79	21732	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
3	42	1-206-789-8788	9237 Abernathy Pass	https://avatars.githubusercontent.com/u/12526808	Evie	Stoltenberg	Lavern29@hotmail.com	Corkery, Jacobi and Baumbach	Entertainment	https://loremflickr.com/640/480/business-logo?lock=5879272474411008	40	384479	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
4	83	722.889.8395 x51372	67174 Loy Spurs	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/604.jpg	Bo	Bradtke	Jarvis91@yahoo.com	Paucek, Witting and Conroy	Transportation	https://loremflickr.com/640/480/business-logo?lock=6519564686852096	31	637632	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
5	59	(502) 367-5201 x61373	97797 Kutch Meadow	https://avatars.githubusercontent.com/u/36948957	Magnolia	Mante	Wyman80@hotmail.com	Streich, McCullough and Yost	Energy	https://loremflickr.com/640/480/business-logo?lock=2017795866886144	66	977678	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
6	89	(432) 850-1473 x19978	24691 Malinda Glen	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/806.jpg	Nikolas	Welch	Quinton_Zieme@gmail.com	Wisoky Inc	Energy	https://loremflickr.com/640/480/business-logo?lock=4053247421579264	34	140279	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
7	44	455-200-0357 x00173	42051 Glenda Ranch	https://avatars.githubusercontent.com/u/76726314	Emmanuel	Torphy	Lauren52@hotmail.com	Yundt - Bayer	Transportation	https://loremflickr.com/640/480/business-logo?lock=1479335957495808	35	628726	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
8	45	325-289-3003	91547 Kaylie Union	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/663.jpg	Hank	Abbott	Nannie.Hilll@gmail.com	Rolfson, Hickle and Jenkins	Education	https://loremflickr.com/640/480/business-logo?lock=87406684405760	71	605189	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
9	3	920.885.3211 x914	890 Bill Burg	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1126.jpg	Clint	Fisher	Greta.Crona@gmail.com	McDermott - Prohaska	Entertainment	https://loremflickr.com/640/480/business-logo?lock=5545844497448960	3	521009	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
10	36	1-382-315-0765 x0333	388 Smith Street	https://avatars.githubusercontent.com/u/10148991	Ray	Boyer	Declan30@yahoo.com	Anderson - Morissette	Healthcare	https://loremflickr.com/640/480/business-logo?lock=3517181658660864	42	142229	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
11	89	(593) 516-6332	4955 Jast Lodge	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/806.jpg	Nikolas	Welch	Quinton_Zieme@gmail.com	Cassin Group	Energy	https://loremflickr.com/640/480/business-logo?lock=1708916513701888	78	290533	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
12	39	502.229.5907	94967 Jenkins Dale	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1199.jpg	Ford	Bergnaum	Keshaun.Stoltenberg43@hotmail.com	Jaskolski - Maggio	Retail	https://loremflickr.com/640/480/business-logo?lock=79953576067072	41	986293	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
13	58	(615) 976-4127 x85477	8729 Springfield Road	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1022.jpg	Elissa	Goodwin-Turcotte	Foster_OReilly@yahoo.com	Stanton LLC	Transportation	https://loremflickr.com/640/480/business-logo?lock=3633731090776064	38	316603	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
14	28	1-993-298-7253 x8797	4852 S 8th Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/731.jpg	Shanelle	Casper	Malinda.Predovic@hotmail.com	Koss, Zemlak and Klocko	Retail	https://loremflickr.com/640/480/business-logo?lock=882508514197504	41	158382	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
15	26	1-793-876-5223 x9904	6192 Rebeca Run	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1008.jpg	Colton	McKenzie	Veronica4@gmail.com	Cummerata, Weissnat and Crist	Entertainment	https://loremflickr.com/640/480/business-logo?lock=2179296521093120	3	292647	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
16	79	815-915-3784 x9948	2503 Lake Avenue	https://avatars.githubusercontent.com/u/64312576	Jedidiah	Strosin	Herminia_Fritsch@hotmail.com	Zboncak Inc	Technology	https://loremflickr.com/640/480/business-logo?lock=612779836833792	37	129701	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
17	12	833-732-3306 x50099	4380 Kirlin Island	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/114.jpg	Mattie	Hickle	Laron2@hotmail.com	Okuneva, Larkin and Prosacco	Finance	https://loremflickr.com/640/480/business-logo?lock=6887273274540032	50	493838	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
18	52	1-663-234-5929 x09964	3871 Rosalyn Hollow	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1203.jpg	Zachery	Balistreri	Manuel_Bins17@hotmail.com	Effertz - Langworth	Technology	https://loremflickr.com/640/480/business-logo?lock=4532401168449536	42	118080	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
19	23	911.769.9155	6063 Gusikowski Gardens	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/239.jpg	Frances	Kunze	Hulda38@gmail.com	Senger, Ullrich and Schowalter	Energy	https://loremflickr.com/640/480/business-logo?lock=162955817648128	19	72007	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
20	56	1-314-749-1631 x94302	5197 Orion Course	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/911.jpg	Keon	Satterfield	Devin24@hotmail.com	Bosco and Sons	Transportation	https://loremflickr.com/640/480/business-logo?lock=3701223182041088	85	297584	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
21	18	861-271-7996 x459	21340 Koss Place	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/210.jpg	Treva	Spencer	Kayden_Hintz@gmail.com	Reilly Group	Technology	https://loremflickr.com/640/480/business-logo?lock=1120448425230336	25	587317	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
22	75	(630) 494-4072 x79253	46389 Flatley Place	https://avatars.githubusercontent.com/u/53804196	Jerrod	Oberbrunner	Candace.Beier@hotmail.com	Purdy Inc	Finance	https://loremflickr.com/640/480/business-logo?lock=3516435993198592	99	967757	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
23	34	630.490.4293 x9298	926 Bramble Close	https://avatars.githubusercontent.com/u/13174152	Christian	Hermiston	Constance_Collins39@yahoo.com	Stroman - D'Amore	Real Estate	https://loremflickr.com/640/480/business-logo?lock=7443767462199296	56	742302	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
24	7	463.424.2962 x9560	879 Adams Avenue	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/816.jpg	Catharine	Rutherford	Lavern.Weimann-Herman@gmail.com	Berge LLC	Technology	https://loremflickr.com/640/480/business-logo?lock=2977792606076928	69	146733	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
25	28	391.978.8393	15435 Green Extension	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/731.jpg	Shanelle	Casper	Malinda.Predovic@hotmail.com	White Group	Energy	https://loremflickr.com/640/480/business-logo?lock=702010768752640	73	504374	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
26	62	(652) 515-5123 x398	566 Spinka Brooks	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1233.jpg	Percy	Greenfelder	Irwin.Crooks39@gmail.com	Simonis Inc	Real Estate	https://loremflickr.com/640/480/business-logo?lock=4307883162337280	63	738585	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
27	40	208.309.8480 x001	4094 Cassidy Lock	https://avatars.githubusercontent.com/u/58152953	Enid	Harvey	Mabel.Littel20@gmail.com	Johnson - Pfeffer	Finance	https://loremflickr.com/640/480/business-logo?lock=4304248013586432	64	337731	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
28	76	(888) 331-1964 x409	3434 S Franklin Street	https://avatars.githubusercontent.com/u/21194323	Maximillia	Buckridge	Markus.Moen92@yahoo.com	Dickens - Boehm	Finance	https://loremflickr.com/640/480/business-logo?lock=134387584729088	31	689510	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
29	25	247.757.4448 x104	73641 Isaias Manor	https://avatars.githubusercontent.com/u/17320848	Jasper	Raynor-McKenzie	Demetrius.Reynolds37@hotmail.com	Smitham, Goyette and Deckow	Entertainment	https://loremflickr.com/640/480/business-logo?lock=433280272826368	49	568987	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
30	6	973.542.2789 x0789	918 Moor Lane	https://avatars.githubusercontent.com/u/82295148	Tristin	Bartell	Nathan_Kuvalis@yahoo.com	Kerluke Group	Technology	https://loremflickr.com/640/480/business-logo?lock=3901979459846144	62	361394	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
31	87	1-339-241-8907 x345	8582 Romaguera Fall	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1116.jpg	Aiden	Grimes	Joesph.Emmerich@yahoo.com	Schamberger Group	Finance	https://loremflickr.com/640/480/business-logo?lock=5457393072734208	28	197232	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
32	76	1-481-301-9718	5235 Wilderman Valleys	https://avatars.githubusercontent.com/u/21194323	Maximillia	Buckridge	Markus.Moen92@yahoo.com	Dach, Labadie and Weber	Retail	https://loremflickr.com/640/480/business-logo?lock=6413034050289664	35	604547	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
33	22	685.693.0483 x9098	192 Ward Greens	https://avatars.githubusercontent.com/u/10970132	Bradly	Towne-Toy	Coy27@yahoo.com	Renner Group	Education	https://loremflickr.com/640/480/business-logo?lock=7913335194386432	62	555683	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
34	41	(319) 326-6280 x388	81262 Ben Garden	https://avatars.githubusercontent.com/u/3473539	Telly	Bode	Joelle_Greenholt@hotmail.com	Corkery, Carroll and Ryan	Healthcare	https://loremflickr.com/640/480/business-logo?lock=3826694146228224	27	191501	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
35	26	1-299-211-4654 x668	56551 Conn Pines	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1008.jpg	Colton	McKenzie	Veronica4@gmail.com	McKenzie Inc	Technology	https://loremflickr.com/640/480/business-logo?lock=6616090476019712	32	43013	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
36	3	1-694-310-0736 x975	823 Otilia Mountain	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1126.jpg	Clint	Fisher	Greta.Crona@gmail.com	Upton Group	Healthcare	https://loremflickr.com/640/480/business-logo?lock=827686624690176	54	310951	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
37	94	(739) 467-4289 x2097	9328 Joannie Freeway	https://avatars.githubusercontent.com/u/66095369	Elisabeth	Prohaska	Jasmin_Flatley92@hotmail.com	Reichel - Rau	Retail	https://loremflickr.com/640/480/business-logo?lock=2306750296358912	8	721489	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
38	34	1-846-266-2071 x319	59953 E Park Avenue	https://avatars.githubusercontent.com/u/13174152	Christian	Hermiston	Constance_Collins39@yahoo.com	Wolff - Hermiston	Technology	https://loremflickr.com/640/480/business-logo?lock=7893899618025472	20	655485	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
39	33	(739) 613-3810	79421 N Central Avenue	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/740.jpg	Gabe	Schneider	Larue_Lehner79@gmail.com	Ondricka, Pfeffer and Greenfelder	Manufacturing	https://loremflickr.com/640/480/business-logo?lock=8440047783116800	52	945778	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
40	92	844-434-3631 x0538	615 E 5th Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/682.jpg	Lea	Gibson	Tracey.Lesch21@gmail.com	Tromp LLC	Technology	https://loremflickr.com/640/480/business-logo?lock=4338491416641536	34	359062	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
41	94	426-418-6116 x0468	1031 King Wall	https://avatars.githubusercontent.com/u/66095369	Elisabeth	Prohaska	Jasmin_Flatley92@hotmail.com	Turcotte LLC	Real Estate	https://loremflickr.com/640/480/business-logo?lock=8330867055263744	2	329601	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
42	49	1-817-399-8442 x2633	30492 Harrison Street	https://avatars.githubusercontent.com/u/95807183	Patience	McKenzie	Reba_Willms@yahoo.com	Hansen - Jacobs	Education	https://loremflickr.com/640/480/business-logo?lock=5356759501766656	16	188209	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
43	38	(953) 450-8887 x5596	5035 Farm Close	https://avatars.githubusercontent.com/u/90952367	Bell	Lebsack	Margaretta_Reichel@yahoo.com	Simonis Inc	Retail	https://loremflickr.com/640/480/business-logo?lock=6905934458650624	56	478573	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
44	17	660-218-6069 x9514	6584 Drew Cove	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/769.jpg	Dalton	Kovacek	Retha_Goyette67@hotmail.com	Keeling - Grant	Technology	https://loremflickr.com/640/480/business-logo?lock=2456069922095104	1	686786	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
45	99	(887) 445-2960 x82964	6516 Witting Gardens	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/456.jpg	Susie	Schumm	Felicity.Wintheiser48@yahoo.com	Streich, Kemmer and Glover	Finance	https://loremflickr.com/640/480/business-logo?lock=2442480687513600	28	422217	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
46	8	302.878.2244 x14419	6587 Hellen Village	https://avatars.githubusercontent.com/u/5207741	Audreanne	Mann	Hoyt_Nader79@gmail.com	Lind Group	Manufacturing	https://loremflickr.com/640/480/business-logo?lock=4173005034881024	66	460501	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
47	62	(862) 745-4984	20734 Wunsch Via	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1233.jpg	Percy	Greenfelder	Irwin.Crooks39@gmail.com	Koelpin - Cassin	Transportation	https://loremflickr.com/640/480/business-logo?lock=4990814690213888	81	713876	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
48	57	708-250-2478 x8511	2336 Moriah Place	https://avatars.githubusercontent.com/u/31125969	Juliana	Goldner	Mathew96@hotmail.com	Rowe, Conn and Feest	Healthcare	https://loremflickr.com/640/480/business-logo?lock=1726722479226880	82	241520	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
49	84	502.722.9236	882 The Mews	https://avatars.githubusercontent.com/u/84119797	Agustina	Wiegand	Rafael.Erdman35@yahoo.com	Kilback - Sporer	Retail	https://loremflickr.com/640/480/business-logo?lock=781937356570624	49	474778	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
50	95	1-306-851-8258	986 Marcia Viaduct	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/343.jpg	Philip	Jacobson	Magnus.Hoppe@hotmail.com	Moore, Breitenberg and Lynch	Entertainment	https://loremflickr.com/640/480/business-logo?lock=7823628871663616	18	597169	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
51	52	361-403-4919 x8587	813 Pollich Bypass	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1203.jpg	Zachery	Balistreri	Manuel_Bins17@hotmail.com	Mante, Shanahan and Legros	Entertainment	https://loremflickr.com/640/480/business-logo?lock=7216726299115520	11	445140	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
52	46	(683) 744-6042 x155	66907 Willow Road	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/761.jpg	Wayne	Beahan	Sammie0@gmail.com	Smith - Goyette	Manufacturing	https://loremflickr.com/640/480/business-logo?lock=6606091448221696	0	500828	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
53	48	1-919-259-5101 x25406	62436 E Jefferson Street	https://avatars.githubusercontent.com/u/87616605	Bernhard	Friesen	Wilhelm_Hoppe66@yahoo.com	King, Stamm and Rogahn	Technology	https://loremflickr.com/640/480/business-logo?lock=8216338396872704	11	756879	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
54	25	892-897-1664	8368 Gordon Road	https://avatars.githubusercontent.com/u/17320848	Jasper	Raynor-McKenzie	Demetrius.Reynolds37@hotmail.com	Zulauf and Sons	Education	https://loremflickr.com/640/480/business-logo?lock=2274063179317248	13	532101	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
55	69	960.536.3046 x000	436 Waterloo Road	https://avatars.githubusercontent.com/u/83622999	Devin	Grant-Gulgowski	Lucie_Homenick36@yahoo.com	Hegmann Group	Healthcare	https://loremflickr.com/640/480/business-logo?lock=7906207043944448	78	184035	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
56	57	807-945-7929 x888	1476 Walker Highway	https://avatars.githubusercontent.com/u/31125969	Juliana	Goldner	Mathew96@hotmail.com	Murazik Group	Real Estate	https://loremflickr.com/640/480/business-logo?lock=2059431409876992	5	220223	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
57	92	481-948-3254 x079	4646 S 1st Avenue	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/682.jpg	Lea	Gibson	Tracey.Lesch21@gmail.com	Denesik - Hoppe	Real Estate	https://loremflickr.com/640/480/business-logo?lock=8860387411755008	78	678323	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
58	66	656-206-3165 x363	82648 Baumbach Walk	https://avatars.githubusercontent.com/u/91666046	Velva	Schmeler	Torrance91@gmail.com	Kautzer - Braun	Retail	https://loremflickr.com/640/480/business-logo?lock=3337989384044544	77	287585	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
59	56	590.624.7293 x25502	6638 Iva Lights	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/911.jpg	Keon	Satterfield	Devin24@hotmail.com	Frami - Hilll	Retail	https://loremflickr.com/640/480/business-logo?lock=455936778960896	23	727959	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
60	40	1-565-285-2097 x1012	70456 Prospect Place	https://avatars.githubusercontent.com/u/58152953	Enid	Harvey	Mabel.Littel20@gmail.com	Fay, Towne and Smitham	Technology	https://loremflickr.com/640/480/business-logo?lock=4496043555160064	25	237099	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
61	83	(764) 201-7167 x37279	6591 Charles Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/604.jpg	Bo	Bradtke	Jarvis91@yahoo.com	Tremblay, Stoltenberg and Rogahn	Energy	https://loremflickr.com/640/480/business-logo?lock=3283284765179904	56	900748	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
62	8	(237) 580-9240 x74614	8589 W Church Street	https://avatars.githubusercontent.com/u/5207741	Audreanne	Mann	Hoyt_Nader79@gmail.com	Windler - Welch	Finance	https://loremflickr.com/640/480/business-logo?lock=7453558142140416	17	283376	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
63	73	252.642.9885 x70024	293 Blanda Lodge	https://avatars.githubusercontent.com/u/13574280	Albertha	Turcotte	Madeline.Schumm62@hotmail.com	Denesik - Kuvalis	Finance	https://loremflickr.com/640/480/business-logo?lock=1994219851874304	73	138886	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
64	2	565-261-2984	6283 Schumm Gardens	https://avatars.githubusercontent.com/u/92325223	David	Wehner	Marcelina.Denesik47@yahoo.com	Ernser Inc	Healthcare	https://loremflickr.com/640/480/business-logo?lock=7424125068902400	68	933720	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
65	80	563-467-9666	49339 Tristin Light	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/418.jpg	Verlie	Swift	Yadira_Farrell87@gmail.com	Brekke, Maggio and Tromp	Retail	https://loremflickr.com/640/480/business-logo?lock=3293159452835840	72	147385	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
66	92	721.233.6358 x184	76536 S Monroe Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/682.jpg	Lea	Gibson	Tracey.Lesch21@gmail.com	Streich Inc	Real Estate	https://loremflickr.com/640/480/business-logo?lock=5729961275031552	38	287558	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
67	86	(594) 848-8954 x6881	597 Manor Way	https://avatars.githubusercontent.com/u/67149936	Kyla	Schneider-Braun	Clay.Harvey97@hotmail.com	Ryan, Hand and Fahey	Entertainment	https://loremflickr.com/640/480/business-logo?lock=5934082886205440	88	114875	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
68	99	(562) 427-1882 x660	423 Monroe Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/456.jpg	Susie	Schumm	Felicity.Wintheiser48@yahoo.com	Auer, Blick and Hessel	Entertainment	https://loremflickr.com/640/480/business-logo?lock=4163909936218112	80	949328	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
69	16	312.846.2152 x90193	3108 Cordell Valleys	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/652.jpg	Joanne	Shields	Jewell_Pfannerstill4@hotmail.com	Barton, Mayer and Mueller	Manufacturing	https://loremflickr.com/640/480/business-logo?lock=223293200138240	8	14382	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
70	96	334-419-3689 x7106	6103 Goyette Parkway	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1165.jpg	Ciara	Senger	Rebeka_Keeling1@yahoo.com	Hahn, Emard and Schuppe	Healthcare	https://loremflickr.com/640/480/business-logo?lock=4544316752003072	37	579251	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
71	51	276.991.8836 x737	7803 S Broadway Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/822.jpg	Linda	Terry	Hollie.Dach33@yahoo.com	Balistreri - Thompson	Education	https://loremflickr.com/640/480/business-logo?lock=1253492052197376	73	69729	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
72	100	633.869.6772 x689	476 Virginie Burgs	https://avatars.githubusercontent.com/u/17973803	Neha	Osinski	Titus_Marquardt1@hotmail.com	Greenfelder Group	Technology	https://loremflickr.com/640/480/business-logo?lock=3200287231705088	13	911444	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
73	16	526.481.7373 x8867	80012 E Broadway	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/652.jpg	Joanne	Shields	Jewell_Pfannerstill4@hotmail.com	Hilpert - Nienow	Healthcare	https://loremflickr.com/640/480/business-logo?lock=1001817645252608	93	841285	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
74	25	961.536.4530	884 Feest Ridges	https://avatars.githubusercontent.com/u/17320848	Jasper	Raynor-McKenzie	Demetrius.Reynolds37@hotmail.com	Koelpin Group	Manufacturing	https://loremflickr.com/640/480/business-logo?lock=2519383779835904	2	739340	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
75	83	(688) 349-6182 x5104	1221 Viola Fork	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/604.jpg	Bo	Bradtke	Jarvis91@yahoo.com	Kemmer LLC	Retail	https://loremflickr.com/640/480/business-logo?lock=3841703423246336	43	259311	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
76	84	874.778.8884 x141	568 7th Street	https://avatars.githubusercontent.com/u/84119797	Agustina	Wiegand	Rafael.Erdman35@yahoo.com	Weimann Group	Healthcare	https://loremflickr.com/640/480/business-logo?lock=4151333479251968	35	999187	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
77	32	837.819.4866	589 Eliezer Valleys	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/199.jpg	Silas	Altenwerth	Olga84@gmail.com	Kuhn - Upton	Technology	https://loremflickr.com/640/480/business-logo?lock=1745656030953472	28	64918	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
78	28	(660) 872-0578	70852 Wisozk Rue	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/731.jpg	Shanelle	Casper	Malinda.Predovic@hotmail.com	Bradtke and Sons	Retail	https://loremflickr.com/640/480/business-logo?lock=3008376753618944	90	210654	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
79	10	464-227-2644 x97227	2367 Melany Highway	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/713.jpg	Mabelle	Weber	Effie.Nienow99@gmail.com	Bechtelar - Satterfield	Healthcare	https://loremflickr.com/640/480/business-logo?lock=746105824346112	36	45457	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
80	87	565.745.6460 x028	8477 Bette Rapids	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1116.jpg	Aiden	Grimes	Joesph.Emmerich@yahoo.com	Crist LLC	Technology	https://loremflickr.com/640/480/business-logo?lock=2115335387873280	75	30809	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
81	83	(334) 865-4551 x4759	8692 Haag Hill	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/604.jpg	Bo	Bradtke	Jarvis91@yahoo.com	Mann, Bergnaum and Dickinson	Manufacturing	https://loremflickr.com/640/480/business-logo?lock=6454901949333504	87	827236	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
82	90	905-389-1355 x72427	650 Boundary Road	https://avatars.githubusercontent.com/u/85636848	Karina	Stroman	Eliezer_Aufderhar13@yahoo.com	Maggio Inc	Retail	https://loremflickr.com/640/480/business-logo?lock=5305160079245312	63	602460	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
83	49	(607) 615-6076 x455	15097 Lane Village	https://avatars.githubusercontent.com/u/95807183	Patience	McKenzie	Reba_Willms@yahoo.com	Casper Group	Education	https://loremflickr.com/640/480/business-logo?lock=3219973252055040	53	66174	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
84	18	680-215-5380 x9450	6573 Brice Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/210.jpg	Treva	Spencer	Kayden_Hintz@gmail.com	Greenholt - Hackett	Technology	https://loremflickr.com/640/480/business-logo?lock=220705438302208	25	967381	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
85	49	290-587-5885	97177 Keebler Hills	https://avatars.githubusercontent.com/u/95807183	Patience	McKenzie	Reba_Willms@yahoo.com	Feil, Lang and Christiansen	Technology	https://loremflickr.com/640/480/business-logo?lock=1841522311954432	96	415215	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
86	96	(725) 797-0780	379 E Water Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1165.jpg	Ciara	Senger	Rebeka_Keeling1@yahoo.com	Keeling, Beer and Mante	Technology	https://loremflickr.com/640/480/business-logo?lock=670200508710912	11	4969	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
87	6	(769) 284-5045 x95319	95376 St George's Road	https://avatars.githubusercontent.com/u/82295148	Tristin	Bartell	Nathan_Kuvalis@yahoo.com	Kautzer, Kris and Pouros	Technology	https://loremflickr.com/640/480/business-logo?lock=2813930676158464	34	277661	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
88	25	558-368-6146 x890	7058 E River Road	https://avatars.githubusercontent.com/u/17320848	Jasper	Raynor-McKenzie	Demetrius.Reynolds37@hotmail.com	O'Reilly - Baumbach	Technology	https://loremflickr.com/640/480/business-logo?lock=1786071402676224	66	636871	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
89	90	399-411-4885 x0597	7778 Roman Way	https://avatars.githubusercontent.com/u/85636848	Karina	Stroman	Eliezer_Aufderhar13@yahoo.com	Hirthe, Bergstrom and Littel	Energy	https://loremflickr.com/640/480/business-logo?lock=645143218618368	40	771182	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
90	54	644.916.1088 x52354	304 Ryley Estate	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/598.jpg	Kris	Runolfsdottir	Vicenta.Klein@gmail.com	Hauck LLC	Entertainment	https://loremflickr.com/640/480/business-logo?lock=8934977674674176	94	886331	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
91	2	(501) 925-6651 x2200	358 Elisabeth Greens	https://avatars.githubusercontent.com/u/92325223	David	Wehner	Marcelina.Denesik47@yahoo.com	Johnston LLC	Energy	https://loremflickr.com/640/480/business-logo?lock=6789814722494464	88	764810	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
92	68	(914) 988-1079 x74076	53815 Alma Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/212.jpg	Zaria	Huel	Alexander.Schaden5@hotmail.com	Hermann LLC	Real Estate	https://loremflickr.com/640/480/business-logo?lock=4898381180698624	13	541324	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
93	31	1-549-313-0510 x7477	56085 Hane Club	https://avatars.githubusercontent.com/u/34392931	Claudie	Brakus	Alphonso_Mosciski98@yahoo.com	Grady - Koepp	Finance	https://loremflickr.com/640/480/business-logo?lock=3536892733685760	28	339652	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
94	41	1-275-279-4785 x163	3624 Lang Avenue	https://avatars.githubusercontent.com/u/3473539	Telly	Bode	Joelle_Greenholt@hotmail.com	Powlowski, McCullough and Ferry	Energy	https://loremflickr.com/640/480/business-logo?lock=8605754565066752	74	808701	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
95	17	247-355-6643	27230 Cayla View	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/769.jpg	Dalton	Kovacek	Retha_Goyette67@hotmail.com	Streich Inc	Energy	https://loremflickr.com/640/480/business-logo?lock=1227155694419968	70	253993	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
96	68	621-572-2710	342 Castle Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/212.jpg	Zaria	Huel	Alexander.Schaden5@hotmail.com	Daugherty, Bosco and Altenwerth	Education	https://loremflickr.com/640/480/business-logo?lock=7539463546732544	70	135266	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
97	43	452-247-5701 x253	495 Klocko Flat	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/686.jpg	Esperanza	Koepp	Shane_Marquardt80@yahoo.com	Bednar Group	Energy	https://loremflickr.com/640/480/business-logo?lock=5403420013887488	66	321213	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
98	39	1-836-876-5411 x0024	597 Morar Via	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1199.jpg	Ford	Bergnaum	Keshaun.Stoltenberg43@hotmail.com	Schoen, Halvorson and Greenfelder	Technology	https://loremflickr.com/640/480/business-logo?lock=2041143221026816	18	727216	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
99	40	956-986-1521	38715 Lake Drive	https://avatars.githubusercontent.com/u/58152953	Enid	Harvey	Mabel.Littel20@gmail.com	Hessel, Bergnaum and Lockman	Real Estate	https://loremflickr.com/640/480/business-logo?lock=1651789550059520	63	50504	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
100	50	917-744-0804 x6880	61033 Margret Place	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/654.jpg	Pierce	Upton	Jessica_Spencer@yahoo.com	Bernier Inc	Finance	https://loremflickr.com/640/480/business-logo?lock=7216794875985920	17	466323	2024-08-13 07:50:39.18+00	2024-08-13 07:50:39.18+00
\.


--
-- Data for Name: interactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interactions (id, "contactId", type, date, notes, "createdAt", "updatedAt") FROM stdin;
1	76	deal	2024-08-26 22:37:07.072+00	Caute comes enim vulariter numquam vehemens angulus.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
2	36	meeting	2024-08-29 08:59:22.579+00	Tamdiu vesco depromo statua cupiditate constans.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
3	66	deal	2024-08-10 19:12:51.978+00	Concido aequitas valde deinde vel amicitia arca celebrer viscus.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
4	72	deal	2024-08-09 03:49:22.731+00	Vitium tunc utor advenio.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
5	75	email	2024-08-28 15:02:26.921+00	Vinum arceo tristis sono ulterius adulescens abbas.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
6	12	call	2024-08-09 13:00:42.452+00	Ulciscor terreo dicta earum vapulus.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
7	43	call	2024-08-19 10:58:18.669+00	Spes deleo coniecto ullus patior ascit.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
8	81	email	2024-08-28 15:42:17.788+00	Hic sperno vix.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
9	51	call	2024-08-14 12:28:42.074+00	Ultio statim turba coruscus pariatur summisse super adiuvo cupiditas.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
10	66	email	2024-08-30 20:46:39.271+00	Demergo cibo incidunt amo artificiose ulciscor vomica soleo libero desolo.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
11	56	call	2024-08-03 23:00:04.363+00	Amitto viriliter sumptus et quisquam tubineus tabula acervus.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
12	59	other	2024-08-04 06:43:08.296+00	Tametsi curis tantillus illo.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
13	72	call	2024-08-20 05:24:19.406+00	Blanditiis enim thermae aranea calculus.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
14	65	email	2024-08-08 11:23:23.203+00	Taedium sublime angustus bis aspernatur tripudio circumvenio tepesco patrocinor studio.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
15	48	deal	2024-08-05 08:07:49.415+00	Nemo censura vita tantum.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
16	71	deal	2024-08-17 09:11:43.159+00	Tres sumo vulariter necessitatibus audax dens desidero.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
17	1	other	2024-08-21 03:51:15.575+00	Constans abscido bestia peior studio totidem crustulum sapiente denuo.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
18	41	meeting	2024-08-05 01:46:16.941+00	Demens tantillus trado somnus subvenio.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
19	14	meeting	2024-08-28 11:31:33.519+00	Advenio calco adfero.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
20	83	call	2024-08-09 19:40:23.079+00	Demulceo aeger attero candidus teneo super cunctatio sortitus teres deleo.	2024-08-13 16:24:08.846+00	2024-08-13 16:24:08.846+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, email, role, "firstName", "lastName", avatar, "createdAt", "updatedAt") FROM stdin;
1	Michaela.Hessel3	P2zGPxpLgeewT93	Roderick.Smith@gmail.com	seller	Cooper	Larkin-Gibson	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/612.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
2	Candida.Turner27	nuP_uhYZj8FMyFa	Marcelina.Denesik47@yahoo.com	seller	David	Wehner	https://avatars.githubusercontent.com/u/92325223	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
3	Michael_Moore9	koNO01FlPFS0wBm	Greta.Crona@gmail.com	seller	Clint	Fisher	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1126.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
4	Adell.Fritsch	wi_jLdIeMKl08m8	Adaline_Gorczany@gmail.com	user	Misty	Hauck	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/706.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
5	Everette6	Wpi__ETX3USW134	Nathan_Ankunding78@yahoo.com	seller	Andy	Doyle	https://avatars.githubusercontent.com/u/4100264	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
6	Jessica10	CxABWQuBBXKomvt	Nathan_Kuvalis@yahoo.com	admin	Tristin	Bartell	https://avatars.githubusercontent.com/u/82295148	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
7	Elian31	OKKpHOxFLTlKGlO	Lavern.Weimann-Herman@gmail.com	seller	Catharine	Rutherford	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/816.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
8	Joy55	kl8s3_MgCHXLTTa	Hoyt_Nader79@gmail.com	seller	Audreanne	Mann	https://avatars.githubusercontent.com/u/5207741	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
9	Mina_Abernathy	dWf67OTxFFZpJZ8	Rhett.Walsh47@hotmail.com	seller	Francisco	Weissnat	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/952.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
10	Alessandro31	KU9CjCMXsAJ7Y4_	Effie.Nienow99@gmail.com	admin	Mabelle	Weber	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/713.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
11	Dorthy_Hagenes59	yj9hHCf6AvGREs8	Green86@hotmail.com	seller	Reilly	Weber	https://avatars.githubusercontent.com/u/93189657	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
12	Meredith.Terry	FbeDMeHyK9HcSeW	Laron2@hotmail.com	seller	Mattie	Hickle	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/114.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
13	Gunnar_Simonis48	OKEu2L2Bk631Q2F	Concepcion73@gmail.com	user	Kasandra	Parker	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1127.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
14	Chandler.Crooks	pzgXVFm30cn91L4	Lacy.Reynolds65@yahoo.com	admin	Olga	Zieme	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/592.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
15	Yvette.Morissette	M6157MlETyWw2zP	Frederic_Vandervort61@yahoo.com	seller	Eulalia	Walter	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/348.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
16	Vernice_Vandervort	FV7gfFmHcKACrG1	Jewell_Pfannerstill4@hotmail.com	user	Joanne	Shields	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/652.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
17	Wilhelmine.McDermott-Kuhic94	I7UTCEWky2_HXP7	Retha_Goyette67@hotmail.com	admin	Dalton	Kovacek	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/769.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
18	Titus17	IrVnCfUvqpEhAGx	Kayden_Hintz@gmail.com	user	Treva	Spencer	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/210.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
19	Kennedy43	PZVcXd8aMbbygBc	Harvey_Zieme@gmail.com	admin	Hubert	Simonis	https://avatars.githubusercontent.com/u/90957376	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
20	Garrison.West97	0rpdBhwex_UFLeB	Felton21@gmail.com	seller	Christelle	Conn	https://avatars.githubusercontent.com/u/38916195	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
21	Harrison.Dickinson71	m_EsE5JgCwBFKqq	Cicero.Braun@hotmail.com	user	Jeffrey	Keebler	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1046.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
22	Lyric0	rFiIqNbbRY5wp14	Coy27@yahoo.com	user	Bradly	Towne-Toy	https://avatars.githubusercontent.com/u/10970132	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
23	Emelia_Oberbrunner	G3pxwNwZYvHpg7i	Hulda38@gmail.com	seller	Frances	Kunze	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/239.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
24	Nicole_Wolf84	GC7fzQLDLZPn6Yv	Chad.Kovacek67@hotmail.com	user	Kariane	Schamberger	https://avatars.githubusercontent.com/u/70033798	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
25	Elody.Wisozk	zbHaUbfutKb5qhy	Demetrius.Reynolds37@hotmail.com	seller	Jasper	Raynor-McKenzie	https://avatars.githubusercontent.com/u/17320848	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
26	Kennedy.King	tR2_uE6EhATsoue	Veronica4@gmail.com	user	Colton	McKenzie	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1008.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
27	Holly.Cummings	PCz9BtUFfDGWcWb	Nikita90@yahoo.com	admin	Carolanne	Daugherty	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/415.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
28	Alice_Mueller	MUsKy4XLTi_q8J7	Malinda.Predovic@hotmail.com	user	Shanelle	Casper	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/731.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
29	Columbus_Rowe	S9dkc61WyWY0qoc	Felipe.Hettinger35@yahoo.com	admin	Golden	Jacobi-Franecki	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/97.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
30	Juana.Carroll73	LJw2JdnXRoEBirC	Adrien_Bosco@gmail.com	user	Christiana	McKenzie	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/964.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
31	Lilyan_Lynch	_E1jcPZmphLizfO	Alphonso_Mosciski98@yahoo.com	seller	Claudie	Brakus	https://avatars.githubusercontent.com/u/34392931	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
32	Jaime39	E18Wt6cscUVifBi	Olga84@gmail.com	user	Silas	Altenwerth	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/199.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
33	Tomas_Kirlin	YW8BpzktPh1wu3t	Larue_Lehner79@gmail.com	seller	Gabe	Schneider	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/740.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
34	Kathleen.Rice	sX6kZWILI6I9kgG	Constance_Collins39@yahoo.com	seller	Christian	Hermiston	https://avatars.githubusercontent.com/u/13174152	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
35	Nelle60	PvCypf_YuJZrBPM	Serenity.Schaefer39@hotmail.com	admin	Quinn	Pouros	https://avatars.githubusercontent.com/u/91167686	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
36	Delilah.Okuneva3	wf1Ldrcsyznrqgh	Declan30@yahoo.com	user	Ray	Boyer	https://avatars.githubusercontent.com/u/10148991	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
37	Naomie8	88YVoBQofLGtdOn	Makenna23@hotmail.com	admin	Ressie	Pfannerstill-Johnson	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/597.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
38	Clay.Wintheiser16	vEF5HylIl4_yCJW	Margaretta_Reichel@yahoo.com	admin	Bell	Lebsack	https://avatars.githubusercontent.com/u/90952367	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
39	Timothy.Dicki	QVw4P442xRx9TQN	Keshaun.Stoltenberg43@hotmail.com	user	Ford	Bergnaum	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1199.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
40	Verona49	lNnXzkt1LiSdVg0	Mabel.Littel20@gmail.com	admin	Enid	Harvey	https://avatars.githubusercontent.com/u/58152953	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
41	Bessie.Block52	8RNOjCtHC_jzLp7	Joelle_Greenholt@hotmail.com	admin	Telly	Bode	https://avatars.githubusercontent.com/u/3473539	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
42	Winona83	Te76sVaJgiZJLf3	Lavern29@hotmail.com	user	Evie	Stoltenberg	https://avatars.githubusercontent.com/u/12526808	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
43	Alanna_Von93	8bPr_jfy41n4wqw	Shane_Marquardt80@yahoo.com	seller	Esperanza	Koepp	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/686.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
44	Vita_Jerde	NXG9ZeiQ6iQEBId	Lauren52@hotmail.com	seller	Emmanuel	Torphy	https://avatars.githubusercontent.com/u/76726314	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
45	Adolfo_VonRueden-Okuneva60	HPx4w3fQyAdZ8G6	Nannie.Hilll@gmail.com	user	Hank	Abbott	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/663.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
46	Jerel_Waelchi88	Fpwsj44bE3BMj3l	Sammie0@gmail.com	user	Wayne	Beahan	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/761.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
47	Lonzo_Jacobs28	axbZxekOA4N55aq	Ova_Kshlerin@gmail.com	admin	Sherwood	Koelpin	https://avatars.githubusercontent.com/u/94626541	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
48	Amelia_McLaughlin-Konopelski29	R8POeCHKaJpPdHy	Wilhelm_Hoppe66@yahoo.com	seller	Bernhard	Friesen	https://avatars.githubusercontent.com/u/87616605	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
49	Mortimer_Wilkinson23	ZvGz_QPKqACfICc	Reba_Willms@yahoo.com	seller	Patience	McKenzie	https://avatars.githubusercontent.com/u/95807183	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
50	Elissa.Cummerata	xSLJphX0DOu2lRe	Jessica_Spencer@yahoo.com	user	Pierce	Upton	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/654.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
51	Meghan3	96s3Hhv1DvuBMcO	Hollie.Dach33@yahoo.com	user	Linda	Terry	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/822.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
52	Jeffry64	2GSuQ3qL3vY1S8T	Manuel_Bins17@hotmail.com	seller	Zachery	Balistreri	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1203.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
53	Courtney28	NekoGZOLzhUzW_N	Eliezer50@yahoo.com	user	Floyd	Swaniawski	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1070.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
54	Monserrate.Thiel0	zUPi18WnjCprFvz	Vicenta.Klein@gmail.com	seller	Kris	Runolfsdottir	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/598.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
55	Lane.Mueller16	UkOIVjd7MnAAaxy	Stone_Moore18@gmail.com	admin	Joelle	Hauck	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/525.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
56	Charles_Reynolds52	OJMzIX3w3stQqbg	Devin24@hotmail.com	user	Keon	Satterfield	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/911.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
57	Annabel.Emmerich45	KGYlZsN8tj0AgVz	Mathew96@hotmail.com	user	Juliana	Goldner	https://avatars.githubusercontent.com/u/31125969	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
58	Kenna_Toy59	3xJIFvIw0nDY6ma	Foster_OReilly@yahoo.com	admin	Elissa	Goodwin-Turcotte	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1022.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
59	Trinity72	eEjZitJc3WI1vrs	Wyman80@hotmail.com	seller	Magnolia	Mante	https://avatars.githubusercontent.com/u/36948957	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
60	Connor_Sipes	hE_imH9eSm3nwkp	Sandy.Corkery@hotmail.com	user	Tyrese	Gutkowski	https://avatars.githubusercontent.com/u/77492088	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
61	Joana.Larkin	dVWqmFHb9kJr3xH	Kyler.Kovacek44@yahoo.com	seller	Elvie	Schoen	https://avatars.githubusercontent.com/u/16738659	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
62	Tate26	GeWpEEyKJY1RRgY	Irwin.Crooks39@gmail.com	user	Percy	Greenfelder	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1233.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
63	Darian.West8	S8yjwdaXHh2uUTP	Lilly.Auer44@yahoo.com	seller	Nellie	Gutmann	https://avatars.githubusercontent.com/u/90381199	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
64	Aliyah_Bartoletti82	iwtzuODyzRjjzmC	Tessie58@hotmail.com	seller	Dean	Bartoletti	https://avatars.githubusercontent.com/u/60398938	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
65	Ona97	qN4J9juEfLmD4pj	Lavern.Pagac@yahoo.com	user	Jaida	Robel	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1209.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
66	Cara_Hamill81	jw_t5blIPVgEuzb	Torrance91@gmail.com	seller	Velva	Schmeler	https://avatars.githubusercontent.com/u/91666046	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
67	Grover.DAmore	7Xtoo7UguM92Lws	Hal.Lesch@yahoo.com	user	Candice	Ryan	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/781.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
68	Jaqueline_Crooks30	fdmefdYZ7wKntnx	Alexander.Schaden5@hotmail.com	admin	Zaria	Huel	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/212.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
69	Constantin74	SEeJZDYt5hU43wZ	Lucie_Homenick36@yahoo.com	seller	Devin	Grant-Gulgowski	https://avatars.githubusercontent.com/u/83622999	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
70	Lukas.Rogahn-Ziemann	ZFQqz_xuyL0AXNk	Jewell.Mraz27@yahoo.com	admin	Misael	Dibbert	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/964.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
71	Marcelina17	pf7z0J103wZm449	Anibal_Wiza@yahoo.com	seller	Myrna	Schimmel	https://avatars.githubusercontent.com/u/79029074	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
72	Christopher.Gleason	i0sOVwH7D2HauLe	Orville.Graham99@yahoo.com	user	Delaney	Dicki	https://avatars.githubusercontent.com/u/39816643	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
73	Enoch.Koch45	a4GoNoE_GfYkDcE	Madeline.Schumm62@hotmail.com	admin	Albertha	Turcotte	https://avatars.githubusercontent.com/u/13574280	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
74	Jazmyn_Kilback57	5JRtMAz4WUwBtKM	Nya_Mitchell61@hotmail.com	user	Tillman	Champlin	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/982.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
75	Amber.DAmore-Crona18	JM9M468A7MQQPTo	Candace.Beier@hotmail.com	user	Jerrod	Oberbrunner	https://avatars.githubusercontent.com/u/53804196	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
76	Erwin.Gislason36	3dSEJ1QryYhwVSV	Markus.Moen92@yahoo.com	admin	Maximillia	Buckridge	https://avatars.githubusercontent.com/u/21194323	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
77	Lizeth.Ritchie-Daniel53	BmAEzgp0HBXtmv0	Theresa_Vandervort@hotmail.com	user	Mortimer	Christiansen	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/854.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
78	Juwan.Ferry75	yjnqwM34NbqQfpT	Annamarie.Mayer29@hotmail.com	seller	Amani	Kling	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/475.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
79	Perry75	GZ6DFl8ATePVwMm	Herminia_Fritsch@hotmail.com	admin	Jedidiah	Strosin	https://avatars.githubusercontent.com/u/64312576	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
80	Paolo22	K4VRYMYpi_d_wh7	Yadira_Farrell87@gmail.com	seller	Verlie	Swift	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/418.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
81	Pat.Windler39	BdMxpSa57Xls_VH	Jamie.Lind@gmail.com	seller	Maci	Rolfson	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/408.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
82	Triston_Walker	1i9WB4FgCcS_Gwd	Terrence.Kunde83@gmail.com	admin	Kristopher	Harris	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1104.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
83	Violet24	zODR63R2zN6Vvtd	Jarvis91@yahoo.com	admin	Bo	Bradtke	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/604.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
84	Jorge_Bednar	K6peDVoNniJ0cEV	Rafael.Erdman35@yahoo.com	seller	Agustina	Wiegand	https://avatars.githubusercontent.com/u/84119797	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
85	Birdie_Kunde3	giR8u5EBXxKmfP8	Enid_Bernhard28@hotmail.com	admin	Leonardo	Hermann	https://avatars.githubusercontent.com/u/96685526	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
86	Alana34	HOuoyvVeXkkaHZu	Clay.Harvey97@hotmail.com	seller	Kyla	Schneider-Braun	https://avatars.githubusercontent.com/u/67149936	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
87	Saul53	VvfusEwiSI32P2f	Joesph.Emmerich@yahoo.com	seller	Aiden	Grimes	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1116.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
88	Bobbie_Beahan61	bC6CNeUX1Lu4XGo	Easton.Corkery@gmail.com	user	Emmett	Beier	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/709.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
89	Reyes70	U1AXI1j6tsLRUSV	Quinton_Zieme@gmail.com	seller	Nikolas	Welch	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/806.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
90	Javonte12	iiZt6e9RhA5lIN9	Eliezer_Aufderhar13@yahoo.com	admin	Karina	Stroman	https://avatars.githubusercontent.com/u/85636848	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
91	Berneice.Lueilwitz80	bpOyJSiQp8fb9ay	Albin.Hills91@gmail.com	admin	Willa	Nader	https://avatars.githubusercontent.com/u/12705678	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
92	Princess_Ruecker	I3zLIbmpdXZDy1c	Tracey.Lesch21@gmail.com	seller	Lea	Gibson	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/682.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
93	Virginia5	4eBpaiVz5Lj6O3r	Tyrel57@yahoo.com	seller	Gabriel	Kautzer	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/125.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
94	Edison.Gutkowski21	JAh1oWZOyIQBqqE	Jasmin_Flatley92@hotmail.com	user	Elisabeth	Prohaska	https://avatars.githubusercontent.com/u/66095369	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
95	Reina.Ratke56	OO5rn0cr8ufUP4p	Magnus.Hoppe@hotmail.com	user	Philip	Jacobson	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/343.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
96	Marshall13	vXftHuZSqsovhdp	Rebeka_Keeling1@yahoo.com	user	Ciara	Senger	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1165.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
97	Ladarius_Brekke61	eSg6nwuHjNNvtMH	Angelina.Schinner@gmail.com	user	Abigail	Hudson	https://avatars.githubusercontent.com/u/9414723	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
98	Shemar_Stanton	PDF3fFRTTaCvgH6	Camilla.Cormier-Morar@gmail.com	user	Uriah	Bauch	https://avatars.githubusercontent.com/u/76164456	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
99	Sylvan.Kovacek	Etle5_L0EQu9ArF	Felicity.Wintheiser48@yahoo.com	seller	Susie	Schumm	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/456.jpg	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
100	Aniyah24	AR_B6nV9BJBL0af	Titus_Marquardt1@hotmail.com	admin	Neha	Osinski	https://avatars.githubusercontent.com/u/17973803	2024-08-07 02:04:09.275+00	2024-08-07 02:04:09.275+00
\.


--
-- Name: contacts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.contacts_id_seq', 100, true);


--
-- Name: interactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interactions_id_seq', 20, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: interactions interactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interactions
    ADD CONSTRAINT interactions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: contacts contacts_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT "contacts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: interactions interactions_contactId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interactions
    ADD CONSTRAINT "interactions_contactId_fkey" FOREIGN KEY ("contactId") REFERENCES public.contacts(id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

