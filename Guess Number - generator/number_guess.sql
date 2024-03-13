--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (3, 'user_1710309912243', 1, 934);
INSERT INTO public.users VALUES (4, 'user_1710309912242', 1, 219);
INSERT INTO public.users VALUES (2, 'Maisa', 2, 2);
INSERT INTO public.users VALUES (6, 'user_1710310048525', 2, 275);
INSERT INTO public.users VALUES (24, 'user_1710310555164', 2, 191);
INSERT INTO public.users VALUES (5, 'user_1710310048526', 5, 1000);
INSERT INTO public.users VALUES (7, 'Kiisseli', 2, 2);
INSERT INTO public.users VALUES (9, 'user_1710310114118', 2, 622);
INSERT INTO public.users VALUES (23, 'user_1710310555165', 5, 171);
INSERT INTO public.users VALUES (8, 'user_1710310114119', 5, 111);
INSERT INTO public.users VALUES (10, 'Hilleri', 1, 6);
INSERT INTO public.users VALUES (12, 'user_1710310195200', 2, 425);
INSERT INTO public.users VALUES (40, 'user_1710311486431', 2, 247);
INSERT INTO public.users VALUES (11, 'user_1710310195201', 5, 261);
INSERT INTO public.users VALUES (14, 'user_1710310239932', 2, 111);
INSERT INTO public.users VALUES (26, 'user_1710310583767', 2, 130);
INSERT INTO public.users VALUES (39, 'user_1710311486432', 5, 109);
INSERT INTO public.users VALUES (13, 'user_1710310239933', 5, 122);
INSERT INTO public.users VALUES (25, 'user_1710310583768', 5, 186);
INSERT INTO public.users VALUES (16, 'user_1710310330546', 2, 397);
INSERT INTO public.users VALUES (28, 'user_1710310676725', 2, 265);
INSERT INTO public.users VALUES (15, 'user_1710310330547', 5, 112);
INSERT INTO public.users VALUES (18, 'user_1710310345487', 2, 130);
INSERT INTO public.users VALUES (27, 'user_1710310676726', 5, 25);
INSERT INTO public.users VALUES (17, 'user_1710310345488', 5, 157);
INSERT INTO public.users VALUES (42, 'user_1710311597963', 2, 453);
INSERT INTO public.users VALUES (20, 'user_1710310357938', 2, 576);
INSERT INTO public.users VALUES (30, 'user_1710310868782', 2, 687);
INSERT INTO public.users VALUES (19, 'user_1710310357939', 5, 315);
INSERT INTO public.users VALUES (41, 'user_1710311597964', 5, 281);
INSERT INTO public.users VALUES (22, 'user_1710310549574', 2, 819);
INSERT INTO public.users VALUES (29, 'user_1710310868783', 5, 256);
INSERT INTO public.users VALUES (21, 'user_1710310549575', 5, 109);
INSERT INTO public.users VALUES (44, 'user_1710311624788', 2, 133);
INSERT INTO public.users VALUES (32, 'user_1710311043048', 2, 518);
INSERT INTO public.users VALUES (43, 'user_1710311624789', 5, 383);
INSERT INTO public.users VALUES (31, 'user_1710311043049', 5, 149);
INSERT INTO public.users VALUES (1, 'Pena', 9, 1);
INSERT INTO public.users VALUES (46, 'user_1710311768986', 2, 53);
INSERT INTO public.users VALUES (34, 'user_1710311249290', 2, 295);
INSERT INTO public.users VALUES (33, 'user_1710311249291', 5, 257);
INSERT INTO public.users VALUES (45, 'user_1710311768987', 5, 265);
INSERT INTO public.users VALUES (36, 'user_1710311284505', 2, 514);
INSERT INTO public.users VALUES (35, 'user_1710311284506', 5, 210);
INSERT INTO public.users VALUES (48, 'user_1710311787196', 2, 493);
INSERT INTO public.users VALUES (38, 'user_1710311293703', 2, 407);
INSERT INTO public.users VALUES (47, 'user_1710311787197', 5, 193);
INSERT INTO public.users VALUES (37, 'user_1710311293704', 5, 159);
INSERT INTO public.users VALUES (50, 'user_1710311984974', 2, 11);
INSERT INTO public.users VALUES (49, 'user_1710311984975', 5, 227);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 50, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

