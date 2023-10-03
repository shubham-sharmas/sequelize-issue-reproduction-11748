--
-- PostgreSQL database dump
--

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
-- Name: exercises; Type: TABLE; Schema: public; Owner: shubham
--

CREATE TABLE public.exercises (
    id integer NOT NULL,
    exercise_name character varying(255) NOT NULL,
    exercise_description text,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.exercises OWNER TO shubham;

--
-- Name: exercises_id_seq; Type: SEQUENCE; Schema: public; Owner: shubham
--

CREATE SEQUENCE public.exercises_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercises_id_seq OWNER TO shubham;

--
-- Name: exercises_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shubham
--

ALTER SEQUENCE public.exercises_id_seq OWNED BY public.exercises.id;


--
-- Name: exercises_metrics; Type: TABLE; Schema: public; Owner: shubham
--

CREATE TABLE public.exercises_metrics (
    id integer NOT NULL,
    vote_count integer DEFAULT 0 NOT NULL,
    avg_vote_score numeric(3,2) DEFAULT 0.0 NOT NULL,
    tags_ids integer[] DEFAULT ARRAY[]::integer[] NOT NULL,
    exercise_id integer NOT NULL
);


ALTER TABLE public.exercises_metrics OWNER TO shubham;

--
-- Name: exercises_metrics_id_seq; Type: SEQUENCE; Schema: public; Owner: shubham
--

CREATE SEQUENCE public.exercises_metrics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.exercises_metrics_id_seq OWNER TO shubham;

--
-- Name: exercises_metrics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: shubham
--

ALTER SEQUENCE public.exercises_metrics_id_seq OWNED BY public.exercises_metrics.id;


--
-- Name: exercises id; Type: DEFAULT; Schema: public; Owner: shubham
--

ALTER TABLE ONLY public.exercises ALTER COLUMN id SET DEFAULT nextval('public.exercises_id_seq'::regclass);


--
-- Name: exercises_metrics id; Type: DEFAULT; Schema: public; Owner: shubham
--

ALTER TABLE ONLY public.exercises_metrics ALTER COLUMN id SET DEFAULT nextval('public.exercises_metrics_id_seq'::regclass);


--
-- Data for Name: exercises; Type: TABLE DATA; Schema: public; Owner: shubham
--

COPY public.exercises (id, exercise_name, exercise_description, created_at, updated_at) FROM stdin;
1	Push-ups	A bodyweight exercise that works the chest and arms.	2023-10-03 17:47:45.343739	2023-10-03 17:47:45.343739
2	Squats	A lower body exercise that targets the legs and glutes.	2023-10-03 17:47:45.343739	2023-10-03 17:47:45.343739
3	Plank	A core-strengthening exercise that improves stability.	2023-10-03 17:47:45.343739	2023-10-03 17:47:45.343739
4	Running	Cardiovascular exercise for endurance and fitness.	2023-10-03 17:47:45.343739	2023-10-03 17:47:45.343739
\.


--
-- Data for Name: exercises_metrics; Type: TABLE DATA; Schema: public; Owner: shubham
--

COPY public.exercises_metrics (id, vote_count, avg_vote_score, tags_ids, exercise_id) FROM stdin;
2	8	4.20	{2,3}	2
4	12	4.70	{4}	4
1	10	4.50	{}	1
3	6	4.00	{}	3
\.


--
-- Name: exercises_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shubham
--

SELECT pg_catalog.setval('public.exercises_id_seq', 4, true);


--
-- Name: exercises_metrics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: shubham
--

SELECT pg_catalog.setval('public.exercises_metrics_id_seq', 4, true);


--
-- Name: exercises_metrics exercises_metrics_pkey; Type: CONSTRAINT; Schema: public; Owner: shubham
--

ALTER TABLE ONLY public.exercises_metrics
    ADD CONSTRAINT exercises_metrics_pkey PRIMARY KEY (id);


--
-- Name: exercises exercises_pkey; Type: CONSTRAINT; Schema: public; Owner: shubham
--

ALTER TABLE ONLY public.exercises
    ADD CONSTRAINT exercises_pkey PRIMARY KEY (id);


--
-- Name: exercises_metrics exercises_metrics_exercise_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: shubham
--

ALTER TABLE ONLY public.exercises_metrics
    ADD CONSTRAINT exercises_metrics_exercise_id_fkey FOREIGN KEY (exercise_id) REFERENCES public.exercises(id);


--
-- PostgreSQL database dump complete
--

