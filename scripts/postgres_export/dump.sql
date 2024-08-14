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

COPY public.contacts (id, "phoneNumber", address, avatar, "firstName", "lastName", email, "companyName", industry, "companyLogo", "companyDeals", "companyRevenue", "createdAt", "updatedAt") FROM stdin;
19	1-681-367-2385	5474 Effertz Plains	https://avatars.githubusercontent.com/u/91148977	Rozella	Hegmann	Georgiana.Doyle@hotmail.com	Conn LLC	Real Estate	https://loremflickr.com/640/480/business-logo?lock=7864322912944128	7	89142	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
20	1-813-315-5821 x3444	5361 Dale Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/879.jpg	Rhiannon	Waelchi	Newton58@gmail.com	Gorczany LLC	Healthcare	https://loremflickr.com/640/480/business-logo?lock=3893875385040896	84	535825	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
21	620-467-0399 x37244	9741 Liliane Route	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/565.jpg	Kyla	McDermott	Bria_Mraz@yahoo.com	Beier - Nolan	Retail	https://loremflickr.com/640/480/business-logo?lock=7598731186667520	77	157609	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
22	1-375-381-6100	13111 Turcotte Avenue	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/371.jpg	Kira	Breitenberg	Darrin_Larson54@yahoo.com	Schmitt, Deckow and Connelly	Manufacturing	https://loremflickr.com/640/480/business-logo?lock=1400629408825344	11	674726	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
23	634.898.2999	96899 Alfonzo Inlet	https://avatars.githubusercontent.com/u/38623346	Robbie	Wyman	Samantha83@yahoo.com	Ferry - Dicki	Retail	https://loremflickr.com/640/480/business-logo?lock=7931462586204160	99	304351	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
24	(382) 697-4080 x287	800 Simonis Canyon	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/132.jpg	Esteban	Cremin	Shirley.Runolfsson80@yahoo.com	Muller, Hettinger and Breitenberg	Real Estate	https://loremflickr.com/640/480/business-logo?lock=8505844635271168	94	429272	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
25	(284) 285-3616	846 Field Lane	https://avatars.githubusercontent.com/u/71558894	Pearlie	Legros	Calista_Schimmel@gmail.com	Murphy - Cassin	Healthcare	https://loremflickr.com/640/480/business-logo?lock=8554935574593536	98	257954	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
26	1-246-964-6502 x865	3504 Arvel Roads	https://avatars.githubusercontent.com/u/35814431	Titus	Hyatt	Mylene.Kunze@yahoo.com	Weber Group	Retail	https://loremflickr.com/640/480/business-logo?lock=7850671483125760	7	882743	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
111	6716-3540	Prueba 2	Prueba 2	Prueba 2	Prueba 2	Prueba@gmail.com	\N	\N	\N	\N	\N	2024-08-14 05:32:08.595+00	2024-08-14 05:32:08.595+00
9	1-737-559-5354 x7860	45206 Carolina Port	https://avatars.githubusercontent.com/u/92023915	Sven	Mayert	Rebecca22@yahoo.com	Bashirian - Littel	Education	https://loremflickr.com/640/480/business-logo?lock=3545892246257664	50	256093	2024-08-14 04:16:01.039+00	2024-08-14 10:01:04.788+00
5	1-366-657-5866 x634	565 Riverside Avenue	https://avatars.githubusercontent.com/u/57900380	Dixie	Welch	Santina_Cole@yahoo.com	Lubowitz - Schuppe	Entertainment	https://loremflickr.com/640/480/business-logo?lock=1544470099132416	50	158424	2024-08-14 04:16:01.039+00	2024-08-14 09:47:00.41+00
6	674-659-5071	26847 Railroad Avenue	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/37.jpg	Katheryn	Greenholt-Walter	Franz.Lesch55@gmail.com	Glover - Fritsch	Healthcare	https://loremflickr.com/640/480/business-logo?lock=7606822812778496	50	695638	2024-08-14 04:16:01.039+00	2024-08-14 09:47:17.905+00
16	1-242-877-6390 x829	50725 Walnut Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/178.jpg	Georgiana	Cormier	Kenna55@hotmail.com	Nike	Manufacturing	https://loremflickr.com/640/480/business-logo?lock=8972202565173248	2	543641	2024-08-14 04:16:01.039+00	2024-08-14 18:12:45.305+00
10	394.927.2733 x482	4771 Lonny Forge	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/730.jpg	Dakota	Mayer	Neil49@gmail.com	Mohr - Nitzsche	Healthcare	https://loremflickr.com/640/480/business-logo?lock=8398716715139072	67	231771	2024-08-14 04:16:01.039+00	2024-08-14 09:59:21.376+00
13	980-220-9970	944 The Spinney	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/560.jpg	Kathleen F.	Swift	Celestine77@hotmail.com	Cole, Reilly and Feeney	Healthcare	https://loremflickr.com/640/480/business-logo?lock=5621978576715776	39	73350	2024-08-14 04:16:01.039+00	2024-08-14 11:02:11.224+00
14	81233-23123	kdjasdkljfk lfa	asdasdasdasdasdasd	Prueba	1	TEST@TEST.COM	Sipes Group	Real Estate	https://loremflickr.com/640/480/business-logo?lock=3732989984899072	4	439862	2024-08-14 04:16:01.039+00	2024-08-14 16:30:33.478+00
15	776.798.1649 x325	8451 Ward Greens	https://avatars.githubusercontent.com/u/72209661	Marlen	Nitzsche	Trisha_Williamson20@hotmail.com	Rowe - Steubers	Education	https://loremflickr.com/640/480/business-logo?lock=5961741806600192	15	399426	2024-08-14 04:16:01.039+00	2024-08-14 17:59:16.551+00
27	252.339.9365 x045	484 Wren Close	https://avatars.githubusercontent.com/u/88546413	Aylin	Kulas	Vernice94@hotmail.com	Hane, Osinski and Rice	Retail	https://loremflickr.com/640/480/business-logo?lock=3355483981217792	79	110139	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
28	613-559-6287 x92894	7821 Shanahan Viaduct	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/227.jpg	Collin	Connelly	Savanah.Morissette@gmail.com	Koepp Group	Transportation	https://loremflickr.com/640/480/business-logo?lock=8014294398533632	69	229652	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
29	819.747.5282 x94183	18975 Market Square	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/15.jpg	Cleora	Waters	Philip1@yahoo.com	Bechtelar LLC	Transportation	https://loremflickr.com/640/480/business-logo?lock=7546444231737344	53	603263	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
31	(470) 637-3328 x09656	7699 Alexandre Centers	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/137.jpg	Perry	Bashirian	Earnest.Batz61@hotmail.com	Emard - Yundt	Retail	https://loremflickr.com/640/480/business-logo?lock=5597318596263936	36	866603	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
32	(416) 294-7332	650 Kassulke Run	https://avatars.githubusercontent.com/u/93117957	Kamren	Carroll	Rashad56@yahoo.com	Willms, Becker and Pacocha	Technology	https://loremflickr.com/640/480/business-logo?lock=3278258334334976	79	330025	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
33	549-835-3220 x027	89349 Canal Street	https://avatars.githubusercontent.com/u/80851969	Jacinto	Harris	Annetta.Paucek36@hotmail.com	Mann - Stamm	Education	https://loremflickr.com/640/480/business-logo?lock=6036561489559552	46	87183	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
34	(755) 503-6496 x009	79984 Wehner Shoal	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/932.jpg	Krystel	Bednar	America54@hotmail.com	Trantow, Lockman and Steuber	Education	https://loremflickr.com/640/480/business-logo?lock=8654559484313600	67	394288	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
35	922-402-0691 x41481	89444 Nora Parkway	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/342.jpg	Heaven	Quitzon	Wendell_Pagac@hotmail.com	Fahey Group	Transportation	https://loremflickr.com/640/480/business-logo?lock=4083982209646592	27	360300	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
36	263.922.4674	319 Rosenbaum Fords	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/946.jpg	Danyka	Kuhlman	Emmanuelle1@yahoo.com	Labadie and Sons	Education	https://loremflickr.com/640/480/business-logo?lock=28560769155072	60	119534	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
37	(961) 763-8233 x0693	62796 Eldon Bypass	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/977.jpg	Julie	Schinner	Maud65@hotmail.com	Bogisich Group	Retail	https://loremflickr.com/640/480/business-logo?lock=7302323898417152	12	519661	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
38	1-573-562-0121 x8029	6482 Greenwood Road	https://avatars.githubusercontent.com/u/24295032	Loy	Sporer	Garrick.Okuneva44@gmail.com	Stiedemann - O'Kon	Healthcare	https://loremflickr.com/640/480/business-logo?lock=1230324528840704	17	912675	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
39	260-279-4498 x59160	73646 Beaulah Trafficway	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/260.jpg	Raleigh	Little	Dominique.Ebert@hotmail.com	Bins Group	Transportation	https://loremflickr.com/640/480/business-logo?lock=6106963326795776	57	625285	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
40	(802) 649-8351 x9212	3474 E Park Avenue	https://avatars.githubusercontent.com/u/5723868	Easton	Fahey	Henderson.Jaskolski@hotmail.com	Schulist, Bechtelar and Trantow	Entertainment	https://loremflickr.com/640/480/business-logo?lock=6172409715490816	82	719110	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
41	1-233-382-5570 x441	29388 Hoeger Hills	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1200.jpg	Opal	Watsica	Jimmie26@yahoo.com	Klein and Sons	Real Estate	https://loremflickr.com/640/480/business-logo?lock=7081264987242496	24	711249	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
42	(473) 262-8615 x73479	91460 Uriah Village	https://avatars.githubusercontent.com/u/96185829	Teagan	Huels	Felton.Franey16@gmail.com	Waelchi - Pagac	Technology	https://loremflickr.com/640/480/business-logo?lock=7159397377638400	0	985833	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
43	1-787-295-3691	2140 Lind Motorway	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/104.jpg	Bill	Lynch	Hildegard.Fay40@hotmail.com	Renner - Feeney	Energy	https://loremflickr.com/640/480/business-logo?lock=8616234046193664	77	723720	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
44	936.523.5240 x60725	81754 Keeling Freeway	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/409.jpg	Rebecca	Waelchi	Catalina_Hilpert62@gmail.com	Orn LLC	Entertainment	https://loremflickr.com/640/480/business-logo?lock=8911054033649664	15	847235	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
45	493-831-9693	72364 Hamill Neck	https://avatars.githubusercontent.com/u/92359862	Kolby	Emmerich	Jeanette_Lang@hotmail.com	Anderson, Heaney and Mayert	Real Estate	https://loremflickr.com/640/480/business-logo?lock=6591746613968896	18	573093	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
46	750.448.1042 x8355	84022 Wehner Heights	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1071.jpg	Taylor	Considine	Iliana.Jerde@hotmail.com	Krajcik - Hintz	Finance	https://loremflickr.com/640/480/business-logo?lock=4818766068187136	23	726115	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
47	(244) 611-0698 x4985	6442 Candace Land	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/13.jpg	Hayley	Trantow	Clotilde43@hotmail.com	Bradtke LLC	Entertainment	https://loremflickr.com/640/480/business-logo?lock=3378449181835264	92	27596	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
48	(963) 614-6568 x372	959 Osbaldo Squares	https://avatars.githubusercontent.com/u/74034308	Arno	Ryan	Francesco_Schuster81@gmail.com	Sipes, Powlowski and Maggio	Manufacturing	https://loremflickr.com/640/480/business-logo?lock=1275976512176128	19	423191	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
50	262.334.6863 x076	291 Woodside Road	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/28.jpg	Alyson	Steuber	Eleonore_Baumbach91@gmail.com	Dooley, Boyer and Conn	Retail	https://loremflickr.com/640/480/business-logo?lock=7402645692088320	57	427351	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
51	1-482-825-4727 x09188	8258 Buckingham Road	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1007.jpg	Jaqueline	Sauer	Devin.Feest@yahoo.com	Wilderman Group	Energy	https://loremflickr.com/640/480/business-logo?lock=1950209462501376	34	9139	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
109	81233-23123	kdjasdkljfk lfa	asdasdasdasdasdasd	Prueba	1	TEST@TEST.COM	\N	\N	\N	\N	\N	2024-08-14 05:31:24.725+00	2024-08-14 05:31:24.725+00
110	81233-23123	kdjasdkljfk lfa	asdasdasdasdasdasd	Prueba	1	TEST@TEST.COM	\N	\N	\N	\N	\N	2024-08-14 05:31:24.848+00	2024-08-14 05:31:24.848+00
52	721-217-1352 x05208	866 Efrain Landing	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/25.jpg	Marian	Steuber	Jaycee91@hotmail.com	Gutkowski - Hegmann	Healthcare	https://loremflickr.com/640/480/business-logo?lock=7720723254607872	48	248473	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
53	939.259.5045 x606	305 Pleasant Street	https://avatars.githubusercontent.com/u/59594831	Lurline	Gorczany	Waldo39@hotmail.com	Rohan, Hammes and Waters	Entertainment	https://loremflickr.com/640/480/business-logo?lock=6989325621264384	76	911352	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
54	907.201.0727 x51336	9587 W Center Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1233.jpg	Maddison	Pagac	Aliyah17@yahoo.com	Carter, Schaefer and Kuvalis	Manufacturing	https://loremflickr.com/640/480/business-logo?lock=4816914582863872	68	597128	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
55	1-868-353-9138	866 Somerset Road	https://avatars.githubusercontent.com/u/43675518	Josue	Davis	Aniya_Maggio79@hotmail.com	Jakubowski, Harvey and Zieme	Manufacturing	https://loremflickr.com/640/480/business-logo?lock=591787022352384	62	168620	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
56	736-892-8170 x9166	809 College Avenue	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/753.jpg	Lupe	Douglas	Felton.Erdman61@gmail.com	Bradtke - Gorczany	Energy	https://loremflickr.com/640/480/business-logo?lock=2045058217934848	60	339335	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
57	389.713.6466 x9737	95344 Liberty Street	https://avatars.githubusercontent.com/u/16346497	Vada	Nienow	Marilou.Funk4@hotmail.com	Connelly Inc	Real Estate	https://loremflickr.com/640/480/business-logo?lock=1529669948014592	63	506688	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
58	498.283.2227	41725 School Lane	https://avatars.githubusercontent.com/u/37069449	Cristal	Schoen	Anahi_Langworth@gmail.com	Mueller, Romaguera and Armstrong	Retail	https://loremflickr.com/640/480/business-logo?lock=6929398424928256	80	554689	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
59	214.923.9835 x20966	501 William Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1173.jpg	Nicole	Roob	Anastacio.Harvey@gmail.com	Hudson Inc	Manufacturing	https://loremflickr.com/640/480/business-logo?lock=7394495391858688	87	85965	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
60	(363) 589-4861 x549	817 Von Tunnel	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/623.jpg	Carroll	Dietrich-Bechtelar	Carlie_Bogisich@yahoo.com	Stehr and Sons	Entertainment	https://loremflickr.com/640/480/business-logo?lock=8588544360579072	29	545854	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
61	1-562-223-0386	460 Kyler Dale	https://avatars.githubusercontent.com/u/848025	Luigi	Murazik	Alexie_Schamberger@yahoo.com	Ward - Upton	Real Estate	https://loremflickr.com/640/480/business-logo?lock=2780864022839296	90	310142	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
62	(247) 601-3923 x23211	25369 Windsor Close	https://avatars.githubusercontent.com/u/76423383	Clovis	Gislason	Mike_Konopelski@hotmail.com	Berge, Sanford and Will	Healthcare	https://loremflickr.com/640/480/business-logo?lock=3269645121355776	8	447443	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
63	916.330.6759	14779 Welch Lane	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/215.jpg	Michelle	Towne	Stephen1@gmail.com	Johnson - Kshlerin	Finance	https://loremflickr.com/640/480/business-logo?lock=6980553381249024	69	675693	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
64	639.906.3435 x65649	7466 Danny Knoll	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/786.jpg	Dorris	Kassulke	Jocelyn13@gmail.com	Cremin, Stark and Mills	Manufacturing	https://loremflickr.com/640/480/business-logo?lock=1909270434021376	67	196620	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
65	1-811-461-0385 x852	185 Candida Parkways	https://avatars.githubusercontent.com/u/55392750	Susan	Block	Dagmar51@yahoo.com	Monahan, Kulas and Hettinger	Education	https://loremflickr.com/640/480/business-logo?lock=7426364013543424	9	984129	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
66	1-805-376-2673 x9325	5360 Princes Street	https://avatars.githubusercontent.com/u/1626998	Earlene	Balistreri-Oberbrunner	Evert_Windler77@hotmail.com	Abshire - Smitham	Education	https://loremflickr.com/640/480/business-logo?lock=749996376850432	42	263229	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
67	347.865.4578 x142	518 Angelina Forks	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1097.jpg	Flo	Nader	Letitia55@gmail.com	Maggio, Pouros and Altenwerth	Transportation	https://loremflickr.com/640/480/business-logo?lock=8147881328377856	64	561937	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
68	(607) 338-0551 x9935	48235 N Park Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/64.jpg	Sophie	Russel	Alanis.Weber@gmail.com	Schneider, Toy and Carter	Entertainment	https://loremflickr.com/640/480/business-logo?lock=3352513570930688	41	369495	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
69	653-228-5362 x5868	3020 Georgiana Wall	https://avatars.githubusercontent.com/u/39934141	Etha	McLaughlin	Shaylee6@hotmail.com	Toy - Dare	Technology	https://loremflickr.com/640/480/business-logo?lock=3593606061359104	33	935276	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
70	(654) 566-7372 x963	69215 Sycamore Avenue	https://avatars.githubusercontent.com/u/8502178	Clare	Bogan	Nichole.Mraz29@hotmail.com	Ernser LLC	Retail	https://loremflickr.com/640/480/business-logo?lock=3781649804296192	70	514533	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
71	334.843.8249 x58118	457 Farm Close	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/300.jpg	Santos	Little	Bradly.Ferry10@hotmail.com	Kihn - Klocko	Technology	https://loremflickr.com/640/480/business-logo?lock=8844365331955712	31	803716	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
72	(564) 547-5332 x194	617 Garnett Ridge	https://avatars.githubusercontent.com/u/20810817	Lucie	Ullrich-Cruickshank	Roxanne.Blick@yahoo.com	Crooks - Reinger	Healthcare	https://loremflickr.com/640/480/business-logo?lock=6949863822458880	38	156906	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
73	1-471-757-9903 x782	75418 Nader Shoals	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/169.jpg	Brant	Brakus	Elenora.Rath@yahoo.com	Champlin, Cartwright and Tromp	Education	https://loremflickr.com/640/480/business-logo?lock=4483095216521216	66	775283	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
74	1-299-899-7622 x400	22906 Dach Lodge	https://avatars.githubusercontent.com/u/55769275	Lela	Rohan	Zoila.Durgan@gmail.com	Langosh and Sons	Technology	https://loremflickr.com/640/480/business-logo?lock=303253965242368	3	735072	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
75	749.980.2245 x8774	93047 S Washington Avenue	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/710.jpg	Rodolfo	Lebsack	Iliana.Wyman79@yahoo.com	Schiller, Schmitt and Legros	Technology	https://loremflickr.com/640/480/business-logo?lock=6917330489573376	2	412216	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
76	(397) 819-8905	3828 Mitchell Prairie	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/108.jpg	Schuyler	Bruen	Emmalee11@yahoo.com	Lynch, Dare and Towne	Entertainment	https://loremflickr.com/640/480/business-logo?lock=3122229934030848	71	155927	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
77	370.730.5173 x9909	363 Mozell Turnpike	https://avatars.githubusercontent.com/u/32766767	Chance	Braun	Valerie.Herman94@yahoo.com	Jast, Batz and O'Keefe	Real Estate	https://loremflickr.com/640/480/business-logo?lock=7007592893120512	80	856844	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
78	676-906-3013	267 Bergstrom Divide	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/678.jpg	Eloy	Lynch	Joanie42@gmail.com	Schuster - Hane	Real Estate	https://loremflickr.com/640/480/business-logo?lock=8177332445511680	71	174251	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
79	529.652.0971 x273	6694 Bridie Forges	https://avatars.githubusercontent.com/u/727620	Dayton	Kreiger	Florine.Balistreri65@hotmail.com	Borer, Lockman and Miller	Healthcare	https://loremflickr.com/640/480/business-logo?lock=1719347758235648	92	777997	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
80	227.558.0894 x3960	662 Omer Skyway	https://avatars.githubusercontent.com/u/46801453	Jayme	Crist	Maxime55@gmail.com	Gislason - Marks	Energy	https://loremflickr.com/640/480/business-logo?lock=517914583105536	53	19393	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
81	(418) 801-4830 x194	987 Alanis Canyon	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1018.jpg	Hank	Bruen	Clotilde7@gmail.com	Bogan LLC	Entertainment	https://loremflickr.com/640/480/business-logo?lock=1527498640719872	9	602494	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
82	240-478-9830	692 Ignacio Lakes	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/732.jpg	Coty	Moore	Lacy_Kiehn@gmail.com	Rice - Upton	Real Estate	https://loremflickr.com/640/480/business-logo?lock=7103755654791168	34	766140	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
83	881-643-0747	160 Bayer Throughway	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/492.jpg	Oma	Waters-Adams	Melvin_Turner@gmail.com	Rippin, Gottlieb and Jacobs	Transportation	https://loremflickr.com/640/480/business-logo?lock=3011490235809792	54	705257	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
84	(412) 388-9723 x2389	46706 Doyle Heights	https://avatars.githubusercontent.com/u/77533120	Sabryna	Weber	Demarcus_Pouros80@gmail.com	Davis - Olson	Entertainment	https://loremflickr.com/640/480/business-logo?lock=3649274663403520	28	843383	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
85	(545) 296-4109 x8031	95025 Jast Points	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1184.jpg	Morgan	Welch	Luciano13@hotmail.com	Haag, Beer and Gutmann	Energy	https://loremflickr.com/640/480/business-logo?lock=3061095658946560	16	352900	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
86	304.342.3310 x674	176 Pfannerstill Canyon	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/807.jpg	Sadye	Kovacek	Sid79@hotmail.com	Nienow - Lueilwitz	Technology	https://loremflickr.com/640/480/business-logo?lock=7512873649569792	60	518050	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
87	523-973-9456 x3416	931 Maurice Pass	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/439.jpg	Aliyah	Kohler	Darlene.Wintheiser-Lang@yahoo.com	Farrell, Becker and Smith	Entertainment	https://loremflickr.com/640/480/business-logo?lock=2102143712493568	42	806901	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
88	706-614-8360	1766 Hill Street	https://avatars.githubusercontent.com/u/29422505	Griffin	Koepp	Aric_Roob@yahoo.com	Stoltenberg - Champlin	Technology	https://loremflickr.com/640/480/business-logo?lock=7596464085663744	30	747526	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
89	1-941-261-0728	14766 Victoria Place	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/865.jpg	Sharon	Wilderman	Violette.Wiza99@hotmail.com	Kertzmann - Rogahn	Finance	https://loremflickr.com/640/480/business-logo?lock=7643263376818176	37	939264	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
90	1-433-297-4973 x344	2074 E Broadway Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/47.jpg	Lavada	Nicolas	Jena.Schoen@yahoo.com	Okuneva LLC	Transportation	https://loremflickr.com/640/480/business-logo?lock=1780452111155200	44	743965	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
91	(996) 825-0986	77525 Demond Ridges	https://avatars.githubusercontent.com/u/67091994	Alexa	Reinger-Gusikowski	Joanne_Purdy@hotmail.com	Lueilwitz - O'Kon	Entertainment	https://loremflickr.com/640/480/business-logo?lock=7190587847475200	15	47642	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
92	259-736-8344 x38507	7935 Tamia Well	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/343.jpg	Adolph	Pollich	Dovie.Schmitt@gmail.com	Lang - Predovic	Energy	https://loremflickr.com/640/480/business-logo?lock=3725054313496576	97	46041	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
93	(570) 868-1249 x7607	98830 Goldner Brooks	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1018.jpg	Maximillian	Wiza	Brooks.Rempel-Windler18@gmail.com	Nader, Schmidt and Gleichner	Technology	https://loremflickr.com/640/480/business-logo?lock=1113080794710016	16	118690	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
94	666.794.9344	9147 West End	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/884.jpg	Thaddeus	Pollich	Clare_Tremblay@yahoo.com	Hudson, Heidenreich and Wintheiser	Manufacturing	https://loremflickr.com/640/480/business-logo?lock=19837933846528	59	898067	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
95	(590) 834-3615 x062	4307 Wood Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1075.jpg	Frieda	Rogahn	Llewellyn_Kling40@yahoo.com	Armstrong - Stehr	Manufacturing	https://loremflickr.com/640/480/business-logo?lock=1307557228445696	99	328335	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
96	1-735-659-5031 x206	683 Mayfield Road	https://avatars.githubusercontent.com/u/60570350	Gregg	Williamson-Oberbrunner	Wilma.Paucek62@gmail.com	Williamson - Zboncak	Real Estate	https://loremflickr.com/640/480/business-logo?lock=2045005623459840	17	251713	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
97	1-976-632-5112 x221	52974 Barton Fort	https://avatars.githubusercontent.com/u/7872472	Vern	Huel	Delilah_Johnson41@hotmail.com	Gutkowski LLC	Transportation	https://loremflickr.com/640/480/business-logo?lock=8168960197394432	31	109943	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
98	799-376-1841 x695	38791 Hanna Dale	https://avatars.githubusercontent.com/u/31101118	Mary	Keebler	Aurelie_Collier@hotmail.com	Frami, Pfeffer and Zieme	Manufacturing	https://loremflickr.com/640/480/business-logo?lock=629392973758464	19	934551	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
99	220-202-5936	171 Kuvalis Views	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/233.jpg	Clementina	Heidenreich	Foster_Bradtke60@hotmail.com	Stark - Renner	Healthcare	https://loremflickr.com/640/480/business-logo?lock=5934613740388352	28	854439	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
100	1-209-789-8716 x1949	5197 Carter Junctions	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/741.jpg	Armani	Lang	Wendell.Kuhlman@hotmail.com	Breitenberg Group	Real Estate	https://loremflickr.com/640/480/business-logo?lock=2894361746472960	17	643978	2024-08-14 04:16:01.039+00	2024-08-14 04:16:01.039+00
102	\N	\N	\N	\N	\N	\N	\N		\N	\N	\N	2024-08-14 04:38:31.991+00	2024-08-14 04:38:31.991+00
103	123-456-7890	123 Main St	http://example.com/avatar.jpg	John	Doe	john.doe@example.com	\N	\N	\N	\N	\N	2024-08-14 04:43:10.737+00	2024-08-14 04:43:10.737+00
112	6716-3540	Prueba 2	Prueba 2	Prueba 2	Prueba 2	Prueba@gmail.com	\N	\N	\N	\N	\N	2024-08-14 05:32:08.816+00	2024-08-14 05:32:08.816+00
114	81233-23123	kdjasdkljfk lfa	asdasdasdasdasdasd	Prueba	3	TEST@TEST.COM	\N	\N	\N	\N	\N	2024-08-14 05:33:04.829+00	2024-08-14 05:33:04.829+00
117	671289859	Villa Zaita	google.com	Manuel	De León	mdeleon@gmail.com	\N	\N	\N	\N	\N	2024-08-14 05:39:05.325+00	2024-08-14 05:39:05.325+00
118	718245059	Villa Zaita	X.com	Verónica	Chacón	Vero@gmail.com	\N	\N	\N	\N	\N	2024-08-14 05:41:04.061+00	2024-08-14 05:41:24.523+00
119	718245059	Villa Zaita	X.com	Verónica	Chacón	Vero@gmail.com	\N	\N	\N	\N	\N	2024-08-14 07:53:35.722+00	2024-08-14 07:53:35.722+00
120	718245059	Villa Zaita	X.com	Verónica	Chacón	Vero@gmail.com	\N	\N	\N	\N	\N	2024-08-14 07:53:36.399+00	2024-08-14 07:53:36.399+00
113	81233-23123	kdjasdkljfk lfa	asdasdasdasdasdasd	Prueba	3	TEST@TEST.COM	Cole, Reilly and Feeney	Healthcare	\N	39	73350	2024-08-14 05:33:04.708+00	2024-08-14 10:09:20.347+00
125	6716-3540	Villa Zaita, Calle Madonina, Casa 6	https://avatars.githubusercontent.com/u/17320441	Prueba 3	BRRR	prueba3@gmail.com	\N	\N	\N	\N	\N	2024-08-14 16:32:04.083+00	2024-08-14 16:32:04.083+00
130	6716-3540	Villa Zaita, Calle Madonina, Casa 6	https://avatars.githubusercontent.com/u/17320441	Juanchi	Montes	juanmontesk925@gmail.com	\N	\N	\N	\N	\N	2024-08-14 17:56:37.925+00	2024-08-14 18:22:47.867+00
132	334534534	Villa Zaita, Calle Madonina, Casa 6	https://avatars.githubusercontent.com/u/17320441	DIEGO	MONTES ASPRILLA	asdasdas@adfasdas.com	Itse	Technology	\N	12	403446	2024-08-14 20:36:00.638+00	2024-08-14 20:36:13.278+00
\.


--
-- Data for Name: interactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interactions (id, "contactId", type, date, notes, "createdAt", "updatedAt") FROM stdin;
8	62	deal	2024-08-21 08:37:01.036+00	Capio quae voro uterque.	2024-08-14 04:29:27.966+00	2024-08-14 04:29:27.966+00
21	25	email	2024-08-30 06:00:38.587+00	Sonitus spiritus vomito ars aequitas concido certe.	2024-08-14 19:56:48.895+00	2024-08-14 19:56:48.895+00
26	111	other	2024-08-17 12:09:55.048+00	Sustineo contabesco bellicus turpis.	2024-08-14 19:56:48.895+00	2024-08-14 19:56:48.895+00
30	113	other	2024-08-21 10:48:29.944+00	Ustilo quidem virga decretum cultellus accedo apostolus aiunt contigo ager.	2024-08-14 19:56:48.895+00	2024-08-14 19:56:48.895+00
33	76	email	2024-08-11 04:27:20.962+00	Pauci reprehenderit considero.	2024-08-14 19:56:48.895+00	2024-08-14 19:56:48.895+00
34	125	call	2024-08-22 10:18:50.923+00	Delinquo demonstro celer calculus illum contra defleo cornu debitis ad.	2024-08-14 19:56:48.895+00	2024-08-14 19:56:48.895+00
35	78	deal	2024-08-10 11:37:29.073+00	Caterva unde colo surgo brevis adduco cresco.	2024-08-14 19:56:48.895+00	2024-08-14 19:56:48.895+00
38	112	other	2024-08-25 01:51:43.318+00	Conicio taceo ara.	2024-08-14 19:56:48.895+00	2024-08-14 19:56:48.895+00
39	117	email	2024-08-10 12:50:47.242+00	Aegrus acerbitas conor arceo vobis tubineus quam.	2024-08-14 19:56:48.895+00	2024-08-14 19:56:48.895+00
27	14	call	2024-08-03 11:41:22.295+00	Constans depono utor sollicito.	2024-08-14 19:56:48.895+00	2024-08-14 20:32:13.235+00
24	59	meeting	2024-08-03 07:58:34.974+00	Arcus comparo deduco cervus conitor substantia vado vomer.	2024-08-14 19:56:48.895+00	2024-08-14 20:32:37.409+00
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

SELECT pg_catalog.setval('public.contacts_id_seq', 132, true);


--
-- Name: interactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interactions_id_seq', 48, true);


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

