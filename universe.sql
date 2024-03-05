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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    description text,
    visible_from_earth boolean
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    shape character varying(40),
    diameter_in_light_years numeric,
    central_black_hole boolean
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
    name character varying(255) NOT NULL,
    planet_id integer,
    distance_from_planet character varying(255),
    radius_in_miles integer
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    radius_in_miles integer,
    description text,
    has_water boolean
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
    name character varying(255) NOT NULL,
    galaxy_id integer,
    lifecycle_stage text NOT NULL,
    distance_from_earth character varying(255)
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Centaurus', 1, 'One of the largest constellations in the sky. It is home to several open clusters and a bright planetary nebula.', true);
INSERT INTO public.constellation VALUES (2, 'Leo', 2, 'Leo is a constellation representing the lion in Greek mythology. It is one of the zodiac constellations and contains several bright stars.', true);
INSERT INTO public.constellation VALUES (3, 'Canis Major', 3, 'Canis Major is a constellation representing the greater dog in Greek mythology.', true);
INSERT INTO public.constellation VALUES (4, 'Ursa Minor', 4, 'Known as the Little Bear, it is the constellation that contains the North Star, Polaris.', true);
INSERT INTO public.constellation VALUES (5, 'Lyra', 5, 'Lyra is a small constellation named after the lyre, a musical instrument from Greek mythology.', true);
INSERT INTO public.constellation VALUES (6, 'Scorpius', 6, 'Scorpius is a constellation representing the scorpion in Greek mythology. It is one of the zodiac constellations.', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 'Barred Spiral', 100000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy M31', 'Spiral', 220000, true);
INSERT INTO public.galaxy VALUES (3, 'Centaurus A NGC 5128', 'Elliptical', 60000, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy M104', 'Lenticular', 50000, true);
INSERT INTO public.galaxy VALUES (5, 'M87 Galaxy', 'Giant Elliptical', 120000, true);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy M33', 'Spiral', 60000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Titan', 4, '759,000 miles', 1600);
INSERT INTO public.moon VALUES (2, 'Ganymede', 3, '665,000 miles', 1635);
INSERT INTO public.moon VALUES (3, 'Callisto', 3, '1,168,000 miles', 1491);
INSERT INTO public.moon VALUES (5, 'Europa', 3, '416,000 miles', 970);
INSERT INTO public.moon VALUES (6, 'Enceladus', 4, '147,909 miles', 157);
INSERT INTO public.moon VALUES (7, 'Triton', 6, '220,000 miles', 1353);
INSERT INTO public.moon VALUES (8, 'Charon', 10, '12,200 miles', 606);
INSERT INTO public.moon VALUES (9, 'Phobos', 8, '3,700 miles', 7);
INSERT INTO public.moon VALUES (10, 'Deimos', 8, '14,600 miles', 6);
INSERT INTO public.moon VALUES (4, 'Io', 3, '262,000 miles', 1131);
INSERT INTO public.moon VALUES (11, 'Miranda', 5, '81,000 miles', 198);
INSERT INTO public.moon VALUES (12, 'Iapetus', 4, '2,212,000 miles', 746);
INSERT INTO public.moon VALUES (13, 'Luna', 1, '238,900 miles', 1079);
INSERT INTO public.moon VALUES (14, 'Phoebe', 4, '8,079,000 miles', 106);
INSERT INTO public.moon VALUES (15, 'Hyperion', 4, '920,000 miles', 168);
INSERT INTO public.moon VALUES (16, 'Mimas', 4, '115,300 miles', 198);
INSERT INTO public.moon VALUES (17, 'Rhea', 4, '327,000 miles', 764);
INSERT INTO public.moon VALUES (18, 'Oberon', 5, '362,000 miles', 761);
INSERT INTO public.moon VALUES (19, 'Umbriel', 5, '266,000 miles', 584);
INSERT INTO public.moon VALUES (20, 'Dione', 4, '234,000 miles', 560);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 7, 3959, 'Earth is our home planet and the only known planet to support life. It has a diverse range of ecosystems, an atmosphere that sustains life, and a variety of landforms and bodies of water.', true);
INSERT INTO public.planet VALUES (2, 'Mercury', 7, 1516, 'Mercury is the closest planet to the Sun and is a rocky planet with a heavily cratered surface. It has a thin atmosphere and extreme temperature variations.', true);
INSERT INTO public.planet VALUES (3, 'Jupiter', 7, 43441, 'Jupiter is the largest planet in our solar system and is a gas giant composed mostly of hydrogen and helium. It has a strong magnetic field and a system of rings.', false);
INSERT INTO public.planet VALUES (4, 'Saturn', 7, 36184, 'Saturn is another gas giant known for its prominent ring system. It is composed mostly of hydrogen and helium and has a complex atmosphere with distinctive cloud bands.', false);
INSERT INTO public.planet VALUES (5, 'Uranus', 7, 15759, 'Uranus is an ice giant with a predominantly hydrogen and helium atmosphere. It is unique among the planets in our solar system as it rotates on its side.', true);
INSERT INTO public.planet VALUES (6, 'Neptune', 7, 15299, 'Neptune is the farthest known planet from the Sun and is an ice giant similar in composition to Uranus. It has a dynamic atmosphere with high-speed winds and a distinctive blue color.', true);
INSERT INTO public.planet VALUES (7, 'Venus', 7, 3760, 'Venus often referred to as Earths sister planet. It has a thick atmosphere composed mainly of carbon dioxide, causing a runaway greenhouse effect and extreme surface temperatures.', false);
INSERT INTO public.planet VALUES (8, 'Mars', 7, 2106, 'Mars is a rocky planet often referred to as the Red Planet due to its reddish appearance. It has a thin atmosphere and a surface marked by impact craters, volcanoes, and valleys.', true);
INSERT INTO public.planet VALUES (9, 'Ceres', 7, 296, 'Ceres is the largest object in the asteroid belt between Mars and Jupiter. It is considered a dwarf planet and is composed of rock and ice.', true);
INSERT INTO public.planet VALUES (10, 'Pluto', 7, 736, 'Pluto is a dwarf planet located in the Kuiper Belt, a region beyond Neptune. It has a varied terrain and a thin atmosphere composed mainly of nitrogen.', true);
INSERT INTO public.planet VALUES (11, 'Eris', 7, 722, 'Eris is another dwarf planet located in the Kuiper Belt. It is similar in size to Pluto and has a highly elliptical orbit around the Sun.', false);
INSERT INTO public.planet VALUES (12, 'Haumea', 7, 621, 'Haumea is a dwarf planet located in the Kuiper Belt. It has an elongated shape and rotates rapidly, causing it to appear flattened.', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Proxima Centauri', 1, 'Main Sequence', '4.24 light years');
INSERT INTO public.star VALUES (2, 'Wolf 359', 1, 'Main Sequence', '7.78 light years');
INSERT INTO public.star VALUES (3, 'Sirius A', 1, 'Main Sequence', '8.6 light years');
INSERT INTO public.star VALUES (4, 'Polaris', 1, 'Main Sequence', '433 light years');
INSERT INTO public.star VALUES (5, 'Vega', 1, 'Main Sequence', '25 light years');
INSERT INTO public.star VALUES (6, 'Antares', 1, 'Main Sequence', '550 light years');
INSERT INTO public.star VALUES (7, 'Sun', 1, 'Main Sequence', '93 million miles');


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: constellation unique_const_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT unique_const_name UNIQUE (name);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: constellation fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

