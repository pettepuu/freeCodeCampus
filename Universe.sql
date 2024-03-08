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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    number_of_stars integer,
    description text NOT NULL,
    type text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20),
    description text NOT NULL,
    planet_id integer NOT NULL,
    size integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    number_of_moons integer,
    distance_from_star numeric,
    has_moons boolean,
    description text NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: spaceship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.spaceship (
    spaceship_id integer NOT NULL,
    name character varying(20) NOT NULL,
    distance_from_earth integer,
    weight_in_kilos integer
);


ALTER TABLE public.spaceship OWNER TO freecodecamp;

--
-- Name: spaceship_spaceship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.spaceship_spaceship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.spaceship_spaceship_id_seq OWNER TO freecodecamp;

--
-- Name: spaceship_spaceship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.spaceship_spaceship_id_seq OWNED BY public.spaceship.spaceship_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20),
    has_planets boolean,
    description text NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: spaceship spaceship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship ALTER COLUMN spaceship_id SET DEFAULT nextval('public.spaceship_spaceship_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milkyway', 2, 'Seems to be fun place to be', NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 5, 'Human has never visited this galaxy', NULL);
INSERT INTO public.galaxy VALUES (3, 'Unknown galaxy nro 5', 1, 'I quess there might be blackholes and stuff', NULL);
INSERT INTO public.galaxy VALUES (6, 'Random galaxy 1', 442, 'noone know where it actually is', 'not an idea');
INSERT INTO public.galaxy VALUES (7, 'Random galaxy 2', 442, 'noone know where it actually is', 'not an idea');
INSERT INTO public.galaxy VALUES (8, 'Random galaxy 3', 442, 'noone know where it actually is', 'not an idea');
INSERT INTO public.galaxy VALUES (9, 'Random galaxy 4', 442, 'noone know where it actually is', 'not an idea');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (7, 'Moon', 'Its very small', 7, 20);
INSERT INTO public.moon VALUES (8, 'Unnamed moon', 'its rotating Jupiter', 8, 12);
INSERT INTO public.moon VALUES (9, 'Big rock', 'made of stone', 9, 12);
INSERT INTO public.moon VALUES (10, 'Common rock 1', 'NOTHING SPECIAL', 8, 33);
INSERT INTO public.moon VALUES (12, 'Common rock 2', 'NOTHING SPECIAL', 8, 33);
INSERT INTO public.moon VALUES (13, 'Common rock 3', 'NOTHING SPECIAL', 8, 33);
INSERT INTO public.moon VALUES (14, 'Common rock 4', 'NOTHING SPECIAL', 8, 33);
INSERT INTO public.moon VALUES (15, 'Common rock 5', 'NOTHING SPECIAL', 8, 33);
INSERT INTO public.moon VALUES (16, 'Common rock 6', 'NOTHING SPECIAL', 8, 33);
INSERT INTO public.moon VALUES (17, 'Common rock 7', 'NOTHING SPECIAL', 8, 33);
INSERT INTO public.moon VALUES (18, 'Common rock 43', 'NOTHING SPECIAL', 8, 33);
INSERT INTO public.moon VALUES (19, 'Common rock 143', 'NOTHING SPECIAL', 8, 33);
INSERT INTO public.moon VALUES (20, 'Common rock 53', 'NOTHING SPECIAL', 8, 33);
INSERT INTO public.moon VALUES (21, 'Common rock 73', 'NOTHING SPECIAL', 8, 33);
INSERT INTO public.moon VALUES (22, 'Common rock 23', 'NOTHING SPECIAL', 9, 3);
INSERT INTO public.moon VALUES (23, 'rock 23', 'NOTHING SPECIAL', 9, 3);
INSERT INTO public.moon VALUES (24, 'rock 1', 'NOTHING SPECIAL', 9, 3);
INSERT INTO public.moon VALUES (25, 'rock 12', 'NOTHING SPECIAL', 9, 3);
INSERT INTO public.moon VALUES (26, 'rock 123', 'NOTHING SPECIAL', 9, 3);
INSERT INTO public.moon VALUES (27, 'rock 1234', 'NOTHING SPECIAL', 9, 3);
INSERT INTO public.moon VALUES (28, 'rock 44', 'NOTHING SPECIAL', 9, 3);
INSERT INTO public.moon VALUES (29, 'rock 445', 'NOTHING SPECIAL', 9, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (7, 'Earth', 1, 150000, true, 'Lots of people. Some of those are quite kind and takecaring persons', 1);
INSERT INTO public.planet VALUES (8, 'MARS', 1, 4000000, true, 'Only sand in here. Nothing special.', 3);
INSERT INTO public.planet VALUES (9, 'Jupiter', 34, 60000000, true, 'In my opinion that is very big and beautiful planet. Would recommend. ', 4);
INSERT INTO public.planet VALUES (12, 'Unknown planet', 44, 2200, true, 'unnamed planet which is located at somewhere. Is not known that well.', 4);
INSERT INTO public.planet VALUES (14, 'Unknown planet 1', 44, 2200, true, 'unnamed planet which is located at somewhere. Is not known that well.', 4);
INSERT INTO public.planet VALUES (15, 'Unknown planet 3', 44, 2200, true, 'unnamed planet which is located at somewhere. Is not known that well.', 4);
INSERT INTO public.planet VALUES (16, 'Unknown planet 4', 44, 2200, true, 'unnamed planet which is located at somewhere. Is not known that well.', 4);
INSERT INTO public.planet VALUES (17, 'Unknown planet 5', 44, 2200, true, 'unnamed planet which is located at somewhere. Is not known that well.', 4);
INSERT INTO public.planet VALUES (18, 'Unknown planet 7', 44, 2200, true, 'unnamed planet which is located at somewhere. Is not known that well.', 4);
INSERT INTO public.planet VALUES (19, 'Unknown planet 8', 44, 2200, true, 'unnamed planet which is located at somewhere. Is not known that well.', 4);
INSERT INTO public.planet VALUES (20, 'Unknown planet 67', 44, 2200, true, 'unnamed planet which is located at somewhere. Is not known that well.', 4);
INSERT INTO public.planet VALUES (22, 'Ghost planet', 3, 54, true, 'Planet what cannot be observed.', 6);
INSERT INTO public.planet VALUES (23, 'Ghost planet 3', 3, 54, true, 'Planet what cannot be observed.', 6);
INSERT INTO public.planet VALUES (24, 'Ghost planet 6', 3, 54, true, 'Planet what cannot be observed.', 6);
INSERT INTO public.planet VALUES (25, 'Ghost planet 8', 3, 54, true, 'Planet what cannot be observed.', 6);
INSERT INTO public.planet VALUES (26, 'Ghost planet 9', 3, 54, true, 'Planet what cannot be observed.', 6);


--
-- Data for Name: spaceship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.spaceship VALUES (1, 'apollo1', 144, 333);
INSERT INTO public.spaceship VALUES (2, 'Apollo4', 1114, 1122);
INSERT INTO public.spaceship VALUES (3, 'Apollo7', 1233, 544);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Earth', true, 'There is pleanty of water and humans', 1);
INSERT INTO public.star VALUES (3, 'Very big star', false, 'A star with great mass can be seen from the far distance from Earth', 2);
INSERT INTO public.star VALUES (4, 'Ugly looking star', true, 'Cold star with lots of hair. It also smells very bad', 3);
INSERT INTO public.star VALUES (6, 'Great star 1', true, 'Extremely hot and big', 1);
INSERT INTO public.star VALUES (9, 'Great star 2', true, 'Extremely hot and big', 1);
INSERT INTO public.star VALUES (10, 'Great star 4', true, 'Extremely hot and big', 1);
INSERT INTO public.star VALUES (11, 'Great star 6', true, 'Extremely hot and big', 1);
INSERT INTO public.star VALUES (12, 'Great star 7', true, 'Extremely hot and big', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 29, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 26, true);


--
-- Name: spaceship_spaceship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.spaceship_spaceship_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: spaceship spaceship_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship
    ADD CONSTRAINT spaceship_name_key UNIQUE (name);


--
-- Name: spaceship spaceship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.spaceship
    ADD CONSTRAINT spaceship_pkey PRIMARY KEY (spaceship_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

