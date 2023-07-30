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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    shape character varying(30),
    age_billion_years numeric(4,1),
    number_of_stars_billion integer,
    number_of_black_holes integer
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
    name character varying(30) NOT NULL,
    shape character varying(30) NOT NULL,
    age_billion_years numeric(4,1),
    water_h2o boolean,
    life_form text,
    diameter_km integer,
    planet_id integer NOT NULL
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
-- Name: more_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_info (
    name character varying(100) NOT NULL,
    more_info_id integer NOT NULL,
    description text
);


ALTER TABLE public.more_info OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_info_more_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_info_more_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_info_more_info_id_seq OWNED BY public.more_info.more_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_billion_years numeric(4,1),
    water_h2o boolean,
    prime_life_form character varying(60),
    diameter_km integer NOT NULL,
    star_id integer NOT NULL,
    moons integer
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
    name character varying(30) NOT NULL,
    planets integer,
    age_billion_years numeric(4,1),
    diameter_million_km numeric(7,3),
    galaxy_id integer
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
-- Name: more_info more_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info ALTER COLUMN more_info_id SET DEFAULT nextval('public.more_info_more_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Prime', 'Spiral', 10.2, 400, 25);
INSERT INTO public.galaxy VALUES (2, 'Centaures Alpha', 'Elliptical', 8.5, 250, 15);
INSERT INTO public.galaxy VALUES (3, 'Draco Minoris', 'Irregular', 12.1, 150, 10);
INSERT INTO public.galaxy VALUES (4, 'Orion-IX', 'Spiral', 9.8, 300, 21);
INSERT INTO public.galaxy VALUES (5, 'Pegasus-7', 'Elliptical', 11.5, 180, 12);
INSERT INTO public.galaxy VALUES (6, 'Lyra Majora', 'Irregular', 13.3, 120, 8);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Astra', 'Irregular', 2.1, true, 'Microscopic organisms', 1500, 5);
INSERT INTO public.moon VALUES (2, 'Nova-9', 'Spherical', 3.8, false, 'None', 2800, 5);
INSERT INTO public.moon VALUES (3, 'Titanus', 'Elliptical', 1.6, true, 'Ancient reptilian creatures', 2300, 6);
INSERT INTO public.moon VALUES (4, 'Lyra Mora', 'Irregular', 4.3, true, 'Avian-like organisms', 1200, 12);
INSERT INTO public.moon VALUES (5, 'Aquarius Prime', 'Spherical', 5.2, true, 'Aquatic mammals', 3100, 1);
INSERT INTO public.moon VALUES (6, 'Zephyr', 'Elliptical', 6.5, false, 'Ethereal energy beings', 2900, 3);
INSERT INTO public.moon VALUES (7, 'Celestia Minor', 'Irregular', 2.9, true, 'Luminescent plants', 1800, 7);
INSERT INTO public.moon VALUES (8, 'Arcadia-6', 'Spherical', 4.7, true, 'Sentient crystals', 2500, 3);
INSERT INTO public.moon VALUES (9, 'Draco Major', 'Elliptical', 3.3, true, 'Subterranean insects', 2100, 11);
INSERT INTO public.moon VALUES (10, 'Orion-11', 'Irregular', 5.9, true, 'Ethereal beings of light', 1400, 4);
INSERT INTO public.moon VALUES (11, 'Aquila Minor', 'Spherical', 1.8, true, 'Avian-like creatures', 2200, 5);
INSERT INTO public.moon VALUES (12, 'Pegasus-IX', 'Elliptical', 4.1, false, 'None', 2700, 5);
INSERT INTO public.moon VALUES (13, 'Nova', 'Irregular', 2.6, true, 'Floating gas entities', 1900, 3);
INSERT INTO public.moon VALUES (14, 'Drak', 'Spherical', 3.6, true, 'Amphibians creatures', 2400, 11);
INSERT INTO public.moon VALUES (15, 'Zeta-7', 'Irregular', 6.7, true, 'Silicon based organisms', 1300, 10);
INSERT INTO public.moon VALUES (16, 'Lyr', 'Spherical', 1.4, true, 'Subsurface fungal network', 2800, 12);
INSERT INTO public.moon VALUES (17, 'Orion Minor', 'Elliptical', 3.2, false, 'None', 2100, 14);
INSERT INTO public.moon VALUES (18, 'Pavo-6', 'Irregular', 4.3, true, 'Crystalline structures', 1700, 13);
INSERT INTO public.moon VALUES (19, 'Cetus-11', 'Spherical', 2.4, true, 'Ancient aquatic civilization', 2300, 13);
INSERT INTO public.moon VALUES (20, 'Aries Minor', 'Elliptical', 5.1, false, 'None', 3000, 12);
INSERT INTO public.moon VALUES (21, 'Vela Prime', 'Irregular', 1.7, true, 'Microscopic organisms', 1600, 13);
INSERT INTO public.moon VALUES (22, 'Aquarias Histora', 'Spherical', 4.7, true, 'Semi-sentient plant life', 2000, 9);
INSERT INTO public.moon VALUES (23, 'Caelum-9', 'Elliptical', 3.8, true, 'Unknown Hostile Civilisation', 2500, 9);


--
-- Data for Name: more_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_info VALUES ('Giant Sentient Beings', 1, 'Majestic creatures with a profound connection to nature. Towering over trees, they transmit thoughts through vibrations. Revered guardians of the natural world, they commune with the spirits of the land.');
INSERT INTO public.more_info VALUES ('Ethereal Energy Entities', 2, 'Enigmatic entities dancing in shimmering auroras. Manifestations of energy transcending the physical realm. Gifted with interdimensional travel, they hold the universe''s mysteries.');
INSERT INTO public.more_info VALUES ('Insectoid Creatures', 3, 'Thriving in arid deserts and jungles, they buzz with life. Intelligent beings with intricate pheromone communication. Builders of towering hives and keepers of ancient knowledge.');
INSERT INTO public.more_info VALUES ('Sentient Fungi', 4, 'Silent network of consciousness in mystical forests. Bioluminescent beings with spore-based communication. Wisdom of the land''s secrets and healing properties of plants.');
INSERT INTO public.more_info VALUES ('Highly Advanced AI Beings', 5, 'Humming metropolis of unparalleled computational power. Fusion of technology and consciousness. Pioneers in space exploration, unlocking cosmos mysteries.');
INSERT INTO public.more_info VALUES ('Shape-Shifting Entities', 6, 'Emerging at twilight, morphing into fluid forms. Guardians of tangible and ethereal realms. Guides to enlightenment, witnesses of boundless wonders.');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Epsilon B', 3.8, true, 'Aquatic Beings', 12500, 6, 2);
INSERT INTO public.planet VALUES (2, 'Zeta-9', 6.2, false, 'None', 15800, 2, 0);
INSERT INTO public.planet VALUES (3, 'Nova Prime', 2.5, true, 'Plant-like organisms', 9100, 2, 4);
INSERT INTO public.planet VALUES (4, 'Terra Nova', 4.4, true, 'Mammalian creatures', 13200, 4, 1);
INSERT INTO public.planet VALUES (5, 'Galactica', 5.7, true, 'Avian species', 18600, 5, 6);
INSERT INTO public.planet VALUES (6, 'Nibiru', 7.3, false, 'Giant Sentient beings', 20400, 8, 3);
INSERT INTO public.planet VALUES (7, 'Celestia', 1.9, true, 'Etheral energy entities', 8300, 1, 2);
INSERT INTO public.planet VALUES (8, 'Titan-7', 3.1, true, 'Insectoid creatures', 11700, 1, 0);
INSERT INTO public.planet VALUES (9, 'Atherius', 4.8, true, 'Humanoid civilisation', 14900, 4, 5);
INSERT INTO public.planet VALUES (10, 'Arcadia', 2.2, true, 'Sentient fungi', 10000, 4, 1);
INSERT INTO public.planet VALUES (11, 'Draco Minor', 6.9, false, 'Amphibians creatures', 17200, 6, 2);
INSERT INTO public.planet VALUES (12, 'Lyra Prime', 5.4, true, 'Highly Advanced AI beings', 16300, 7, 4);
INSERT INTO public.planet VALUES (13, 'Vela Major', 2.6, true, 'Subterranean organisms', 9800, 8, 3);
INSERT INTO public.planet VALUES (14, 'Orion-IX', 4.6, true, 'Shape=shifting entities', 13900, 4, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri', 5, 4.3, 1.227, 2);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 2, 7.8, 0.900, 2);
INSERT INTO public.star VALUES (2, 'Sirius', 3, 2.1, 1.711, 1);
INSERT INTO public.star VALUES (6, 'Vega', 6, 4.9, 3.500, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 7, 7.8, 900.000, 4);
INSERT INTO public.star VALUES (5, 'Polaris', 4, 3.6, 1.362, 4);
INSERT INTO public.star VALUES (7, 'Antares', 1, 6.2, 3.500, 4);
INSERT INTO public.star VALUES (8, 'Aldebaran', 8, 5.5, 2.903, 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: more_info_more_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_info_more_info_id_seq', 6, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: more_info more_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_name_key UNIQUE (name);


--
-- Name: more_info more_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_info
    ADD CONSTRAINT more_info_pkey PRIMARY KEY (more_info_id);


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

