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
-- Data for Name: compilations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.compilations VALUES (1, 'Taylor The Best', 2020);
INSERT INTO public.compilations VALUES (2, 'You Rock! ', 2019);
INSERT INTO public.compilations VALUES (3, 'Country Mamas', 2022);
INSERT INTO public.compilations VALUES (4, 'Enjoy the moment', 2023);


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
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.genres VALUES (1, 'pop');
INSERT INTO public.genres VALUES (2, 'rock');
INSERT INTO public.genres VALUES (3, 'country');


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
-- PostgreSQL database dump complete
--

