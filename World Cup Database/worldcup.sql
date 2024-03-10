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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(20) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_teams_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_teams_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_teams_id_seq OWNER TO freecodecamp;

--
-- Name: teams_teams_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_teams_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_teams_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (339, 2018, 'Final', 4, 2, 448, 449);
INSERT INTO public.games VALUES (340, 2018, 'Third Place', 2, 0, 450, 451);
INSERT INTO public.games VALUES (341, 2018, 'Semi-Final', 2, 1, 449, 451);
INSERT INTO public.games VALUES (342, 2018, 'Semi-Final', 1, 0, 448, 450);
INSERT INTO public.games VALUES (343, 2018, 'Quarter-Final', 3, 2, 449, 452);
INSERT INTO public.games VALUES (344, 2018, 'Quarter-Final', 2, 0, 451, 453);
INSERT INTO public.games VALUES (345, 2018, 'Quarter-Final', 2, 1, 450, 454);
INSERT INTO public.games VALUES (346, 2018, 'Quarter-Final', 2, 0, 448, 455);
INSERT INTO public.games VALUES (347, 2018, 'Eighth-Final', 2, 1, 451, 456);
INSERT INTO public.games VALUES (348, 2018, 'Eighth-Final', 1, 0, 453, 457);
INSERT INTO public.games VALUES (349, 2018, 'Eighth-Final', 3, 2, 450, 458);
INSERT INTO public.games VALUES (350, 2018, 'Eighth-Final', 2, 0, 454, 459);
INSERT INTO public.games VALUES (351, 2018, 'Eighth-Final', 2, 1, 449, 460);
INSERT INTO public.games VALUES (352, 2018, 'Eighth-Final', 2, 1, 452, 461);
INSERT INTO public.games VALUES (353, 2018, 'Eighth-Final', 2, 1, 455, 462);
INSERT INTO public.games VALUES (354, 2018, 'Eighth-Final', 4, 3, 448, 463);
INSERT INTO public.games VALUES (355, 2014, 'Final', 1, 0, 464, 463);
INSERT INTO public.games VALUES (356, 2014, 'Third Place', 3, 0, 465, 454);
INSERT INTO public.games VALUES (357, 2014, 'Semi-Final', 1, 0, 463, 465);
INSERT INTO public.games VALUES (358, 2014, 'Semi-Final', 7, 1, 464, 454);
INSERT INTO public.games VALUES (359, 2014, 'Quarter-Final', 1, 0, 465, 466);
INSERT INTO public.games VALUES (360, 2014, 'Quarter-Final', 1, 0, 463, 450);
INSERT INTO public.games VALUES (361, 2014, 'Quarter-Final', 2, 1, 454, 456);
INSERT INTO public.games VALUES (362, 2014, 'Quarter-Final', 1, 0, 464, 448);
INSERT INTO public.games VALUES (363, 2014, 'Eighth-Final', 2, 1, 454, 467);
INSERT INTO public.games VALUES (364, 2014, 'Eighth-Final', 2, 0, 456, 455);
INSERT INTO public.games VALUES (365, 2014, 'Eighth-Final', 2, 0, 448, 468);
INSERT INTO public.games VALUES (366, 2014, 'Eighth-Final', 2, 1, 464, 469);
INSERT INTO public.games VALUES (367, 2014, 'Eighth-Final', 2, 1, 465, 459);
INSERT INTO public.games VALUES (368, 2014, 'Eighth-Final', 2, 1, 466, 470);
INSERT INTO public.games VALUES (369, 2014, 'Eighth-Final', 1, 0, 463, 457);
INSERT INTO public.games VALUES (370, 2014, 'Eighth-Final', 2, 1, 450, 471);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (448, 'France');
INSERT INTO public.teams VALUES (449, 'Croatia');
INSERT INTO public.teams VALUES (450, 'Belgium');
INSERT INTO public.teams VALUES (451, 'England');
INSERT INTO public.teams VALUES (452, 'Russia');
INSERT INTO public.teams VALUES (453, 'Sweden');
INSERT INTO public.teams VALUES (454, 'Brazil');
INSERT INTO public.teams VALUES (455, 'Uruguay');
INSERT INTO public.teams VALUES (456, 'Colombia');
INSERT INTO public.teams VALUES (457, 'Switzerland');
INSERT INTO public.teams VALUES (458, 'Japan');
INSERT INTO public.teams VALUES (459, 'Mexico');
INSERT INTO public.teams VALUES (460, 'Denmark');
INSERT INTO public.teams VALUES (461, 'Spain');
INSERT INTO public.teams VALUES (462, 'Portugal');
INSERT INTO public.teams VALUES (463, 'Argentina');
INSERT INTO public.teams VALUES (464, 'Germany');
INSERT INTO public.teams VALUES (465, 'Netherlands');
INSERT INTO public.teams VALUES (466, 'Costa Rica');
INSERT INTO public.teams VALUES (467, 'Chile');
INSERT INTO public.teams VALUES (468, 'Nigeria');
INSERT INTO public.teams VALUES (469, 'Algeria');
INSERT INTO public.teams VALUES (470, 'Greece');
INSERT INTO public.teams VALUES (471, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 370, true);


--
-- Name: teams_teams_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_teams_id_seq', 471, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

