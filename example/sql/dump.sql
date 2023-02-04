

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


CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO nest_transact_user;



COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;



CREATE TABLE public.purse (
    id integer NOT NULL,
    balance integer DEFAULT 0 NOT NULL,
    "userId" integer NOT NULL
);


ALTER TABLE public.purse OWNER TO nest_transact_user;



CREATE SEQUENCE public.purse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.purse_id_seq OWNER TO nest_transact_user;



ALTER SEQUENCE public.purse_id_seq OWNED BY public.purse.id;




CREATE TABLE public."user" (
    id integer NOT NULL,
    name character varying NOT NULL,
    "defaultPurseId" integer
);


ALTER TABLE public."user" OWNER TO nest_transact_user;



CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO nest_transact_user;



ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;




ALTER TABLE ONLY public.purse ALTER COLUMN id SET DEFAULT nextval('public.purse_id_seq'::regclass);




ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);




COPY public.purse (id, balance, "userId") FROM stdin;
1	1000	1
2	1000	2
\.




COPY public."user" (id, name, "defaultPurseId") FROM stdin;
1	USER 1	1
2	USER 2	2
\.




SELECT pg_catalog.setval('public.purse_id_seq', 2, true);




SELECT pg_catalog.setval('public.user_id_seq', 2, true);




ALTER TABLE ONLY public.purse
    ADD CONSTRAINT "PK_64d0b0e71c1213684fe6e99d877" PRIMARY KEY (id);




ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_cace4a159ff9f2512dd42373760" PRIMARY KEY (id);



ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "REL_8cc9faec34c5d4c21903b1b02a" UNIQUE ("defaultPurseId");



ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "FK_8cc9faec34c5d4c21903b1b02ac" FOREIGN KEY ("defaultPurseId") REFERENCES public.purse(id);



ALTER TABLE ONLY public.purse
    ADD CONSTRAINT "FK_bd39d6b41508d60fe38380839f6" FOREIGN KEY ("userId") REFERENCES public."user"(id);

