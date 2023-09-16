--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4 (Ubuntu 15.4-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.4 (Ubuntu 15.4-1.pgdg20.04+1)

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: SequelizeMeta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SequelizeMeta" (
    name character varying(255) NOT NULL
);


ALTER TABLE public."SequelizeMeta" OWNER TO postgres;

--
-- Name: app_statuses; Type: TABLE; Schema: public; Owner: sagar
--

CREATE TABLE public.app_statuses (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    status_number integer NOT NULL,
    status boolean,
    value_info character varying NOT NULL,
    title character varying NOT NULL,
    description text NOT NULL,
    created_at date,
    updated_at date
);


ALTER TABLE public.app_statuses OWNER TO sagar;

--
-- Name: blog_images; Type: TABLE; Schema: public; Owner: sagar
--

CREATE TABLE public.blog_images (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    image character varying NOT NULL,
    status boolean,
    status_id uuid,
    post_id uuid,
    created_at date,
    updated_at date
);


ALTER TABLE public.blog_images OWNER TO sagar;

--
-- Name: celestial_post_hash_tags; Type: TABLE; Schema: public; Owner: sagar
--

CREATE TABLE public.celestial_post_hash_tags (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    celestial_post_id uuid,
    hash_tag_id uuid,
    status_id uuid,
    created_at date,
    updated_at date,
    status boolean
);


ALTER TABLE public.celestial_post_hash_tags OWNER TO sagar;

--
-- Name: celestial_posts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.celestial_posts (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    image character varying NOT NULL,
    title character varying NOT NULL,
    description character varying NOT NULL,
    metatitle character varying NOT NULL,
    metadescription character varying NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    user_id uuid,
    status_id uuid
);


ALTER TABLE public.celestial_posts OWNER TO postgres;

--
-- Name: contact_forms; Type: TABLE; Schema: public; Owner: sagar
--

CREATE TABLE public.contact_forms (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    description text NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    status_id uuid
);


ALTER TABLE public.contact_forms OWNER TO sagar;

--
-- Name: event_cities; Type: TABLE; Schema: public; Owner: sagar
--

CREATE TABLE public.event_cities (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    event_time time without time zone,
    event_date date,
    city character varying NOT NULL,
    state character varying NOT NULL,
    country character varying NOT NULL,
    address text NOT NULL,
    pincode character varying NOT NULL,
    cost character varying NOT NULL,
    currency_code character varying NOT NULL,
    terms_condition text NOT NULL,
    description text NOT NULL,
    contact character varying NOT NULL,
    longitude character varying NOT NULL,
    latitude character varying NOT NULL,
    created_at date,
    updated_at date,
    events_id uuid,
    status boolean,
    status_id uuid
);


ALTER TABLE public.event_cities OWNER TO sagar;

--
-- Name: event_feedbacks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_feedbacks (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying NOT NULL,
    description text NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    user_id uuid,
    event_id uuid,
    status_id uuid
);


ALTER TABLE public.event_feedbacks OWNER TO postgres;

--
-- Name: event_images; Type: TABLE; Schema: public; Owner: sagar
--

CREATE TABLE public.event_images (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    image character varying NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    events_id uuid,
    status_id uuid
);


ALTER TABLE public.event_images OWNER TO sagar;

--
-- Name: event_prices; Type: TABLE; Schema: public; Owner: sagar
--

CREATE TABLE public.event_prices (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    event_price character varying NOT NULL,
    discount character varying NOT NULL,
    currency_code character varying NOT NULL,
    created_at date,
    updated_at date,
    status boolean,
    events_id uuid,
    status_id uuid
);


ALTER TABLE public.event_prices OWNER TO sagar;

--
-- Name: event_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_ratings (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    rating_comment text NOT NULL,
    rating_number integer NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    user_id uuid,
    event_id uuid,
    status_id uuid
);


ALTER TABLE public.event_ratings OWNER TO postgres;

--
-- Name: event_service_images; Type: TABLE; Schema: public; Owner: sagar
--

CREATE TABLE public.event_service_images (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    image character varying NOT NULL,
    event_service_id uuid,
    status_id uuid,
    status boolean,
    created_at date,
    updated_at date
);


ALTER TABLE public.event_service_images OWNER TO sagar;

--
-- Name: event_services; Type: TABLE; Schema: public; Owner: sagar
--

CREATE TABLE public.event_services (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying NOT NULL,
    description text NOT NULL,
    service_description text NOT NULL,
    cost character varying NOT NULL,
    city character varying NOT NULL,
    currency_code character varying NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    events_id uuid,
    status_id uuid
);


ALTER TABLE public.event_services OWNER TO sagar;

--
-- Name: event_sub_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_sub_types (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    value_info character varying NOT NULL,
    description character varying NOT NULL,
    title character varying NOT NULL,
    meta_title character varying NOT NULL,
    meta_description character varying NOT NULL,
    image character varying NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    event_types_id uuid,
    status_id uuid
);


ALTER TABLE public.event_sub_types OWNER TO postgres;

--
-- Name: event_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_types (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    value_info character varying NOT NULL,
    description character varying NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    status_id uuid
);


ALTER TABLE public.event_types OWNER TO postgres;

--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    address character varying NOT NULL,
    image character varying NOT NULL,
    description character varying NOT NULL,
    title character varying NOT NULL,
    city character varying NOT NULL,
    status boolean,
    country character varying NOT NULL,
    state character varying NOT NULL,
    contact character varying NOT NULL,
    event_date date,
    event_time time without time zone,
    created_at date,
    updated_at date,
    user_id uuid,
    event_sub_types_id uuid,
    status_id uuid
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_hash_tags; Type: TABLE; Schema: public; Owner: sagar
--

CREATE TABLE public.events_hash_tags (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    event_id uuid,
    hash_tag_id uuid,
    status_id uuid,
    status boolean,
    created_at date,
    updated_at date
);


ALTER TABLE public.events_hash_tags OWNER TO sagar;

--
-- Name: hash_tags; Type: TABLE; Schema: public; Owner: sagar
--

CREATE TABLE public.hash_tags (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    value_info character varying NOT NULL,
    user_id uuid,
    status_id uuid,
    status boolean,
    created_at date,
    updated_at date
);


ALTER TABLE public.hash_tags OWNER TO sagar;

--
-- Name: post_comments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_comments (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    description character varying NOT NULL,
    comment character varying NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    post_id uuid,
    user_id uuid,
    status_id uuid
);


ALTER TABLE public.post_comments OWNER TO postgres;

--
-- Name: post_likes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.post_likes (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    description character varying NOT NULL,
    likes boolean,
    status boolean,
    created_at date,
    updated_at date,
    post_id uuid,
    user_id uuid,
    status_id uuid
);


ALTER TABLE public.post_likes OWNER TO postgres;

--
-- Name: subscription_forms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscription_forms (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    email character varying NOT NULL,
    status boolean,
    is_sent_email boolean,
    created_at date,
    updated_at date,
    status_id uuid
);


ALTER TABLE public.subscription_forms OWNER TO postgres;

--
-- Name: upi_payments; Type: TABLE; Schema: public; Owner: sagar
--

CREATE TABLE public.upi_payments (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    amount character varying NOT NULL,
    currency_code character varying NOT NULL,
    payment_date timestamp without time zone,
    payment_mode character varying NOT NULL,
    razorpay_payment_status boolean,
    order_id bigint NOT NULL,
    razorpay_order_id character varying NOT NULL,
    user_id uuid,
    events_id uuid,
    status_id uuid,
    status boolean,
    created_at date,
    updated_at date,
    razorpay_payment_id character varying NOT NULL,
    razorpay_invoice_id character varying,
    razorpay_payment_status_completed character varying
);


ALTER TABLE public.upi_payments OWNER TO sagar;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying NOT NULL,
    value_info character varying NOT NULL,
    description character varying NOT NULL,
    status boolean,
    created_at date,
    updated_at date,
    status_id uuid
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: user_teams; Type: TABLE; Schema: public; Owner: sagar
--

CREATE TABLE public.user_teams (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid,
    team_member_id uuid,
    created_at date,
    updated_at date
);


ALTER TABLE public.user_teams OWNER TO sagar;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    username character varying NOT NULL,
    firstname character varying NOT NULL,
    lastname character varying NOT NULL,
    state character varying NOT NULL,
    city character varying NOT NULL,
    country character varying NOT NULL,
    address1 character varying NOT NULL,
    status boolean,
    address2 character varying NOT NULL,
    created_at date,
    updated_at date,
    user_role_id uuid,
    status_id uuid
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_events (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    created_at date,
    updated_at date,
    is_active boolean,
    user_id uuid,
    event_id uuid,
    status_id uuid
);


ALTER TABLE public.users_events OWNER TO postgres;

--
-- Data for Name: SequelizeMeta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SequelizeMeta" (name) FROM stdin;
20221128074015-create-user.js
20221128075344-create-celestial-posts.js
20221128080946-create-post-likes.js
20221128081001-create-post-comments.js
20221130065634-create-events.js
20221130071450-create-users-events.js
20221205052848-create-user-role.js
20221216114234-create-event-types.js
20221219064654-create-event-sub-types.js
20230102122817-create-events-rating.js
20230109092553-create-events-feedback.js
20230405061710-create-contact-form.js
\.


--
-- Data for Name: app_statuses; Type: TABLE DATA; Schema: public; Owner: sagar
--

COPY public.app_statuses (id, status_number, status, value_info, title, description, created_at, updated_at) FROM stdin;
312dea0b-d6b4-4f8c-b6e9-72b7d43423da	0	t	default	default	default	2023-06-07	2023-06-07
\.


--
-- Data for Name: blog_images; Type: TABLE DATA; Schema: public; Owner: sagar
--

COPY public.blog_images (id, image, status, status_id, post_id, created_at, updated_at) FROM stdin;
7b2e2a47-9469-4990-a72a-d8e6be4a2f0b	https://unsplash.com/photos/PP8Escz15d8/download?ixid=M3wxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjg2MjA4NzM0fA&force=true	t	312dea0b-d6b4-4f8c-b6e9-72b7d43423da	896b9641-55e3-4ed7-847c-41b562aa1f1e	2023-06-08	2023-06-08
\.


--
-- Data for Name: celestial_post_hash_tags; Type: TABLE DATA; Schema: public; Owner: sagar
--

COPY public.celestial_post_hash_tags (id, celestial_post_id, hash_tag_id, status_id, created_at, updated_at, status) FROM stdin;
ce715f35-56f7-4565-825b-d13d4817287a	0f992431-ed91-436a-a659-72f48d466eca	c88f0a61-2d11-49fc-80ed-74b29e64c969	312dea0b-d6b4-4f8c-b6e9-72b7d43423da	2023-07-24	2023-07-24	t
e60d9773-9a40-4440-bf13-5b0beaabcb6b	0f992431-ed91-436a-a659-72f48d466eca	19a7fca5-b4ec-4762-a8ec-6d16d22d0008	312dea0b-d6b4-4f8c-b6e9-72b7d43423da	2023-07-25	2023-07-25	t
db1c2075-0c96-4b84-819a-bcaf0b91748d	0f992431-ed91-436a-a659-72f48d466eca	84095f86-4f02-4610-b2a4-6446001d9500	312dea0b-d6b4-4f8c-b6e9-72b7d43423da	2023-07-25	2023-07-25	t
c18a5ae9-6c3e-4fea-a1dd-eec3f96796f1	0f992431-ed91-436a-a659-72f48d466eca	330d9603-76c7-49f6-aa4b-63ee1fc389e0	312dea0b-d6b4-4f8c-b6e9-72b7d43423da	2023-07-25	2023-07-25	t
6179d708-f67d-4945-954a-75526319f24e	1cad16cc-f6d3-47ad-8fa0-5da0b0081f63	c88f0a61-2d11-49fc-80ed-74b29e64c969	312dea0b-d6b4-4f8c-b6e9-72b7d43423da	2023-07-25	2023-07-25	t
\.


--
-- Data for Name: celestial_posts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.celestial_posts (id, image, title, description, metatitle, metadescription, status, created_at, updated_at, user_id, status_id) FROM stdin;
896b9641-55e3-4ed7-847c-41b562aa1f1e	https://unsplash.com/photos/GEEYsGh-30M/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8NnNNVmpUTFNrZVF8fHx8fDJ8fDE2ODE3MzE5MTU&force=true&w=640	ds	ds	ds	ds	t	2023-04-17	2023-04-17	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
e8625731-0d5f-4b2c-b520-47311e25faf6	https://unsplash.com/photos/GEEYsGh-30M/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8NnNNVmpUTFNrZVF8fHx8fDJ8fDE2ODE3MzE5MTU&force=true&w=640	a	a	a	a	t	2022-12-07	2022-12-07	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
1cad16cc-f6d3-47ad-8fa0-5da0b0081f63	https://unsplash.com/photos/GEEYsGh-30M/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8NnNNVmpUTFNrZVF8fHx8fDJ8fDE2ODE3MzE5MTU&force=true&w=640	b	b	b	b	t	2022-12-09	2022-12-09	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
befb916e-86f4-4114-b0ee-4ac675fb2299	https://unsplash.com/photos/GEEYsGh-30M/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8NnNNVmpUTFNrZVF8fHx8fDJ8fDE2ODE3MzE5MTU&force=true&w=640	hello	hello1	hello1	hello1	t	2023-04-17	2023-04-17	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
889ac41f-dafe-4c9c-83df-69ac12ce6a9f	https://unsplash.com/photos/GEEYsGh-30M/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8NnNNVmpUTFNrZVF8fHx8fDJ8fDE2ODE3MzE5MTU&force=true&w=640	hello2	hello	hello	hello	t	2023-04-17	2023-04-17	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
0f992431-ed91-436a-a659-72f48d466eca	https://unsplash.com/photos/GEEYsGh-30M/download?ixid=MnwxMjA3fDB8MXx0b3BpY3x8NnNNVmpUTFNrZVF8fHx8fDJ8fDE2ODE3MzE5MTU&force=true&w=640	aaaaa	aaaaa	aaaaa	aaaaa	t	2023-04-17	2023-04-17	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Data for Name: contact_forms; Type: TABLE DATA; Schema: public; Owner: sagar
--

COPY public.contact_forms (id, title, name, email, description, status, created_at, updated_at, status_id) FROM stdin;
f2ce74fb-bd3d-4996-b9c4-56b474702188	suggestion	sagar	sagar@gmail.com	suggestion	t	2023-04-05	2023-04-05	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
9c628352-d83e-4b75-90b0-cf4a57cb1862	hello	iflair	dinesh@gmail.com	hello	t	2023-04-10	2023-04-10	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Data for Name: event_cities; Type: TABLE DATA; Schema: public; Owner: sagar
--

COPY public.event_cities (id, event_time, event_date, city, state, country, address, pincode, cost, currency_code, terms_condition, description, contact, longitude, latitude, created_at, updated_at, events_id, status, status_id) FROM stdin;
5b770ad3-9d55-48ce-9bfc-3a4723fa2ff0	11:32:00	2023-12-23	san fransico	california	USA	abc	392011	$40	$dollar	abc	abc	1234567890	1123.09	1123.90	2023-06-02	2023-06-02	b31e9608-1c2b-4c3f-9ce5-1271f21f8005	t	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Data for Name: event_feedbacks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_feedbacks (id, title, description, status, created_at, updated_at, user_id, event_id, status_id) FROM stdin;
5505c78f-9c7a-4db8-bd49-a117e65f8c7c	a good event	was fantastic we enjoyed a lot	t	2023-01-10	2023-01-10	9ff65a25-522c-41ff-95b7-6e2414a1655a	b31e9608-1c2b-4c3f-9ce5-1271f21f8005	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Data for Name: event_images; Type: TABLE DATA; Schema: public; Owner: sagar
--

COPY public.event_images (id, image, status, created_at, updated_at, events_id, status_id) FROM stdin;
147dd37f-44c7-455e-a535-cc4fc438e704	a	t	2023-06-02	2023-06-02	b31e9608-1c2b-4c3f-9ce5-1271f21f8005	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Data for Name: event_prices; Type: TABLE DATA; Schema: public; Owner: sagar
--

COPY public.event_prices (id, event_price, discount, currency_code, created_at, updated_at, status, events_id, status_id) FROM stdin;
2d636c61-fa8e-4dc8-bbdc-dd72a56a84c3	$40	0	$ dollar	2023-06-02	2023-06-02	t	b31e9608-1c2b-4c3f-9ce5-1271f21f8005	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Data for Name: event_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_ratings (id, rating_comment, rating_number, status, created_at, updated_at, user_id, event_id, status_id) FROM stdin;
673d4c2c-bab3-4e92-a40d-755c81d6f9a2	hello	5	t	2023-01-02	2023-01-02	9ff65a25-522c-41ff-95b7-6e2414a1655a	b31e9608-1c2b-4c3f-9ce5-1271f21f8005	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Data for Name: event_service_images; Type: TABLE DATA; Schema: public; Owner: sagar
--

COPY public.event_service_images (id, image, event_service_id, status_id, status, created_at, updated_at) FROM stdin;
252d8070-1415-45c6-b2a9-87c71a490a27	https://unsplash.com/photos/Abfu_HHbM-Y/download?ixid=M3wxMjA3fDB8MXxhbGx8NHx8fHx8fDJ8fDE2OTE1NTkxMzV8&force=true&w=1920	fe43aff4-777f-43c3-9524-5e52f8ae6869	312dea0b-d6b4-4f8c-b6e9-72b7d43423da	t	2023-08-09	2023-08-09
\.


--
-- Data for Name: event_services; Type: TABLE DATA; Schema: public; Owner: sagar
--

COPY public.event_services (id, title, description, service_description, cost, city, currency_code, status, created_at, updated_at, events_id, status_id) FROM stdin;
fe43aff4-777f-43c3-9524-5e52f8ae6869	a	a	a	$40	hyderabad	$dollar	t	2023-06-02	2023-06-02	b31e9608-1c2b-4c3f-9ce5-1271f21f8005	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Data for Name: event_sub_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_sub_types (id, name, value_info, description, title, meta_title, meta_description, image, status, created_at, updated_at, event_types_id, status_id) FROM stdin;
fbc49398-4502-43e8-ae5c-02fd46080f49	Birthday Party	birthday_party	birthday party	Birthday Party	Birthday Party	Birthday Party	a	t	2022-12-20	2022-12-20	800c29c1-59d9-49b3-a710-0bfaa853738d	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Data for Name: event_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_types (id, name, value_info, description, status, created_at, updated_at, status_id) FROM stdin;
800c29c1-59d9-49b3-a710-0bfaa853738d	Social Events	social_events	Social Events	t	2022-12-16	2022-12-16	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
dc5728fe-ad00-4331-989c-041d332ed4b4	Corporate Events	corporate_events	Corporate Events	t	2022-12-16	2022-12-16	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
b30891bd-7489-4ae2-81a6-71cf70f2d4aa	Live Events	live_events	Live Events	t	2022-12-16	2022-12-16	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
bc5e48b6-fe64-476b-9c84-36476655af27	Miscellaneous Events	miscellaneous_events	Miscellaneous Events	t	2022-12-16	2022-12-16	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, address, image, description, title, city, status, country, state, contact, event_date, event_time, created_at, updated_at, user_id, event_sub_types_id, status_id) FROM stdin;
b31e9608-1c2b-4c3f-9ce5-1271f21f8005	a	a	a	a	a	t	a	a	123	2022-12-20	11:05:00	2022-12-20	2022-12-20	9ff65a25-522c-41ff-95b7-6e2414a1655a	fbc49398-4502-43e8-ae5c-02fd46080f49	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Data for Name: events_hash_tags; Type: TABLE DATA; Schema: public; Owner: sagar
--

COPY public.events_hash_tags (id, event_id, hash_tag_id, status_id, status, created_at, updated_at) FROM stdin;
d465046a-b489-471f-8b3e-e027ee394e09	b31e9608-1c2b-4c3f-9ce5-1271f21f8005	c88f0a61-2d11-49fc-80ed-74b29e64c969	312dea0b-d6b4-4f8c-b6e9-72b7d43423da	t	2023-08-03	2023-08-03
7ea3ec06-3d3b-434e-bcb2-20ff8d036cc4	b31e9608-1c2b-4c3f-9ce5-1271f21f8005	c88f0a61-2d11-49fc-80ed-74b29e64c969	312dea0b-d6b4-4f8c-b6e9-72b7d43423da	t	2023-08-03	2023-08-03
\.


--
-- Data for Name: hash_tags; Type: TABLE DATA; Schema: public; Owner: sagar
--

COPY public.hash_tags (id, name, value_info, user_id, status_id, status, created_at, updated_at) FROM stdin;
c88f0a61-2d11-49fc-80ed-74b29e64c969	forest	forest	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da	t	2023-07-24	2023-07-24
19a7fca5-b4ec-4762-a8ec-6d16d22d0008	jungle	jungle	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da	t	2023-07-25	2023-07-25
84095f86-4f02-4610-b2a4-6446001d9500	volcano	volcano	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da	t	2023-07-25	2023-07-25
330d9603-76c7-49f6-aa4b-63ee1fc389e0	first	first	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da	t	2023-07-25	2023-07-25
\.


--
-- Data for Name: post_comments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_comments (id, description, comment, status, created_at, updated_at, post_id, user_id, status_id) FROM stdin;
41aa832b-9020-4b9d-a7a5-c2f20c79ca11	a	a	t	2022-12-07	2022-12-07	e8625731-0d5f-4b2c-b520-47311e25faf6	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
914c3516-4306-49c0-bcd9-c7d7e3c31163	hello how are you sagar	hello how are you sagar	t	2023-07-11	2023-07-11	e8625731-0d5f-4b2c-b520-47311e25faf6	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
01414624-fbaf-41e1-bcab-883d589c9fc2	how are you	how are you	t	2023-07-11	2023-07-11	e8625731-0d5f-4b2c-b520-47311e25faf6	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
ba3a4406-5f3a-4a85-b309-cbe16f970fdb	how are you how are	how are you how are	t	2023-07-11	2023-07-11	e8625731-0d5f-4b2c-b520-47311e25faf6	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
7a28031f-596a-484f-b9d4-f3580f3b23fe	dsad	dsad	t	2023-07-11	2023-07-11	e8625731-0d5f-4b2c-b520-47311e25faf6	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
dbb3e4b7-6457-4202-9432-b56dc7853bc5	hello how are you shubham	hello how are you shubham	t	2023-07-11	2023-07-11	e8625731-0d5f-4b2c-b520-47311e25faf6	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
66350195-a122-4015-9076-bf4ba874bf33	hello dinesh	hello dinesh	t	2023-07-11	2023-07-11	e8625731-0d5f-4b2c-b520-47311e25faf6	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
07cebf7a-5318-4ca7-a0a4-fac3bcbd1965	helo sagar	helo sagar	t	2023-07-11	2023-07-11	e8625731-0d5f-4b2c-b520-47311e25faf6	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
7b6287f1-4aca-4c54-8b1b-696b70741f65	hellow	hellow	t	2023-07-11	2023-07-11	e8625731-0d5f-4b2c-b520-47311e25faf6	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
ff5f22c5-d0b5-4f1c-b3d9-a921bdece4d8	hello dinesh baba	hello dinesh baba	t	2023-07-11	2023-07-11	e8625731-0d5f-4b2c-b520-47311e25faf6	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
c3c50574-d4c6-4487-bf63-e16cedee6af6	hiii	hiii	t	2023-07-11	2023-07-11	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
74b0486d-23f8-48ad-9d54-de2aa477f3ce	hello	hello	t	2023-07-11	2023-07-11	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
97501b42-0698-45be-a778-bfe3b0855ba5	hello vue	hello vue	t	2023-07-11	2023-07-11	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
03454848-719a-46e6-a5f0-2d250432a48c	hello vue	hello vue	t	2023-07-11	2023-07-11	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
1b246aaa-c3d3-4d27-b71e-279a16a4af3c	fdgd	fdgd	t	2023-07-11	2023-07-11	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
bb87baa6-7966-4eed-af67-0f43f0cfd3fc	hello dinesh vue11 c	hello dinesh vue11 c	t	2023-07-11	2023-07-11	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
59be0ec5-57b3-4e4e-b338-09dcab16bfee	hello dinesh bhai	hello dinesh bhai	t	2023-07-11	2023-07-11	e8625731-0d5f-4b2c-b520-47311e25faf6	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
6f601e99-55eb-488b-b059-ac70b6af3c37	sagar shubham	sagar shubham	t	2023-07-11	2023-07-11	e8625731-0d5f-4b2c-b520-47311e25faf6	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
5fc6d186-7856-4a48-ba7c-b313567fa84c	dsdsa	dsdsa	t	2023-07-12	2023-07-12	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
fda6363d-7f41-425d-87ed-7c5c9afc7a31	erewr	erewr	t	2023-07-12	2023-07-12	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
3be27139-afa9-436d-bfb5-2eae5d716bd0	sonali is a good girl	sonali is a good girl	t	2023-07-12	2023-07-12	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
ef82a116-410f-486d-a2de-097c779d3eff	hiiiiiiiiiiii	hiiiiiiiiiiii	t	2023-07-12	2023-07-12	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
8cb2e369-d62d-4bc0-aeb7-6ce2294dfc9d	zx	zx	t	2023-07-12	2023-07-12	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
e1e036a7-3439-4d78-a55c-94140331902c	zxcdsfw	zxcdsfw	t	2023-07-12	2023-07-12	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
50f76bdd-f92f-46d2-bc5d-c24a4269b70e	fhhhhhhhhhh	fhhhhhhhhhh	t	2023-07-12	2023-07-12	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
ef653d15-605c-4a39-9470-ccecc31cadb4	zxc	zxc	t	2023-07-12	2023-07-12	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
5f15c187-3842-4af2-a9a3-77bd9b2de755	sonali	sonali	t	2023-07-12	2023-07-12	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
d0ff09ba-d619-4af6-8a9a-b90527fe2eae	xxxxxxxxxxx	xxxxxxxxxxx	t	2023-07-12	2023-07-12	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
a0d1ec21-3071-44c7-8328-3974344b1fa3	   cvvv	   cvvv	t	2023-07-12	2023-07-12	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
8f63d170-7883-4610-9e3f-81c70b3fbf65	xczzzzzzzzz	xczzzzzzzzz	t	2023-07-12	2023-07-12	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
cd6e0bb0-732e-4697-8324-cd37a04da576	hello	hello	t	2023-07-13	2023-07-13	1cad16cc-f6d3-47ad-8fa0-5da0b0081f63	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
165aa706-ba3d-4ecc-afbf-be66ec283620	hii	hii	t	2023-07-14	2023-07-14	befb916e-86f4-4114-b0ee-4ac675fb2299	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
b609828b-7f15-4233-844b-4b3d42e714f8	helllo how are you	helllo how are you	t	2023-07-18	2023-07-18	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
59473359-82eb-4f32-94d5-da6a3aaa487d	hiii shubham	hiii shubham	t	2023-07-18	2023-07-18	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
e2cffebe-5ed6-40c3-b414-72480eb5aaee	hii sonali	hii sonali	t	2023-07-18	2023-07-18	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
236e0cc7-4025-4e10-a16c-fa45a8b7fcaa	hello dinesh 	hello dinesh 	t	2023-07-18	2023-07-18	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
30e831b8-7e99-4279-8b15-3413d9942392	ertrtrt	ertrtrt	t	2023-07-18	2023-07-18	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
17ad4ffb-5333-4ccd-b970-4617854d22c7	hello world	hello world	t	2023-07-19	2023-07-19	896b9641-55e3-4ed7-847c-41b562aa1f1e	6d909bfd-b562-4070-8024-847c13fa8b44	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
2f3ede46-3cbf-4e46-8565-4ef88d7f2083	hello	hello	t	2023-07-19	2023-07-19	0f992431-ed91-436a-a659-72f48d466eca	6d909bfd-b562-4070-8024-847c13fa8b44	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
33e08fae-78f5-4972-914c-878324ecbd81	dsasd	dsasd	t	2023-07-20	2023-07-20	0f992431-ed91-436a-a659-72f48d466eca	6d909bfd-b562-4070-8024-847c13fa8b44	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
bf8ab7f6-6f5e-489d-b90b-c8257f338d71	dfgghfghfhg	dfgghfghfhg	t	2023-08-02	2023-08-02	0f992431-ed91-436a-a659-72f48d466eca	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
63400415-81f3-40fc-9c37-0fb094c3c160	dssd	dssd	t	2023-08-04	2023-08-04	889ac41f-dafe-4c9c-83df-69ac12ce6a9f	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
2c1b1550-37f2-411a-b900-643b323a41fe	dsdasd	dsdasd	t	2023-08-04	2023-08-04	889ac41f-dafe-4c9c-83df-69ac12ce6a9f	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Data for Name: post_likes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.post_likes (id, description, likes, status, created_at, updated_at, post_id, user_id, status_id) FROM stdin;
4328c155-6024-4c23-bca6-00f6a1ca7907	a	t	t	2022-12-07	2022-12-07	e8625731-0d5f-4b2c-b520-47311e25faf6	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
321bbe6d-4cf1-4e8a-8163-070a48dc8703	a	t	t	2022-12-09	2022-12-09	1cad16cc-f6d3-47ad-8fa0-5da0b0081f63	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
519252dd-2d4f-4e95-a7fa-34078b16d4e8	likes	t	t	2023-07-19	2023-07-19	896b9641-55e3-4ed7-847c-41b562aa1f1e	6d909bfd-b562-4070-8024-847c13fa8b44	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
0e85ad47-87fe-4812-955b-92092f3a4df1	hello	t	t	2023-07-12	2023-07-19	896b9641-55e3-4ed7-847c-41b562aa1f1e	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
587c3081-b253-41e1-9312-02db7aa0717a	likes	t	t	2023-07-19	2023-07-19	896b9641-55e3-4ed7-847c-41b562aa1f1e	51567290-1749-48b3-8c69-38bbe5212a36	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
034ea3b8-d996-430c-b96c-a7ded178e880	likes	t	t	2023-07-19	2023-07-19	889ac41f-dafe-4c9c-83df-69ac12ce6a9f	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
3c146ad7-1fb1-477a-9c0c-a0d46ab27ff9	likes	t	t	2023-07-19	2023-07-19	889ac41f-dafe-4c9c-83df-69ac12ce6a9f	6d909bfd-b562-4070-8024-847c13fa8b44	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
43a679a3-df46-48f9-a66d-2a55ff7fe212	likes	t	t	2023-07-19	2023-07-19	0f992431-ed91-436a-a659-72f48d466eca	6d909bfd-b562-4070-8024-847c13fa8b44	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
31fa86ef-260f-43e1-9040-964c186b194f	likes	t	t	2023-07-20	2023-07-20	1cad16cc-f6d3-47ad-8fa0-5da0b0081f63	6d909bfd-b562-4070-8024-847c13fa8b44	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
b5596b40-1e20-4550-a7aa-20b096be075b	likes	t	t	2023-07-28	2023-07-28	befb916e-86f4-4114-b0ee-4ac675fb2299	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
275580ca-a4fb-481c-997a-b972953bdecd	likes	t	t	2023-07-19	2023-08-01	0f992431-ed91-436a-a659-72f48d466eca	9ff65a25-522c-41ff-95b7-6e2414a1655a	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Data for Name: subscription_forms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscription_forms (id, email, status, is_sent_email, created_at, updated_at, status_id) FROM stdin;
4d6ccbe9-b243-45d3-9ec7-775e492fe429	sagar.patel@iflair.com	t	t	2023-05-02	2023-05-02	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
937beb12-5f78-4571-9192-77b8b0204418	hello@gmail.com	t	t	2023-05-02	2023-05-02	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
648dddb6-eaaa-4c09-84c8-d5ee578d88ce	deviflair2020@gmail.com	t	t	2023-05-02	2023-05-02	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
01e8c1c6-b36c-42a2-8724-7a92aeb20cf7	shubham.anchliya@iflair.com	t	t	2023-05-02	2023-05-02	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Data for Name: upi_payments; Type: TABLE DATA; Schema: public; Owner: sagar
--

COPY public.upi_payments (id, amount, currency_code, payment_date, payment_mode, razorpay_payment_status, order_id, razorpay_order_id, user_id, events_id, status_id, status, created_at, updated_at, razorpay_payment_id, razorpay_invoice_id, razorpay_payment_status_completed) FROM stdin;
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (id, name, value_info, description, status, created_at, updated_at, status_id) FROM stdin;
661bf130-6416-4bc3-a4d1-4fbc12773994	Admin	admin	Admin has to handle Everything	t	2022-12-05	2022-12-05	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
908cd23e-7034-440a-919a-c68f32008495	Event planner	event_planner	Event Planner can create events and services	t	2022-12-05	2022-12-05	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
0cfc39ed-ea61-4b40-a9c6-9fe44989b593	Event Planner Client	event_planner_client	Client can give order to Event Planner	t	2022-12-05	2022-12-05	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
4b9e8f43-a598-469b-a46f-6d8414e3b505	User	user	User can enroll in events	t	2022-12-05	2022-12-05	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
27ee199f-77ef-4943-a19f-a9b90c9fed82	Invitors	invited_member	Invitors are invited in private events	t	2022-12-05	2022-12-05	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
59d1a794-dbbb-49b1-bde6-bfcc0082ea3e	Event Planner Team Member	event_planner_team_member	Event Planner can assign service task to its Team Members	t	2022-12-05	2022-12-05	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Data for Name: user_teams; Type: TABLE DATA; Schema: public; Owner: sagar
--

COPY public.user_teams (id, user_id, team_member_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, username, firstname, lastname, state, city, country, address1, status, address2, created_at, updated_at, user_role_id, status_id) FROM stdin;
51567290-1749-48b3-8c69-38bbe5212a36	sagar4@gmail.com	CuH5T7It++UP8sgCfetVUIoST0jScN/VpFnjLPBD45U=	sagar4	sagar	patel	b	a	b	a	t	a	2023-06-07	2023-06-07	4b9e8f43-a598-469b-a46f-6d8414e3b505	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
365f367f-b46c-4682-81b4-1592e0c11e79	sagar.patel1@iflair.com	CuH5T7It++UP8sgCfetVUIoST0jScN/VpFnjLPBD45U=	sagar12	Sagar	Patel	gujarat	bharuch	india	abc	t	2	2023-03-01	2023-03-01	661bf130-6416-4bc3-a4d1-4fbc12773994	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
f249ec16-df3d-4eba-ad38-05f405b0b650	dinesh@gmail.com	0mZKYGRolg7k6wn6NHzJVXGZJFFWsy588MLM4U9+a/8=	dinesh	dinesh	suthar	gujarat	ahmedabad	india	paldi	t	paldi	2023-03-31	2023-03-31	4b9e8f43-a598-469b-a46f-6d8414e3b505	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
5802f346-5707-4c45-a381-506f1d79198e	abc@vsooc.com	w54vT+xlnGAN9iEGN/yHz/rhjit7ouIjvydi7Z+5tRQ=	abc_vsooc	abc	def	gujarat	ahmedabad	india	a	t	a	2023-04-04	2023-04-04	4b9e8f43-a598-469b-a46f-6d8414e3b505	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
7169e23d-36e6-41ad-a5fb-b8b9aba743be	sagar@gmail.com	MGu7YaN7k87Cdl6cPSD50HRtjHoqYtB3UNDUMuMdyJE=	sagar2	sagar	patel	gujarat	ahmedabad	india	paldi	t	paldi	2023-04-06	2023-04-06	4b9e8f43-a598-469b-a46f-6d8414e3b505	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
9ff65a25-522c-41ff-95b7-6e2414a1655a	sagar.patel@iflair.com	CuH5T7It++UP8sgCfetVUIoST0jScN/VpFnjLPBD45U=	sagar	sagar	patel	a	a	a	a	t	a	2022-12-07	2023-05-05	4b9e8f43-a598-469b-a46f-6d8414e3b505	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
6d909bfd-b562-4070-8024-847c13fa8b44	sagar5@gmail.com	CuH5T7It++UP8sgCfetVUIoST0jScN/VpFnjLPBD45U=	sagar5	sagar	patel	b	a	b	a	t	a	2023-06-07	2023-06-07	4b9e8f43-a598-469b-a46f-6d8414e3b505	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
6c205777-1c24-4b95-8cb3-abd5a4a51559	sagar3@gmail.com	CuH5T7It++UP8sgCfetVUIoST0jScN/VpFnjLPBD45U=	sagar3	sagar	patel	gujarat	bharuch	india	abc	t	abc	2023-06-26	2023-06-26	908cd23e-7034-440a-919a-c68f32008495	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
5166e3ac-a6d1-4d3f-9b36-b578c0b25e6f	sagar7@gmail.com	CuH5T7It++UP8sgCfetVUIoST0jScN/VpFnjLPBD45U=	sagar7	sagar	patel	gujarat	bharuch	india	abc	t	abc	2023-06-26	2023-06-26	59d1a794-dbbb-49b1-bde6-bfcc0082ea3e	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Data for Name: users_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users_events (id, created_at, updated_at, is_active, user_id, event_id, status_id) FROM stdin;
8e05859c-415d-4e36-906c-b0fbc2169f2f	2023-05-30	2023-05-30	t	9ff65a25-522c-41ff-95b7-6e2414a1655a	b31e9608-1c2b-4c3f-9ce5-1271f21f8005	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
d76d6fff-3832-4fbc-9a8a-08710f503513	2023-05-31	2023-05-31	t	7169e23d-36e6-41ad-a5fb-b8b9aba743be	b31e9608-1c2b-4c3f-9ce5-1271f21f8005	312dea0b-d6b4-4f8c-b6e9-72b7d43423da
\.


--
-- Name: SequelizeMeta SequelizeMeta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SequelizeMeta"
    ADD CONSTRAINT "SequelizeMeta_pkey" PRIMARY KEY (name);


--
-- Name: app_statuses app_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.app_statuses
    ADD CONSTRAINT app_statuses_pkey PRIMARY KEY (id);


--
-- Name: app_statuses app_statuses_status_number_key; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.app_statuses
    ADD CONSTRAINT app_statuses_status_number_key UNIQUE (status_number);


--
-- Name: app_statuses app_statuses_value_info_key; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.app_statuses
    ADD CONSTRAINT app_statuses_value_info_key UNIQUE (value_info);


--
-- Name: blog_images blog_images_pkey; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.blog_images
    ADD CONSTRAINT blog_images_pkey PRIMARY KEY (id);


--
-- Name: celestial_post_hash_tags celestial_post_hash_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.celestial_post_hash_tags
    ADD CONSTRAINT celestial_post_hash_tags_pkey PRIMARY KEY (id);


--
-- Name: celestial_posts celestial_posts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_posts
    ADD CONSTRAINT celestial_posts_pkey PRIMARY KEY (id);


--
-- Name: contact_forms contact_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.contact_forms
    ADD CONSTRAINT contact_forms_pkey PRIMARY KEY (id);


--
-- Name: event_cities event_cities_pkey; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.event_cities
    ADD CONSTRAINT event_cities_pkey PRIMARY KEY (id);


--
-- Name: event_feedbacks event_feedbacks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_feedbacks
    ADD CONSTRAINT event_feedbacks_pkey PRIMARY KEY (id);


--
-- Name: event_images event_images_pkey; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.event_images
    ADD CONSTRAINT event_images_pkey PRIMARY KEY (id);


--
-- Name: event_prices event_price_pkey; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.event_prices
    ADD CONSTRAINT event_price_pkey PRIMARY KEY (id);


--
-- Name: event_ratings event_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_ratings
    ADD CONSTRAINT event_ratings_pkey PRIMARY KEY (id);


--
-- Name: event_service_images event_service_images_pkey; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.event_service_images
    ADD CONSTRAINT event_service_images_pkey PRIMARY KEY (id);


--
-- Name: event_services event_services_pkey; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.event_services
    ADD CONSTRAINT event_services_pkey PRIMARY KEY (id);


--
-- Name: event_sub_types event_sub_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_sub_types
    ADD CONSTRAINT event_sub_types_pkey PRIMARY KEY (id);


--
-- Name: events_hash_tags events_hash_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.events_hash_tags
    ADD CONSTRAINT events_hash_tags_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: hash_tags hash_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.hash_tags
    ADD CONSTRAINT hash_tags_pkey PRIMARY KEY (id);


--
-- Name: hash_tags hash_tags_value_info_key; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.hash_tags
    ADD CONSTRAINT hash_tags_value_info_key UNIQUE (value_info);


--
-- Name: upi_payments order_id_unique; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.upi_payments
    ADD CONSTRAINT order_id_unique UNIQUE (order_id);


--
-- Name: post_comments post_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT post_comments_pkey PRIMARY KEY (id);


--
-- Name: post_likes post_likes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_likes
    ADD CONSTRAINT post_likes_pkey PRIMARY KEY (id);


--
-- Name: subscription_forms subscription_forms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_forms
    ADD CONSTRAINT subscription_forms_pkey PRIMARY KEY (id);


--
-- Name: upi_payments upi_payments_pkey; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.upi_payments
    ADD CONSTRAINT upi_payments_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: user_teams user_teams_pkey; Type: CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.user_teams
    ADD CONSTRAINT user_teams_pkey PRIMARY KEY (id);


--
-- Name: event_types user_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_types
    ADD CONSTRAINT user_types_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_events users_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_events
    ADD CONSTRAINT users_events_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: blog_images fk_app_status_blog_image; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.blog_images
    ADD CONSTRAINT fk_app_status_blog_image FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: celestial_posts fk_app_status_celestial_posts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_posts
    ADD CONSTRAINT fk_app_status_celestial_posts FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: contact_forms fk_app_status_contact_forms; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.contact_forms
    ADD CONSTRAINT fk_app_status_contact_forms FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: event_cities fk_app_status_event_cities; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.event_cities
    ADD CONSTRAINT fk_app_status_event_cities FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: event_feedbacks fk_app_status_event_feedbacks; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_feedbacks
    ADD CONSTRAINT fk_app_status_event_feedbacks FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: event_images fk_app_status_event_images; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.event_images
    ADD CONSTRAINT fk_app_status_event_images FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: event_prices fk_app_status_event_prices; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.event_prices
    ADD CONSTRAINT fk_app_status_event_prices FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: event_ratings fk_app_status_event_ratings; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_ratings
    ADD CONSTRAINT fk_app_status_event_ratings FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: event_services fk_app_status_event_services; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.event_services
    ADD CONSTRAINT fk_app_status_event_services FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: event_sub_types fk_app_status_event_sub_types; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_sub_types
    ADD CONSTRAINT fk_app_status_event_sub_types FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: event_types fk_app_status_event_types; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_types
    ADD CONSTRAINT fk_app_status_event_types FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: events fk_app_status_events; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_app_status_events FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: blog_images fk_app_status_paticular_blog; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.blog_images
    ADD CONSTRAINT fk_app_status_paticular_blog FOREIGN KEY (post_id) REFERENCES public.celestial_posts(id);


--
-- Name: post_comments fk_app_status_post_comments; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT fk_app_status_post_comments FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: post_likes fk_app_status_post_likes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_likes
    ADD CONSTRAINT fk_app_status_post_likes FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: post_comments fk_app_status_post_likes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT fk_app_status_post_likes FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: subscription_forms fk_app_status_subscription_forms; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscription_forms
    ADD CONSTRAINT fk_app_status_subscription_forms FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: users fk_app_status_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_app_status_user FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: user_roles fk_app_status_user_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fk_app_status_user_roles FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: users_events fk_app_status_users_events; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_events
    ADD CONSTRAINT fk_app_status_users_events FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: celestial_post_hash_tags fk_celestial_post_id_celestial_post_hash_tags; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.celestial_post_hash_tags
    ADD CONSTRAINT fk_celestial_post_id_celestial_post_hash_tags FOREIGN KEY (celestial_post_id) REFERENCES public.celestial_posts(id);


--
-- Name: post_likes fk_celestial_posts; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_likes
    ADD CONSTRAINT fk_celestial_posts FOREIGN KEY (post_id) REFERENCES public.celestial_posts(id);


--
-- Name: post_comments fk_celestial_posts_comments; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT fk_celestial_posts_comments FOREIGN KEY (post_id) REFERENCES public.celestial_posts(id);


--
-- Name: event_cities fk_event_cities_events; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.event_cities
    ADD CONSTRAINT fk_event_cities_events FOREIGN KEY (events_id) REFERENCES public.events(id);


--
-- Name: events_hash_tags fk_event_id_celestial_post_hash_tags; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.events_hash_tags
    ADD CONSTRAINT fk_event_id_celestial_post_hash_tags FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: event_images fk_event_images_events; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.event_images
    ADD CONSTRAINT fk_event_images_events FOREIGN KEY (events_id) REFERENCES public.events(id);


--
-- Name: event_prices fk_event_prices_events; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.event_prices
    ADD CONSTRAINT fk_event_prices_events FOREIGN KEY (events_id) REFERENCES public.events(id);


--
-- Name: event_service_images fk_event_service_images_event_services; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.event_service_images
    ADD CONSTRAINT fk_event_service_images_event_services FOREIGN KEY (event_service_id) REFERENCES public.event_services(id);


--
-- Name: event_services fk_event_services_events; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.event_services
    ADD CONSTRAINT fk_event_services_events FOREIGN KEY (events_id) REFERENCES public.events(id);


--
-- Name: events fk_event_sub_types_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_event_sub_types_id FOREIGN KEY (event_sub_types_id) REFERENCES public.event_sub_types(id);


--
-- Name: event_sub_types fk_event_types_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_sub_types
    ADD CONSTRAINT fk_event_types_id FOREIGN KEY (event_types_id) REFERENCES public.event_types(id);


--
-- Name: events fk_events; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_events FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users_events fk_events_event; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_events
    ADD CONSTRAINT fk_events_event FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: event_feedbacks fk_events_feedback_event; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_feedbacks
    ADD CONSTRAINT fk_events_feedback_event FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: event_feedbacks fk_events_feedback_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_feedbacks
    ADD CONSTRAINT fk_events_feedback_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users_events fk_events_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_events
    ADD CONSTRAINT fk_events_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: celestial_post_hash_tags fk_hash_tag_id_celestial_post_hash_tags; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.celestial_post_hash_tags
    ADD CONSTRAINT fk_hash_tag_id_celestial_post_hash_tags FOREIGN KEY (hash_tag_id) REFERENCES public.hash_tags(id);


--
-- Name: events_hash_tags fk_hash_tag_id_events_hash_tags; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.events_hash_tags
    ADD CONSTRAINT fk_hash_tag_id_events_hash_tags FOREIGN KEY (hash_tag_id) REFERENCES public.hash_tags(id);


--
-- Name: post_comments fk_post_comment_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_comments
    ADD CONSTRAINT fk_post_comment_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: post_likes fk_post_like_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.post_likes
    ADD CONSTRAINT fk_post_like_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: event_ratings fk_ratings_events; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_ratings
    ADD CONSTRAINT fk_ratings_events FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: event_ratings fk_ratings_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_ratings
    ADD CONSTRAINT fk_ratings_user FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: celestial_post_hash_tags fk_status_id_celestial_post_hash_tags; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.celestial_post_hash_tags
    ADD CONSTRAINT fk_status_id_celestial_post_hash_tags FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: event_service_images fk_status_id_event_service_images; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.event_service_images
    ADD CONSTRAINT fk_status_id_event_service_images FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: events_hash_tags fk_status_id_events_hash_tags; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.events_hash_tags
    ADD CONSTRAINT fk_status_id_events_hash_tags FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: hash_tags fk_status_id_hash_tags; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.hash_tags
    ADD CONSTRAINT fk_status_id_hash_tags FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: user_teams fk_team_member_id_users; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.user_teams
    ADD CONSTRAINT fk_team_member_id_users FOREIGN KEY (team_member_id) REFERENCES public.users(id);


--
-- Name: upi_payments fk_upi_payment_app_statuses; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.upi_payments
    ADD CONSTRAINT fk_upi_payment_app_statuses FOREIGN KEY (status_id) REFERENCES public.app_statuses(id);


--
-- Name: upi_payments fk_upi_payment_events; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.upi_payments
    ADD CONSTRAINT fk_upi_payment_events FOREIGN KEY (events_id) REFERENCES public.events(id);


--
-- Name: upi_payments fk_upi_payment_users; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.upi_payments
    ADD CONSTRAINT fk_upi_payment_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: hash_tags fk_user_id_hash_tags; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.hash_tags
    ADD CONSTRAINT fk_user_id_hash_tags FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_teams fk_user_id_users; Type: FK CONSTRAINT; Schema: public; Owner: sagar
--

ALTER TABLE ONLY public.user_teams
    ADD CONSTRAINT fk_user_id_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: users fk_user_role; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_user_role FOREIGN KEY (user_role_id) REFERENCES public.user_roles(id);


--
-- Name: celestial_posts fk_users; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_posts
    ADD CONSTRAINT fk_users FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

