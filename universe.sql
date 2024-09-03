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
    age_in_years integer,
    mass_to_light_ratio integer,
    mass_10_12_kg numeric(6,2),
    description text,
    has_life boolean,
    is_spherical boolean
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
    age_in_years integer,
    mass_to_light_ratio integer,
    mass_10_12_kg numeric(6,2),
    description text,
    has_life boolean,
    is_spherical boolean,
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
    age_in_years integer,
    mass_to_light_ratio integer,
    mass_10_12_kg numeric(6,2),
    description text,
    has_life boolean,
    is_spherical boolean,
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
-- Name: planet_stars; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_stars (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) DEFAULT 'dummy'::character varying,
    planet_stars_id integer NOT NULL,
    record_id character varying(4) DEFAULT 'id00'::character varying
);


ALTER TABLE public.planet_stars OWNER TO freecodecamp;

--
-- Name: planet_stars_planet_stars_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_stars_planet_stars_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_stars_planet_stars_id_seq OWNER TO freecodecamp;

--
-- Name: planet_stars_planet_stars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_stars_planet_stars_id_seq OWNED BY public.planet_stars.planet_stars_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_years integer,
    mass_to_light_ratio integer,
    mass_10_12_kg numeric(6,2),
    description text,
    has_life boolean,
    is_spherical boolean,
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
-- Name: planet_stars planet_stars_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_stars ALTER COLUMN planet_stars_id SET DEFAULT nextval('public.planet_stars_planet_stars_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 234, 322, 234.30, 'First galaxy', false, false);
INSERT INTO public.galaxy VALUES (2, 'Antennae', 234, 322, 234.30, 'Second galaxy', false, false);
INSERT INTO public.galaxy VALUES (3, 'Black Eye', 24, 422, 234.23, 'Third galaxy', false, false);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel', 24, 422, 234.23, 'Fourth galaxy', false, false);
INSERT INTO public.galaxy VALUES (5, 'Centaurus', 24, 422, 234.23, 'Fifth galaxy', false, false);
INSERT INTO public.galaxy VALUES (6, 'Circinus', 24, 422, 234.23, 'Sixth galaxy', false, false);
INSERT INTO public.galaxy VALUES (7, 'Comet', 24, 422, 234.23, 'Seventh galaxy', false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon 1', 234, 232, 234.50, '', false, false, 2);
INSERT INTO public.moon VALUES (22, 'Moon 2', 234, 232, 234.50, '', false, false, 3);
INSERT INTO public.moon VALUES (23, 'Moon 3', 234, 232, 234.50, '', false, false, 2);
INSERT INTO public.moon VALUES (24, 'Moon 4', 234, 232, 234.50, '', false, false, 2);
INSERT INTO public.moon VALUES (25, 'Moon 5', 234, 232, 234.50, '', false, false, 5);
INSERT INTO public.moon VALUES (26, 'Moon 6', 234, 232, 234.50, '', false, false, 3);
INSERT INTO public.moon VALUES (27, 'Moon 7', 234, 232, 234.50, '', false, false, 2);
INSERT INTO public.moon VALUES (28, 'Moon 8', 234, 232, 234.50, '', false, false, 3);
INSERT INTO public.moon VALUES (29, 'Moon 9', 234, 232, 234.50, '', false, false, 5);
INSERT INTO public.moon VALUES (30, 'Moon 10', 234, 232, 234.50, '', false, false, 2);
INSERT INTO public.moon VALUES (31, 'Moon 11', 234, 232, 234.50, '', false, false, 2);
INSERT INTO public.moon VALUES (32, 'Moon 12', 234, 232, 234.50, '', false, false, 6);
INSERT INTO public.moon VALUES (33, 'Moon 13', 234, 232, 234.50, '', false, false, 6);
INSERT INTO public.moon VALUES (34, 'Moon 14', 234, 232, 234.50, '', false, false, 6);
INSERT INTO public.moon VALUES (35, 'Moon 15', 234, 232, 234.50, '', false, false, 6);
INSERT INTO public.moon VALUES (36, 'Moon 16', 234, 232, 234.50, '', false, false, 3);
INSERT INTO public.moon VALUES (37, 'Moon 17', 234, 232, 234.50, '', false, false, 3);
INSERT INTO public.moon VALUES (38, 'Moon 18', 234, 232, 234.50, '', false, false, 3);
INSERT INTO public.moon VALUES (39, 'Moon 19', 234, 232, 234.50, '', false, false, 2);
INSERT INTO public.moon VALUES (40, 'Moon 20', 234, 232, 234.50, '', false, false, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Mercury', 234, 232, 234.50, 'Nearest to the sun', true, true, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 234, 232, 234.50, '2nd Nearest to the sun', true, true, 2);
INSERT INTO public.planet VALUES (4, 'Earth', 234, 232, 234.50, '3rd Nearest to the sun', true, true, 3);
INSERT INTO public.planet VALUES (5, 'Mars', 234, 232, 234.50, '4th Nearest to the sun', true, true, 4);
INSERT INTO public.planet VALUES (6, 'Jupyter', 234, 232, 234.50, '5th Nearest to the sun', true, true, 5);
INSERT INTO public.planet VALUES (7, 'Saturn', 234, 232, 234.50, '6th Nearest to the sun', true, true, 6);
INSERT INTO public.planet VALUES (8, 'Uranus', 234, 232, 234.50, '7th Nearest to the sun', true, true, 6);
INSERT INTO public.planet VALUES (9, 'Neptune', 234, 232, 234.50, '8th Nearest to the sun', true, true, 4);
INSERT INTO public.planet VALUES (10, 'Pluto', 234, 232, 234.50, '9th Nearest to the sun', true, true, 6);
INSERT INTO public.planet VALUES (11, 'Pluto Plasma', 234, 232, 234.50, '10th Nearest to the sun', true, true, 6);
INSERT INTO public.planet VALUES (13, 'Black Hole', 234, 232, 234.50, '11th Nearest to the sun', false, false, 1);
INSERT INTO public.planet VALUES (14, 'White Hole', 234, 232, 234.50, '12th Nearest to the sun', false, false, 5);


--
-- Data for Name: planet_stars; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_stars VALUES (2, 1, 'dummy', 1, 'id00');
INSERT INTO public.planet_stars VALUES (2, 3, 'dummy', 2, 'id01');
INSERT INTO public.planet_stars VALUES (2, 2, 'dummy', 3, 'id02');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Star-1', 234, 232, 234.50, 'First Star', true, true, 2);
INSERT INTO public.star VALUES (2, 'Star-2', 234, 232, 234.50, 'Second Star Now', true, true, 2);
INSERT INTO public.star VALUES (3, 'Star-3', 234, 232, 234.50, 'Third Star Now', true, true, 3);
INSERT INTO public.star VALUES (4, 'Star-4', 234, 232, 234.50, 'Fourth Star Now', true, true, 3);
INSERT INTO public.star VALUES (5, 'Star-5', 234, 232, 234.50, 'Fifth Star Now', true, true, 4);
INSERT INTO public.star VALUES (6, 'Star-6', 234, 232, 234.50, 'Sixth Star Now', true, true, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: planet_stars_planet_stars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_stars_planet_stars_id_seq', 3, true);


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
-- Name: planet_stars planet_stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_stars
    ADD CONSTRAINT planet_stars_pkey PRIMARY KEY (planet_stars_id);


--
-- Name: planet_stars planet_stars_record_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_stars
    ADD CONSTRAINT planet_stars_record_id_key UNIQUE (record_id);


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
-- Name: planet_stars planet_stars_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_stars
    ADD CONSTRAINT planet_stars_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_stars planet_stars_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_stars
    ADD CONSTRAINT planet_stars_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

