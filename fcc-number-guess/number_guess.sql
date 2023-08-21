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

DROP DATABASE number_guess_game;
--
-- Name: number_guess_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess_game OWNER TO freecodecamp;

\connect number_guess_game

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
-- Name: scoreboard; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.scoreboard (
    scoreboard_id integer NOT NULL,
    games_played integer DEFAULT 0,
    best_score integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.scoreboard OWNER TO freecodecamp;

--
-- Name: scoreboard_scoreboard_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.scoreboard_scoreboard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scoreboard_scoreboard_id_seq OWNER TO freecodecamp;

--
-- Name: scoreboard_scoreboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.scoreboard_scoreboard_id_seq OWNED BY public.scoreboard.scoreboard_id;


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
-- Name: scoreboard scoreboard_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scoreboard ALTER COLUMN scoreboard_id SET DEFAULT nextval('public.scoreboard_scoreboard_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: scoreboard; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.scoreboard VALUES (20, 2, 30, 22);
INSERT INTO public.scoreboard VALUES (19, 5, 367, 21);
INSERT INTO public.scoreboard VALUES (22, 2, 564, 24);
INSERT INTO public.scoreboard VALUES (21, 5, 137, 23);
INSERT INTO public.scoreboard VALUES (24, 2, 289, 26);
INSERT INTO public.scoreboard VALUES (23, 5, 18, 25);
INSERT INTO public.scoreboard VALUES (26, 2, 427, 28);
INSERT INTO public.scoreboard VALUES (25, 5, 202, 27);
INSERT INTO public.scoreboard VALUES (28, 2, 120, 30);
INSERT INTO public.scoreboard VALUES (27, 5, 48, 29);
INSERT INTO public.scoreboard VALUES (30, 2, 406, 32);
INSERT INTO public.scoreboard VALUES (29, 5, 105, 31);
INSERT INTO public.scoreboard VALUES (32, 2, 609, 34);
INSERT INTO public.scoreboard VALUES (31, 5, 215, 33);
INSERT INTO public.scoreboard VALUES (34, 2, 200, 36);
INSERT INTO public.scoreboard VALUES (33, 5, 54, 35);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (21, 'user_1692601057777');
INSERT INTO public.users VALUES (22, 'user_1692601057776');
INSERT INTO public.users VALUES (23, 'user_1692601126228');
INSERT INTO public.users VALUES (24, 'user_1692601126227');
INSERT INTO public.users VALUES (25, 'user_1692601143891');
INSERT INTO public.users VALUES (26, 'user_1692601143890');
INSERT INTO public.users VALUES (27, 'user_1692601200897');
INSERT INTO public.users VALUES (28, 'user_1692601200896');
INSERT INTO public.users VALUES (29, 'user_1692601264178');
INSERT INTO public.users VALUES (30, 'user_1692601264177');
INSERT INTO public.users VALUES (31, 'user_1692601301450');
INSERT INTO public.users VALUES (32, 'user_1692601301449');
INSERT INTO public.users VALUES (33, 'user_1692601446606');
INSERT INTO public.users VALUES (34, 'user_1692601446605');
INSERT INTO public.users VALUES (35, 'user_1692603037932');
INSERT INTO public.users VALUES (36, 'user_1692603037931');


--
-- Name: scoreboard_scoreboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.scoreboard_scoreboard_id_seq', 34, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 36, true);


--
-- Name: scoreboard scoreboard_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scoreboard
    ADD CONSTRAINT scoreboard_pkey PRIMARY KEY (scoreboard_id);


--
-- Name: users users_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_name_key UNIQUE (name);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: scoreboard scoreboard_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scoreboard
    ADD CONSTRAINT scoreboard_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

