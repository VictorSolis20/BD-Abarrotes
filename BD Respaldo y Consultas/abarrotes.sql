--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    cliente_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido_paterno character varying(255) NOT NULL,
    apellido_materno character varying(255) NOT NULL,
    calle character varying(255),
    numero_exterior character varying(255),
    colonia character varying(255),
    municipio character varying(255) NOT NULL,
    estado character varying(255) NOT NULL,
    telefono character varying(255),
    correo character varying(255),
    "fechaHora_registro" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- Name: clientes_cliente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_cliente_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clientes_cliente_id_seq OWNER TO postgres;

--
-- Name: clientes_cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_cliente_id_seq OWNED BY public.clientes.cliente_id;


--
-- Name: knex_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.knex_migrations (
    id integer NOT NULL,
    name character varying(255),
    batch integer,
    migration_time timestamp with time zone
);


ALTER TABLE public.knex_migrations OWNER TO postgres;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.knex_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_id_seq OWNER TO postgres;

--
-- Name: knex_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.knex_migrations_id_seq OWNED BY public.knex_migrations.id;


--
-- Name: knex_migrations_lock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.knex_migrations_lock (
    index integer NOT NULL,
    is_locked integer
);


ALTER TABLE public.knex_migrations_lock OWNER TO postgres;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.knex_migrations_lock_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.knex_migrations_lock_index_seq OWNER TO postgres;

--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.knex_migrations_lock_index_seq OWNED BY public.knex_migrations_lock.index;


--
-- Name: personal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal (
    personal_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    apellido_paterno character varying(255) NOT NULL,
    apellido_materno character varying(255) NOT NULL,
    puesto character varying(255) NOT NULL,
    calle character varying(255),
    numero_exterior character varying(255),
    colonia character varying(255),
    municipio character varying(255) NOT NULL,
    estado character varying(255) NOT NULL,
    telefono character varying(255) NOT NULL,
    correo character varying(255) NOT NULL,
    "fechaHora_registro" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.personal OWNER TO postgres;

--
-- Name: personal_personal_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_personal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_personal_id_seq OWNER TO postgres;

--
-- Name: personal_personal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_personal_id_seq OWNED BY public.personal.personal_id;


--
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    productos_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    descripcion character varying(255),
    cantidad integer DEFAULT 1,
    precio numeric(8,2) NOT NULL,
    "fechaHora_registro" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- Name: productos_productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_productos_id_seq OWNER TO postgres;

--
-- Name: productos_productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_productos_id_seq OWNED BY public.productos.productos_id;


--
-- Name: ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ventas (
    venta_id integer NOT NULL,
    cantidad_productos integer DEFAULT 1,
    total numeric(10,2) NOT NULL,
    "fechaHora_registro" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    fk_producto integer,
    fk_personal integer,
    fk_cliente integer
);


ALTER TABLE public.ventas OWNER TO postgres;

--
-- Name: ventas_venta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ventas_venta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ventas_venta_id_seq OWNER TO postgres;

--
-- Name: ventas_venta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ventas_venta_id_seq OWNED BY public.ventas.venta_id;


--
-- Name: clientes cliente_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN cliente_id SET DEFAULT nextval('public.clientes_cliente_id_seq'::regclass);


--
-- Name: knex_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations ALTER COLUMN id SET DEFAULT nextval('public.knex_migrations_id_seq'::regclass);


--
-- Name: knex_migrations_lock index; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations_lock ALTER COLUMN index SET DEFAULT nextval('public.knex_migrations_lock_index_seq'::regclass);


--
-- Name: personal personal_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal ALTER COLUMN personal_id SET DEFAULT nextval('public.personal_personal_id_seq'::regclass);


--
-- Name: productos productos_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN productos_id SET DEFAULT nextval('public.productos_productos_id_seq'::regclass);


--
-- Name: ventas venta_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas ALTER COLUMN venta_id SET DEFAULT nextval('public.ventas_venta_id_seq'::regclass);


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (cliente_id, nombre, apellido_paterno, apellido_materno, calle, numero_exterior, colonia, municipio, estado, telefono, correo, "fechaHora_registro") FROM stdin;
1	Victor	Martinez	Solis	Porvenir	8	Tomatlan	Morelia	Michoacán	7894561238	victor@gmail.com	2023-09-09 20:24:55.743988-06
2	Juan	Torres	López	Madero	48	Condesa	Guadalajara	Jalisco	9856471235	juan@gmail.com	2023-09-09 20:26:14.861241-06
3	Carlos	Santos	Flores	Avenida Juárez	23	Polanco	Guadalajara	Jalisco	8529746123	carlos@gmail.com	2023-09-09 20:27:17.836592-06
4	Santiago	Rivas	Rangel	Paseo de la Reforma	75	Guerrero	Cuauhtémoc	Ciudad de México	7412589874	santiago@gmail.com	2023-09-09 20:27:56.081664-06
5	Jhon	Peralta	López	Avenida Ámsterdam	46	Condesa	Cuauhtémoc	Ciudad de México	3574125896	jhon@gmail.com	2023-09-09 20:28:32.657662-06
6	Luis	Soria	Valencia	31	Génova	Villa Coyoacán	Monterrey	Nuevo León	8524697321	luis@gmail.com	2023-09-09 20:29:21.640597-06
7	Denia	Ortega	Castañeda	19	Avenida Kabah	Matamoros	Cancún	Quintana Roo	1579634832	denia@gmail.com	2023-09-09 20:29:59.71606-06
8	Lucia	Magaña	Torres	27	Avenida Bonampak	Toreo	Cancún	Quintana Roo	6547891235	lucia@gmail.com	2023-09-09 20:30:40.430125-06
9	Fernando	Sánchez	Duarte	55	Palma	Valle del mirador	Monterrey	Nuevo León	9745632891	fernando@gmail.com	2023-09-09 20:31:20.607687-06
10	Julia	Almazán	Duque	23	Miramar	Balcones de alta vista	Monterrey	Nuevo León	5478231964	julia@gmail.com	2023-09-09 20:31:55.776679-06
\.


--
-- Data for Name: knex_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations (id, name, batch, migration_time) FROM stdin;
1	20230909201243_clientes.js	1	2023-09-09 16:17:08.371-06
2	20230909233237_personal.js	2	2023-09-09 18:28:19.543-06
3	20230910003028_productos.js	3	2023-09-09 18:44:37.292-06
4	20230910005154_ventas.js	4	2023-09-09 18:56:39.372-06
5	20230910010134_venta_has_producto.js	5	2023-09-09 19:48:09.695-06
6	20230910015743_venta_has_personal.js	6	2023-09-09 20:01:05.818-06
7	20230910020428_venta_has_cliente.js	7	2023-09-09 20:08:57.035-06
\.


--
-- Data for Name: knex_migrations_lock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.knex_migrations_lock (index, is_locked) FROM stdin;
1	0
\.


--
-- Data for Name: personal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal (personal_id, nombre, apellido_paterno, apellido_materno, puesto, calle, numero_exterior, colonia, municipio, estado, telefono, correo, "fechaHora_registro") FROM stdin;
1	Edgar	Peres	Estrada	Cajero	Curatame	22	El libramiento	Carácuaro	Michoacán	1254789354	edgar@gmail.com	2023-09-09 20:35:14.933906-06
2	Juana	Paredes	Campos	Cajero	Loma larga	73	Arroyo seco	Tiquicheo	Michoacán	8974356789	juana@gmail.com	2023-09-09 20:35:44.339947-06
3	Alejandro	Cruz	Gálvez	Cajero	Palestina	66	Roma	Monterrey	Nuevo León	2456987319	alejandro@gmail.com	2023-09-09 20:36:11.537367-06
4	Alma	Hinojosa	Obrador	Cajero	Álamos	17	La florida	Monterrey	Nuevo León	4897356218	alma@gmail.com	2023-09-09 20:36:41.931011-06
5	Emmanuel	Arana	Ramírez	Cajero	Primavera	98	San Antonio	Cancún	Quintana Roo	3256987416	emmanuel@gmail.com	2023-09-09 20:37:13.198914-06
8	Genaro	Perez	López	Cajero	San Antonio	56	Toreo	Cancún	Quintana Roo	3218945632	genaro@gmail.com	2023-09-09 20:40:10.932872-06
\.


--
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (productos_id, nombre, descripcion, cantidad, precio, "fechaHora_registro") FROM stdin;
1	Azúcar	Azúcar refinada de alta calidad	10	30.00	2023-09-09 20:56:33.607752-06
2	Jabón para Trastes	Jabón líquido para lavar trastes	5	26.00	2023-09-09 20:56:33.607752-06
3	Litro de Leche	Leche fresca en envase de 1 litro	21	35.00	2023-09-09 20:56:33.607752-06
4	Avena	Avena natural en hojuelas	12	50.00	2023-09-09 20:56:33.607752-06
5	Galletas	Galletas crujientes y deliciosas	40	25.00	2023-09-09 20:56:33.607752-06
6	Cepillo de Dientes	Cepillo de dientes suave de calidad	15	10.00	2023-09-09 20:56:33.607752-06
7	Papel Higiénico	Rollo de papel higiénico de 2 capas	9	13.00	2023-09-09 20:56:33.607752-06
8	Shampoo	Shampoo nutritivo para el cabello	23	40.00	2023-09-09 20:56:33.607752-06
9	Cerveza	Cerveza premium en lata de 355 ml	80	33.00	2023-09-09 20:56:33.607752-06
10	Café	Café molido 100% arábica	8	64.00	2023-09-09 20:56:33.607752-06
\.


--
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ventas (venta_id, cantidad_productos, total, "fechaHora_registro", fk_producto, fk_personal, fk_cliente) FROM stdin;
31	5	150.00	2023-09-09 21:41:10.817287-06	1	1	2
32	3	52.00	2023-09-09 21:41:10.817287-06	2	5	4
33	4	60.00	2023-09-09 21:41:10.817287-06	5	8	6
34	6	30.00	2023-09-09 21:41:10.817287-06	3	4	3
35	1	13.00	2023-09-09 21:41:10.817287-06	7	5	9
36	15	375.00	2023-09-09 21:41:10.817287-06	5	2	7
37	1	26.00	2023-09-09 21:41:10.817287-06	2	3	2
38	1	35.00	2023-09-09 21:41:10.817287-06	3	3	2
39	1	50.00	2023-09-09 21:41:10.817287-06	4	4	2
40	1	25.00	2023-09-09 21:41:10.817287-06	5	4	2
41	2	20.00	2023-09-09 21:41:10.817287-06	6	5	2
42	1	13.00	2023-09-09 21:41:10.817287-06	7	2	2
43	4	160.00	2023-09-09 21:41:10.817287-06	8	1	2
44	2	66.00	2023-09-09 21:41:10.817287-06	9	1	2
45	1	64.00	2023-09-09 21:41:10.817287-06	10	3	2
\.


--
-- Name: clientes_cliente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_cliente_id_seq', 5, true);


--
-- Name: knex_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.knex_migrations_id_seq', 7, true);


--
-- Name: knex_migrations_lock_index_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.knex_migrations_lock_index_seq', 1, true);


--
-- Name: personal_personal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_personal_id_seq', 8, true);


--
-- Name: productos_productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_productos_id_seq', 10, true);


--
-- Name: ventas_venta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ventas_venta_id_seq', 45, true);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (cliente_id);


--
-- Name: knex_migrations_lock knex_migrations_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations_lock
    ADD CONSTRAINT knex_migrations_lock_pkey PRIMARY KEY (index);


--
-- Name: knex_migrations knex_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.knex_migrations
    ADD CONSTRAINT knex_migrations_pkey PRIMARY KEY (id);


--
-- Name: personal personal_correo_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_correo_unique UNIQUE (correo);


--
-- Name: personal personal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_pkey PRIMARY KEY (personal_id);


--
-- Name: personal personal_telefono_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal
    ADD CONSTRAINT personal_telefono_unique UNIQUE (telefono);


--
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (productos_id);


--
-- Name: ventas ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (venta_id);


--
-- Name: ventas ventas_fk_cliente_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_fk_cliente_foreign FOREIGN KEY (fk_cliente) REFERENCES public.clientes(cliente_id);


--
-- Name: ventas ventas_fk_personal_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_fk_personal_foreign FOREIGN KEY (fk_personal) REFERENCES public.personal(personal_id);


--
-- Name: ventas ventas_fk_producto_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ventas
    ADD CONSTRAINT ventas_fk_producto_foreign FOREIGN KEY (fk_producto) REFERENCES public.productos(productos_id);


--
-- PostgreSQL database dump complete
--

