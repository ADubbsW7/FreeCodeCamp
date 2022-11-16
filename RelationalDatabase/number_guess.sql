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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    correct_answer integer,
    num_guesses integer
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL
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
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (7, 3, 808, 809);
INSERT INTO public.games VALUES (8, 3, 937, 938);
INSERT INTO public.games VALUES (9, 4, 931, 932);
INSERT INTO public.games VALUES (10, 4, 64, 65);
INSERT INTO public.games VALUES (11, 3, 631, 634);
INSERT INTO public.games VALUES (12, 3, 575, 577);
INSERT INTO public.games VALUES (13, 3, 792, 793);
INSERT INTO public.games VALUES (14, 5, 308, 309);
INSERT INTO public.games VALUES (15, 5, 246, 247);
INSERT INTO public.games VALUES (16, 6, 218, 219);
INSERT INTO public.games VALUES (17, 6, 197, 198);
INSERT INTO public.games VALUES (18, 5, 579, 582);
INSERT INTO public.games VALUES (19, 5, 126, 128);
INSERT INTO public.games VALUES (20, 5, 776, 777);
INSERT INTO public.games VALUES (21, 7, 842, 843);
INSERT INTO public.games VALUES (22, 7, 160, 161);
INSERT INTO public.games VALUES (23, 8, 171, 172);
INSERT INTO public.games VALUES (24, 8, 557, 558);
INSERT INTO public.games VALUES (25, 7, 39, 42);
INSERT INTO public.games VALUES (26, 7, 88, 90);
INSERT INTO public.games VALUES (27, 7, 166, 167);
INSERT INTO public.games VALUES (28, 9, 182, 183);
INSERT INTO public.games VALUES (29, 9, 147, 148);
INSERT INTO public.games VALUES (30, 10, 124, 125);
INSERT INTO public.games VALUES (31, 10, 3, 4);
INSERT INTO public.games VALUES (32, 9, 779, 782);
INSERT INTO public.games VALUES (33, 9, 625, 627);
INSERT INTO public.games VALUES (34, 9, 902, 903);
INSERT INTO public.games VALUES (35, 11, 56, 57);
INSERT INTO public.games VALUES (36, 11, 877, 878);
INSERT INTO public.games VALUES (37, 12, 710, 711);
INSERT INTO public.games VALUES (38, 12, 769, 770);
INSERT INTO public.games VALUES (39, 11, 900, 903);
INSERT INTO public.games VALUES (40, 11, 371, 373);
INSERT INTO public.games VALUES (41, 11, 381, 382);
INSERT INTO public.games VALUES (42, 13, 230, 231);
INSERT INTO public.games VALUES (43, 13, 177, 178);
INSERT INTO public.games VALUES (44, 14, 56, 57);
INSERT INTO public.games VALUES (45, 14, 163, 164);
INSERT INTO public.games VALUES (46, 13, 447, 450);
INSERT INTO public.games VALUES (47, 13, 12, 14);
INSERT INTO public.games VALUES (48, 13, 958, 959);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (3, 'user_1668565653847');
INSERT INTO public.users VALUES (4, 'user_1668565653846');
INSERT INTO public.users VALUES (5, 'user_1668566100154');
INSERT INTO public.users VALUES (6, 'user_1668566100153');
INSERT INTO public.users VALUES (7, 'user_1668566108168');
INSERT INTO public.users VALUES (8, 'user_1668566108167');
INSERT INTO public.users VALUES (9, 'user_1668566171377');
INSERT INTO public.users VALUES (10, 'user_1668566171376');
INSERT INTO public.users VALUES (11, 'user_1668566184477');
INSERT INTO public.users VALUES (12, 'user_1668566184476');
INSERT INTO public.users VALUES (13, 'user_1668566202562');
INSERT INTO public.users VALUES (14, 'user_1668566202561');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 48, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 14, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games fk_user_id_games; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_user_id_games FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

