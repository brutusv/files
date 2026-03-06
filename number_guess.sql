--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    user_id integer,
    number_of_attemps integer
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
    name character varying(22) NOT NULL
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

INSERT INTO public.games VALUES (1, 2, 1);
INSERT INTO public.games VALUES (2, 2, 4);
INSERT INTO public.games VALUES (3, 12, 393);
INSERT INTO public.games VALUES (4, 12, 507);
INSERT INTO public.games VALUES (5, 13, 326);
INSERT INTO public.games VALUES (6, 13, 964);
INSERT INTO public.games VALUES (7, 12, 860);
INSERT INTO public.games VALUES (8, 12, 1);
INSERT INTO public.games VALUES (9, 12, 388);
INSERT INTO public.games VALUES (10, 2, 7);
INSERT INTO public.games VALUES (11, 14, 283);
INSERT INTO public.games VALUES (12, 14, 99);
INSERT INTO public.games VALUES (13, 15, 816);
INSERT INTO public.games VALUES (14, 15, 628);
INSERT INTO public.games VALUES (15, 14, 987);
INSERT INTO public.games VALUES (16, 14, 1);
INSERT INTO public.games VALUES (17, 14, 874);
INSERT INTO public.games VALUES (18, 2, 1);
INSERT INTO public.games VALUES (19, 2, 1);
INSERT INTO public.games VALUES (20, 2, 1);
INSERT INTO public.games VALUES (21, 2, 10);
INSERT INTO public.games VALUES (22, 2, 15);
INSERT INTO public.games VALUES (23, 16, 411);
INSERT INTO public.games VALUES (24, 16, 68);
INSERT INTO public.games VALUES (25, 17, 270);
INSERT INTO public.games VALUES (26, 17, 244);
INSERT INTO public.games VALUES (27, 16, 342);
INSERT INTO public.games VALUES (28, 16, 991);
INSERT INTO public.games VALUES (29, 16, 823);
INSERT INTO public.games VALUES (30, 18, 593);
INSERT INTO public.games VALUES (31, 18, 693);
INSERT INTO public.games VALUES (32, 19, 45);
INSERT INTO public.games VALUES (33, 19, 813);
INSERT INTO public.games VALUES (34, 18, 637);
INSERT INTO public.games VALUES (35, 18, 161);
INSERT INTO public.games VALUES (36, 18, 328);
INSERT INTO public.games VALUES (37, 20, 461);
INSERT INTO public.games VALUES (38, 20, 393);
INSERT INTO public.games VALUES (39, 21, 438);
INSERT INTO public.games VALUES (40, 21, 108);
INSERT INTO public.games VALUES (41, 20, 550);
INSERT INTO public.games VALUES (42, 20, 890);
INSERT INTO public.games VALUES (43, 20, 68);
INSERT INTO public.games VALUES (44, 22, 63);
INSERT INTO public.games VALUES (45, 22, 507);
INSERT INTO public.games VALUES (46, 23, 973);
INSERT INTO public.games VALUES (47, 23, 665);
INSERT INTO public.games VALUES (48, 22, 652);
INSERT INTO public.games VALUES (49, 22, 533);
INSERT INTO public.games VALUES (50, 22, 853);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'User');
INSERT INTO public.users VALUES (2, 'Broot');
INSERT INTO public.users VALUES (6, 'User4');
INSERT INTO public.users VALUES (7, 'Test');
INSERT INTO public.users VALUES (8, 'user_1772836403583');
INSERT INTO public.users VALUES (9, 'user_1772836403582');
INSERT INTO public.users VALUES (10, 'user_1772836589678');
INSERT INTO public.users VALUES (11, 'user_1772836589677');
INSERT INTO public.users VALUES (12, 'user_1772837241389');
INSERT INTO public.users VALUES (13, 'user_1772837241388');
INSERT INTO public.users VALUES (14, 'user_1772837840044');
INSERT INTO public.users VALUES (15, 'user_1772837840043');
INSERT INTO public.users VALUES (16, 'user_1772839057723');
INSERT INTO public.users VALUES (17, 'user_1772839057722');
INSERT INTO public.users VALUES (18, 'user_1772839113286');
INSERT INTO public.users VALUES (19, 'user_1772839113285');
INSERT INTO public.users VALUES (20, 'user_1772839510800');
INSERT INTO public.users VALUES (21, 'user_1772839510799');
INSERT INTO public.users VALUES (22, 'user_1772839703416');
INSERT INTO public.users VALUES (23, 'user_1772839703415');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 50, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 23, true);


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
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

