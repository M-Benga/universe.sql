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
    distance_from_earth integer,
    galaxy_type character varying NOT NULL,
    is_active boolean,
    name character varying
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
    name character varying NOT NULL,
    size integer,
    planet_id integer,
    does_it_shine boolean
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
-- Name: moplastar; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moplastar (
    name character varying NOT NULL,
    planet_id integer,
    moon_id integer,
    moplastar_id integer NOT NULL,
    star_id integer
);


ALTER TABLE public.moplastar OWNER TO freecodecamp;

--
-- Name: moon_planet_star_moon_planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_star_moon_planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_star_moon_planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_star_moon_planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_star_moon_planet_star_id_seq OWNED BY public.moplastar.moplastar_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    has_life boolean,
    number_of_moons integer,
    planet_type character varying,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    distance_from_earth integer NOT NULL,
    has_planets boolean,
    age_in_millions_of_years numeric,
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
-- Name: moplastar moplastar_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moplastar ALTER COLUMN moplastar_id SET DEFAULT nextval('public.moon_planet_star_moon_planet_star_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 25000000, 'Spiral', true, 'Andromeda Galaxy');
INSERT INTO public.galaxy VALUES (2, 120000000, 'Elliptical', false, 'Centaurus A');
INSERT INTO public.galaxy VALUES (3, 110000000, 'Irregular', true, 'Large Magellanic Cloud');
INSERT INTO public.galaxy VALUES (4, 165000000, 'Spiral', true, 'Messier 81');
INSERT INTO public.galaxy VALUES (5, 55000000, 'Irregular', false, 'Small Magellanic Cloud');
INSERT INTO public.galaxy VALUES (6, 2000000, 'Dwarf Elliptical', false, 'Canis Major Dwarf Galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Proxima Centauri b d', 1000, 1, false);
INSERT INTO public.moon VALUES (2, 'Achernar b c', 5000, 2, false);
INSERT INTO public.moon VALUES (3, 'Aldebaran b e', 8000, 3, false);
INSERT INTO public.moon VALUES (4, 'Polaris b x', 3000, 4, false);
INSERT INTO public.moon VALUES (5, 'Canopus A b f', 7000, 5, false);
INSERT INTO public.moon VALUES (6, 'Rigel Exb v', 9000, 6, true);
INSERT INTO public.moon VALUES (7, 'Skadaro c i', 2000, 7, true);
INSERT INTO public.moon VALUES (8, 'Gamma Doradus b g', 4000, 8, true);
INSERT INTO public.moon VALUES (9, 'Gamma Doradus c h', 6000, 8, false);
INSERT INTO public.moon VALUES (10, 'Sirius B b m', 1500, 9, true);
INSERT INTO public.moon VALUES (11, 'DZ Canis Majoris b y', 2500, 10, true);
INSERT INTO public.moon VALUES (12, 'Moon 1', NULL, 1, true);
INSERT INTO public.moon VALUES (13, 'Moon 2', 4500, 5, false);
INSERT INTO public.moon VALUES (14, 'Moon 3', 1200, 4, false);
INSERT INTO public.moon VALUES (15, 'Moon 4', NULL, 6, false);
INSERT INTO public.moon VALUES (16, 'Moon 5', 3200, 2, true);
INSERT INTO public.moon VALUES (17, 'Moon 6', NULL, 9, false);
INSERT INTO public.moon VALUES (18, 'Moon 7', 7800, 3, true);
INSERT INTO public.moon VALUES (19, 'Moon 8', 2100, 7, false);
INSERT INTO public.moon VALUES (20, 'Moon 9', 5600, 10, false);
INSERT INTO public.moon VALUES (21, 'Moon 10', NULL, 8, false);


--
-- Data for Name: moplastar; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moplastar VALUES ('Alpha', 1, 1, 1, 1);
INSERT INTO public.moplastar VALUES ('Beta', 2, 2, 2, 2);
INSERT INTO public.moplastar VALUES ('Gamma', 3, 3, 3, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima Centauri b', 'Rocky exoplanet, potentially habitable zone', false, 0, 'Super-Earth', 1);
INSERT INTO public.planet VALUES (2, 'Achernar b', 'Hot gas giant close to its star', false, NULL, 'Gas Giant', 2);
INSERT INTO public.planet VALUES (3, 'Aldebaran b', 'Gas giant candidate with potential dust rings', false, NULL, 'Gas Giant', 3);
INSERT INTO public.planet VALUES (4, 'Polaris b', 'Controversial candidate for a giant planet, needs confirmation', false, NULL, 'Gas Giant', 4);
INSERT INTO public.planet VALUES (5, 'Canopus A b', 'Likely a hot gas giant', false, NULL, 'Gas Giant', 5);
INSERT INTO public.planet VALUES (6, 'Rigel Exb', 'Large gas giant in a binary star system', false, NULL, 'Gas Giant', 6);
INSERT INTO public.planet VALUES (7, 'Skadaro b', 'Possible rocky planet candidate, needs more data', false, NULL, 'Terrestrial', 7);
INSERT INTO public.planet VALUES (8, 'Skadaro c', 'Likely a hot super-Earth close to its star', false, NULL, 'Super-Earth', 7);
INSERT INTO public.planet VALUES (9, 'Gamma Doradus b', 'Confirmed exoplanet with a long orbit', false, NULL, 'Gas Giant', 8);
INSERT INTO public.planet VALUES (10, 'Gamma Doradus c', 'Another confirmed exoplanet in the system', false, NULL, 'Gas Giant', 8);
INSERT INTO public.planet VALUES (11, 'Sirius B b', 'Small, dense white dwarf companion to Sirius', false, 0, 'White Dwarf', 9);
INSERT INTO public.planet VALUES (12, 'DZ Canis Majoris b', 'Likely a rocky planet with a short orbit', false, NULL, 'Terrestrial', 10);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 4, true, 4800, 2);
INSERT INTO public.star VALUES (2, 'Achernar', 144, false, 150, 2);
INSERT INTO public.star VALUES (3, 'Aldebaran', 65, false, 6.5, 1);
INSERT INTO public.star VALUES (4, 'Polaris', 434, true, 4.6, 1);
INSERT INTO public.star VALUES (5, 'Canopus', 319, false, 120, 3);
INSERT INTO public.star VALUES (6, 'Rigel', 860, false, 10, 4);
INSERT INTO public.star VALUES (7, 'Skadaro', 170000, false, 67, 5);
INSERT INTO public.star VALUES (8, 'Gamma Doradus', 170000, true, 98, 5);
INSERT INTO public.star VALUES (9, 'Sirius B', 9, false, 200, 6);
INSERT INTO public.star VALUES (10, 'DZ Canis Majoris', 11, true, 43, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: moon_planet_star_moon_planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_star_moon_planet_star_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


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
-- Name: moplastar galaxy_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moplastar
    ADD CONSTRAINT galaxy_star_name_key UNIQUE (name);


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
-- Name: moplastar moon_planet_star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moplastar
    ADD CONSTRAINT moon_planet_star_pkey PRIMARY KEY (moplastar_id);


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
-- Name: moplastar galaxy_star_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moplastar
    ADD CONSTRAINT galaxy_star_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moplastar moon_planet_star_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moplastar
    ADD CONSTRAINT moon_planet_star_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moplastar moon_planet_star_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moplastar
    ADD CONSTRAINT moon_planet_star_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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






