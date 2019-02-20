--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: unsigned_int; Type: DOMAIN; Schema: public; Owner: johnnyt
--

CREATE DOMAIN public.unsigned_int AS integer
	CONSTRAINT unsigned_int_check CHECK ((VALUE > 0));


ALTER DOMAIN public.unsigned_int OWNER TO johnnyt;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alexandra_burdujanu; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.alexandra_burdujanu (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.alexandra_burdujanu OWNER TO johnnyt;

--
-- Name: alexandra_burdujanu_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.alexandra_burdujanu_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alexandra_burdujanu_sequence OWNER TO johnnyt;

--
-- Name: alexandru_apostu; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.alexandru_apostu (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.alexandru_apostu OWNER TO johnnyt;

--
-- Name: alexandru_apostu_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.alexandru_apostu_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alexandru_apostu_sequence OWNER TO johnnyt;

--
-- Name: alexandru_cruceanu; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.alexandru_cruceanu (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.alexandru_cruceanu OWNER TO johnnyt;

--
-- Name: alexandru_cruceanu_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.alexandru_cruceanu_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alexandru_cruceanu_sequence OWNER TO johnnyt;

--
-- Name: alexandru_niamtu; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.alexandru_niamtu (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.alexandru_niamtu OWNER TO johnnyt;

--
-- Name: alexandru_niamtu_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.alexandru_niamtu_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alexandru_niamtu_sequence OWNER TO johnnyt;

--
-- Name: alin_manole; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.alin_manole (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.alin_manole OWNER TO johnnyt;

--
-- Name: alin_manole_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.alin_manole_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alin_manole_sequence OWNER TO johnnyt;

--
-- Name: ana_cirlan; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.ana_cirlan (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.ana_cirlan OWNER TO johnnyt;

--
-- Name: ana_cirlan_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.ana_cirlan_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ana_cirlan_sequence OWNER TO johnnyt;

--
-- Name: andreea_maxim; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.andreea_maxim (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.andreea_maxim OWNER TO johnnyt;

--
-- Name: andreea_maxim_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.andreea_maxim_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.andreea_maxim_sequence OWNER TO johnnyt;

--
-- Name: andreea_raduc; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.andreea_raduc (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.andreea_raduc OWNER TO johnnyt;

--
-- Name: andreea_raduc_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.andreea_raduc_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.andreea_raduc_sequence OWNER TO johnnyt;

--
-- Name: andrei_popa; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.andrei_popa (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.andrei_popa OWNER TO johnnyt;

--
-- Name: andrei_popa_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.andrei_popa_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.andrei_popa_sequence OWNER TO johnnyt;

--
-- Name: andrei_tenie; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.andrei_tenie (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.andrei_tenie OWNER TO johnnyt;

--
-- Name: andrei_tenie_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.andrei_tenie_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.andrei_tenie_sequence OWNER TO johnnyt;

--
-- Name: andrei_vicol; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.andrei_vicol (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.andrei_vicol OWNER TO johnnyt;

--
-- Name: andrei_vicol_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.andrei_vicol_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.andrei_vicol_sequence OWNER TO johnnyt;

--
-- Name: antonio_ganea; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.antonio_ganea (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.antonio_ganea OWNER TO johnnyt;

--
-- Name: antonio_ganea_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.antonio_ganea_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.antonio_ganea_sequence OWNER TO johnnyt;

--
-- Name: cheltuieli; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.cheltuieli (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.cheltuieli OWNER TO johnnyt;

--
-- Name: cheltuieli_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.cheltuieli_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cheltuieli_sequence OWNER TO johnnyt;

--
-- Name: cosmin_costescu; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.cosmin_costescu (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.cosmin_costescu OWNER TO johnnyt;

--
-- Name: cosmin_costescu_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.cosmin_costescu_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cosmin_costescu_sequence OWNER TO johnnyt;

--
-- Name: denis_popa; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.denis_popa (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.denis_popa OWNER TO johnnyt;

--
-- Name: denis_popa_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.denis_popa_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.denis_popa_sequence OWNER TO johnnyt;

--
-- Name: diana_caminoc; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.diana_caminoc (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.diana_caminoc OWNER TO johnnyt;

--
-- Name: diana_caminoc_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.diana_caminoc_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.diana_caminoc_sequence OWNER TO johnnyt;

--
-- Name: dragos_bahrim; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.dragos_bahrim (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.dragos_bahrim OWNER TO johnnyt;

--
-- Name: dragos_bahrim_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.dragos_bahrim_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dragos_bahrim_sequence OWNER TO johnnyt;

--
-- Name: george_chiru; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.george_chiru (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.george_chiru OWNER TO johnnyt;

--
-- Name: george_chiru_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.george_chiru_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.george_chiru_sequence OWNER TO johnnyt;

--
-- Name: george_tabacaru; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.george_tabacaru (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.george_tabacaru OWNER TO johnnyt;

--
-- Name: george_tabacaru_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.george_tabacaru_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.george_tabacaru_sequence OWNER TO johnnyt;

--
-- Name: gregorio_manea; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.gregorio_manea (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.gregorio_manea OWNER TO johnnyt;

--
-- Name: gregorio_manea_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.gregorio_manea_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gregorio_manea_sequence OWNER TO johnnyt;

--
-- Name: iuliana_prodea; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.iuliana_prodea (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.iuliana_prodea OWNER TO johnnyt;

--
-- Name: iuliana_prodea_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.iuliana_prodea_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.iuliana_prodea_sequence OWNER TO johnnyt;

--
-- Name: lista; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.lista (
    id integer NOT NULL,
    nume character varying(255),
    suma public.unsigned_int,
    ultima_contributie character varying(255)
);


ALTER TABLE public.lista OWNER TO johnnyt;

--
-- Name: matei_cibotaru; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.matei_cibotaru (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.matei_cibotaru OWNER TO johnnyt;

--
-- Name: matei_cibotaru_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.matei_cibotaru_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.matei_cibotaru_sequence OWNER TO johnnyt;

--
-- Name: miriam_ditu; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.miriam_ditu (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.miriam_ditu OWNER TO johnnyt;

--
-- Name: miriam_ditu_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.miriam_ditu_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.miriam_ditu_sequence OWNER TO johnnyt;

--
-- Name: monica_chedica; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.monica_chedica (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.monica_chedica OWNER TO johnnyt;

--
-- Name: monica_chedica_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.monica_chedica_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.monica_chedica_sequence OWNER TO johnnyt;

--
-- Name: radu_tache; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.radu_tache (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.radu_tache OWNER TO johnnyt;

--
-- Name: radu_tache_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.radu_tache_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.radu_tache_sequence OWNER TO johnnyt;

--
-- Name: rares_cozma; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.rares_cozma (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.rares_cozma OWNER TO johnnyt;

--
-- Name: rares_cozma_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.rares_cozma_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rares_cozma_sequence OWNER TO johnnyt;

--
-- Name: razvan_vilciu; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.razvan_vilciu (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.razvan_vilciu OWNER TO johnnyt;

--
-- Name: razvan_vilciu_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.razvan_vilciu_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.razvan_vilciu_sequence OWNER TO johnnyt;

--
-- Name: stefan_spiridon; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.stefan_spiridon (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.stefan_spiridon OWNER TO johnnyt;

--
-- Name: stefan_spiridon_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.stefan_spiridon_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stefan_spiridon_sequence OWNER TO johnnyt;

--
-- Name: theodora_toderascu; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.theodora_toderascu (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.theodora_toderascu OWNER TO johnnyt;

--
-- Name: theodora_toderascu_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.theodora_toderascu_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.theodora_toderascu_sequence OWNER TO johnnyt;

--
-- Name: valentin_petrea; Type: TABLE; Schema: public; Owner: johnnyt
--

CREATE TABLE public.valentin_petrea (
    id integer NOT NULL,
    suma public.unsigned_int,
    data character varying(255)
);


ALTER TABLE public.valentin_petrea OWNER TO johnnyt;

--
-- Name: valentin_petrea_sequence; Type: SEQUENCE; Schema: public; Owner: johnnyt
--

CREATE SEQUENCE public.valentin_petrea_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.valentin_petrea_sequence OWNER TO johnnyt;

--
-- Data for Name: alexandra_burdujanu; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.alexandra_burdujanu (id, suma, data) FROM stdin;
\.


--
-- Data for Name: alexandru_apostu; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.alexandru_apostu (id, suma, data) FROM stdin;
\.


--
-- Data for Name: alexandru_cruceanu; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.alexandru_cruceanu (id, suma, data) FROM stdin;
1	10	2019-01-29
\.


--
-- Data for Name: alexandru_niamtu; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.alexandru_niamtu (id, suma, data) FROM stdin;
\.


--
-- Data for Name: alin_manole; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.alin_manole (id, suma, data) FROM stdin;
1	10	2018-09-17
\.


--
-- Data for Name: ana_cirlan; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.ana_cirlan (id, suma, data) FROM stdin;
\.


--
-- Data for Name: andreea_maxim; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.andreea_maxim (id, suma, data) FROM stdin;
1	5	2019-02-19
\.


--
-- Data for Name: andreea_raduc; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.andreea_raduc (id, suma, data) FROM stdin;
1	5	2018-09-13
2	36	2018-09-16
\.


--
-- Data for Name: andrei_popa; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.andrei_popa (id, suma, data) FROM stdin;
1	2	2018-11-06
2	3	2019-02-19
\.


--
-- Data for Name: andrei_tenie; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.andrei_tenie (id, suma, data) FROM stdin;
\.


--
-- Data for Name: andrei_vicol; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.andrei_vicol (id, suma, data) FROM stdin;
1	5	2018-09-27
\.


--
-- Data for Name: antonio_ganea; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.antonio_ganea (id, suma, data) FROM stdin;
\.


--
-- Data for Name: cheltuieli; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.cheltuieli (id, suma, data) FROM stdin;
1	36	2018-09-21
2	8	2018-11-22
3	23	2018-12-04
4	11	2019-01-16
5	9	2019-01-29
6	10	2019-02-14
\.


--
-- Data for Name: cosmin_costescu; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.cosmin_costescu (id, suma, data) FROM stdin;
1	2	2018-09-24
\.


--
-- Data for Name: denis_popa; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.denis_popa (id, suma, data) FROM stdin;
\.


--
-- Data for Name: diana_caminoc; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.diana_caminoc (id, suma, data) FROM stdin;
\.


--
-- Data for Name: dragos_bahrim; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.dragos_bahrim (id, suma, data) FROM stdin;
1	5	2018-09-13
\.


--
-- Data for Name: george_chiru; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.george_chiru (id, suma, data) FROM stdin;
\.


--
-- Data for Name: george_tabacaru; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.george_tabacaru (id, suma, data) FROM stdin;
\.


--
-- Data for Name: gregorio_manea; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.gregorio_manea (id, suma, data) FROM stdin;
\.


--
-- Data for Name: iuliana_prodea; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.iuliana_prodea (id, suma, data) FROM stdin;
1	5	2018-09-17
\.


--
-- Data for Name: lista; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.lista (id, nume, suma, ultima_contributie) FROM stdin;
4	Alexandru Niamtu	\N	\N
6	Ana Cirlan	\N	\N
10	Andrei Tenie	\N	\N
12	Antonio Ganea	\N	\N
14	Denis Popa	\N	\N
15	Diana Caminoc	\N	\N
17	George Chiru	\N	\N
18	George Tabacaru	\N	\N
19	Gregorio Manea	\N	\N
21	Matei Cibotaru	\N	\N
26	Razvan Vilciu	\N	\N
28	Theodora Toderascu	\N	\N
20	Iuliana Prodea	5	2018-09-17
16	Dragos Bahrim	5	2018-09-13
8	Andreea Raduc	41	2018-09-16
5	Alin Manole	10	2018-09-17
13	Cosmin Costescu	2	2018-09-24
11	Andrei Vicol	5	2018-09-27
1	Alexandra Burdujanu	\N	\N
2	Alexandru Apostu	\N	\N
24	Radu Tache	5	2018-09-23
3	Alexandru Cruceanu	10	2019-01-29
9	Andrei Popa	5	2019-02-19
27	Stefan Spiridon	4	2019-02-19
7	Andreea Maxim	5	2019-02-19
22	Miriam Ditu	2	2019-02-19
25	Rares Cozma	5	2019-02-19
29	Valentin Petrea	1	2019-02-19
23	Monica Chedica	13	2019-02-19
\.


--
-- Data for Name: matei_cibotaru; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.matei_cibotaru (id, suma, data) FROM stdin;
\.


--
-- Data for Name: miriam_ditu; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.miriam_ditu (id, suma, data) FROM stdin;
1	2	2019-02-19
\.


--
-- Data for Name: monica_chedica; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.monica_chedica (id, suma, data) FROM stdin;
1	10	2018-09-13
2	3	2019-02-19
\.


--
-- Data for Name: radu_tache; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.radu_tache (id, suma, data) FROM stdin;
1	3	2018-09-20
2	2	2018-09-23
\.


--
-- Data for Name: rares_cozma; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.rares_cozma (id, suma, data) FROM stdin;
2	5	2019-02-19
\.


--
-- Data for Name: razvan_vilciu; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.razvan_vilciu (id, suma, data) FROM stdin;
\.


--
-- Data for Name: stefan_spiridon; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.stefan_spiridon (id, suma, data) FROM stdin;
1	2	2018-09-24
2	2	2019-02-19
\.


--
-- Data for Name: theodora_toderascu; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.theodora_toderascu (id, suma, data) FROM stdin;
\.


--
-- Data for Name: valentin_petrea; Type: TABLE DATA; Schema: public; Owner: johnnyt
--

COPY public.valentin_petrea (id, suma, data) FROM stdin;
1	1	2019-02-19
\.


--
-- Name: alexandra_burdujanu_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.alexandra_burdujanu_sequence', 1, false);


--
-- Name: alexandru_apostu_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.alexandru_apostu_sequence', 1, false);


--
-- Name: alexandru_cruceanu_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.alexandru_cruceanu_sequence', 1, true);


--
-- Name: alexandru_niamtu_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.alexandru_niamtu_sequence', 1, false);


--
-- Name: alin_manole_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.alin_manole_sequence', 1, true);


--
-- Name: ana_cirlan_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.ana_cirlan_sequence', 1, false);


--
-- Name: andreea_maxim_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.andreea_maxim_sequence', 1, true);


--
-- Name: andreea_raduc_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.andreea_raduc_sequence', 2, true);


--
-- Name: andrei_popa_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.andrei_popa_sequence', 2, true);


--
-- Name: andrei_tenie_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.andrei_tenie_sequence', 1, false);


--
-- Name: andrei_vicol_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.andrei_vicol_sequence', 1, true);


--
-- Name: antonio_ganea_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.antonio_ganea_sequence', 1, false);


--
-- Name: cheltuieli_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.cheltuieli_sequence', 6, true);


--
-- Name: cosmin_costescu_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.cosmin_costescu_sequence', 1, true);


--
-- Name: denis_popa_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.denis_popa_sequence', 1, false);


--
-- Name: diana_caminoc_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.diana_caminoc_sequence', 1, false);


--
-- Name: dragos_bahrim_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.dragos_bahrim_sequence', 1, true);


--
-- Name: george_chiru_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.george_chiru_sequence', 1, false);


--
-- Name: george_tabacaru_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.george_tabacaru_sequence', 1, false);


--
-- Name: gregorio_manea_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.gregorio_manea_sequence', 1, false);


--
-- Name: iuliana_prodea_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.iuliana_prodea_sequence', 1, true);


--
-- Name: matei_cibotaru_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.matei_cibotaru_sequence', 1, false);


--
-- Name: miriam_ditu_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.miriam_ditu_sequence', 1, true);


--
-- Name: monica_chedica_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.monica_chedica_sequence', 2, true);


--
-- Name: radu_tache_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.radu_tache_sequence', 2, true);


--
-- Name: rares_cozma_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.rares_cozma_sequence', 2, true);


--
-- Name: razvan_vilciu_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.razvan_vilciu_sequence', 1, false);


--
-- Name: stefan_spiridon_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.stefan_spiridon_sequence', 2, true);


--
-- Name: theodora_toderascu_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.theodora_toderascu_sequence', 1, false);


--
-- Name: valentin_petrea_sequence; Type: SEQUENCE SET; Schema: public; Owner: johnnyt
--

SELECT pg_catalog.setval('public.valentin_petrea_sequence', 1, true);


--
-- Name: alexandra_burdujanu alexandra_burdujanu_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.alexandra_burdujanu
    ADD CONSTRAINT alexandra_burdujanu_pkey PRIMARY KEY (id);


--
-- Name: alexandru_apostu alexandru_apostu_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.alexandru_apostu
    ADD CONSTRAINT alexandru_apostu_pkey PRIMARY KEY (id);


--
-- Name: alexandru_cruceanu alexandru_cruceanu_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.alexandru_cruceanu
    ADD CONSTRAINT alexandru_cruceanu_pkey PRIMARY KEY (id);


--
-- Name: alexandru_niamtu alexandru_niamtu_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.alexandru_niamtu
    ADD CONSTRAINT alexandru_niamtu_pkey PRIMARY KEY (id);


--
-- Name: alin_manole alin_manole_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.alin_manole
    ADD CONSTRAINT alin_manole_pkey PRIMARY KEY (id);


--
-- Name: ana_cirlan ana_cirlan_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.ana_cirlan
    ADD CONSTRAINT ana_cirlan_pkey PRIMARY KEY (id);


--
-- Name: andreea_maxim andreea_maxim_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.andreea_maxim
    ADD CONSTRAINT andreea_maxim_pkey PRIMARY KEY (id);


--
-- Name: andreea_raduc andreea_raduc_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.andreea_raduc
    ADD CONSTRAINT andreea_raduc_pkey PRIMARY KEY (id);


--
-- Name: andrei_popa andrei_popa_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.andrei_popa
    ADD CONSTRAINT andrei_popa_pkey PRIMARY KEY (id);


--
-- Name: andrei_tenie andrei_tenie_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.andrei_tenie
    ADD CONSTRAINT andrei_tenie_pkey PRIMARY KEY (id);


--
-- Name: andrei_vicol andrei_vicol_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.andrei_vicol
    ADD CONSTRAINT andrei_vicol_pkey PRIMARY KEY (id);


--
-- Name: antonio_ganea antonio_ganea_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.antonio_ganea
    ADD CONSTRAINT antonio_ganea_pkey PRIMARY KEY (id);


--
-- Name: cheltuieli cheltuieli_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.cheltuieli
    ADD CONSTRAINT cheltuieli_pkey PRIMARY KEY (id);


--
-- Name: cosmin_costescu cosmin_costescu_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.cosmin_costescu
    ADD CONSTRAINT cosmin_costescu_pkey PRIMARY KEY (id);


--
-- Name: denis_popa denis_popa_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.denis_popa
    ADD CONSTRAINT denis_popa_pkey PRIMARY KEY (id);


--
-- Name: diana_caminoc diana_caminoc_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.diana_caminoc
    ADD CONSTRAINT diana_caminoc_pkey PRIMARY KEY (id);


--
-- Name: dragos_bahrim dragos_bahrim_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.dragos_bahrim
    ADD CONSTRAINT dragos_bahrim_pkey PRIMARY KEY (id);


--
-- Name: george_chiru george_chiru_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.george_chiru
    ADD CONSTRAINT george_chiru_pkey PRIMARY KEY (id);


--
-- Name: george_tabacaru george_tabacaru_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.george_tabacaru
    ADD CONSTRAINT george_tabacaru_pkey PRIMARY KEY (id);


--
-- Name: gregorio_manea gregorio_manea_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.gregorio_manea
    ADD CONSTRAINT gregorio_manea_pkey PRIMARY KEY (id);


--
-- Name: iuliana_prodea iuliana_prodea_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.iuliana_prodea
    ADD CONSTRAINT iuliana_prodea_pkey PRIMARY KEY (id);


--
-- Name: lista lista_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.lista
    ADD CONSTRAINT lista_pkey PRIMARY KEY (id);


--
-- Name: matei_cibotaru matei_cibotaru_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.matei_cibotaru
    ADD CONSTRAINT matei_cibotaru_pkey PRIMARY KEY (id);


--
-- Name: miriam_ditu miriam_ditu_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.miriam_ditu
    ADD CONSTRAINT miriam_ditu_pkey PRIMARY KEY (id);


--
-- Name: monica_chedica monica_chedica_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.monica_chedica
    ADD CONSTRAINT monica_chedica_pkey PRIMARY KEY (id);


--
-- Name: radu_tache radu_tache_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.radu_tache
    ADD CONSTRAINT radu_tache_pkey PRIMARY KEY (id);


--
-- Name: rares_cozma rares_cozma_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.rares_cozma
    ADD CONSTRAINT rares_cozma_pkey PRIMARY KEY (id);


--
-- Name: razvan_vilciu razvan_vilciu_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.razvan_vilciu
    ADD CONSTRAINT razvan_vilciu_pkey PRIMARY KEY (id);


--
-- Name: stefan_spiridon stefan_spiridon_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.stefan_spiridon
    ADD CONSTRAINT stefan_spiridon_pkey PRIMARY KEY (id);


--
-- Name: theodora_toderascu theodora_toderascu_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.theodora_toderascu
    ADD CONSTRAINT theodora_toderascu_pkey PRIMARY KEY (id);


--
-- Name: valentin_petrea valentin_petrea_pkey; Type: CONSTRAINT; Schema: public; Owner: johnnyt
--

ALTER TABLE ONLY public.valentin_petrea
    ADD CONSTRAINT valentin_petrea_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

