--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: asteroid_belt; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid_belt (
    asteroid_belt_id integer NOT NULL,
    star_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.asteroid_belt OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_belt_asteroid_belt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_belt_asteroid_belt_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_belt_asteroid_belt_id_seq OWNED BY public.asteroid_belt.asteroid_belt_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_light_years integer,
    is_spiral boolean,
    part_of_cluster boolean
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
    planet_id integer,
    name character varying(30) NOT NULL,
    tidal_locked boolean,
    diameter_in_km integer
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
    star_id integer,
    name character varying(30) NOT NULL,
    description text,
    distance_from_star_in_au integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    radius_in_km integer,
    color character varying(20),
    mass_in_solar_mass numeric(4,1),
    name character varying(30) NOT NULL
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
-- Name: asteroid_belt asteroid_belt_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt ALTER COLUMN asteroid_belt_id SET DEFAULT nextval('public.asteroid_belt_asteroid_belt_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid_belt; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid_belt VALUES (1, 1, 'The Belt');
INSERT INTO public.asteroid_belt VALUES (2, 2, 'B234');
INSERT INTO public.asteroid_belt VALUES (3, 3, 'B3497');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 105700, true, true);
INSERT INTO public.galaxy VALUES (2, 'Backward', 145700, true, false);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 130400, true, true);
INSERT INTO public.galaxy VALUES (4, 'Carwheel', 144900, false, true);
INSERT INTO public.galaxy VALUES (5, 'Condor', 260400, true, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 195700, true, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (6, 1, 'Moon', true, NULL);
INSERT INTO public.moon VALUES (7, 3, 'M2345', false, NULL);
INSERT INTO public.moon VALUES (8, 3, 'M98762345', false, NULL);
INSERT INTO public.moon VALUES (9, 9, 'M549278', false, NULL);
INSERT INTO public.moon VALUES (10, 15, 'M2345978', true, NULL);
INSERT INTO public.moon VALUES (16, 12, 'M73852', true, NULL);
INSERT INTO public.moon VALUES (17, 4, 'M45', false, NULL);
INSERT INTO public.moon VALUES (18, 4, 'M98345', false, NULL);
INSERT INTO public.moon VALUES (19, 11, 'M5478', false, NULL);
INSERT INTO public.moon VALUES (20, 16, 'M2978', true, NULL);
INSERT INTO public.moon VALUES (21, 12, 'M782', true, NULL);
INSERT INTO public.moon VALUES (22, 9, 'M56502102', false, NULL);
INSERT INTO public.moon VALUES (23, 10, 'M945', false, NULL);
INSERT INTO public.moon VALUES (24, 10, 'M1239784789', false, NULL);
INSERT INTO public.moon VALUES (25, 14, 'M743879', true, NULL);
INSERT INTO public.moon VALUES (26, 16, 'M87354', true, NULL);
INSERT INTO public.moon VALUES (27, 4, 'M565012', false, NULL);
INSERT INTO public.moon VALUES (28, 11, 'M972138', false, NULL);
INSERT INTO public.moon VALUES (29, 13, 'M1237849', false, NULL);
INSERT INTO public.moon VALUES (30, 13, 'M779', true, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', NULL, 1);
INSERT INTO public.planet VALUES (2, 1, 'Neptune', NULL, 30);
INSERT INTO public.planet VALUES (3, 2, 'X2349', NULL, 4);
INSERT INTO public.planet VALUES (4, 3, 'X123', NULL, 5);
INSERT INTO public.planet VALUES (9, 4, 'X345', NULL, 6);
INSERT INTO public.planet VALUES (10, 3, 'N2345', NULL, 3);
INSERT INTO public.planet VALUES (11, 5, 'X23949', NULL, 7);
INSERT INTO public.planet VALUES (12, 4, 'X257', NULL, 7);
INSERT INTO public.planet VALUES (13, 2, 'X716954', NULL, 19);
INSERT INTO public.planet VALUES (14, 3, 'P34652', NULL, 5);
INSERT INTO public.planet VALUES (15, 3, 'X72196', NULL, 15);
INSERT INTO public.planet VALUES (16, 4, 'X2347', NULL, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 696340, 'Yellow', 1.0, 'Sun');
INSERT INTO public.star VALUES (2, 2, 340000, 'Blue', 5.2, 'A234');
INSERT INTO public.star VALUES (3, 4, 123000, 'White', 8.0, 'B821');
INSERT INTO public.star VALUES (4, 3, 1000500, 'Red', 3.2, 'A5874');
INSERT INTO public.star VALUES (5, 6, 649100, 'Yellow', 0.9, 'A4671');
INSERT INTO public.star VALUES (6, 5, 950400, 'Red', 6.7, 'C974');


--
-- Name: asteroid_belt_asteroid_belt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_belt_asteroid_belt_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid_belt asteroid_belt_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_name_key UNIQUE (name);


--
-- Name: asteroid_belt asteroid_belt_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT asteroid_belt_pkey PRIMARY KEY (asteroid_belt_id);


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
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: asteroid_belt star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid_belt
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

