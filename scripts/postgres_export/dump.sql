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
    'purchase'
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
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: contacts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.contacts (id, "userId", "phoneNumber", address, avatar, "firstName", "lastName", email, "createdAt", "updatedAt") FROM stdin;
1	59	1-884-328-7688 x40923	45016 Hermann Dam	https://avatars.githubusercontent.com/u/36948957	Magnolia	Mante	Wyman80@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
2	71	(894) 554-2545	277 Pearl Street	https://avatars.githubusercontent.com/u/79029074	Myrna	Schimmel	Anibal_Wiza@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
3	99	304.457.6599 x062	3991 Treutel Oval	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/456.jpg	Susie	Schumm	Felicity.Wintheiser48@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
4	68	(584) 373-1430	9972 Koss Falls	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/212.jpg	Zaria	Huel	Alexander.Schaden5@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
5	38	743-410-8321 x14047	719 Jamil Highway	https://avatars.githubusercontent.com/u/90952367	Bell	Lebsack	Margaretta_Reichel@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
6	50	1-358-502-9799 x6549	78603 Fadel Divide	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/654.jpg	Pierce	Upton	Jessica_Spencer@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
7	16	1-282-452-5613	87392 Depot Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/652.jpg	Joanne	Shields	Jewell_Pfannerstill4@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
8	15	(480) 618-6673 x082	1410 Leannon Walk	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/348.jpg	Eulalia	Walter	Frederic_Vandervort61@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
9	12	262.606.0452 x14262	812 Eleanore Key	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/114.jpg	Mattie	Hickle	Laron2@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
10	93	(919) 706-5489 x795	259 Silver Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/125.jpg	Gabriel	Kautzer	Tyrel57@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
11	57	369-227-4162	1332 Lonny Hills	https://avatars.githubusercontent.com/u/31125969	Juliana	Goldner	Mathew96@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
12	34	1-880-682-4938 x6425	97323 Schultz Summit	https://avatars.githubusercontent.com/u/13174152	Christian	Hermiston	Constance_Collins39@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
13	68	720-746-2153 x36593	4001 Smitham Wall	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/212.jpg	Zaria	Huel	Alexander.Schaden5@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
14	22	1-546-275-3456 x665	2505 Spring Gardens	https://avatars.githubusercontent.com/u/10970132	Bradly	Towne-Toy	Coy27@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
15	100	(320) 492-0134 x972	9827 Sheldon Flats	https://avatars.githubusercontent.com/u/17973803	Neha	Osinski	Titus_Marquardt1@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
16	10	1-646-844-6604	828 Ilene Fall	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/713.jpg	Mabelle	Weber	Effie.Nienow99@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
17	34	(269) 270-8322 x32620	537 Kerluke Ville	https://avatars.githubusercontent.com/u/13174152	Christian	Hermiston	Constance_Collins39@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
18	38	414.641.3189	68630 Cooper Squares	https://avatars.githubusercontent.com/u/90952367	Bell	Lebsack	Margaretta_Reichel@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
19	78	208.653.4021 x133	83921 Conn Ville	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/475.jpg	Amani	Kling	Annamarie.Mayer29@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
20	97	618-986-4846	169 Isabell Orchard	https://avatars.githubusercontent.com/u/9414723	Abigail	Hudson	Angelina.Schinner@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
21	9	583.354.5391 x59520	89468 Frami Wall	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/952.jpg	Francisco	Weissnat	Rhett.Walsh47@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
22	14	214-361-0179 x3195	14961 Glover Plain	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/592.jpg	Olga	Zieme	Lacy.Reynolds65@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
23	100	936.589.9077 x13905	1357 Nicolas Freeway	https://avatars.githubusercontent.com/u/17973803	Neha	Osinski	Titus_Marquardt1@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
24	42	227.477.3609 x350	11610 Treutel Forest	https://avatars.githubusercontent.com/u/12526808	Evie	Stoltenberg	Lavern29@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
25	17	(305) 481-9002	368 Koch Drive	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/769.jpg	Dalton	Kovacek	Retha_Goyette67@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
26	64	635-722-0226 x0431	601 Elm Road	https://avatars.githubusercontent.com/u/60398938	Dean	Bartoletti	Tessie58@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
27	58	546-328-7535 x5869	6172 Keebler Run	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1022.jpg	Elissa	Goodwin-Turcotte	Foster_OReilly@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
28	98	1-594-719-7936 x389	31558 Ronaldo Fields	https://avatars.githubusercontent.com/u/76164456	Uriah	Bauch	Camilla.Cormier-Morar@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
29	39	869-992-2857 x5275	4495 A Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1199.jpg	Ford	Bergnaum	Keshaun.Stoltenberg43@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
30	45	290.578.0641 x22355	6190 Harber Junctions	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/663.jpg	Hank	Abbott	Nannie.Hilll@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
31	96	317-469-7207 x515	761 Franecki Streets	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1165.jpg	Ciara	Senger	Rebeka_Keeling1@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
32	19	1-956-937-2268 x200	76289 McCullough View	https://avatars.githubusercontent.com/u/90957376	Hubert	Simonis	Harvey_Zieme@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
33	45	1-352-325-9431 x3335	93925 Spruce Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/663.jpg	Hank	Abbott	Nannie.Hilll@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
34	66	554.788.2301 x728	6077 Orchard Lane	https://avatars.githubusercontent.com/u/91666046	Velva	Schmeler	Torrance91@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
35	48	(755) 480-1630 x80188	9466 Maple Road	https://avatars.githubusercontent.com/u/87616605	Bernhard	Friesen	Wilhelm_Hoppe66@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
36	73	(708) 523-8794 x2520	501 Rutherford Flats	https://avatars.githubusercontent.com/u/13574280	Albertha	Turcotte	Madeline.Schumm62@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
37	31	735.409.5320	8305 W 2nd Street	https://avatars.githubusercontent.com/u/34392931	Claudie	Brakus	Alphonso_Mosciski98@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
38	97	951-374-9580 x94035	750 Deckow Trace	https://avatars.githubusercontent.com/u/9414723	Abigail	Hudson	Angelina.Schinner@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
39	47	920.567.9159	15813 Westgate	https://avatars.githubusercontent.com/u/94626541	Sherwood	Koelpin	Ova_Kshlerin@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
40	11	(317) 612-3089 x37752	930 Auer Estate	https://avatars.githubusercontent.com/u/93189657	Reilly	Weber	Green86@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
41	3	630-941-1571 x31143	828 Carroll Mountains	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1126.jpg	Clint	Fisher	Greta.Crona@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
42	5	253.541.2108 x04710	80947 MacGyver Meadow	https://avatars.githubusercontent.com/u/4100264	Andy	Doyle	Nathan_Ankunding78@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
43	37	807.405.8222 x964	263 Jackson Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/597.jpg	Ressie	Pfannerstill-Johnson	Makenna23@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
44	47	572.350.5644 x11886	671 Liberty Street	https://avatars.githubusercontent.com/u/94626541	Sherwood	Koelpin	Ova_Kshlerin@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
45	62	596-869-6286	55527 Kuphal Rapids	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1233.jpg	Percy	Greenfelder	Irwin.Crooks39@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
46	2	886-305-7792	8546 Brakus Green	https://avatars.githubusercontent.com/u/92325223	David	Wehner	Marcelina.Denesik47@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
47	89	367-781-0111	8978 Poplar Road	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/806.jpg	Nikolas	Welch	Quinton_Zieme@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
48	7	235-446-9452	143 Osinski Falls	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/816.jpg	Catharine	Rutherford	Lavern.Weimann-Herman@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
49	9	1-787-538-2675	553 Rae Locks	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/952.jpg	Francisco	Weissnat	Rhett.Walsh47@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
50	29	277.579.7853	871 Hermina Coves	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/97.jpg	Golden	Jacobi-Franecki	Felipe.Hettinger35@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
51	66	312.228.9033 x3531	64611 Clifford Ranch	https://avatars.githubusercontent.com/u/91666046	Velva	Schmeler	Torrance91@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
52	4	836-725-1691	72528 Shanie Bypass	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/706.jpg	Misty	Hauck	Adaline_Gorczany@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
53	66	755-507-9509 x47793	1205 Rebeca Manor	https://avatars.githubusercontent.com/u/91666046	Velva	Schmeler	Torrance91@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
54	8	646-375-8820 x90790	9118 Beatty Rest	https://avatars.githubusercontent.com/u/5207741	Audreanne	Mann	Hoyt_Nader79@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
55	78	(393) 581-7700 x672	314 Henri Fields	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/475.jpg	Amani	Kling	Annamarie.Mayer29@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
56	53	877-875-8895 x505	8007 Water Lane	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1070.jpg	Floyd	Swaniawski	Eliezer50@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
57	21	763.721.2128	6145 Miller Falls	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1046.jpg	Jeffrey	Keebler	Cicero.Braun@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
58	38	1-822-961-7171 x2399	88033 Emard Well	https://avatars.githubusercontent.com/u/90952367	Bell	Lebsack	Margaretta_Reichel@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
59	32	1-422-812-6105 x84862	5389 Springfield Close	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/199.jpg	Silas	Altenwerth	Olga84@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
60	63	273-296-7720 x92793	592 Dane Fords	https://avatars.githubusercontent.com/u/90381199	Nellie	Gutmann	Lilly.Auer44@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
61	49	454.465.3967 x675	994 School Close	https://avatars.githubusercontent.com/u/95807183	Patience	McKenzie	Reba_Willms@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
62	32	(288) 446-6852 x475	90193 Cedar Road	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/199.jpg	Silas	Altenwerth	Olga84@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
63	46	1-616-762-7536	98304 Chestnut Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/761.jpg	Wayne	Beahan	Sammie0@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
64	65	(641) 459-6776 x54924	27127 Anderson Rue	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1209.jpg	Jaida	Robel	Lavern.Pagac@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
65	22	1-735-219-4078	706 Ridge Road	https://avatars.githubusercontent.com/u/10970132	Bradly	Towne-Toy	Coy27@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
66	22	997.744.9714	54681 E 4th Avenue	https://avatars.githubusercontent.com/u/10970132	Bradly	Towne-Toy	Coy27@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
67	47	212.680.3762 x078	413 Hudson Key	https://avatars.githubusercontent.com/u/94626541	Sherwood	Koelpin	Ova_Kshlerin@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
68	65	969-383-4767	7777 E River Road	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1209.jpg	Jaida	Robel	Lavern.Pagac@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
69	3	1-616-395-2938 x74013	88788 Castle Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1126.jpg	Clint	Fisher	Greta.Crona@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
70	60	310.715.3224 x2665	1599 Dennis Estates	https://avatars.githubusercontent.com/u/77492088	Tyrese	Gutkowski	Sandy.Corkery@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
71	80	1-836-932-7976 x45871	38609 Lynch Valley	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/418.jpg	Verlie	Swift	Yadira_Farrell87@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
72	43	337-789-2833 x21232	9773 MacGyver Mews	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/686.jpg	Esperanza	Koepp	Shane_Marquardt80@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
73	48	(319) 261-5083 x878	6936 Russel Port	https://avatars.githubusercontent.com/u/87616605	Bernhard	Friesen	Wilhelm_Hoppe66@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
74	98	594.638.2015 x12580	27143 Kirk Villages	https://avatars.githubusercontent.com/u/76164456	Uriah	Bauch	Camilla.Cormier-Morar@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
75	97	1-414-528-7158 x822	324 Brown Harbors	https://avatars.githubusercontent.com/u/9414723	Abigail	Hudson	Angelina.Schinner@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
76	81	(314) 421-6050 x811	5268 Walker Valley	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/408.jpg	Maci	Rolfson	Jamie.Lind@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
77	21	1-698-638-0549	6366 Depot Street	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1046.jpg	Jeffrey	Keebler	Cicero.Braun@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
78	61	1-418-420-0147 x256	9052 Fisher Union	https://avatars.githubusercontent.com/u/16738659	Elvie	Schoen	Kyler.Kovacek44@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
79	39	1-724-638-6630 x5001	9381 Sanford Terrace	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1199.jpg	Ford	Bergnaum	Keshaun.Stoltenberg43@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
80	7	332.775.2873 x956	31465 Rosemarie Haven	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/816.jpg	Catharine	Rutherford	Lavern.Weimann-Herman@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
81	35	868.246.7527	455 Bogisich Fork	https://avatars.githubusercontent.com/u/91167686	Quinn	Pouros	Serenity.Schaefer39@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
82	75	373.787.5983	5956 Jones Freeway	https://avatars.githubusercontent.com/u/53804196	Jerrod	Oberbrunner	Candace.Beier@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
83	2	(311) 790-7060 x08206	25244 Railroad Street	https://avatars.githubusercontent.com/u/92325223	David	Wehner	Marcelina.Denesik47@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
84	92	941.926.6684	12529 Langosh Crossing	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/682.jpg	Lea	Gibson	Tracey.Lesch21@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
85	74	777.486.5444 x20676	5627 Pinfold Lane	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/982.jpg	Tillman	Champlin	Nya_Mitchell61@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
86	64	240.213.6051	924 The Causeway	https://avatars.githubusercontent.com/u/60398938	Dean	Bartoletti	Tessie58@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
87	55	1-950-452-6536 x4544	6169 Hintz Crossing	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/525.jpg	Joelle	Hauck	Stone_Moore18@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
88	42	697-390-0058 x08644	5327 W Market Street	https://avatars.githubusercontent.com/u/12526808	Evie	Stoltenberg	Lavern29@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
89	100	598.648.6154 x990	9822 Cruickshank Turnpike	https://avatars.githubusercontent.com/u/17973803	Neha	Osinski	Titus_Marquardt1@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
90	31	(488) 423-5471 x6265	47729 Adelle Coves	https://avatars.githubusercontent.com/u/34392931	Claudie	Brakus	Alphonso_Mosciski98@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
91	81	990.955.4398 x043	957 Kozey Parks	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/408.jpg	Maci	Rolfson	Jamie.Lind@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
92	21	1-381-487-7097 x64402	85686 Haleigh Ville	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1046.jpg	Jeffrey	Keebler	Cicero.Braun@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
93	93	(500) 560-4567 x76805	98621 County Line Road	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/125.jpg	Gabriel	Kautzer	Tyrel57@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
94	85	931.460.4428 x213	7435 Lincoln Street	https://avatars.githubusercontent.com/u/96685526	Leonardo	Hermann	Enid_Bernhard28@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
95	19	215.454.6611	64141 Schoen Parks	https://avatars.githubusercontent.com/u/90957376	Hubert	Simonis	Harvey_Zieme@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
96	34	555.508.0242 x09294	294 Andres Burg	https://avatars.githubusercontent.com/u/13174152	Christian	Hermiston	Constance_Collins39@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
97	67	489-776-3250 x4821	1590 McKenzie Knolls	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/781.jpg	Candice	Ryan	Hal.Lesch@yahoo.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
98	37	(819) 748-4583	2395 Lakin Falls	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/597.jpg	Ressie	Pfannerstill-Johnson	Makenna23@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
99	85	1-698-488-5856	397 First Avenue	https://avatars.githubusercontent.com/u/96685526	Leonardo	Hermann	Enid_Bernhard28@hotmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
100	4	(797) 815-8495	76249 Consuelo Dam	https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/706.jpg	Misty	Hauck	Adaline_Gorczany@gmail.com	2024-08-12 23:29:41.562+00	2024-08-12 23:29:41.562+00
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
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 100, true);


--
-- Name: contacts contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


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
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

