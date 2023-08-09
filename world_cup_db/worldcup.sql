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
    round character varying(60) NOT NULL,
    winner_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_id integer NOT NULL,
    opponent_goals integer NOT NULL
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
    name text NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (185, 2018, 'Final', 168, 4, 169, 2);
INSERT INTO public.games VALUES (186, 2018, 'Third Place', 170, 2, 171, 0);
INSERT INTO public.games VALUES (187, 2018, 'Semi-Final', 169, 2, 171, 1);
INSERT INTO public.games VALUES (188, 2018, 'Semi-Final', 168, 1, 170, 0);
INSERT INTO public.games VALUES (189, 2018, 'Quarter-Final', 169, 3, 172, 2);
INSERT INTO public.games VALUES (190, 2018, 'Quarter-Final', 171, 2, 173, 0);
INSERT INTO public.games VALUES (191, 2018, 'Quarter-Final', 170, 2, 174, 1);
INSERT INTO public.games VALUES (192, 2018, 'Quarter-Final', 168, 2, 175, 0);
INSERT INTO public.games VALUES (193, 2018, 'Eighth-Final', 171, 2, 176, 1);
INSERT INTO public.games VALUES (194, 2018, 'Eighth-Final', 173, 1, 177, 0);
INSERT INTO public.games VALUES (195, 2018, 'Eighth-Final', 170, 3, 178, 2);
INSERT INTO public.games VALUES (196, 2018, 'Eighth-Final', 174, 2, 179, 0);
INSERT INTO public.games VALUES (197, 2018, 'Eighth-Final', 169, 2, 180, 1);
INSERT INTO public.games VALUES (198, 2018, 'Eighth-Final', 172, 2, 181, 1);
INSERT INTO public.games VALUES (199, 2018, 'Eighth-Final', 175, 2, 182, 1);
INSERT INTO public.games VALUES (200, 2018, 'Eighth-Final', 168, 4, 183, 3);
INSERT INTO public.games VALUES (201, 2014, 'Final', 184, 1, 183, 0);
INSERT INTO public.games VALUES (202, 2014, 'Third Place', 185, 3, 174, 0);
INSERT INTO public.games VALUES (203, 2014, 'Semi-Final', 183, 1, 185, 0);
INSERT INTO public.games VALUES (204, 2014, 'Semi-Final', 184, 7, 174, 1);
INSERT INTO public.games VALUES (205, 2014, 'Quarter-Final', 185, 1, 186, 0);
INSERT INTO public.games VALUES (206, 2014, 'Quarter-Final', 183, 1, 170, 0);
INSERT INTO public.games VALUES (207, 2014, 'Quarter-Final', 174, 2, 176, 1);
INSERT INTO public.games VALUES (208, 2014, 'Quarter-Final', 184, 1, 168, 0);
INSERT INTO public.games VALUES (209, 2014, 'Eighth-Final', 174, 2, 187, 1);
INSERT INTO public.games VALUES (210, 2014, 'Eighth-Final', 176, 2, 175, 0);
INSERT INTO public.games VALUES (211, 2014, 'Eighth-Final', 168, 2, 188, 0);
INSERT INTO public.games VALUES (212, 2014, 'Eighth-Final', 184, 2, 189, 1);
INSERT INTO public.games VALUES (213, 2014, 'Eighth-Final', 185, 2, 179, 1);
INSERT INTO public.games VALUES (214, 2014, 'Eighth-Final', 186, 2, 190, 1);
INSERT INTO public.games VALUES (215, 2014, 'Eighth-Final', 183, 1, 177, 0);
INSERT INTO public.games VALUES (216, 2014, 'Eighth-Final', 170, 2, 191, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (168, 'France');
INSERT INTO public.teams VALUES (169, 'Croatia');
INSERT INTO public.teams VALUES (170, 'Belgium');
INSERT INTO public.teams VALUES (171, 'England');
INSERT INTO public.teams VALUES (172, 'Russia');
INSERT INTO public.teams VALUES (173, 'Sweden');
INSERT INTO public.teams VALUES (174, 'Brazil');
INSERT INTO public.teams VALUES (175, 'Uruguay');
INSERT INTO public.teams VALUES (176, 'Colombia');
INSERT INTO public.teams VALUES (177, 'Switzerland');
INSERT INTO public.teams VALUES (178, 'Japan');
INSERT INTO public.teams VALUES (179, 'Mexico');
INSERT INTO public.teams VALUES (180, 'Denmark');
INSERT INTO public.teams VALUES (181, 'Spain');
INSERT INTO public.teams VALUES (182, 'Portugal');
INSERT INTO public.teams VALUES (183, 'Argentina');
INSERT INTO public.teams VALUES (184, 'Germany');
INSERT INTO public.teams VALUES (185, 'Netherlands');
INSERT INTO public.teams VALUES (186, 'Costa Rica');
INSERT INTO public.teams VALUES (187, 'Chile');
INSERT INTO public.teams VALUES (188, 'Nigeria');
INSERT INTO public.teams VALUES (189, 'Algeria');
INSERT INTO public.teams VALUES (190, 'Greece');
INSERT INTO public.teams VALUES (191, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 216, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 191, true);


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
