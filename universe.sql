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
    name character varying(30) NOT NULL,
    size integer NOT NULL,
    number_of_stars integer NOT NULL,
    distance_from_earth numeric,
    shape text,
    exist boolean,
    visible_from_earth boolean
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
    size integer,
    number_in_cluster integer NOT NULL,
    radius numeric,
    about text,
    visited_before boolean,
    gaseous boolean,
    planet_id integer
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
    name character varying(30) NOT NULL,
    size integer,
    "position" integer NOT NULL,
    radius numeric,
    about text,
    habitable boolean,
    gaseous boolean,
    star_id integer
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
-- Name: satellite; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.satellite (
    satellite_id integer NOT NULL,
    name character varying(30) NOT NULL,
    length integer,
    width integer NOT NULL,
    distance numeric,
    about text,
    active boolean,
    visible boolean
);


ALTER TABLE public.satellite OWNER TO freecodecamp;

--
-- Name: satellite_satelitte_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.satellite_satelitte_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.satellite_satelitte_id_seq OWNER TO freecodecamp;

--
-- Name: satellite_satelitte_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.satellite_satelitte_id_seq OWNED BY public.satellite.satellite_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size integer,
    age integer NOT NULL,
    temperature numeric,
    review text,
    hot boolean,
    twinkles boolean,
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
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: satellite satellite_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite ALTER COLUMN satellite_id SET DEFAULT nextval('public.satellite_satelitte_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000, 200000000, 25000.00, 'Spiral', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, 400000000, 27000.00, 'Spiral', true, true);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 600000, 1000000000, 55000.00, 'Elliptical', true, true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 50000, 40000000, 30000.00, 'Spiral', true, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 60000, 20000000, 31000.00, 'Spiral', true, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 120000, 500000000, 36000.00, 'Elliptical', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 1, 1, 1737.1, 'Earth''s only natural satellite', true, false, 1);
INSERT INTO public.moon VALUES (22, 'Phobos', 0, 1, 11.1, 'Moon of Mars', true, false, 2);
INSERT INTO public.moon VALUES (23, 'Deimos', 0, 2, 6.2, 'Moon of Mars', true, false, 2);
INSERT INTO public.moon VALUES (24, 'Europa', 0, 2, 1560.8, 'Moon of Jupiter', true, false, 4);
INSERT INTO public.moon VALUES (25, 'Ganymede', 0, 3, 2634.1, 'Moon of Jupiter', true, false, 4);
INSERT INTO public.moon VALUES (26, 'Callisto', 0, 4, 2410.3, 'Moon of Jupiter', true, false, 4);
INSERT INTO public.moon VALUES (27, 'Titan', 0, 1, 2575.5, 'Moon of Saturn', true, false, 5);
INSERT INTO public.moon VALUES (28, 'Enceladus', 0, 2, 252.1, 'Moon of Saturn', true, false, 5);
INSERT INTO public.moon VALUES (29, 'Miranda', 0, 1, 235.8, 'Moon of Uranus', true, false, 17);
INSERT INTO public.moon VALUES (30, 'Triton', 0, 1, 1353.4, 'Moon of Neptune', true, false, 14);
INSERT INTO public.moon VALUES (31, 'Charon', 0, 1, 603.6, 'Moon of Pluto', true, false, 15);
INSERT INTO public.moon VALUES (32, 'Phobos II', 0, 1, 10.1, 'Second moon of Mars', false, false, 2);
INSERT INTO public.moon VALUES (33, 'Lysithea', 0, 1, 18.3, 'Moon of Jupiter', false, false, 4);
INSERT INTO public.moon VALUES (34, 'Rhea', 0, 3, 764.3, 'Moon of Saturn', false, false, 5);
INSERT INTO public.moon VALUES (35, 'Oberon', 0, 2, 761.4, 'Moon of Uranus', false, false, 17);
INSERT INTO public.moon VALUES (36, 'Nereid', 0, 1, 170.0, 'Moon of Neptune', false, false, 15);
INSERT INTO public.moon VALUES (37, 'Styx', 0, 1, 10.0, 'Moon of Pluto', false, false, 16);
INSERT INTO public.moon VALUES (38, 'Amalthea', 0, 1, 83.5, 'Moon of Jupiter', false, false, 4);
INSERT INTO public.moon VALUES (39, 'Dione', 0, 2, 561.4, 'Moon of Saturn', false, false, 5);
INSERT INTO public.moon VALUES (40, 'Titania', 0, 1, 788.9, 'Moon of Uranus', false, false, 14);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 3, 6371.0, 'Third planet from the Sun', true, false, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 4, 3389.5, 'Fourth planet from the Sun', false, false, 1);
INSERT INTO public.planet VALUES (3, 'Neptune', 4, 8, 24622.0, 'Eighth planet from the Sun', false, true, 2);
INSERT INTO public.planet VALUES (4, 'Jupiter', 11, 5, 69911.0, 'Fifth planet from the Sun', false, true, 3);
INSERT INTO public.planet VALUES (5, 'Saturn', 9, 6, 58232.0, 'Sixth planet from the Sun', false, true, 4);
INSERT INTO public.planet VALUES (6, 'Venus', 1, 2, 6051.8, 'Second planet from the Sun', false, false, 2);
INSERT INTO public.planet VALUES (14, 'Mercury', 0, 1, 2439.7, 'Closest planet to the Sun', false, false, 1);
INSERT INTO public.planet VALUES (15, 'Uranus', 4, 7, 25362.0, 'Seventh planet from the Sun', false, true, 3);
INSERT INTO public.planet VALUES (16, 'Pluto', 0, 9, 1188.3, 'Dwarf planet in the Kuiper belt', false, false, 4);
INSERT INTO public.planet VALUES (17, 'Kepler-452b', 2, 10, 6400.0, 'Potentially habitable exoplanet', true, false, 5);
INSERT INTO public.planet VALUES (18, 'HD 209458 b', 1, 11, 94500.0, 'Hot Jupiter exoplanet', false, true, 6);
INSERT INTO public.planet VALUES (19, 'Gliese 581 c', 1, 12, 5500.0, 'Super-Earth exoplanet', true, false, 3);


--
-- Data for Name: satellite; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.satellite VALUES (1, 'Hubble Space Telescope', 13, 4, NULL, 'Space telescope orbiting Earth', true, true);
INSERT INTO public.satellite VALUES (2, 'International Space Station', 73, 109, 408, 'Habitat and laboratory in low Earth orbit', true, true);
INSERT INTO public.satellite VALUES (3, 'Tiangong Space Station', 16, 4, 400, 'Chinese space station in low Earth orbit', true, true);
INSERT INTO public.satellite VALUES (4, 'Mars Reconnaissance Orbiter', 21, 3, 310, 'Orbiter studying Mars', true, true);
INSERT INTO public.satellite VALUES (5, 'Voyager 1', 21, 3, 22600000000, 'Interstellar probe', true, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 40, 5778.0, 'Main sequence star', true, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 2, 25, 9940.0, 'Brightest star in the night sky', true, true, 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 0, 50, 3042.0, 'Closest star to the Sun', false, false, 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1000, 20, 3500.0, 'Red supergiant', true, true, 3);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 1, 60, 5790.0, 'Closest star system to the Sun', true, true, 2);
INSERT INTO public.star VALUES (6, 'Arcturus', 25, 70, 4300.0, 'Brightest star in the northern celestial hemisphere', true, true, 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 19, true);


--
-- Name: satellite_satelitte_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.satellite_satelitte_id_seq', 5, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: satellite satellite_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_name_key UNIQUE (name);


--
-- Name: satellite satellite_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.satellite
    ADD CONSTRAINT satellite_pkey PRIMARY KEY (satellite_id);


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

