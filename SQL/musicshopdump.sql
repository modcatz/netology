--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Homebrew)
-- Dumped by pg_dump version 14.9 (Homebrew)

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
-- Name: album_artist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.album_artist (
    id integer NOT NULL,
    album_id integer NOT NULL,
    artist_id integer NOT NULL
);


ALTER TABLE public.album_artist OWNER TO postgres;

--
-- Name: album_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.album_artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.album_artist_id_seq OWNER TO postgres;

--
-- Name: album_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.album_artist_id_seq OWNED BY public.album_artist.id;


--
-- Name: albums; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.albums (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    year smallint,
    CONSTRAINT albums_year_check CHECK ((year > 0))
);


ALTER TABLE public.albums OWNER TO postgres;

--
-- Name: albums_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.albums_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.albums_id_seq OWNER TO postgres;

--
-- Name: albums_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.albums_id_seq OWNED BY public.albums.id;


--
-- Name: artists; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artists (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.artists OWNER TO postgres;

--
-- Name: artists_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.artists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.artists_id_seq OWNER TO postgres;

--
-- Name: artists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.artists_id_seq OWNED BY public.artists.id;


--
-- Name: compilation_track; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compilation_track (
    id integer NOT NULL,
    compilation_id integer NOT NULL,
    track_id integer NOT NULL
);


ALTER TABLE public.compilation_track OWNER TO postgres;

--
-- Name: compilation_track_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compilation_track_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compilation_track_id_seq OWNER TO postgres;

--
-- Name: compilation_track_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compilation_track_id_seq OWNED BY public.compilation_track.id;


--
-- Name: compilations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compilations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    year smallint,
    CONSTRAINT compilations_year_check CHECK ((year > 0))
);


ALTER TABLE public.compilations OWNER TO postgres;

--
-- Name: compilations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compilations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.compilations_id_seq OWNER TO postgres;

--
-- Name: compilations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compilations_id_seq OWNED BY public.compilations.id;


--
-- Name: genre_artist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre_artist (
    id integer NOT NULL,
    artist_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE public.genre_artist OWNER TO postgres;

--
-- Name: genre_artist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genre_artist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genre_artist_id_seq OWNER TO postgres;

--
-- Name: genre_artist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genre_artist_id_seq OWNED BY public.genre_artist.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_id_seq OWNER TO postgres;

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: tracks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tracks (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    duration integer,
    album_id integer NOT NULL
);


ALTER TABLE public.tracks OWNER TO postgres;

--
-- Name: tracks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tracks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tracks_id_seq OWNER TO postgres;

--
-- Name: tracks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tracks_id_seq OWNED BY public.tracks.id;


--
-- Name: album_artist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album_artist ALTER COLUMN id SET DEFAULT nextval('public.album_artist_id_seq'::regclass);


--
-- Name: albums id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums ALTER COLUMN id SET DEFAULT nextval('public.albums_id_seq'::regclass);


--
-- Name: artists id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists ALTER COLUMN id SET DEFAULT nextval('public.artists_id_seq'::regclass);


--
-- Name: compilation_track id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compilation_track ALTER COLUMN id SET DEFAULT nextval('public.compilation_track_id_seq'::regclass);


--
-- Name: compilations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compilations ALTER COLUMN id SET DEFAULT nextval('public.compilations_id_seq'::regclass);


--
-- Name: genre_artist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre_artist ALTER COLUMN id SET DEFAULT nextval('public.genre_artist_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: tracks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks ALTER COLUMN id SET DEFAULT nextval('public.tracks_id_seq'::regclass);


--
-- Data for Name: album_artist; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.album_artist VALUES (1, 1, 1);
INSERT INTO public.album_artist VALUES (2, 2, 1);
INSERT INTO public.album_artist VALUES (3, 3, 2);
INSERT INTO public.album_artist VALUES (4, 4, 3);
INSERT INTO public.album_artist VALUES (5, 5, 4);
INSERT INTO public.album_artist VALUES (6, 6, 4);
INSERT INTO public.album_artist VALUES (7, 6, 5);
INSERT INTO public.album_artist VALUES (8, 7, 5);


--
-- Data for Name: albums; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.albums VALUES (1, 'reputation', 2017);
INSERT INTO public.albums VALUES (2, 'lover', 2019);
INSERT INTO public.albums VALUES (3, 'Nevermind', 1991);
INSERT INTO public.albums VALUES (4, 'St. Anger', 2003);
INSERT INTO public.albums VALUES (5, 'Jolene', 1974);
INSERT INTO public.albums VALUES (6, 'Younger Now', 2017);
INSERT INTO public.albums VALUES (7, 'Plastic Hearts', 2020);


--
-- Data for Name: artists; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.artists VALUES (1, 'Taylor Swift');
INSERT INTO public.artists VALUES (2, 'Nirvana');
INSERT INTO public.artists VALUES (3, 'Metallica');
INSERT INTO public.artists VALUES (4, 'Dolly Parton');
INSERT INTO public.artists VALUES (5, 'Miley Cyrus');


--
-- Data for Name: compilation_track; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.compilation_track VALUES (1, 1, 3);
INSERT INTO public.compilation_track VALUES (2, 1, 5);
INSERT INTO public.compilation_track VALUES (3, 2, 6);
INSERT INTO public.compilation_track VALUES (4, 2, 9);
INSERT INTO public.compilation_track VALUES (5, 3, 10);
INSERT INTO public.compilation_track VALUES (6, 3, 11);
INSERT INTO public.compilation_track VALUES (7, 4, 2);
INSERT INTO public.compilation_track VALUES (8, 4, 11);
INSERT INTO public.compilation_track VALUES (9, 4, 7);
INSERT INTO public.compilation_track VALUES (10, 4, 4);


--
-- Data for Name: compilations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.compilations VALUES (1, 'Taylor The Best', 2020);
INSERT INTO public.compilations VALUES (2, 'You Rock! ', 2019);
INSERT INTO public.compilations VALUES (3, 'Country Mamas', 2022);
INSERT INTO public.compilations VALUES (4, 'Enjoy the moment', 2023);


--
-- Data for Name: genre_artist; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.genre_artist VALUES (1, 1, 1);
INSERT INTO public.genre_artist VALUES (2, 1, 3);
INSERT INTO public.genre_artist VALUES (3, 2, 2);
INSERT INTO public.genre_artist VALUES (4, 3, 2);
INSERT INTO public.genre_artist VALUES (5, 4, 3);
INSERT INTO public.genre_artist VALUES (6, 5, 1);
INSERT INTO public.genre_artist VALUES (7, 5, 3);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.genres VALUES (1, 'pop');
INSERT INTO public.genres VALUES (2, 'rock');
INSERT INTO public.genres VALUES (3, 'country');


--
-- Data for Name: tracks; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tracks VALUES (2, 'Afterglow', 223, 2);
INSERT INTO public.tracks VALUES (3, 'The Man', 190, 2);
INSERT INTO public.tracks VALUES (4, 'King Of My Heart', 214, 1);
INSERT INTO public.tracks VALUES (5, 'Delicate', 232, 1);
INSERT INTO public.tracks VALUES (6, 'Come As You Are', 209, 3);
INSERT INTO public.tracks VALUES (7, 'Smells Like Teen Spirit', 401, 3);
INSERT INTO public.tracks VALUES (8, 'My World', 446, 4);
INSERT INTO public.tracks VALUES (9, 'Purify', 414, 4);
INSERT INTO public.tracks VALUES (10, 'Jolene', 162, 5);
INSERT INTO public.tracks VALUES (11, 'Malibu', 238, 6);
INSERT INTO public.tracks VALUES (12, 'Prisoner', 169, 7);
INSERT INTO public.tracks VALUES (13, 'Midnight Sky', 223, 7);


--
-- Name: album_artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.album_artist_id_seq', 8, true);


--
-- Name: albums_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.albums_id_seq', 7, true);


--
-- Name: artists_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.artists_id_seq', 5, true);


--
-- Name: compilation_track_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compilation_track_id_seq', 10, true);


--
-- Name: compilations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compilations_id_seq', 4, true);


--
-- Name: genre_artist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_artist_id_seq', 7, true);


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_id_seq', 3, true);


--
-- Name: tracks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tracks_id_seq', 13, true);


--
-- Name: album_artist album_artist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album_artist
    ADD CONSTRAINT album_artist_pkey PRIMARY KEY (id);


--
-- Name: albums albums_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_name_key UNIQUE (name);


--
-- Name: albums albums_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);


--
-- Name: artists artists_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_name_key UNIQUE (name);


--
-- Name: artists artists_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artists
    ADD CONSTRAINT artists_pkey PRIMARY KEY (id);


--
-- Name: compilation_track compilation_track_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compilation_track
    ADD CONSTRAINT compilation_track_pkey PRIMARY KEY (id);


--
-- Name: compilations compilations_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compilations
    ADD CONSTRAINT compilations_name_key UNIQUE (name);


--
-- Name: compilations compilations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compilations
    ADD CONSTRAINT compilations_pkey PRIMARY KEY (id);


--
-- Name: genre_artist genre_artist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre_artist
    ADD CONSTRAINT genre_artist_pkey PRIMARY KEY (id);


--
-- Name: genres genres_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_name_key UNIQUE (name);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: tracks tracks_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_name_key UNIQUE (name);


--
-- Name: tracks tracks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT tracks_pkey PRIMARY KEY (id);


--
-- Name: tracks fk_album; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tracks
    ADD CONSTRAINT fk_album FOREIGN KEY (album_id) REFERENCES public.albums(id);


--
-- Name: album_artist fk_album; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album_artist
    ADD CONSTRAINT fk_album FOREIGN KEY (album_id) REFERENCES public.albums(id) ON DELETE CASCADE;


--
-- Name: album_artist fk_artist; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album_artist
    ADD CONSTRAINT fk_artist FOREIGN KEY (artist_id) REFERENCES public.artists(id) ON DELETE CASCADE;


--
-- Name: genre_artist fk_artist; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre_artist
    ADD CONSTRAINT fk_artist FOREIGN KEY (artist_id) REFERENCES public.artists(id) ON DELETE CASCADE;


--
-- Name: compilation_track fk_compilation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compilation_track
    ADD CONSTRAINT fk_compilation FOREIGN KEY (compilation_id) REFERENCES public.compilations(id) ON DELETE CASCADE;


--
-- Name: genre_artist fk_genre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre_artist
    ADD CONSTRAINT fk_genre FOREIGN KEY (genre_id) REFERENCES public.genres(id) ON DELETE CASCADE;


--
-- Name: compilation_track fk_track; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compilation_track
    ADD CONSTRAINT fk_track FOREIGN KEY (track_id) REFERENCES public.tracks(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

