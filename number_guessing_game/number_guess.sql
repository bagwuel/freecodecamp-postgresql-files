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
-- Name: guesses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guesses (
    guess_id integer NOT NULL,
    user_id integer,
    guess integer
);


ALTER TABLE public.guesses OWNER TO freecodecamp;

--
-- Name: guesses_guess_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.guesses_guess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guesses_guess_id_seq OWNER TO freecodecamp;

--
-- Name: guesses_guess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.guesses_guess_id_seq OWNED BY public.guesses.guess_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer
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
-- Name: guesses guess_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses ALTER COLUMN guess_id SET DEFAULT nextval('public.guesses_guess_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: guesses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guesses VALUES (1, 8, 10);
INSERT INTO public.guesses VALUES (2, 8, 11);
INSERT INTO public.guesses VALUES (3, 9, 214);
INSERT INTO public.guesses VALUES (4, 9, 691);
INSERT INTO public.guesses VALUES (5, 10, 822);
INSERT INTO public.guesses VALUES (6, 10, 761);
INSERT INTO public.guesses VALUES (7, 9, 352);
INSERT INTO public.guesses VALUES (8, 9, 736);
INSERT INTO public.guesses VALUES (9, 9, 287);
INSERT INTO public.guesses VALUES (10, 13, 940);
INSERT INTO public.guesses VALUES (11, 13, 638);
INSERT INTO public.guesses VALUES (12, 14, 165);
INSERT INTO public.guesses VALUES (13, 14, 45);
INSERT INTO public.guesses VALUES (14, 13, 546);
INSERT INTO public.guesses VALUES (15, 13, 433);
INSERT INTO public.guesses VALUES (16, 13, 838);
INSERT INTO public.guesses VALUES (17, 15, 735);
INSERT INTO public.guesses VALUES (18, 15, 230);
INSERT INTO public.guesses VALUES (19, 16, 944);
INSERT INTO public.guesses VALUES (20, 16, 425);
INSERT INTO public.guesses VALUES (21, 15, 491);
INSERT INTO public.guesses VALUES (22, 15, 564);
INSERT INTO public.guesses VALUES (23, 15, 825);
INSERT INTO public.guesses VALUES (24, 17, 230);
INSERT INTO public.guesses VALUES (25, 17, 573);
INSERT INTO public.guesses VALUES (26, 18, 247);
INSERT INTO public.guesses VALUES (27, 18, 352);
INSERT INTO public.guesses VALUES (28, 17, 232);
INSERT INTO public.guesses VALUES (29, 17, 340);
INSERT INTO public.guesses VALUES (30, 17, 197);
INSERT INTO public.guesses VALUES (31, 19, 459);
INSERT INTO public.guesses VALUES (32, 19, 533);
INSERT INTO public.guesses VALUES (33, 20, 901);
INSERT INTO public.guesses VALUES (34, 20, 766);
INSERT INTO public.guesses VALUES (35, 19, 461);
INSERT INTO public.guesses VALUES (36, 19, 441);
INSERT INTO public.guesses VALUES (37, 19, 581);
INSERT INTO public.guesses VALUES (38, 21, 107);
INSERT INTO public.guesses VALUES (39, 21, 307);
INSERT INTO public.guesses VALUES (40, 22, 171);
INSERT INTO public.guesses VALUES (41, 22, 343);
INSERT INTO public.guesses VALUES (42, 21, 250);
INSERT INTO public.guesses VALUES (43, 21, 950);
INSERT INTO public.guesses VALUES (44, 21, 173);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (8, 'emma', 3);
INSERT INTO public.users VALUES (10, 'user_1735153952642', 2);
INSERT INTO public.users VALUES (9, 'user_1735153952643', 5);
INSERT INTO public.users VALUES (11, 'user_1735158476520', 1);
INSERT INTO public.users VALUES (12, 'user_1735158476519', 1);
INSERT INTO public.users VALUES (13, 'user_1735158556558', 1);
INSERT INTO public.users VALUES (14, 'user_1735158556557', 1);
INSERT INTO public.users VALUES (15, 'user_1735158931424', 1);
INSERT INTO public.users VALUES (16, 'user_1735158931423', 1);
INSERT INTO public.users VALUES (17, 'user_1735159030693', 1);
INSERT INTO public.users VALUES (18, 'user_1735159030692', 1);
INSERT INTO public.users VALUES (19, 'user_1735159071694', 1);
INSERT INTO public.users VALUES (20, 'user_1735159071693', 1);
INSERT INTO public.users VALUES (21, 'user_1735159151534', 1);
INSERT INTO public.users VALUES (22, 'user_1735159151533', 1);


--
-- Name: guesses_guess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.guesses_guess_id_seq', 44, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 22, true);


--
-- Name: guesses guesses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT guesses_pkey PRIMARY KEY (guess_id);


--
-- Name: users uniqu_user; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uniqu_user UNIQUE (username);


--
-- Name: users user_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pk PRIMARY KEY (user_id);


--
-- Name: guesses user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

